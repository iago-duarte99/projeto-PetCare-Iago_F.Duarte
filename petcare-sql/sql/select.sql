USE petcare;

-- 1) Lista de animais com seus donos
SELECT a.Nome AS Animal, a.Especie, c.Nome AS Dono
FROM Animal a
JOIN Cliente c ON c.ID_Cliente = a.ID_Cliente
ORDER BY Dono, Animal
LIMIT 50;

-- 2) Consultas agendadas com veterinário
SELECT co.ID_Consulta, co.Data, co.Hora, v.Nome AS Veterinario, a.Nome AS Animal
FROM Consulta co
JOIN Veterinario v ON v.ID_Veterinario = co.ID_Veterinario
JOIN Animal a ON a.ID_Animal = co.ID_Animal
WHERE co.Data >= CURDATE()
ORDER BY co.Data, co.Hora
LIMIT 100;

-- 3) Pagamentos por atendimento
SELECT p.ID_Pagamento, p.Data, p.Valor, p.Forma_Pagamento, at.Tipo
FROM Pagamento p
JOIN Atendimento at ON at.ID_Atendimento = p.ID_Atendimento
ORDER BY p.Data DESC
LIMIT 50;

-- 4) Total faturado por mês
SELECT DATE_FORMAT(p.Data, '%Y-%m') AS Mes, SUM(p.Valor) AS Total
FROM Pagamento p
GROUP BY Mes
ORDER BY Mes DESC
LIMIT 12;

-- 5) Animais sem consulta futura
SELECT a.ID_Animal, a.Nome
FROM Animal a
LEFT JOIN Consulta c ON c.ID_Animal = a.ID_Animal AND c.Data >= CURDATE()
WHERE c.ID_Consulta IS NULL
ORDER BY a.Nome;
