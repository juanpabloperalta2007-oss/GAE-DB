insert into rol (nombre) values ('coordinador'), ('profesor'), ('acudiente');

insert into usuario (login,password_hash, activa, email, token_activacion, token_recuperacion_contrasena, fecha_token_recuperacion) values 
('paolarojas@GAE.com', sha2('admin123',256), 1 , 'paolarojas@gmail.com' , 'abc1', '3y33yg','2026-01-01'), 
('dorisvillalba@GAE.com', sha2('dkfffff',256), 1, 'dorisvillalba@gmail.com' , 'abc12', '3y33yg','2026-01-01'), 
('laurarestrepo@GAE.com', SHA2('dkjdjoooo',256),1, 'laurarestrepo@gmail.com' , 'abc123', '3y33yg','2026-01-01'), 
('marcelacontreras@GAE.com', SHA2('deutet',256), 1 , 'marcelacontreras@gmail.com' , 'abc1234', '3y33yg','2026-01-01'), 
('juliethpinzon@GAE.com', SHA2('dbddhd',256), 1 , 'juliethpinzon@gmail.com' , 'abc12345', '3y33yg','2026-01-01'), 
('esperanzaramirez@GAE.com', SHA2('dkjdjdh',256), 1 , 'esperanzaramirez@gmail.com' , 'abc123456', '3y33yg','2026-01-01'), 
('diegoleal@GAE.com', SHA2('dkjdjdh',256), 1 , 'diegoleal@gmail.com' , 'abc1234567', '3y33yg','2026-01-01'), 
('felipegomez@GAE.com', SHA2('dkjdjdh',256), 1 , 'felipegomez@gmail.com' , 'abc1', '3y33yg','2026-01-01'),
('felipemartinez@GAE.com', SHA2('abc12345',256), 1 , 'felipemartinez@gmail.com' , 'tok107', 'rec907','2026-01-08'),
('sophialopez@GAE.com', SHA2('xyz987',256), 1 , 'sophialopez@gmail.com' , 'tok108', 'rec908','2026-01-09'),
('camiladiaz@GAE.com', SHA2('miclave11',256), 1 , 'camiladiaz@gmail.com' , 'tok109', 'rec909','2026-01-10'),
('nicolasvargas@GAE.com', SHA2('test2026',256), 1 , 'nicolasvargas@gmail.com' , 'tok110', 'rec910','2026-01-11');

insert into rol_usuario (id_rol, id_usuario) values ( 1,1), (1,2), (2,3), (2,4), (2,5), (3,6), (3,7), (3,8);


insert into cliente (tipo_documento, numero_documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, id_usuario) values 
( 'CC', 4878738 , 'paola', 'andrea', 'rojas', 'amarillas', 1),
( 'CC', 74646646 , 'doris', 'yael', 'villalba', 'torres', 2),
( 'CC', 1346655 , 'laura', '', 'restrepo', 'gomez', 3),
( 'CC', 546464 , 'marcela', 'esperanza', 'contreras', 'carvajal', 4),
( 'CC', 178716 , 'fanny', 'julieth', 'pinzon', 'romero', 5),
( 'CC', 898499 , 'gloria', 'esperanza', 'ramirez', 'martinez', 6),
( 'CC', 23673663 , 'diego', 'fernando', 'leal', 'ramirez', 7),
( 'CC', 437732732 , 'andres', 'felipe', 'gomez', 'casas', 8),
( 'CC', 4377324 , 'fredy', 'felipe', 'martinez', 'loaiza', 9),
( 'CC', 5356363 , 'laura', 'sophia', 'gomez', 'lopez', 10),
( 'CC', 5858858 , 'valery', 'camila', 'patiño', 'flores',11),
( 'CC', 42248474 , 'diego', 'nicolas', 'vega', 'vargas', 12);


insert into coordinador (estado, area, id_cliente) values ('activo', 'academico', 1), ('activo', 'convivencia', 2);

insert into profesor (estado, id_cliente) values 
('activo', 3),
('activo', 4),
('activo', 5);

insert into curso (nombre_curso, estado) values
('6A', 'activo'), ('7A', 'activo'),('8A', 'activo'), ('9A', 'activo'), ('10A', 'activo'), ('11A', 'activo');

insert into coordinador_curso (id_coordinador, id_curso) values
(1, 1), (1,3), (1,2);

insert into acudiente (direccion, id_cliente, estado, telefono) values
('d 73 # 78 i 50' , 6, 'activo', 3213124525),
('kra 75 # 78a' , 7 , 'activo', 3102070720),
('cl 78-73 sur' , 8 , 'activo', 3001297741),
('cra 10 # 25-30' ,9, 'activo', 3204567890),
('cll 45 # 18-22' , 10, 'activo', 3119876543),
('av 68 # 72-15' , 11, 'inactivo', 3152233445),
('transv 90 # 12-40' , 12, 'activo', 3005566778);


insert into estudiante (primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, codigo_lista, estado, id_acudiente, id_cliente) values
('Juan', 'David', 'Gomez', 'Perez', 1, 'activo', 1, 1),
('Maria', 'Alejandra', 'Lopez', 'Ramirez', 10,'activo', 2, 2),
('Carlos', 'Andres', 'Martinez', 'Diaz', 15,'activo', 3, 3),
('Laura', 'Sofia', 'Ramirez', 'Torres', 2,'activo', 4, 4),
('Andres', 'Felipe', 'Castro', 'Lopez', 3,'activo', 5, 5),
('Camila', 'Andrea', 'Diaz', 'Martinez', 4,'activo', 6, 6),
('Nicolas', 'Jose', 'Vargas', 'Perez', 5,'activo', 7, 7);


insert into calendario (fecha, nombre, id_curso) values
('2026-01-26', 'inicio clases', 1),
('2026-02-02', 'primer taller', 1),
('2026-02-09', 'evaluacion parcial 1', 1),
('2026-01-27', 'inicio clases', 2),
('2026-02-03', 'laboratorio 1', 2),
('2026-02-10', 'quiz 1', 2),
('2026-01-28', 'inicio clases', 3),
('2026-02-04', 'actividad grupal', 3),
('2026-02-18', 'parcial teorico', 3);

insert into materia (nombre_materia, estado) values 
('ingles', 'activo'), 
('matematicas', 'activo'), 
('quimica', 'activa'), 
('fisica', 'activo'),
('biologia', 'activo'),
('historia', 'activo'),
('geografia', 'activo'),
('educacion fisica', 'activo');

insert into periodo (fecha_inicio, fecha_fin, nombre) values
('2026-02-01', '2026-04-15', 'primer periodo'),
('2026-04-16', '2026-06-15', 'segundo periodo'),
('2026-07-03', '2026-09-15', 'tercer periodo'),
('2026-09-16', '2026-11-15', 'cuarto periodo');

insert into profesor_materia (id_profesor, id_materia) values
(1, 1), (2,2), (3,3), (1,4), (2,5), (3,6), (1,7), (2,8);

insert into curso_periodo (id_curso, id_periodo) values (1, 1), (1, 2), (1, 3), (1, 4);

insert into profesor_curso_periodo (id_profesor, id_curso, id_periodo) values
(1, 1, 1), (1,1,2), (1, 1, 3), (1, 1, 4),
(2, 1, 1), (2,1,2), (2, 1, 3), (2, 1, 4),
(3, 1, 1), (3,1,2), (3, 1, 3), (3, 1, 4);

insert into curso_materia (id_curso, id_materia) values (1, 1), (1,2), (1,3), (1,4), (1,5), (1,6), (1,7), (1,8),(2,1), (2,2), (2,3), (2,4), (2,5), (2,6), (2,7), (2,8), (3,1), (3,2), (3,3), (3,4), (3,5), (3,6), (3,7), (3,8);

insert into horario (id_curso, anio, dia_semana, hora_inicio, hora_fin, id_materia) values
(1, 2026, 'lunes', '7:00:00','9:00:00', 1),
(1, 2026, 'lunes', '9:00:00','10:00:00', 2),
(1, 2026, 'lunes', '11:00:00','13:00:00', 3),
(2, 2026, 'lunes', '7:00:00','9:00:00', 3),
(2, 2026, 'lunes', '9:00:00','10:00:00', 1),
(2, 2026, 'lunes', '11:00:00','13:00:00', 2),
(3, 2026, 'lunes', '7:00:00','9:00:00', 2),
(3, 2026, 'lunes', '9:00:00','10:00:00', 3),
(3, 2026, 'lunes', '11:00:00','13:00:00', 1);



insert into calificacion (nota, id_materia, id_estudiante, id_periodo) values
(100, 1, 1, 1),
(100, 2, 1, 1),
(90, 1, 2, 1),
(90, 2, 2, 1),
(95, 1, 3, 1),
(95, 2, 3, 1);


insert into asistencia (id_estudiante, id_horario, fecha, estado) values
(1, 1, '2026-05-19', 'inasistencia'),
(2, 4, '2026-05-20', 'asistencia'),
(3, 7, '2026-05-21', 'retardo'),
(4, 2, '2026-05-19', 'asistencia'),
(5, 3, '2026-05-19', 'inasistencia'),
(6, 5, '2026-05-20', 'asistencia'),
(7, 6, '2026-05-20', 'retardo');

insert into aviso_asistencia (fecha_aviso, motivo, estado, observaciones, id_profesor, id_acudiente) values
('2026-04-28', 'acumulacion de inasistencias', 'activo', 'el estudiante presenta varias fallas a la clase de matematicas', 1, 1),
('2026-04-29', 'inasistencia injustificada', 'activo', 'el estudiante no asistio a clases durante dos dias consecutivos', 2, 2),
('2026-05-02', 'retrasos constantes', 'activo', 'se reportan llegadas tarde frecuentes en la jornada escolar', 3, 3),
('2026-05-03', 'bajo rendimiento academico', 'activo', 'las ausencias afectan el desempeño en quimica', 1, 4),
('2026-05-04', 'inasistencia a evaluacion', 'activo', 'el estudiante falto al examen parcial programado', 2, 5),
('2026-05-05', 'falta recurrente', 'activo', 'el acudiente justifico las ausencias por motivos medicos', 3, 6);


insert into correo (asunto, mensaje, fecha_envio, id_cliente) values
('aviso de inasistencia', 'el estudiante santiago presenta varias faltas a la clase de matematicas', '2026-04-19',  3),
('citacion acudiente', 'se solicita la presencia del acudiente para tratar temas academicos del estudiante', '2026-04-20', 1),
('recordatorio de pago', 'se recuerda realizar el pago correspondiente al mes de abril', '2026-04-21', 2),
('felicitaciones academicas', 'el estudiante obtuvo un excelente desempeno en las evaluaciones finales', '2026-04-22', 4),
('aviso disciplinario', 'el estudiante presento comportamiento inadecuado durante la clase', '2026-04-23', 5),
('suspension de clases', 'se informa que no habra clases el dia viernes por jornada pedagogica', '2026-04-24', 6);


insert into estudiante_curso (id_estudiante, id_curso, anio) values
(1,1,2026), (2,2, 2026), (3,3,2026), (4,4,2026),(5,5,2026),(6,6,2026),(7,1,2026);



