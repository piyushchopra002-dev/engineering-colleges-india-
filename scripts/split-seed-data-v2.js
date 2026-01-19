const fs = require('fs');
const path = require('path');

// Read the large SQL file
const inputFile = path.join(__dirname, '..', 'supabase', 'seed-data-500-complete.sql');
const content = fs.readFileSync(inputFile, 'utf8');

// Find the INSERT statement
const insertMatch = content.match(/INSERT INTO colleges[^;]+;/s);
if (!insertMatch) {
  console.error('Could not find colleges INSERT statement');
  process.exit(1);
}

const fullInsert = insertMatch[0];

// Extract VALUES section - handle multiline
const valuesMatch = fullInsert.match(/VALUES\s+([\s\S]+?)\s+ON CONFLICT/s);
if (!valuesMatch) {
  console.error('Could not find VALUES section');
  process.exit(1);
}

const allValues = valuesMatch[1].trim();

// Split by ), pattern (end of each row)
// Each row ends with ), or ),\n
const rows = [];
let currentRow = '';
let parenCount = 0;
let inString = false;
let escapeNext = false;

for (let i = 0; i < allValues.length; i++) {
  const char = allValues[i];
  const nextChar = allValues[i + 1];
  
  if (escapeNext) {
    currentRow += char;
    escapeNext = false;
    continue;
  }
  
  if (char === '\\') {
    currentRow += char;
    escapeNext = true;
    continue;
  }
  
  if (char === "'" && !escapeNext) {
    inString = !inString;
    currentRow += char;
    continue;
  }
  
  if (!inString) {
    if (char === '(') {
      parenCount++;
      currentRow += char;
    } else if (char === ')') {
      parenCount--;
      currentRow += char;
      
      // Check if this is the end of a row
      if (parenCount === 0 && (nextChar === ',' || nextChar === '\n' || i === allValues.length - 1)) {
        rows.push(currentRow.trim());
        currentRow = '';
        // Skip the comma and newline
        if (nextChar === ',') i++;
        continue;
      }
    } else {
      currentRow += char;
    }
  } else {
    currentRow += char;
  }
}

if (currentRow.trim()) {
  rows.push(currentRow.trim());
}

console.log(`📊 Found ${rows.length} college rows`);

// Split into chunks of 50
const chunkSize = 50;
const chunks = [];
for (let i = 0; i < rows.length; i += chunkSize) {
  chunks.push(rows.slice(i, i + chunkSize));
}

console.log(`📦 Split into ${chunks.length} chunks`);

// Create output directory
const outputDir = path.join(__dirname, '..', 'supabase', 'seed-chunks');
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir, { recursive: true });
}

// Generate chunk files
chunks.forEach((chunk, index) => {
  const chunkNum = index + 1;
  const startNum = index * chunkSize + 1;
  const endNum = Math.min((index + 1) * chunkSize, rows.length);
  
  const sql = `-- Seed Data Chunk ${chunkNum} of ${chunks.length}
-- Colleges ${startNum} to ${endNum} (${chunk.length} colleges)

INSERT INTO colleges (name, slug, short_name, description, established_year, location, city, state, pincode, latitude, longitude, website, email, phone, approval_body, affiliation, college_type, logo_url, cover_image_url, male_female_ratio, seat_matrix, fees_breakdown, infrastructure_summary) VALUES
${chunk.join(',\n')}
ON CONFLICT (slug) DO NOTHING;

`;

  const filename = `seed-chunk-${String(chunkNum).padStart(3, '0')}.sql`;
  const filepath = path.join(outputDir, filename);
  fs.writeFileSync(filepath, sql, 'utf8');
  console.log(`✅ Created ${filename} (${chunk.length} colleges, ${(fs.statSync(filepath).size / 1024).toFixed(2)} KB)`);
});

// Extract and save relationships section
const relationshipsMatch = content.match(/-- COLLEGE BRANCHES[\s\S]+?COMMIT;/);
if (relationshipsMatch) {
  const relationshipsFile = path.join(outputDir, 'seed-relationships.sql');
  const relationshipsSQL = `-- Relationships: College Branches, Rankings, Placements, Cutoffs
-- ⚠️ IMPORTANT: Run this AFTER all college chunks have been imported
-- This file links all colleges to branches and adds rankings, placements, and cutoffs

${relationshipsMatch[0]}`;
  
  fs.writeFileSync(relationshipsFile, relationshipsSQL, 'utf8');
  console.log(`✅ Created seed-relationships.sql (${(fs.statSync(relationshipsFile).size / 1024).toFixed(2)} KB)`);
}

// Create README
const readme = `# Seed Data Chunks

This directory contains the seed data split into manageable chunks for Supabase SQL Editor.

## Total: ${rows.length} colleges in ${chunks.length} chunks

## How to Import:

### Step 1: Import College Chunks
Run these files **in order** (001, 002, 003, ...) in Supabase SQL Editor:
${chunks.map((_, i) => `- seed-chunk-${String(i + 1).padStart(3, '0')}.sql`).join('\n')}

### Step 2: Import Relationships
After all chunks are imported, run:
- seed-relationships.sql

This will add:
- College-branch relationships
- NIRF rankings
- Placement statistics
- Cutoff data

## Notes:
- Each chunk contains ~50 colleges
- Files are safe to run multiple times (uses ON CONFLICT DO NOTHING)
- Make sure branches (CSE, ECE, ME, CE, EE) exist before running relationships
`;

fs.writeFileSync(path.join(outputDir, 'README.md'), readme, 'utf8');

console.log(`\n✅ All chunks created in: ${outputDir}`);
console.log(`\n📋 Next steps:`);
console.log(`   1. Run seed-chunk-001.sql through seed-chunk-${String(chunks.length).padStart(3, '0')}.sql in Supabase SQL Editor`);
console.log(`   2. After all chunks, run seed-relationships.sql`);
