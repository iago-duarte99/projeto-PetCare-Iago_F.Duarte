# PetCare SQL

Sistema de gestão para clínica veterinária com banco relacional (MySQL/PostgreSQL).

## Estrutura
- sql/: scripts (schema, insert, select, update_delete, reset)
- config/: sqltools connections e docker-compose
- .vscode/: tasks para execução
- docs/: modelo lógico

## Como rodar (MySQL local)
1. Crie o banco:
   - `mysql -u root -p < sql/schema.sql`
2. Popule:
   - `mysql -u root -p petcare < sql/insert.sql`
3. Consultas:
   - `mysql -u root -p petcare < sql/select.sql`
4. Atualizações/Exclusões:
   - `mysql -u root -p petcare < sql/update_delete.sql`

## Como rodar (Docker)
1. `docker compose -f config/docker-compose.yml up -d`
2. Conecte com SQLTools em `localhost:3306` (user: root, pass: root)
