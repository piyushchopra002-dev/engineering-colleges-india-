// Quick script to check if environment variables are set
const fs = require('fs');
const path = require('path');

const envPath = path.join(__dirname, '..', '.env.local');

console.log('🔍 Checking environment setup...\n');

if (!fs.existsSync(envPath)) {
  console.log('❌ .env.local file not found!');
  console.log('📝 Please create .env.local file with your API keys.\n');
  process.exit(1);
}

const envContent = fs.readFileSync(envPath, 'utf8');

const requiredVars = [
  'NEXT_PUBLIC_SUPABASE_URL',
  'NEXT_PUBLIC_SUPABASE_ANON_KEY',
  'SUPABASE_SERVICE_ROLE_KEY',
];

const optionalVars = [
  'OPENROUTER_API_KEY',
  'NEXT_PUBLIC_GOOGLE_PLACES_API_KEY',
];

let allGood = true;

console.log('📋 Required Variables:');
requiredVars.forEach(varName => {
  const regex = new RegExp(`${varName}=(.+)`, 'm');
  const match = envContent.match(regex);
  const isSet = match && match[1] && match[1].trim() !== '' && !match[1].includes('your_');
  if (isSet) {
    console.log(`  ✅ ${varName}`);
  } else {
    console.log(`  ❌ ${varName} - NOT SET`);
    allGood = false;
  }
});

console.log('\n📋 Optional Variables:');
optionalVars.forEach(varName => {
  const regex = new RegExp(`${varName}=(.+)`, 'm');
  const match = envContent.match(regex);
  const isSet = match && match[1] && match[1].trim() !== '' && !match[1].includes('your_');
  if (isSet) {
    console.log(`  ✅ ${varName}`);
  } else {
    console.log(`  ⚠️  ${varName} - Not set (optional)`);
  }
});

console.log('\n' + '='.repeat(50));

if (allGood) {
  console.log('✅ All required environment variables are set!');
  console.log('🚀 You can start the dev server with: npm run dev\n');
} else {
  console.log('❌ Some required variables are missing.');
  console.log('📖 See SETUP_GUIDE.md for instructions.\n');
  process.exit(1);
}
