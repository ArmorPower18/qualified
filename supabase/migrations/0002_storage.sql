-- Create storage bucket for mock test uploads
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'mock-test-uploads',
  'mock-test-uploads',
  false,
  20971520, -- 20 MB
  array[
    'application/pdf',
    'image/png',
    'image/jpeg',
    'image/jpg',
    'image/webp'
  ]
)
on conflict (id) do nothing;

-- Allow authenticated users to upload their own files
create policy "authenticated users can upload files"
  on storage.objects for insert
  to authenticated
  with check (
    bucket_id = 'mock-test-uploads'
    and (storage.foldername(name))[1] = auth.uid()::text
  );

-- Allow users to read their own files
create policy "users can read own files"
  on storage.objects for select
  to authenticated
  using (
    bucket_id = 'mock-test-uploads'
    and (storage.foldername(name))[1] = auth.uid()::text
  );

-- Allow users to delete their own files
create policy "users can delete own files"
  on storage.objects for delete
  to authenticated
  using (
    bucket_id = 'mock-test-uploads'
    and (storage.foldername(name))[1] = auth.uid()::text
  );
