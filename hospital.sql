create database bd_hospital

use bd_hospital

create table if not exists tbl_paciente (
  id int not null auto_increment primary key,
  nome_paciente varchar(190) not null,
  cpf varchar(20)not null,
  rg varchar(20)not null,
  data_nascimento date not null,
  email varchar(256),
  unique index (id)
);

create table if not exists tbl_tipo_telefone(
   id int not null auto_increment primary key,
   tipo varchar(20),
   unique index(id)
);

create table if not exists tbl_estado(
   id int not null auto_increment primary key,
   sigla varchar(2)not null,
   nome_estado varchar(30)not null,
   unique index (id)
);

create table if not exists tbl_cidade(
  id int not null auto_increment primary key,
  sigla varchar(2)not null,
  nome_cidade varchar(30)not null,
  id_estado int not null,
  constraint fk_estado_cidade
  foreign key(id_estado)
  references tbl_estado(id),
  unique index (id)
);

create table if not exists tbl_endereco_paciente (
  id int not null auto_increment primary key,
  logradouro varchar(100)not null,
  bairro varchar(100)not null,
  cep varchar(20)not null,
  id_cidade int not null,
  constraint fk_cidade_endereco
  foreign key(id_cidade)
  references tbl_cidade(id),
  id_paciente int not null,
  constraint fk_paciente_endereco
  foreign key(id_paciente)
  references tbl_paciente(id),
  unique index(id)
);

create table if not exists tbl_telefone_paciente(
  id int not null auto_increment primary key,
  ddd varchar(3)not null,
  numero varchar(20)not null,
  id_tipo_telefone int not null,
  constraint fk_tipo_telefone
  foreign key(id_tipo_telefone)
  references tbl_tipo_telefone(id),
  id_paciente int not null,
  constraint fk_paciente_telefone
  foreign key(id_paciente)
  references tbl_paciente(id),
  unique index(id)
);
create table if not exists tbl_medico (
id int not null auto_increment primary key,
nome varchar(190) not null,
cpf varchar(20)not null,
rg varchar(20)not null,
crm varchar(20)not null,
sexo varchar(30),
unique index(id)
);

create table if not exists tbl_telefone_medico(
id int not null auto_increment primary key,
ddd varchar(3)not null,
telefone varchar(20)not null,
id_tipo_telefone int not null,
constraint fk_tipo_telefone_telefone_medico
foreign key(id_tipo_telefone)
references tbl_tipo_telefone(id),
id_medico int not null,
constraint fk_medico_telefone_medico
foreign key(id_medico)
references tbl_medico(id),
unique index(id)
);

create table if not exists tbl_email_medico(
id int not null auto_increment primary key,
email varchar(256)not null,
id_medico int not null,
constraint fk_medico_email_medico
foreign key(id_medico)
references tbl_medico(id),
unique index(id)
);

create table if not exists tbl_endereco_medico(
id int not null auto_increment primary key,
logradouro varchar(100)not null,
bairro varchar(100),
id_medico int not null,
constraint fk_medico_endereco_medico
foreign key(id_medico)
references tbl_medico(id),
id_cidade int not null,
constraint fk_cidade_endere_medico
foreign key (id_cidade)
references tbl_cidade(id),
unique index(id)
);
create table if not exists tbl_medico (
id int not null auto_increment primary key,
nome varchar(190) not null,
cpf varchar(20)not null,
rg varchar(20)not null,
crm varchar(20)not null,
sexo varchar(30),
unique index(id)
);

create table if not exists tbl_telefone_medico(
id int not null auto_increment primary key,
ddd varchar(3)not null,
telefone varchar(20)not null,
id_tipo_telefone int not null,
constraint fk_tipo_telefone_telefone_medico
foreign key(id_tipo_telefone)
references tbl_tipo_telefone(id),
id_medico int not null,
constraint fk_medico_telefone_medico
foreign key(id_medico)
references tbl_medico(id)
);

create table if not exists tbl_email_medico(
id int not null auto_increment primary key,
email varchar(256)not null,
id_medico int not null,
constraint fk_medico_email_medico
foreign key(id_medico)
references tbl_medico(id)
);

create table if not exists tbl_endereco_medico(
id int not null auto_increment primary key,
logradouro varchar(100)not null,
bairro varchar(100),
id_medico int not null,
constraint fk_medico_endereco_medico
foreign key(id_medico)
references tbl_medico(id),
id_cidade int not null,
constraint fk_cidade_endere_medico
foreign key (id_cidade)
references tbl_cidade(id),
unique index(id)
);

create table if not exists tbl_especialidade(
id int not null auto_increment primary key,
nome varchar(100)not null,
descricao varchar(200)not null,
valor float not null,
unique index(id)
);

create table if not exists tbl_medico_especialidade_consulta(
id int not null auto_increment primary key,
id_medico int not null,
constraint FK_MEDICO_MEDICO_ESPECIALIDADE_CONSULTA
foreign key(id_medico)
references tbl_medico(id),
unique index(id)
);

create table if not exists tbl_tipo_consulta(
id int not null auto_increment primary key,
tipo_consulta varchar(40)not null,
unique index (id)
);

create table if not exists tbl_especialidade_medico(
id int not null auto_increment primary key,
id_medico int not null,
constraint FK_MEDICO_ESPECIALIDADE
foreign key (id_medico)
references tbl_medico(id)
);

create table if not exists tbl_consulta(
id int not null auto_increment primary key,
data_consulta date not null,
hora_consulta time not null,
descricao varchar(200)not null,
relatorio varchar(200)not null,

id_paciente int not null,
constraint FK_PACIENTE_CONSULTA
foreign key(id_paciente)
references tbl_paciente(id),

id_tipo_consulta int not null,
constraint FK_TIPO_CONSULTA_CONSULTA
foreign key(id_tipo_consulta)
references tbl_tipo_consulta(id),

id_especialidade_medico int not null,
constraint FK_ESPECIALIDADE_MEDICO_CONSULTA 
foreign key (id_especialidade_medico)
references tbl_especialidade_medico(id),
unique index(id)
);

create table if not exists tbl_enfermeiro(
id int not null auto_increment primary key,
nome varchar(190)not null,
cpf varchar(20)not null,
rg varchar(20)not null,
sexo varchar(10)not null,
data_nascimento date not null,
certificado varchar(300)not null,
unique index(id)
);

create table if not exists tbl_email_enfermeiro(
id int not null auto_increment primary key,
email varchar(256)not null,

id_enfermeiro int not null,
constraint FK_ENFREMEIRO_EMAIL_ENFERMEIRO
foreign key (id_enfermeiro)
references tbl_enfermeiro(id),
unique index(id)
);

create table if not exists tbl_telefone_enfermeiro(
id int not null auto_increment primary key,
ddd varchar(3)not null,
numero varchar(20)not null,

id_tipo_telefone int not null,
constraint FK_TIPO_TELEFONE_TELEFONE_ENFERMEIRO
foreign key(id_enfermeiro)
references tbl_tipo_telefone(id),

id_enfermeiro int not null,
constraint FK_ENFERMEIRO_TELEFONE_ENFERMEIRO
foreign key(id_enfermeiro)
references tbl_enfermeiro(id),
unique index(id)
);

create table if not exists tbl_endereco_enfermeiro(
id int not null auto_increment primary key,
logradouro varchar(100)not null,
bairro varchar(100)not null,
cep varchar(20)not null,

id_cidade int not null,
constraint FK_CIDADE_ENDERECO_ENFERMEIRO
foreign key(id_enfermeiro)
references tbl_cidade(id),

id_enfermeiro int not null,
constraint FK_ENFERMEIRO_ENDERECO_ENFERMEIRO
foreign key(id_enfermeiro)
references tbl_enfermeiro(id),
unique index(id)
);

create table if not exists tbl_tipo_internecao(
id int not null auto_increment primary key,
tipo_internecao varchar(100)not null,
descricao varchar(300)not null,
unique index (id)
);

create table if not exists tbl_internecao(
id int not null auto_increment primary key,
relatorio varchar(300)not null,
descricao varchar(300)not null,
data_internecao date not null,
hora time not null,
data_alta date,

id_tipo_internecao int not null,
constraint FK_TIPO_INTENACAO_INTERNACAO
foreign key(id_tipo_internecao)
references tbl_tipo_internecao(id),
unique index(id)
);

create table if not exists tbl_gravidade(
id int not null auto_increment primary key,
tipo_gravidade varchar(100)not null,
descricao varchar(200)not null,
unique index (id)
);


create table if not exists tbl_internacao_paciente(
id int not null auto_increment primary key,

id_internacao int not null,
constraint FKI_INTERNACAO_INTERNACAO_PACIENTE
foreign key(id_internacao)
references tbl_internecao(id),

id_paciente int not null,
constraint FK_PACIENTE_INTERNACAO_PACIENTE
foreign key(id_paciente)
references tbl_paciente(id),
unique index(id)
);

create table if not exists tbl_quarto(
id int not null auto_increment primary key,
numero_quarto int not null,
numero_cama int not null,
data_entrada date not null,
data_saida date,
hora_entrada time not null,
hora_saida time,
descricao varchar(200),

id_paciente_internacao int not null,
constraint FK_PACIENTE_QUARTO
foreign key(id_paciente_internacao)
references tbl_internacao_paciente(id),

id_enfermeiro int not null,
constraint FK_ENFERMEIRO_QUARTO
foreign key(id_enfermeiro)
references tbl_enfermeiro(id), 

id_gravidade int not null,
constraint FK_GRAVIDADE_QUARTO
foreign key(id_gravidade)
references tbl_gravidade(id),
unique index(id)
);


create table if not exists tbl_uti(
id int not null auto_increment primary key,
ala_uti varchar(30)not null,
quarto_uti int not null,
cama_uti int not null,
data_entrada date not null,
data_saida date,
hora_entrada time not null,
hora_saida time,
descricao varchar(300)not null,

id_internacao_paciente int not null,
constraint FK_INTERNACAO_PACIENTE_UTI
foreign key(id_internacao_paciente)
references tbl_internacao_paciente(id),

id_gravidade int not null,
constraint FK_GRAVIDADE_UTI
foreign key(id_gravidade)
references tbl_gravidade(id),

id_enfermeiro int not null,
constraint FK_ENFERMEIRO_UTI
foreign key(id_enfermeiro)
references tbl_enfermeiro(id),
unique index(id)
);

create table if not exists tbl_acompanhante(
id int not null auto_increment primary key,
nome varchar(190)not null,
cpf varchar(20)not null,
rg varchar(20)not null,
data_nascimento date not null,
email varchar(256)not null,
sexo varchar(10)not null,
unique index (id)
);

create table if not exists tbl_endereco_acompanhante(
id int not null auto_increment primary key,
logradouro varchar(100)not null,
bairro varchar(100)not null,
cep varchar(20)not null,

id_cidade int not null,
constraint FK_CIDADE_ENDERECO_ACOMPANHANTE
foreign key(id_cidade)
references tbl_cidade(id),

id_acompanhante int not null,
constraint FK_ACOMPANHANTE_ENDERECO_ENFERMEIRO
foreign key(id_acompanhante)
references tbl_acompanhante(id),
unique index(id)
);

create table if not exists tbl_telefone_acompanhante(
id int not null auto_increment primary key,
ddd varchar(3)not null,
numero varchar(20)not null,

id_tipo_telefone int not null,
constraint FK_TIPO_TELEFONE_TELEFONE_ACOMPANHANTE
foreign key(id_tipo_telefone)
references tbl_tipo_telefone(id),

id_acompanhante int not null,
constraint FK_ACOMPANHANTE_TELEFONE_ACOMPANHANTE
foreign key(id_acompanhante)
references tbl_acompanhante(id),
unique index(id)
);

create table if not exists tbl_convenio(
id int not null auto_increment primary key,
nome varchar(100)not null,
cnpj varchar(100) not null,
unique index(id)
);

create table if not exists tbl_paciente_convenio(
id int not null auto_increment primary key,
carteirinha varchar(20)not null,
validade date not null,

id_paciente int not null,
constraint FK_PACIENTE_PACIENTE_CONVENIO
foreign key(id_paciente)
references tbl_paciente(id),

id_convenio int not null,
constraint FK_CONVENIO_PACIENTE_CONVENIO
foreign key(id_convenio)
references tbl_convenio(id),
unique index(id) 
);

-- Inserindo dados na tabela Convenio
--
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(1, 'SulAmerica', '01685053001390', '30 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(2, 'Unimed', '477510596327845', '72 horas');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(3, 'Bradesco', '38409520784195', '24 dias');
insert into convenio(id_convenio, nome_convenio, cnpj_convenio, tempo_carencia) values(4, 'Biovidasaude', '04299138000194', '90 dias');


-- Inserindo dados na tabela Especialidade
--
insert into especialidade(id_especialidade, nome_especialidade) values(1, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(2, 'Clínica Geral');
insert into especialidade(id_especialidade, nome_especialidade) values(3, 'Gastroenterologia');
insert into especialidade(id_especialidade, nome_especialidade) values(4, 'Dermatologia');
insert into especialidade(id_especialidade, nome_especialidade) values(5, 'Cardiologia');
insert into especialidade(id_especialidade, nome_especialidade) values(6, 'Alergia');
insert into especialidade(id_especialidade, nome_especialidade) values(7, 'Otorrino');


-- Inserindo dados na tabela Tipo de quarto
--
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(1, '1200.00', 'Apartamento');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(2, '700.00', 'Quartos');
insert into tipo_quarto(id_tipo, valor_diario, desc_quarto) values(3, '400.00', 'Enfermaria');

-- Inserindo dados na tabela Medico
--
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id) values(1, 'Cleber Henrique Dantes', '033415829602', '303684', 'cleberdantes@gmail.com', 'Especialista', 2);
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id) values(2, 'Fernando Ehidi Kondo', '24415829601', '131807', 'drehidi@outlook.com', 'Especialista', 4);
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id) values(3, 'Jose Otani soares', '03815829601', '462981', 'joseotani@outlook.com', 'Residente', 6); 
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id) values(4, 'Maria Silvia soares', '02215829615', '609422', 'silvia422@gmail.com', 'Residente', 7);
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id) values(5, 'Carlos Alberto Ferreira', '01515829633', '247973', 'drcarlosalberto@gmail.com', 'Residente', 1);
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id) values(6, 'Jose Geraldo Dantas', '00815829620', '289184', 'drjosegeraldo@hotmail.com', 'Especialista', 6);
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id) values(7, 'Pedro Henrique Basto ', '12315829610', '257052', 'henriquebasto@gmail.com', 'Residente', 2);
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id) values(8, 'Pedro Wagner Santos ', '25415829609', '255255', 'drpedro@gmail.com', 'Especialista', 3);
insert into medico(id_medico, nome_medico, cpf_medico, crm, email_medico, cargo, especialidade_id) values(9, 'Sirleu Jorge sousa', '05615829603', '219543', 'drsirleusousa@gmail.com', 'Especialista', 1);

-- Inserindo dados na tabela Paciente
--
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(1, 'Marcia Sousa', '1995-03-21', '74951847', '1462085-x', 'marcia95@gmail.com',2);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(2, 'Andre Silva', '1980-07-21', '87165493', '1459870', 'andresilva80@gmail.com', 2);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(3, 'Denes Santos', '2001-01-11', '19874623', '3278451', 'denessantos01@gmail.com', null);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(4, 'Selma Correia', '1996-12-03', '65982365', '8541795', 'scorreia96@gmail.com', 4);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(5, 'Daniel de Melo', '2002-05-04', '14785296', '2684197', 'danielmelo@gmail.com', 3);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(6, 'Emerson Costa', '1989-02-25', '65987436', '145987-x', 'costa25@gmail.com', 1);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(7, 'Ruty da Silva', '1984-04-01', '65983063', '74859615', 'ruty04@gmail.com', 4);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(8, 'Rone Santiago', '2000-10-15', '85964723', '4569874', 'rsantiago00@gmail.com', null);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(9, 'Maria Aparecida', '1970-06-22', '36985269', '25647891', 'maparecida70@gmail.com', null);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(10, 'Gabriel de Souza', '1979-03-12', '36502178', '12097452', 'gabriel12@gmail.com', null);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(11, 'Carlos Santiago', '2000-07-18', '03269856', '69812045', 'carlos07@gmail.com', 4);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(12, 'Jose Vinius', '1982-11-12', '63025789', '3265471', 'josevinius@gmail.com', 3);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(13, 'Amelia Basto', '1996-07-13', '85479623', '2436598', 'basto@gmail.com', 1);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(14, 'Rosa Maria', '2001-03-20', '25316489', '25419876', 'rosa01@gmail.com', null);
insert into paciente(id_paciente, nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, email_paciente, convenio_id) values(15, 'Vanessa Prado', '1991-04-15', '56784985', '73564189', 'prado91@gmail.com', 1);

-- Inserindo dados na tabela Telefone
--
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(1, 11, 40028922, 1, null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(2, 11, 40089655, 2, null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(3, 11, 75589644, 3, null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(4, 11, 41587622, 4, null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(5, 11, 46685711, 5, null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(6, 11, 40028922, 6, null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(7, 11, 74851987, 7, null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(8, 11, 58749684, 8, null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(9, 11, 41879655, 9, null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(10, 11, 14487522, 10, null);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(11, 11, 985632001, null, 1);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(12, 11, 998654789, null, 2);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(13, 11, 987569856, null, 3);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(14, 11, 987654021, null, 4);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(15, 11, 958620347, null, 5);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(16, 11, 985314758, null, 6);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(17, 11, 987654259, null, 7);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(18, 11, 974851471, null, 8);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(19, 11, 914032569, null, 9);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(20, 11, 963266587, null, 10);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(21, 11, 941178546, null, 11);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(22, 11, 985864127, null, 12);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(23, 11, 963568891, null, 13);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(24, 11, 987475812, null, 14);
insert into telefone(id_telefone, ddd, numero, medico_id, paciente_id) values(25, 11, 987745876, null, 15);

-- Inserindo dados na tabela Endereco
--
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(1, 'Rua Brg. Galvão', 01154-000, 'Barra Funda', 'São Paulo', 'São Paulo', null, 11);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(2, 'Rua Dom Bento pickel', 02555-000, 'Casa Verde Alta', 'São Paulo', 'São Paulo', null, 12);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(3, 'Av. Lasar Segall', 02543-010, 'Vila Celeste', 'São Paulo', 'São Paulo', null, 13);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(4, 'Av. Imirim', 02464-600, 'Imirim', 'São Paulo', 'São Paulo', null, 14);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(5, 'Rua Maria do Carmo', 03206-010, 'Vila Alpina', 'São Paulo', 'São Paulo', null, 15);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(6, 'Rua Batataes', 01423-010, 'Jardim Paulista', 'São Paulo', 'São Paulo', 3, null);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(7, 'Rua Abílio Soares', 04005-001, 'Paraíso', 'São Paulo', 'São Paulo', 4, null);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(8, 'Rua Alvarenga', 05509-001, 'Butatã', 'São Paulo', 'São Paulo', 5, null);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(9, 'Rua Gago Coutinho', 02577-020, 'Vila Yara', 'Osasco', 'São Paulo', 6, null);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(10, 'Rua Froben', 05315-010, 'Vila Leopoldina', 'São Paulo', 'São Paulo', 7, null);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(11, 'Rua Mipibu', 05049-030, 'Vila Romana', 'São Paulo', 'São Paulo', null, 8);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(12, 'Rua Conselheiro Ramalho', 01325-001, 'Bela Vista', 'São Paulo', 'São Paulo', null, 9);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(13, 'Av. Tiradentes', 16400-050, 'Jardim Santa Edwirges', 'Guarulhos', 'São Paulo', null, 10);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(14, 'Rua Damianopolis', 07070-111, 'Vila Galvão', 'Guarulhos', 'São Paulo', 8, null);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(15, 'Rua Ismael Neri', 02335-001, 'Água Fria', 'São Paulo', 'São Paulo', 9, null);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(16, 'Av. Joaquina Ramalho', 02065-010, 'Vila Guilherme', 'São Paulo', 'São Paulo', 10, null);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(17, 'Rua Dias da Silva', 02114-001, 'Vila Maria', 'São Paulo', 'São Paulo', null, 4);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(18, 'Av. Pedroso da Silveira', 03028-050, 'Pari', 'São Paulo', 'São Paulo', null, 5);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(19, 'Rua Maria Joaquina', 03016-010, 'Brás', 'São Paulo', 'São Paulo', null, 6);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(20, 'Rua da Graça', 0659-511, 'Bom Retiro', 'São Paulo', 'São Paulo', null, 7);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(21, 'Rua Cardeal Arcoverde', 05407-003, 'Pinheiros', 'São Paulo', 'São Paulo', null, 1);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(22, 'Rua Jesuíno Arruda', 04532-082, 'Itaim Bibi', 'São Paulo', 'São Paulo', null, 2);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(23, 'Rua Romano Schiesari', 05018-020, 'Sumaré', 'São Paulo', 'São Paulo', null, 3);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(24, 'Rua da Consolação',  3325-3181 , 'Cerqueira César', 'São Paulo', 'São Paulo', 1, null);
insert into endereco(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id, paciente_id) values(25, 'Rua São Joaquim', 01508-001, 'Liberdade', 'São Paulo', 'São Paulo', 2, null);


-- Inserindo dados na tabela Enfermeiro
--
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(1, 'Danilo Soares', 74851574, '415879');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(2, 'João Fernandes', 58749617, '254109');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(3, 'André Silva', 78032145, '012478');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(4, 'Brenda de Araujo', 10479547, '960124');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(5, 'Antonio Domingues', 87459612, '784169');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(6, 'Afonso de Sousa', 20147896, '894175');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(7, 'Beatriz de Almeida', 12047953, '784196');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(8, 'Daniel Silva', 2143608, '254987');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(9, 'Paulo Augusto', 74198569, '120478');
insert into enfermeiro(id_enfermeiro, nome_enfermeiro, cpf_enfermeiro, cre) values(10, 'Ana dos Anjos', 88742514, '251369');


-- Inserindo dados na tabela Consulta
--
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(1, '2015-01-01', '13:40:00', '200.00', 3, 10, 5, 4);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(2, '2017-08-29', '08:00:00', '150.00', 4, 7, 13, 3);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(3, '2015-10-03', '12:30:00', '200.00', 1, 9, 4, 2);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(4, '2018-02-10', '09:30:00', '230.00', 1, 7, 12, 3);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(5, '2018-02-10', '11:00:00', '200.00', 4, 4, 11, 5);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(6, '2020-01-30', '18:00:00', '250.00', 1, 9, 4, 2);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(7, '2021-06-13', '15:30:00', '200.00', null, 7, 1, 3);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(8, '2022-01-01', '14:30:00', '200.00', null, 10, 3, 4);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(9, '2018-07-14', '08:30:00', '250.00', null, 7, 14, 3);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(10, '2019-05-08', '18:00:00', '250.00', null, 6, 14, 2);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(11, '2019-11-16', '08:45:00', '250.00', 4, 4, 13, 5);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(12, '2016-12-07', '15:00:00', '200.00', 4, 9, 11, 2);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(13, '2018-11-12', '09:30:00', '250.00', 3, 7, 5, 3);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(14, '2021-02-20', '12:15:00', '250.00', null, 10, 3, 4);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(15, '2021-02-20', '12:15:00', '250.00', null, 10, 3, 4);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(16, '2021-02-20', '12:15:00', '250.00', 1, 10, 2, 6);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(17, '2017-08-22', '14:15:00', '200.00', 1, 1, 6, 6);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(18, '2022-01-01', '08:45:00', '200.00', 2, 2, 7, 7);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(19, '2019-02-15', '17:00:00', '250.00', null, 8, 8, 1);
insert into consulta(id_consulta, data_consulta, hora_consulta, valor_consulta, convenio_id, medico_id, paciente_id, especialidade_id) values(20, '2021-11-29', '11:20:00', '200.00', null, 5, 9, 6);


-- Inserindo dados na tabela Receita
--
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(2, 'Roacutan, Pycnogenol', '2', 'Tomar um comprimido de roacutan uma vez ao dia. Tomar um comprimido de Pycnogenol uma vez ao dia', 1);
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(11, 'Omeprazol e Ibuprofeno', '2', 'Tomar 1 vez ao dia de manhã, durante 4 semanas. Tomar 1 comprimido de ibuprofene a cada 4 horas.', 2);
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(1, 'Dipirona 1g', '1', 'Tomar um comprimido a cada 6 horas. Não tomar mais de 4 comprimidos no dia', 3);
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(3, 'Omeprazol, Dipirona', '2', 'Tomar 1 comprimido de omeprazol uma vez ao dia de manhã, durante 4 semanas. Tomar um comprimido de dipirona a cada 6 horas. Não tomar mais de 4 comprimidos no dia', 4);
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(4, 'Dipirona, Ibuprofeno, Seki Xarope ', '3', 'Tomar um comprimido de dipirona a cada 6 horas. Não tomar mais de 4 comprimidos no dia, Tomar 1 comprimido de ibuprofene a cada 4 horas. Tomar o xarope se houver tosse', 5);
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(5, 'Diurético, Metoprolol', '2', 'Tomar 2 comprimidos de Diurético de 50 mg + 50 mg por dia. Tomar o Metoprolol uma vez ao dia', 6);
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(6, 'Omeprazol e Ibuprofeno', '2', 'Tomar 1 vez ao dia de manhã, durante 4 semanas. Tomar 1 comprimido de ibuprofene a cada 4 horas.', 7);
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(7, 'Roacutan, Pycnogenol', '2', 'Tomar um comprimido de roacutan uma vez ao dia. Tomar um comprimido de Pycnogenol uma vez ao dia', 8);
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(8, 'Omeprazol, Dipirona', '2', 'Tomar 1 comprimido de omeprazol uma vez ao dia de manhã, durante 4 semanas. Tomar um comprimido de dipirona a cada 6 horas. Não tomar mais de 4 comprimidos no dia', 9);
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(9, 'Dipirona, Ibuprofeno', '2', 'Tomar um comprimido de dipirona a cada 6 horas. Não tomar mais de 4 comprimidos no dia, Tomar 1 comprimido de ibuprofene a cada 4 horas. Tomar o xarope se houver tosse', 10);
insert into receita(id_receita, medicamento, qtd_medicamento,instrucao_uso, consulta_id) values(10, 'Diurético, Metoprolol', '2', 'Tomar 2 comprimidos de Diurético de 50 mg + 50 mg por dia. Tomar o Metoprolol uma vez ao dia', 11);


-- Inserindo dados na tabela Quarto
--
insert into quarto(id_quarto, numero, tipo_id) values(1, 02, 1);
insert into quarto(id_quarto, numero, tipo_id) values(2, 03, 2);
insert into quarto(id_quarto, numero, tipo_id) values(3, 04, 3);
insert into quarto(id_quarto, numero, tipo_id) values(4, 05, 3);
insert into quarto(id_quarto, numero, tipo_id) values(5, 10, 1);


-- Inserindo dados na tabela Internacao
--
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) values (1, '2015-01-01', '2015-01-15', '2015-01-15', 'TRATAMENTO e MEDICAMENTO DA DOENÇA DA RETINA', 8, 5, 2);
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) values (2, '2020-05-21', '2020-05-29', '2020-05-25', 'RADIOTERAPIA DO APARELHO DIGESTIVO', 1, 10, 5);
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) values (3, '2016-08-18', '2016-08-30', '2016-08-26', 'TESTE MOLECULAR PARA A DETECÇÃO DO COMPLEXO MYCOBACTERIUM TUBERCULOSIS', 8, 5, 2);
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) values (4, '2018-07-02', '2018-07-10', '2018-07-15', 'TRATAMENTO DE INFECÇÂO PELO NOVO CORONAVÍRUS - COVID 19', 15, 3, 1);
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) values (5, '2022-01-01', '2022-01-05', '2022-01-04', 'REALIZAÇÃO ELETROCARDIOGRAMA', 1, 6, 3);
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) values (6, '2019-02-22', '2019-02-27', '2019-02-27', 'INSERÇÃO DO IMPLANTE SUBDÉRMICO LIBERADOR DE ETONOGESTREL', 7, 9, 4);
insert into internacao(id_internacao, data_entrada, data_prev_alta, data_efet_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) values (7, '2020-03-14', '2020-03-20', '2020-03-19', 'TRATAMENTO DE INTERCORRÊNCIA PÓS-TRANSPLANTE DE FÍGADO', 13, 8,5);


-- Inserindo dados na tabela Plantão
--
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (1, '2015-01-01', '05:00:00', 1, 2);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (2, '2015-01-01', '18:00:00', 1, 7);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (3, '2020-05-21', '10:00:00', 2, 8);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (4, '2016-08-18', '18:30:00', 3, 5);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (5, '2016-08-19', '06:00:00', 3, 1);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (6, '2018-07-02', '08:40:00', 4, 9);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (7, '2018-07-02', '22:00:00', 4, 7);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (8, '2022-01-01', '15:00:00', 5, 6);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (9, '2022-01-02', '05:00:00', 5, 3);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (10, '2020-05-21', '20:00:00', 2, 3);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (11, '2019-02-22', '23:30:00', 6, 4);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (12, '2019-02-23', '10:00:00', 6, 8);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (13, '2020-02-22', '09:00:00', 7, 3);
insert into plantao(id_plantao, data_plantao, hora_plantao, internacao_id, enfermeiro_id) values (14, '2020-02-22', '20:30:00', 7, 1);




insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(8, 'Rua Alvarenga', 05509-001, 'Butatã', 'São Paulo', 'São Paulo', 5);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(9, 'Rua Gago Coutinho', 02577-020, 'Vila Yara', 'Osasco', 'São Paulo', 6 );
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(10, 'Rua Froben', 05315-010, 'Vila Leopoldina', 'São Paulo', 'São Paulo', 7);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(11, 'Rua Mipibu', 05049-030, 'Vila Romana', 'São Paulo', 'São Paulo', 8);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(12, 'Rua Conselheiro Ramalho', 01325-001, 'Bela Vista', 'São Paulo', 'São Paulo', 9);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(13, 'Av. Tiradentes', 16400-050, 'Jardim Santa Edwirges', 'Guarulhos', 'São Paulo', 10);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(14, 'Rua Damianopolis', 07070-111, 'Vila Galvão', 'Guarulhos', 'São Paulo', 8);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(15, 'Rua Ismael Neri', 02335-001, 'Água Fria', 'São Paulo', 'São Paulo', 9);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(16, 'Av. Joaquina Ramalho', 02065-010, 'Vila Guilherme', 'São Paulo', 'São Paulo', 10);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(17, 'Rua Dias da Silva', 02114-001, 'Vila Maria', 'São Paulo', 'São Paulo', 4);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(18, 'Av. Pedroso da Silveira', 03028-050, 'Pari', 'São Paulo', 'São Paulo', 5);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(19, 'Rua Maria Joaquina', 03016-010, 'Brás', 'São Paulo', 'São Paulo', 6);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(20, 'Rua da Graça', 0659-511, 'Bom Retiro', 'São Paulo', 'São Paulo', 7);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(21, 'Rua Cardeal Arcoverde', 05407-003, 'Pinheiros', 'São Paulo', 'São Paulo', 1);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(22, 'Rua Jesuíno Arruda', 04532-082, 'Itaim Bibi', 'São Paulo', 'São Paulo',  2);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(23, 'Rua Romano Schiesari', 05018-020, 'Sumaré', 'São Paulo', 'São Paulo', 3);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(24, 'Rua da Consolação',  3325-3181 , 'Cerqueira César', 'São Paulo', 'São Paulo', 1);
insert into tbl_endereco_medico(id_endereco, logradouro, cep, bairro, cidade, estado, medico_id) values(25, 'Rua São Joaquim', 01508-001, 'Liberdade', 'São Paulo', 'São Paulo', 2);


