CREATE DATABASE Lira_De_Delfos;
USE Lira_De_Delfos;

-- Tabela de Usuários
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20), -- Ajuste aqui se necessário
    endereco VARCHAR(255), -- Ajuste aqui se necessário
    data_criacao datetime
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    duracao VARCHAR(50) -- Pode ser numérico se desejar uma unidade mais específica
);

-- Tabela de Inscrições
CREATE TABLE Inscricoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    curso_id INT,
    data_inscricao DATETIME,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

-- Tabela de Depoimentos
CREATE TABLE Depoimentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    depoimento TEXT,
    data_deposito DATETIME DEFAULT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabela de Apostilas
CREATE TABLE Apostilas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    link_pdf VARCHAR(255) -- Use um link único para cada apostila
);

-- Tabela de FAQ
CREATE TABLE FAQ (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pergunta TEXT NOT NULL,
    resposta TEXT NOT NULL
);

-- Inserindo Usuários
INSERT INTO Usuarios (nome, email, senha) VALUES
('Fabio Lima', 'joao@example.com', 'senha123'),
('Maria Oliveira', 'maria@example.com', 'senha456'),
('Carlos Eduardo', 'carlos@example.com', 'senha789'),
('Sofia Souza', 'sofia@example.com', 'senha321'),
('Elizabeth Lancellot', 'elizabeth@example.com', 'senha432');

-- Inserindo Cursos
INSERT INTO Cursos (nome, descricao, data_inicio, duracao) VALUES
('Curso de Teoria Musical', 'Aprenda os fundamentos da teoria musical.', '2024-01-10', '3 meses'),
('Curso de Violão', 'Domine o violão com técnicas práticas.', '2024-02-15', '4 meses'),
('Curso de Violino', 'Domine o violino com técnicas práticas.', '2024-02-15', '4 meses'),
('Curso de Piano', 'Aprimore suas habilidades no piano.', '2024-03-20', '5 meses');

-- Inserindo Inscrições (completa depois)
INSERT INTO Inscricoes (usuario_id, curso_id) VALUES
(1, 1),  -- Fabio Lima se inscreveu no Curso de Teoria Musical
(1, 2),  -- Fabio Lima se inscreveu no Curso de Violão
(2, 1),  -- Maria Oliveira se inscreveu no Curso de Teoria Musical
(3, 3),  -- Carlos Eduardo se inscreveu no Curso de Piano
(4, 2),  -- Sofia Souza se inscreveu no Curso de Violino
(5, 2);  -- Elizabeth Lancellot se inscreveu no Curso de Violino

-- Inserindo Depoimentos
INSERT INTO Depoimentos (usuario_id, depoimento) VALUES
(1, 'O curso de teoria musical é incrível! Aprendi muito.'),
(2, 'Aula de violão super prática e divertida. Recomendo!'),
(3, 'Estudar música aqui mudou minha vida! Nunca imaginei que poderia tocar tão bem em tão pouco tempo.'),
(4, 'As aulas são incríveis! O professor Robert é muito dedicado.'),
(5, 'As aulas são incríveis! O professor Robert é muito dedicado.');

-- Inserindo Apostilas
INSERT INTO Apostilas (titulo, descricao, link_pdf) VALUES
('Apostila de Teoria Musical', 'Apostila que cobre os conceitos básicos de teoria musical.', 'link_para_apostila1.pdf'),
('Apostila de Violão', 'Apostila com exercícios práticos para violão.', 'link_para_apostila2.pdf'),
('Apostila de Violino', 'Apostila com exercícios práticos para violino.', 'link_para_apostila3.pdf'), -- Corrigido o link
('Apostila de Piano', 'Apostila com exercícios práticos para piano.', 'link_para_apostila4.pdf'); -- Corrigido o link

-- Inserindo FAQ
INSERT INTO FAQ (pergunta, resposta) VALUES
('Como faço para me inscrever em um curso?', 'Para se inscrever, basta acessar a seção de cursos e clicar no botão "Inscreva-se".'),
('Os cursos têm certificado?', 'Sim, todos os cursos oferecem um certificado de conclusão.'),
('É necessário ter experiência anterior para se inscrever?', 'Não! Nossos cursos são projetados para atender iniciantes e músicos de todos os níveis.'),
('Posso cancelar minha inscrição?', 'Sim, você pode cancelar sua inscrição, mas recomendamos que você nos avise com antecedência para verificar a política de reembolso.'),
('Qual é a duração dos cursos?', 'A duração varia de curso para curso. Em geral, nossos cursos têm duração de 8 a 12 semanas, dependendo do conteúdo.'),
('Como posso entrar em contato com a escola?', 'Você pode entrar em contato conosco pelo e-mail LiraDeDelfos@gmail.com ou pelo telefone (11) 95849-5678.'),
('Os professores são qualificados?', 'Sim, todos os nossos professores têm experiência comprovada e formação adequada nas áreas em que lecionam.'),
('Posso agendar uma aula experimental?', 'Sim! Oferecemos aulas experimentais para que você possa conhecer nosso método de ensino antes de se inscrever.');
