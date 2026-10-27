-- Pocket Ledger: run this once in Supabase > SQL Editor

create table if not exists inbox (
  id bigint generated always as identity primary key,
  raw text not null,
  created_at timestamptz default now()
);

create table if not exists items (
  id text primary key,
  kind text not null,
  data jsonb not null,
  updated_at timestamptz default now()
);

create or replace function touch_updated_at() returns trigger as $$
begin new.updated_at = now(); return new; end $$ language plpgsql;

drop trigger if exists items_touch on items;
create trigger items_touch before insert or update on items
for each row execute function touch_updated_at();

alter table inbox enable row level security;
alter table items enable row level security;

drop policy if exists "app inbox" on inbox;
create policy "app inbox" on inbox for all to anon using (true) with check (true);
drop policy if exists "app items" on items;
create policy "app items" on items for all to anon using (true) with check (true);
