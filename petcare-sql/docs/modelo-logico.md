# Modelo Lógico – PetCare 🐾

## Entidades e Relacionamentos

### Cliente
- **ID_Cliente** (PK)
- Nome
- CPF (único)
- Endereço
- Telefone
- Email

### Animal
- **ID_Animal** (PK)
- Nome
- Espécie
- Raça
- Data_Nascimento
- **ID_Cliente** (FK → Cliente)

### Veterinário
- **ID_Veterinario** (PK)
- Nome
- CRMV (único)
- Especialidade

### Consulta
- **ID_Consulta** (PK)
- Data
- Hora
- Motivo
- **ID_Animal** (FK → Animal)
- **ID_Veterinario** (FK → Veterinário)

### Atendimento
- **ID_Atendimento** (PK)
- Tipo
- Descrição
- **ID_Consulta** (FK → Consulta)

### Pagamento
- **ID_Pagamento** (PK)
- Data
- Valor
- Forma_Pagamento
- **ID_Atendimento** (FK → Atendimento)

---

## Regras de Integridade
- **Cliente → Animal**: um cliente pode ter vários animais.
- **Animal → Consulta**: um animal pode ter várias consultas.
- **Veterinário → Consulta**: um veterinário pode atender várias consultas.
- **Consulta → Atendimento**: cada consulta gera um ou mais atendimentos.
- **Atendimento → Pagamento**: cada atendimento gera um pagamento.

---

## Normalização
- Todas as tabelas seguem até a **3ª Forma Normal (3FN)**:
  - Atributos atômicos.
  - Sem dependências parciais.
  - Sem dependências transitivas.

---

## Observações
- CPF e CRMV possuem restrição de unicidade.
- Chaves primárias são auto-incrementáveis.
- Relacionamentos possuem integridade referencial com `ON DELETE CASCADE` ou `ON UPDATE CASCADE` conforme necessidade.
