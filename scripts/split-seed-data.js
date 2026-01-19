const fs = require('fs');
const path = require('path');

// Read the large SQL file
const inputFile = path.join(__dirname, '..', 'supabase', 'seed-data-500-complete.sql');
const content = fs.readFileSync(inputFile, 'utf8');

// Split into sections
const sections = content.split('-- ============================================');

// Extract colleges section
const collegesSection = sections.find(s => s.includes('COLLEGES'));
const relationshipsSection = sections.find(s => s.includes('COLLEGE BRANCHES'));

// Split colleges into chunks of 50
const collegesMatch = collegesSection.match(/INSERT INTO colleges[^;]+;/s);
if (!collegesMatch) {
  console.error('Could not find colleges INSERT statement');
  process.exit(1);
}

const fullInsert = collegesMatch[0];
const valuesMatch = fullInsert.match(/VALUES\s+(.+)\s+ON CONFLICT/s);
if (!valuesMatch) {
  console.error('Could not find VALUES section');
  process.exit(1);
}

const allValues = valuesMatch[1].trim();
const valueRows = allValues.split(/\),\s*\(/).map((v, i, arr) => {
  if (i === 0) return v + ')';
  if (i === arr.length - 1) return '(' + v;
  return '(' + v + ')';
});

const chunkSize = 50;
const chunks = [];
for (let i = 0; i < valueRows.length; i += chunkSize) {
  chunks.push(valueRows.slice(i, i + chunkSize));
}

console.log(`📊 Split ${valueRows.length} colleges into ${chunks.length} chunks`);

// Create output directory
const outputDir = path.join(__dirname, '..', 'supabase', 'seed-chunks');
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir, { recursive: true });
}

// Generate chunk files
chunks.forEach((chunk, index) => {
  const chunkNum = index + 1;
  const sql = `-- Seed Data Chunk ${chunkNum} of ${chunks.length}
-- Colleges ${index * chunkSize + 1} to ${Math.min((index + 1) * chunkSize, valueRows.length)}

INSERT INTO colleges (name, slug, short_name, description, established_year, location, city, state, pincode, latitude, longitude, website, email, phone, approval_body, affiliation, college_type, logo_url, cover_image_url, male_female_ratio, seat_matrix, fees_breakdown, infrastructure_summary) VALUES
${chunk.join(',\n')}
ON CONFLICT (slug) DO NOTHING;

`;

  const filename = `seed-chunk-${String(chunkNum).padStart(3, '0')}.sql`;
  const filepath = path.join(outputDir, filename);
  fs.writeFileSync(filepath, sql, 'utf8');
  console.log(`✅ Created ${filename} (${chunk.length} colleges)`);
});

// Create relationships file (separate, can be run once after all colleges are added)
const relationshipsFile = path.join(outputDir, 'seed-relationships.sql');
if (relationshipsSection) {
  // Extract the DO block
  const doBlockMatch = relationshipsSection.match(/DO \$\$[\s\S]+END \$\$;/);
  if (doBlockMatch) {
    const relationshipsSQL = `-- Relationships: College Branches, Rankings, Placements, Cutoffs
-- Run this AFTER all college chunks have been imported

${doBlockMatch[0]}

COMMIT;
`;
    fs.writeFileSync(relationshipsFile, relationshipsSQL, 'utf8');
    console.log(`✅ Created seed-relationships.sql`);
  }
}

// Create a master script file
const masterScript = `-- Master Script: Run all chunks in order
-- Instructions:
-- 1. Run seed-chunk-001.sql through seed-chunk-${String(chunks.length).padStart(3, '0')}.sql in order
-- 2. After all chunks are imported, run seed-relationships.sql

-- Total chunks: ${chunks.length}
-- Total colleges: ${valueRows.length}
`;
fs.writeFileSync(path.join(outputDir, 'README.md'), masterScript, 'utf8');

console.log(`\n✅ All chunks created in: ${outputDir}`);
console.log(`\n📋 Next steps:`);
console.log(`   1. Run seed-chunk-001.sql through seed-chunk-${String(chunks.length).padStart(3, '0')}.sql in Supabase SQL Editor`);
console.log(`   2. After all chunks, run seed-relationships.sql`);
