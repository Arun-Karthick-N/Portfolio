-- Create the table for contact form submissions
CREATE TABLE contact_submissions (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT,
  email TEXT NOT NULL,
  designation TEXT,
  company TEXT,
  description TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Optional: Enable Row Level Security (RLS) for the table
ALTER TABLE contact_submissions ENABLE ROW LEVEL SECURITY;

-- Optional: Create a policy to allow anonymous/public inserts (for contact forms)
-- This allows anyone to insert without authentication, but you can add checks (e.g., email validation)
CREATE POLICY "Allow public inserts" ON contact_submissions
FOR INSERT TO public
WITH CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
