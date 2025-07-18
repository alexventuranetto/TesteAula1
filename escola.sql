-- ========================================
-- SCRIPT  DE  CRIAÇÃO DO BANCO DE DADOS "escola"
-- ========================================

-- Remove o banco de dados caso ele já exista (para testes repetidos)
DROP DATABASE IF EXISTS escola;

-- Cria um novo banco de dados chamado "escola"
CREATE DATABASE escola;

-- Define o banco como o atual para execução dos próximos comandos
USE escola;

-- =======================================
-- TABELA: aluno
-- Armazena informações básicas dos estudantes
-- =======================================
CREATE TABLE aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Identificador único
    nome VARCHAR(100),                          -- Nome do aluno
    data_nascimento DATE                        -- Data de nascimento
);

-- =======================================
-- TABELA: professor
-- Armazena dados dos professores
-- =======================================
CREATE TABLE professor (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Identificador único
    nome VARCHAR(100),                          -- Nome do professor
    especialidade VARCHAR(100)                  -- Área de ensino
);

-- =======================================
-- TABELA: curso
-- Contém os cursos oferecidos e seu professor responsável
-- =======================================
CREATE TABLE curso (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Identificador do curso
    nome VARCHAR(100),                          -- Nome do curso
    id_professor INT,                           -- Chave estrangeira para professor
    FOREIGN KEY (id_professor) REFERENCES professor(id)
);

-- =======================================
-- TABELA: matricula
-- Registra a inscrição de um aluno em um curso
-- =======================================
CREATE TABLE matricula (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Identificador da matrícula
    id_aluno INT,                               -- Aluno matriculado
    id_curso INT,                               -- Curso escolhido
    data_matricula DATE,                        -- Data da matrícula
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);

-- =======================================
-- INSERÇÕES: tabela aluno
-- 5 comandos separados, com alunos fictícios
-- =======================================
INSERT INTO aluno (nome, data_nascimento) VALUES ('Maria Souza', '2007-05-14');
INSERT INTO aluno (nome, data_nascimento) VALUES ('João Silva', '2006-11-02');
INSERT INTO aluno (nome, data_nascimento) VALUES ('Ana Lima', '2008-01-21');
INSERT INTO aluno (nome, data_nascimento) VALUES ('Carlos Mendes', '2007-07-09');
INSERT INTO aluno (nome, data_nascimento) VALUES ('Fernanda Costa', '2006-03-30');

-- =======================================
-- INSERÇÃO ÚNICA: tabela professor
-- Um único comando com múltiplos professores
-- =======================================
INSERT INTO professor (nome, especialidade) VALUES
('Roberto Tavares', 'Matemática'),
('Luciana Nogueira', 'Português'),
('Paulo Henrique', 'História'),
('Marina Dias', 'Biologia'),
('André Farias', 'Inglês'),
('Ze das Coves', 'Matemática');

INSERT INTO professor (nome, especialidade) VALUES
('Roberto Tavares', 'Dança');

INSERT INTO professor (nome, especialidade) VALUES
('Antonio Roberto', 'Educação Física');

-- Like "%Roberto"  com o percente antes busca qualquer nome que contem a palavra Roberto
select count(nome)  from professor where nome  like "%Roberto";

-- Like "Roberto%"  com o percente depois busca qualquer nome que contem a palavra Roberto no inicio do nome
select count(nome)  from professor where nome  like "%Roberto";
-- =======================================
-- INSERÇÃO ÚNICA: tabela curso
-- Cada curso está associado a um professor
-- =======================================
INSERT INTO curso (nome, id_professor) VALUES
('Matemática Básica', 1),
('Gramática Avançada', 2),
('História Geral', 3),
('Biologia Celular', 4),
('Inglês Intermediário', 5);

-- =======================================
-- INSERÇÃO ÚNICA: tabela matricula
-- Matrícula de cada aluno em um curso
-- =======================================
INSERT INTO matricula (id_aluno, id_curso, data_matricula) VALUES
(1, 1, '2025-02-01'),
(2, 2, '2025-02-01'),
(3, 3, '2025-02-02'),
(4, 4, '2025-02-03'),
(5, 5, '2025-02-04'),
(1, 1, '2025-07-16');

select * from professor;

select especialidade from professor group by especialidade;

select * from matricula where month(data_matricula) = 07;

select * from matricula where data_matricula >= '2025-02-02';



select * from matricula;

select * from aluno;

update aluno SET data_nascimento = '2025-06-15' where id = 1;

update aluno SET nome = 'Cristina da Silva' where id = 1;

select * from aluno;

delete from matricula where id_aluno = 1;

select * from matricula;

delete from matricula where id_aluno = 3;

select * from matricula;