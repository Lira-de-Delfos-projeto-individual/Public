CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    data_criacao DATETIME DEFAULT '2024-01-01 00:00:00',
    data_nascimento DATE,
    status ENUM('ativo', 'inativo') DEFAULT 'ativo' -- Para controlar o status do usuário
);

CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    duracao VARCHAR(50),
    status ENUM('ativo', 'finalizado') DEFAULT 'ativo' -- Novo campo para controle do status do curso
);

CREATE TABLE Inscricoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    curso_id INT,
    data_inscricao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('confirmada', 'pendente', 'cancelada') DEFAULT 'confirmada',
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

CREATE TABLE Depoimentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    depoimento TEXT,
    data_deposito DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

CREATE TABLE Apostilas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    link_pdf VARCHAR(255),
    tipo ENUM('PDF', 'Vídeo', 'Link Externo') DEFAULT 'PDF' -- Novo campo para tipo de apostila
);

CREATE TABLE FAQ (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pergunta TEXT NOT NULL,
    resposta TEXT NOT NULL,
    categoria VARCHAR(50) -- Para categorizar as perguntas, como 'Inscrição', 'Cursos', 'Pagamentos', etc.
);

INSERT INTO Usuarios (nome, email, senha, data_nascimento) VALUES
('Fabio Lima', 'joao@example.com', 'senha123', '1990-05-10'),
('Maria Oliveira', 'maria@example.com', 'senha456', '1985-08-15'),
('Carlos Eduardo', 'carlos@example.com', 'senha789', '1992-02-20'),
('Sofia Souza', 'sofia@example.com', 'senha321', '1994-10-30'),
('Elizabeth Lancellot', 'elizabeth@example.com', 'senha432', '1988-04-25');

INSERT INTO Cursos (nome, descricao, data_inicio, duracao) VALUES
('Curso de Teoria Musical', 'Aprenda os fundamentos da teoria musical.', '2024-01-10', '3 meses'),
('Curso de Violão', 'Domine o violão com técnicas práticas.', '2024-02-15', '4 meses'),
('Curso de Violino', 'Domine o violino com técnicas práticas.', '2024-02-15', '4 meses'),
('Curso de Piano', 'Aprimore suas habilidades no piano.', '2024-03-20', '5 meses');

INSERT INTO Inscricoes (usuario_id, curso_id) VALUES
(1, 1),  -- Fabio Lima se inscreveu no Curso de Teoria Musical
(1, 2),  -- Fabio Lima se inscreveu no Curso de Violão
(2, 1),  -- Maria Oliveira se inscreveu no Curso de Teoria Musical
(3, 3),  -- Carlos Eduardo se inscreveu no Curso de Piano
(4, 2),  -- Sofia Souza se inscreveu no Curso de Violino
(5, 2);  -- Elizabeth Lancellot se inscreveu no Curso de Violino

INSERT INTO Depoimentos (usuario_id, depoimento) VALUES
(1, 'O curso de teoria musical é incrível! Aprendi muito.'),
(2, 'Aula de violão super prática e divertida. Recomendo!'),
(3, 'Estudar música aqui mudou minha vida! Nunca imaginei que poderia tocar tão bem em tão pouco tempo.'),
(4, 'Aula de piano super prática e divertida. Recomendo!'),
(5, 'As aulas são incríveis! O professor Robert é muito dedicado.');
