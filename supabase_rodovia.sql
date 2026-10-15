-- SSCONPAV · Rodovias — estrutura da nuvem
-- Cole no SQL Editor do projeto Supabase NOVO e clique em Run. Pode rodar mais de uma vez.

create table if not exists public.rodovia_registros (
  uid text not null,
  org text not null default 'RODOVIA',
  store text not null,
  dados jsonb not null default '{}'::jsonb,
  deletado boolean not null default false,
  atualizado_em timestamptz not null default now(),
  primary key (org, store, uid)
);
-- a baixada pagina por (atualizado_em, uid): este índice a mantém rápida
create index if not exists rodovia_registros_sync_idx on public.rodovia_registros (org, atualizado_em, uid);

alter table public.rodovia_registros enable row level security;
drop policy if exists rodovia_registros_acesso on public.rodovia_registros;
create policy rodovia_registros_acesso on public.rodovia_registros for all using (true) with check (true);

-- fotos: bucket público (as imagens são lidas pelo endereço direto)
insert into storage.buckets (id, name, public) values ('rodovia-fotos', 'rodovia-fotos', true)
on conflict (id) do update set public = true;
drop policy if exists rodovia_fotos_ler    on storage.objects;
drop policy if exists rodovia_fotos_enviar on storage.objects;
drop policy if exists rodovia_fotos_trocar on storage.objects;
drop policy if exists rodovia_fotos_apagar on storage.objects;
create policy rodovia_fotos_ler    on storage.objects for select using (bucket_id = 'rodovia-fotos');
create policy rodovia_fotos_enviar on storage.objects for insert with check (bucket_id = 'rodovia-fotos');
create policy rodovia_fotos_trocar on storage.objects for update using (bucket_id = 'rodovia-fotos') with check (bucket_id = 'rodovia-fotos');
create policy rodovia_fotos_apagar on storage.objects for delete using (bucket_id = 'rodovia-fotos');
