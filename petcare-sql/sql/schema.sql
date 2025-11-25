-- Criação do banco e uso
CREATE DATABASE IF NOT EXISTS petcare;
USE petcare;

-- Tabela Cliente
CREATE TABLE IF NOT EXISTS Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Endereco VARCHAR(150),
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    INDEX idx_cliente_nome (Nome)
);

-- Tabela Animal
CREATE TABLE IF NOT EXISTS Animal (
    ID_Animal INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Especie VARCHAR(50) NOT NULL,
    Raca VARCHAR(50),
    Data_Nascimento DATE,
    ID_Cliente INT NOT NULL,
    CONSTRAINT fk_animal_cliente
        FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    INDEX idx_animal_cliente (ID_Cliente),
    INDEX idx_animal_nome (Nome)
);

-- Tabela Veterinario
CREATE TABLE IF NOT EXISTS Veterinario (
    ID_Veterinario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CRMV VARCHAR(20) UNIQUE NOT NULL,
    Especialidade VARCHAR(100),
    INDEX idx_veterinario_nome (Nome)
);

-- Tabela Consulta
CREATE TABLE IF NOT EXISTS Consulta (
    ID_Consulta INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    Hora TIME NOT NULL,
    Motivo VARCHAR(150),
    ID_Animal INT NOT NULL,
    ID_Veterinario INT NOT NULL,
    CONSTRAINT fk_consulta_animal
        FOREIGN KEY (ID_Animal) REFERENCES Animal(ID_Animal)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_consulta_vet
        FOREIGN KEY (ID_Veterinario) REFERENCES Veterinario(ID_Veterinario)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    INDEX idx_consulta_data (Data),
    INDEX idx_consulta_animal (ID_Animal)
);

-- Tabela Atendimento
CREATE TABLE IF NOT EXISTS Atendimento (
    ID_Atendimento INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(50) NOT NULL,
    Descricao VARCHAR(200),
    ID_Consulta INT NOT NULL,
    CONSTRAINT fk_atendimento_consulta
        FOREIGN KEY (ID_Consulta) REFERENCES Consulta(ID_Consulta)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    INDEX idx_atendimento_consulta (ID_Consulta),
    INDEX idx_atendimento_tipo (Tipo)
);

-- Tabela Pagamento
CREATE TABLE IF NOT EXISTS Pagamento (
    ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    Forma_Pagamento VARCHAR(50) NOT NULL,
    ID_Atendimento INT NOT NULL,
    CONSTRAINT fk_pagamento_atendimento
        FOREIGN KEY (ID_Atendimento) REFERENCES Atendimento(ID_Atendimento)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    INDEX idx_pagamento_data (Data),
    INDEX idx_pagamento_atendimento (ID_Atendimento),
    CHECK (Valor >= 0)
);
