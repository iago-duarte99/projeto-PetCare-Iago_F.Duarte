# 🐾 PetCare SQL

Sistema de gestão para clínica veterinária **PetCare**, implementado com banco de dados relacional (MySQL ou PostgreSQL).  
O projeto organiza cadastros de clientes, animais, consultas, atendimentos e pagamentos, seguindo normalização até a **3ª Forma Normal (3FN)**.

---
# 👨‍🎓 Autor
## Iago Figueiredo Duarte 
Experiência Prática 4 – Criação e Manipulação de Dados com SQL em Projeto Real (Mini-mundo)

# 📊 Funcionalidades Implementadas
---
Cadastro de clientes e animais

Agendamento de consultas

Registro de atendimentos

Controle de pagamentos

Consultas SQL para relatórios (ex.: faturamento mensal, animais sem consulta futura)
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


---

# 🛠 Ferramentas Utilizadas

- **VS Code** com extensões:
  - SQLTools
  - SQLTools MySQL/MariaDB ou PostgreSQL
- **Banco de Dados**: MySQL 8.0 ou PostgreSQL 14+
- **GitHub** para versionamento
- **Docker** (opcional)

---

# 🚀 Como Executar no VS Code

1. **Instale as extensões**:
   - SQLTools
   - SQLTools MySQL/MariaDB (ou PostgreSQL)

2. **Configure a conexão** em `.vscode/settings.json` ou via SQLTools:
   ```json
   {
     "sqltools.connections": [
       {
         "name": "PetCare MySQL",
         "driver": "MySQL",
         "server": "localhost",
         "port": 3306,
         "database": "petcare",
         "username": "root",
         "password": "sua_senha"
       }
     ]
   }
