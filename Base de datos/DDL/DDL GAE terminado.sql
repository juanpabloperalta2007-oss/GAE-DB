drop database gae;
create database GAE;
use GAE;

create table usuario(
	id_usuario int auto_increment primary key,
	login varchar(250) unique,
	password_hash varchar(255)not null,
	activa int,
	email varchar(255) unique not null,
	token_activacion varchar(255),
	token_recuperacion_contrasena varchar(255),
	fecha_token_recuperacion varchar(255) 
);

create table rol (
	id_rol int auto_increment primary key,
	nombre varchar(255) not null
);

create table curso(
	id_curso int auto_increment primary key,
	nombre_curso varchar(255)unique,
	estado varchar(11)
);

create table materia(
	id_materia int auto_increment primary key,
	nombre_materia varchar(30),
    estado varchar(11)
);

create table periodo(
	id_periodo int auto_increment primary key,
	fecha_inicio date not null,
    fecha_fin date not null,
    nombre varchar(100)
);

create table rol_usuario(
	id_rol int not null,
    id_usuario int not null,
    primary key (id_rol, id_usuario),
	FOREIGN KEY (id_rol)
	REFERENCES rol(id_rol)
	ON DELETE CASCADE
	ON UPDATE CASCADE,

    FOREIGN KEY (id_usuario)
	REFERENCES usuario(id_usuario)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

create table cliente(
	id_cliente int auto_increment primary key,
    tipo_documento varchar(20) not null,
    numero_documento varchar(20)unique not null,
    primer_nombre varchar(100) not null,
    segundo_nombre varchar(100) null,
    primer_apellido varchar(100) not null,
    segundo_apellido varchar(100) null,
    id_usuario int not null,
    foreign key (id_usuario) references usuario(id_usuario)
			
);

create table coordinador(
	id_coordinador int auto_increment primary key,
	estado varchar(11),
	area varchar(255),
    id_cliente int not null,
    foreign key (id_cliente) references cliente(id_cliente)
);

create table coordinador_curso(
	id_coordinador int not null,
    id_curso int not null,
    primary key (id_coordinador, id_curso),
    
    foreign key (id_coordinador) references coordinador(id_coordinador),
    foreign key (id_curso) references curso(id_curso)
);

create table profesor(
	id_profesor int auto_increment primary key,
    estado varchar(11),
    id_cliente int not null,
    foreign key(id_cliente) references cliente(id_cliente)
);

create table acudiente(
	id_acudiente int auto_increment primary key,
    direccion varchar(50),
    estado varchar(11),
    telefono varchar(18),
    id_cliente int not null,
    foreign key (id_cliente) references cliente(id_cliente)
);

create table estudiante (
	id_estudiante int auto_increment primary key,
	primer_nombre varchar(100) not null,
    segundo_nombre varchar(100) null,
    primer_apellido varchar(100) not null,
    segundo_apellido varchar(100) null,
	codigo_lista int unique not null,
    estado varchar(10) not null,
    id_acudiente int not null,
    id_cliente int not null,
    foreign key (id_acudiente) references acudiente(id_acudiente),
    foreign key (id_cliente) references cliente(id_cliente)
);

create table curso_periodo(
	id_curso int not null,
    id_periodo int not null,
    primary key (id_curso, id_periodo),
    
    foreign key (id_curso) references curso(id_curso),
    foreign key (id_periodo) references periodo(id_periodo)
);

create table profesor_curso_periodo(

	id_profesor int not null,

	id_curso int not null,

	id_periodo int not null,

	primary key(
	id_profesor,
	id_curso,
	id_periodo
	),

	foreign key (id_profesor)
	references profesor(id_profesor),

	foreign key (id_curso,id_periodo)
	references curso_periodo(id_curso,id_periodo)

);

create table profesor_materia (
	id_profesor int not null,
    id_materia int not null,
    primary key (id_profesor, id_materia),
    
    foreign key (id_profesor) references profesor (id_profesor),
    foreign key (id_materia) references materia (id_materia)
);

create table aviso_asistencia(
	id_aviso_asistencia int auto_increment primary key,
    fecha_aviso date not null,
    motivo varchar (200) not null,
    estado varchar (50),
    observaciones varchar(200) null,
    id_profesor int not null,
    id_acudiente int not null,
    foreign key (id_profesor) references profesor(id_profesor),
    foreign key (id_acudiente) references acudiente(id_acudiente)
);

create table calendario (
	id_calendario int auto_increment primary key,
    fecha date not null,
    nombre varchar(100),
    id_curso int not null,
    foreign key (id_curso) references curso(id_curso)
);

create table estudiante_curso (
	anio year,
    id_estudiante int not null,
    id_curso int not null, 
    primary key (id_estudiante, id_curso, anio),
    
    foreign key (id_estudiante) references estudiante(id_estudiante),
    foreign key (id_curso) references curso (id_curso)
);

create table calificacion (
	id_calificacion int auto_increment primary key,
    nota int null,
    id_materia int not null,
    id_estudiante int not null,
    id_periodo int not null,
    foreign key (id_materia) references materia(id_materia),
    foreign key (id_estudiante) references estudiante(id_estudiante),
    foreign key (id_periodo) references periodo(id_periodo)
);

create table curso_materia (
	id_curso int not null,
    id_materia int not null,
    primary key (id_curso, id_materia),
    
    foreign key (id_curso) references curso (id_curso),
    foreign key (id_materia) references materia(id_materia)
);

create table horario (	
	id_horario int auto_increment primary key,
    anio year not null,
    dia_semana varchar(255) not null,
    hora_inicio time not null,
    hora_fin time not null,
    id_curso int not null,
    id_materia int not null,
    foreign key (id_curso, id_materia) references curso_materia(id_curso, id_materia)
);

create table asistencia (
	id_asistencia int auto_increment primary key,
    fecha date not null,
    estado varchar(100) not null,
    id_estudiante int not null,
    id_horario int not null,
    foreign key (id_estudiante) references estudiante(id_estudiante),
    foreign key (id_horario) references horario (id_horario)
);

create table correo (
	id_correo int auto_increment primary key,
    asunto varchar(50),
	mensaje text,
    fecha_envio date,
    id_cliente int not null,
	foreign key (id_cliente) references cliente (id_cliente)
);
    
    
    