-- =========================================================================
-- DJN TECH - Google Reviews Database Table Schema
-- Run this script in your Supabase SQL Editor:
-- https://supabase.com/dashboard/project/rudqiwifokllmjpfcnbp/sql
-- =========================================================================

CREATE TABLE IF NOT EXISTS public.google_reviews (
  id TEXT PRIMARY KEY,
  author_name TEXT NOT NULL,
  author_location TEXT DEFAULT 'Mumbai',
  author_avatar_color TEXT DEFAULT '#4285F4',
  author_avatar_url TEXT,
  rating NUMERIC DEFAULT 5,
  relative_time TEXT DEFAULT 'Recently',
  text TEXT NOT NULL,
  category_tag TEXT DEFAULT 'Verified Customer',
  helpful_count INTEGER DEFAULT 0,
  photos JSONB DEFAULT '[]'::jsonb,
  owner_reply JSONB,
  is_local_guide BOOLEAN DEFAULT false,
  guide_reviews_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (RLS)
ALTER TABLE public.google_reviews ENABLE ROW LEVEL SECURITY;

-- Allow all visitors to read reviews
DROP POLICY IF EXISTS "Allow public read access to google_reviews" ON public.google_reviews;
CREATE POLICY "Allow public read access to google_reviews"
  ON public.google_reviews FOR SELECT
  USING (true);

-- Allow insert/update operations
DROP POLICY IF EXISTS "Allow full access to google_reviews" ON public.google_reviews;
CREATE POLICY "Allow full access to google_reviews"
  ON public.google_reviews FOR ALL
  USING (true);
