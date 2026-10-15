# SSCONPAV · Rodovias — Sistema do escritório

Recebe os relatórios do app de campo, **valida ou devolve** (com motivo), corrige valores trecho a trecho, e fecha a **medição** (quantidade × preço unitário do cadastro de serviços), gerando o Boletim de Medição numerado em planilha e PDF. Exporta os relatórios no **formato exato do modelo** "Relatório Fotográfico de Obra" e "Relatório de Ordens de Serviço".

- `sistema.html` — o sistema inteiro (gerado por `_fabrica-rodovia/build.py`).
- `versao-sistema.json` — versão publicada.
- `ssconpav-desktop/` — casca Windows (Electron). O robô `build-windows.yml` gera o `SSCONPAV-Rodovias-Setup.exe`.
- `supabase_rodovia.sql` — estrutura da nuvem (tabela + bucket de fotos). Rode uma vez no projeto Supabase novo.

Login inicial: usuário `ssconpav`, senha `Ssconpav` (troque em Cadastros → Usuários).
