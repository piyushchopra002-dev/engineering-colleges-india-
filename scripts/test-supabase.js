// Quick test script to verify Supabase connection
const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env.local' });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

console.log('🔍 Testing Supabase Connection...\n');
console.log('URL:', supabaseUrl ? '✅ Set' : '❌ Missing');
console.log('Key:', supabaseKey ? '✅ Set' : '❌ Missing');
console.log('');

if (!supabaseUrl || !supabaseKey) {
  console.log('❌ Missing environment variables!');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

// Test connection by querying a table
supabase
  .from('colleges')
  .select('count')
  .limit(1)
  .then(({ data, error }) => {
    if (error) {
      if (error.code === 'PGRST116' || error.message.includes('relation') || error.message.includes('does not exist')) {
        console.log('⚠️  Connection works, but tables might not be created yet.');
        console.log('   Make sure you ran the SQL schema in Supabase SQL Editor.\n');
      } else {
        console.log('❌ Connection error:', error.message);
      }
    } else {
      console.log('✅ Supabase connection successful!');
      console.log('✅ Database is accessible.\n');
    }
  })
  .catch((err) => {
    console.log('❌ Error:', err.message);
  });
