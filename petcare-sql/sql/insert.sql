USE petcare;

-- Clientes
INSERT INTO Cliente (Nome, CPF, Endereco, Telefone, Email)
VALUES
('Ana Souza', '123.456.789-00', 'Rua A, 123', '71 99999-0000', 'ana@exemplo.com'),
('Carlos Lima', '987.654.321-00', 'Av. B, 456', '71 98888-1111', 'carlos@exemplo.com');

-- Veterinários
INSERT INTO Veterinario (Nome, CRMV, Especialidade)
VALUES
('Dra. Marina Alves', 'BA-12345', 'Clínica Geral'),
('Dr. Paulo Mendes', 'BA-67890', 'Cirurgia');

-- Animais
INSERT INTO Animal (Nome, Especie, Raca, Data_Nascimento, ID_Cliente)
VALUES
('Thor', 'Cão', 'Labrador', '2020-05-10', 1),
('Mia', 'Gato', 'SRD', '2021-03-22', 2);

-- Consultas
INSERT INTO Consulta (Data, Hora, Motivo, ID_Animal, ID_Veterinario)
VALUES
('2025-11-24', '10:30:00', 'Vacinação', 1, 1),
('2025-11-25', '15:00:00', 'Check-up', 2, 2);

-- Atendimentos
INSERT INTO Atendimento (Tipo, Descricao, ID_Consulta)
VALUES
('Vacina', 'Aplicação de vacina V10', 1),
('Check-up', 'Exame físico completo', 2);

-- Pagamentos
INSERT INTO Pagamento (Data, Valor, Forma_Pagamento, ID_Atendimento)
VALUES
('2025-11-24', 120.00, 'Cartão', 1),
('2025-11-25', 200.00, 'Pix', 2);
