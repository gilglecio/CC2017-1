/* CRIÇÃO DA TABELA CIDADE */
CREATE TABLE cities
(
	-- O ID DEVE COMÇAR COM 1 E INCREMENTAR DE 1 EM 1
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(50) NOT NULL,
	uf CHAR(2) NOT NULL,
)

/* CRIÇÃO DA TABELA PROFESSOR */
CREATE TABLE teachers
(
	-- O ID DEVE COMÇAR COM 1 E INCREMENTAR DE 1 EM 1
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	registration INT NOT NULL,
	name VARCHAR(45) NOT NULL,
	rg VARCHAR(15) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	address_public_place VARCHAR(100) NOT NULL,
	address_neighborhood VARCHAR(45) NOT NULL,
	address_number VARCHAR(15) NOT NULL,
	address_cep VARCHAR(8) NOT NULL, 
	-- APENAS AS LETRAS F e M SÃO ACEITAS
	gender VARCHAR(1) CONSTRAINT ck_gender CHECK ( gender IN ('F', 'M')),
	-- RELACIONAMENTO 1:N COM CURSO
	city_id INT CONSTRAINT fk_city_id1 FOREIGN KEY (city_id) REFERENCES cities(id),
	-- APENAS OS NUMEROS 0 e 1 SÃO ACEITOS
	status TINYINT CONSTRAINT ck_status1 CHECK (status IN (0, 1))
)

/* CRIÇÃO DA TABELA MATERIA */
CREATE TABLE matters
(
	-- O ID DEVE COMÇAR COM 1 E INCREMENTAR DE 1 EM 1
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(45) NOT NULL,
	description VARCHAR(255) NOT NULL,
	workload TINYINT NOT NULL
)

/* CRIÇÃO DA TABELA CURSO */
CREATE TABLE courses
(
	-- O ID DEVE COMÇAR COM 1 E INCREMENTAR DE 1 EM 1
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(45) NOT NULL,
	shift VARCHAR(45) NOT NULL,
	description VARCHAR(255) NOT NULL,
	semesters TINYINT NOT NULL
)

/* CRIÇÃO DA TABELA N:M ENTRE MATERIA E CURSO */
CREATE TABLE matters_courses
(
	-- RELACIONAMENTO 1:N COM MATERIA
	matter_id INT CONSTRAINT fk_matter_id FOREIGN KEY (matter_id) REFERENCES matters(id),
	-- RELACIONAMENTO 1:N COM CURSO
	course_id INT CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES courses(id),
	-- DEFINIDO A CHAVE COMPOSTA
	CONSTRAINT pk_matters_courses PRIMARY KEY (matter_id,course_id)
)

/* CRIÇÃO DA TABELA N:M ENTRE MATERIA E PROFESSOR */
CREATE TABLE matters_teachers
(
	-- RELACIONAMENTO 1:N COM MATERIA
	matter_id INT CONSTRAINT fk_matter_id1 FOREIGN KEY (matter_id) REFERENCES matters(id),
	-- RELACIONAMENTO 1:N COM PROFESSOR
	teacher_id INT CONSTRAINT fk_teacher_id FOREIGN KEY (teacher_id) REFERENCES teachers(id),
	-- DEFINIDO A CHAVE COMPOSTA
	CONSTRAINT pk_matters_teachers PRIMARY KEY (matter_id, teacher_id)
)

/* CRIÇÃO DA TABELA ALUNO */
CREATE TABLE students
(
	-- O ID DEVE COMÇAR COM 1 E INCREMENTAR DE 1 EM 1
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	rg VARCHAR(15) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	registration INT NOT NULL,
	name VARCHAR(45) NOT NULL,
	address_public_place VARCHAR(100) NOT NULL,
	address_neighborhood VARCHAR(45) NOT NULL,
	address_number VARCHAR(15) NOT NULL,
	address_cep VARCHAR(8) NOT NULL, 
	-- APENAS AS LETRAS F e M SÃO ACEITAS
	gender VARCHAR(1) CONSTRAINT ck_gender1 CHECK (gender IN ('F','M')),
	-- APENAS OS NUMEROS 0 e 1 SÃO ACEITOS
	status TINYINT CONSTRAINT ck_status CHECK (status IN (0, 1)),
	-- RELACIONAMENTO 1:N COM CURSO
	course_id INT CONSTRAINT fk_course_id1 FOREIGN KEY (course_id) REFERENCES courses(id),
	-- RELACIONAMENTO 1:N COM CIDADE
	city_id INT CONSTRAINT fk_city_id FOREIGN KEY (city_id) REFERENCES cities(id),
)

INSERT INTO cities (name, uf) VALUES 
	('TEIXERIA DE FREITAS', 'BA'),
	('ITAMARAJÚ', 'BA'),
	('CARAVELAS', 'BA'),
	('SALVADOR', 'BA')

INSERT INTO courses (name, description, semesters, shift) VALUES
	('CIENCIA DA COMPUTAÇÃO', 'FORMA CIENTISTAS DA COMPUTAÇÃO', 8, 'MATUTINO'),
	('MEDICINA', 'FORMA PROFISSIONAIS CAPAZES DE SALVAR VIDAS', 10, 'VESPERTINO'),
	('DIREITO', 'FORMA PROFISISONAIS PARA DEVEDER A LEI ACIMA DE TUDO', 15, 'NOTURNO'),
	('ENGENHARIA DE AUTOMAÇÃO', 'FORMA PROFISSIONAIS CAPAZES DE CONSTRUIR E PROGRAMAR MAQUINAS', 5, 'INTEGRAL')

INSERT INTO matters (name, workload, description) VALUES
	('PROGRAMAÇÃO DE BANCO DE DAODS', 100, 'PROGRAMAÇÃO'),
	('CÁLCULO NUMÉRICO', 50, 'MATEMATICA APLICADA'),
	('DIREITO DO CONSUMIDOR', 80, 'DEFENDE O CONSUMIDOR'),
	('ANATOMIA', 120, 'PARTES DO CORPO HUMANO'),
	('CIRCUITOS DIGITAIS', 35, 'CIRCUITOS INTEGRAIS E DIGITAIS')

INSERT INTO teachers (city_id, cpf, address_neighborhood, address_cep, address_public_place, address_number, registration, name, rg, gender, status) VALUES
	(1, '01234567891', 'CASTELINHO', '45995000', 'RUA CARNE NA UBA', '24-v', 979, 'JOAO MENDOÇA II', '168885789', 'M', 1),
	(2, '89257567891', 'COLINA VERDE', '45995778', 'RUA EVANGÉLICA', '7789', 981, 'MARIA CRISTINA', '168885790', 'F', 1)

INSERT INTO students (city_id, cpf, course_id, address_neighborhood, address_cep, address_public_place, address_number, registration, name, rg, gender, status) VALUES
	(3, '06615683500', 1, 'SANTA RITA', '45992088', 'RUA VARGINIA SILVA', '8898', '000054', 'JOAO PAULO SANTOS', '7789795545', 'M', 1),
	(4, '06615683577', 3, 'TRANCREDO NEVES', '45992777', 'RUA BAHIA', '7789', '000321', 'DEBORA SILVA', '7789795777', 'F', 1)

INSERT INTO matters_courses (matter_id, course_id) VALUES 
	(1,1), (1,2), (1,3), (1,4), 
	(2,1), (2,2), (2,3), (2,4), 
	(3,1), (3,2), (3,3), (3,4), 
	(4,1), (4,2), (4,3), (4,4), 
	(5,1), (5,2), (5,3), (5,4)

INSERT INTO matters_teachers(teacher_id, matter_id) VALUES 
	(1, 1), (1, 2), (1, 5),
	(2, 4)
