# Debug: Why Users Aren't Showing

## Possible Issues

### 1. No Users in Database
**Check:** Go to Supabase Dashboard → Table Editor → `users` table
- If empty, users need to register first
- Registration creates users in the database

### 2. Supabase Environment Variables Not Set
**Check in Vercel:**
1. Go to Vercel Dashboard → Your Project → Settings → Environment Variables
2. Verify these are set:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`

### 3. Database Connection Issue
**Test in Browser Console (F12):**
```javascript
// Check if Supabase is configured
console.log('Supabase URL:', process.env.NEXT_PUBLIC_SUPABASE_URL);

// Try to fetch users manually
const { data, error } = await supabase.from('users').select('*');
console.log('Users:', data);
console.log('Error:', error);
```

### 4. Row Level Security (RLS) Blocking
**Check Supabase:**
1. Go to Supabase Dashboard → Authentication → Policies
2. Check if RLS is enabled on `users` table
3. If enabled, you may need to disable it or create policies

### 5. Table Doesn't Exist
**Check:** Run this in Supabase SQL Editor:
```sql
SELECT * FROM users LIMIT 10;
```

If error, the table doesn't exist. Run `setup_supabase.sql`.

## Quick Fixes

### Fix 1: Register a Test User
1. Go to `/register`
2. Create a new account
3. Check if it appears in `/admin/users`

### Fix 2: Check Environment Variables
1. Vercel Dashboard → Settings → Environment Variables
2. Make sure Supabase URL and Key are correct
3. Redeploy after adding/changing variables

### Fix 3: Check Supabase Connection
1. Open browser console (F12)
2. Go to Network tab
3. Visit `/admin/users`
4. Look for requests to Supabase
5. Check if they're successful (200) or failing

### Fix 4: Verify Database Setup
Run in Supabase SQL Editor:
```sql
-- Check if users table exists
SELECT COUNT(*) FROM users;

-- Check table structure
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'users';
```

## After Fixing

The admin page will now show:
- Error messages if something fails
- "Loading..." while fetching
- Actual user count
- A "Refresh" button to manually reload

## Expected Behavior

- If users exist: Shows user count and list
- If no users: Shows "No users found" message
- If error: Shows error message
- If loading: Shows "Loading..."

