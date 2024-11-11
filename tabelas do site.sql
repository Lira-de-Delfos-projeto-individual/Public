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
    data_criacao DATETIME,
    papel ENUM('aluno', 'professor', 'administrador') DEFAULT 'aluno' -- Coluna de papel para definir o tipo de usuário
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    pagina_curso VARCHAR(255), -- Link para página do curso
    data_inicio DATE,
    duracao VARCHAR(50), -- Pode ser numérico se desejar uma unidade mais específica
    status VARCHAR(20) DEFAULT 'ativo' -- Status do curso (ativo ou inativo)
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
    curso_id INT, -- Associando o depoimento ao curso
    data_deposito DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id) -- Chave estrangeira para curso
);

-- Tabela de Apostilas
CREATE TABLE Apostilas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    link_pdf VARCHAR(255), -- Link para a apostila em PDF
    curso_id INT, -- Associando apostila ao curso
    FOREIGN KEY (curso_id) REFERENCES Cursos(id) -- Chave estrangeira para curso
);

-- Tabela de FAQ
CREATE TABLE FAQ (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pergunta TEXT NOT NULL,
    resposta TEXT NOT NULL
);

-- Inserindo Usuários
INSERT INTO Usuarios (nome, email, senha) VALUES
('Giuseppe Tartini', 'giuseppe@example.com', 'senha123'),
('Arcangelo Corelli', 'arcangelo@example.com', 'senha456'),
('Elizabeth Oliveira', 'elizabeth@example.com', 'senha432');

-- Inserindo Cursos
INSERT INTO Cursos (nome, descricao, pagina_curso, data_inicio, duracao) VALUES
('Curso de Teoria Musical', 'Aprenda os fundamentos da teoria musical.', 'link_para_pagina_do_curso_1', '2024-01-10', '3 meses'),
('Curso de Violão', 'Domine o violão com técnicas práticas.', 'link_para_pagina_do_curso_2', '2024-02-15', '4 meses'),
('Curso de Violino', 'Domine o violino com técnicas práticas.', 'link_para_pagina_do_curso_3', '2024-02-15', '4 meses'),
('Curso de Piano', 'Aprimore suas habilidades no piano.', 'link_para_pagina_do_curso_4', '2024-03-20', '5 meses');

-- Inserindo Inscrições
INSERT INTO Inscricoes (usuario_id, curso_id, data_inscricao) VALUES
(1, 1, NOW()),  -- Giuseppe Tartini se inscreveu no Curso de Teoria Musical
(2, 2, NOW()),  -- Arcangelo Corelli se inscreveu no Curso de Violão
(3, 2, NOW());  -- Elizabeth Oliveira se inscreveu no Curso de Violino

-- Inserindo Depoimentos
INSERT INTO Depoimentos (usuario_id, depoimento, curso_id, data_deposito) VALUES
(1, 'O curso de teoria musical é incrível! Aprendi muito.', 1, NOW()),
(2, 'Aula de violão super prática e divertida. Recomendo!', 2, NOW()),
(3, 'Estudar música aqui mudou minha vida! Nunca imaginei que poderia tocar tão bem em tão pouco tempo.', 3, NOW());

-- Inserindo Apostilas
INSERT INTO Apostilas (titulo, descricao, link_pdf, curso_id) VALUES
('Apostila de Teoria Musical', 'Apostila que cobre os conceitos básicos de teoria musical.', 'link_para_apostila1.pdf', 1),
('Apostila de Violão', 'Apostila com exercícios práticos para violão.', 'link_para_apostila2.pdf', 2),
('Apostila de Violino', 'Apostila com exercícios práticos para violino.', 'link_para_apostila3.pdf', 3),
('Apostila de Piano', 'Apostila com exercícios práticos para piano.', 'link_para_apostila4.pdf', 4);

-- Inserindo FAQ (alinhado com o conteúdo do site)
INSERT INTO FAQ (pergunta, resposta) VALUES
('Como faço para me inscrever no curso?', 'Para se inscrever em um curso, basta acessar a página do curso desejado e clicar no botão "Inscreva-se". Em seguida, você será redirecionado para a página de pagamento.'),
('Quais são os métodos de pagamento?', 'Você pode pagar pelos cursos usando cartões de crédito, PayPal, e transferências bancárias. Todos os pagamentos são seguros e processados por plataformas confiáveis.'),
('Preciso de algum material específico para os cursos?', 'Para os cursos de instrumentos, recomendamos que você tenha seu próprio instrumento (violão, piano, violino). Para os cursos de teoria musical, você precisará apenas de papel e caneta para fazer anotações e praticar os exercícios.'),
('Os cursos possuem certificado?', 'Sim! Ao concluir o curso, você receberá um certificado digital que poderá ser baixado ou impresso para fins de comprovação.'),
('Como acesso o material do curso?', 'Após a inscrição, você receberá um login e senha para acessar os materiais diretamente na plataforma, que está disponível 24/7.'),
('Posso acessar os cursos de qualquer lugar?', 'Sim! Os cursos estão disponíveis online e podem ser acessados de qualquer lugar, basta ter uma conexão com a internet.'),
('Posso refazer um curso depois de finalizado?', 'Sim! Você pode refazer os cursos quantas vezes quiser, enquanto sua inscrição estiver ativa.'),
('O que acontece se eu não conseguir terminar o curso?', 'Se você não conseguir terminar dentro do prazo, entre em contato com nosso suporte. Podemos prorrogar o prazo ou oferecer uma nova inscrição em outro momento.');

