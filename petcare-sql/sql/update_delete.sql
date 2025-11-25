USE petcare;

-- UPDATEs
UPDATE Cliente SET Telefone = '71 97777-2222' WHERE CPF = '123.456.789-00';
UPDATE Veterinario SET Especialidade = 'Dermatologia' WHERE CRMV = 'BA-12345';
UPDATE Atendimento SET Descricao = 'Check-up com exames laboratoriais' WHERE ID_Atendimento = 2;

-- DELETEs (com segurança)
-- Exclui pagamento específico
DELETE FROM Pagamento WHERE ID_Pagamento = 1;

-- Exclui atendimento sem pagamento associado
DELETE FROM Atendimento
WHERE ID_Atendimento NOT IN (SELECT DISTINCT ID_Atendimento FROM Pagamento);

-- Exclui consultas passadas sem atendimento registrado
DELETE FROM Consulta
WHERE Data < CURDATE()
  AND ID_Consulta NOT IN (SELECT DISTINCT ID_Consulta FROM Atendimento);
