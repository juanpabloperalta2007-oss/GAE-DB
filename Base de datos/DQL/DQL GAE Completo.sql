-- Consultas tabla usuarios
select * from usuario;
select id_usuario, email from usuario where id_usuario <10;


-- Consultas tabla rol
select * from rol;
select id_rol, nombre from rol where id_rol = 2;


-- Consultas tabla curso
select * from curso;
select nombre_curso from curso where id_curso between 1 and 4;
 

-- Consultas tabla materia
select * from materia;
select id_materia, nombre_materia, estado from materia where id_materia > 5;

-- Consultas tabla periodo
select * from periodo;
select id_periodo, nombre from periodo where fecha_inicio = '2026-02-01'; 

-- Consultas tabla rol_usuario
select * from rol_usuario;

-- Consultas tabla cliente
select * from cliente;
select id_cliente, primer_nombre, primer_apellido from cliente where id_cliente between 4 and 7;

-- Consultas tabla coordinador
select * from coordinador;
select estado , area from coordinador where estado like '%inactivo%';

-- Consultas tabla coordinador_curso
select * from coordinador_curso;

-- Consultas tabla profesor
select * from profesor;
select id_profesor, estado from profesor where id_profesor = 2;

-- Consultas tabla acudiente
select * from acudiente;
select id_acudiente, direccion, telefono from acudiente where id_acudiente >3;

-- Consultas tabla estudiante
select * from estudiante;
select id_estudiante, primer_nombre, primer_apellido from estudiante where estado like '%activo%';

-- Consultas tabla curso_periodo
select * from curso_periodo;

-- Consultas tabla profesor_curso_periodo
select * from profesor_curso_periodo;

-- Consultas tabla aviso_asistencia
select * from aviso_asistencia;
select motivo, estado, observaciones from aviso_asistencia where fecha_aviso like '2026-05-02';

-- Consultas tabla calendario
select * from calendario;
# select fecha, nombre from calendario where id_calendario = 4;

-- Consultas tabla estudiante_curso
# select * from estudiante_curso;

-- Consultas tabla calificacion 
select * from calificacion;

-- Consultas tabla curso_materia
select * from curso_materia;

-- Consultas tabla horario
select * from horario;
select id_curso, dia_semana, hora_inicio, hora_fin from horario where id_curso = 2;

-- Consultas tabla asistencia
select * from asistencia;
select id_estudiante, fecha, estado from asistencia where id_estudiante = 2;

-- Consultas tabla correo
select * from correo; 
select id_correo, asunto, mensaje from correo where fecha_envio = '2026-04-21'; 


-- Consultas con dos o mas tablas 
-- Usuario con su Rol
select u.id_usuario, u.login, u.email, r.nombre as rol
from usuario u
inner join rol_usuario ru on u.id_usuario = ru.id_usuario
inner join rol r on ru.id_rol = r.id_rol;

-- Estudiante con los cursos en los que está inscrito y el año
select e.primer_nombre, e.primer_apellido, cu.nombre_curso, ec.anio
from estudiante e
inner join estudiante_curso ec on e.id_estudiante = ec.id_estudiante
inner join curso cu on ec.id_curso = cu.id_curso;

-- Calificaciones del estudiante con materia y periodo
select e.primer_nombre, e.primer_apellido, m.nombre_materia, cal.nota, p.nombre AS periodo
from calificacion cal
inner join estudiante e on cal.id_estudiante = e.id_estudiante
inner join materia m on cal.id_materia = m.id_materia
inner join periodo p on cal.id_periodo = p.id_periodo;

-- Materias por curso
select cu.nombre_curso, m.nombre_materia, m.estado
from curso cu
inner join curso_materia cm on cu.id_curso = cm.id_curso
inner join materia m on cm.id_materia = m.id_materia;

-- Curso con su periodo
select cu.nombre_curso, p.nombre as periodo, p.fecha_inicio, p.fecha_fin
from curso cu
inner join curso_periodo cp on cu.id_curso = cp.id_curso
inner join periodo p on cp.id_periodo = p.id_periodo;

-- Horario con curso y materia
select cu.nombre_curso, m.nombre_materia, h.dia_semana, h.hora_inicio, h.hora_fin
from horario h
inner join curso cu on h.id_curso = cu.id_curso
inner join materia m on h.id_materia = m.id_materia;

-- Profesor con las materias que imparte 
select c.primer_nombre, c.primer_apellido, m.nombre_materia
from profesor_materia pm
inner join profesor p on pm.id_profesor = p.id_profesor
inner join cliente c on p.id_cliente = c.id_cliente
inner join materia m on pm.id_materia = m.id_materia;

-- Asunto con fecha envio nombre y apellido
select co.asunto, co.fecha_envio, c.primer_nombre, c.primer_apellido
from correo co
inner join acudiente a on co.id_cliente = a.id_acudiente
inner join cliente c on a.id_cliente = c.id_cliente;

-- Calendario con eventos de cada curso con fecha y nombre del evento 
select cu.nombre_curso, cal.fecha, cal.nombre
from curso cu
inner join calendario cal on cu.id_curso = cal.id_curso;

-- SUBCONSULTAS

-- Mostrar los usuarios que tienen el rol de Coordinador
select login, email
from usuario
where id_usuario in (
    select id_usuario
    from rol_usuario
    where id_rol = (
        select id_rol
        from rol
        where nombre = 'Coordinador'
    )
);

-- Mostrar los estudiantes que pertenecen al curso "10A"
select primer_nombre, primer_apellido
from estudiante
where id_estudiante in (
    select id_estudiante
    from estudiante_curso
    where id_curso = (
        select id_curso
        from curso
        where nombre_curso like '10%'
    )
);

-- Mostrar las materias que tienen al menos una calificación registrada
select nombre_materia
from materia
where id_materia in (
    select distinct id_materia
    from calificacion
);

-- Consultas RIGTH JOIN 
-- Mostrar todos los roles y los usuarios que pertenecen a ellos
select u.login, r.nombre as rol
from rol_usuario ru
right join rol r
on ru.id_rol = r.id_rol
left join usuario u
on ru.id_usuario = u.id_usuario;

-- Mostrar todos los cursos y su coordinador
select cu.nombre_curso,
       c.area,
       c.estado
from coordinador_curso cc
right join curso cu
on cc.id_curso = cu.id_curso
left join coordinador c
on cc.id_coordinador = c.id_coordinador;

-- Mostrar todos los periodos con los cursos asociados
select p.nombre as periodo,
       cu.nombre_curso
from curso_periodo cp
right join periodo p
on cp.id_periodo = p.id_periodo
left join curso cu
on cp.id_curso = cu.id_curso;

-- Consultas LEFT JOIN
-- Mostrar todos los estudiantes y su curso
select e.primer_nombre,
       e.primer_apellido,
       cu.nombre_curso
from estudiante e
left join estudiante_curso ec
on e.id_estudiante = ec.id_estudiante
left join curso cu
on ec.id_curso = cu.id_curso;

-- Mostrar todos los profesores y las materias que dictan
select c.primer_nombre,
       c.primer_apellido,
       m.nombre_materia
from profesor p
left join cliente c
on p.id_cliente = c.id_cliente
left join profesor_materia pm
on p.id_profesor = pm.id_profesor
left join materia m
on pm.id_materia = m.id_materia;

-- Mostrar todos los cursos y sus horarios
select cu.nombre_curso,
       h.dia_semana,
       h.hora_inicio,
       h.hora_fin
from curso cu
left join horario h
on cu.id_curso = h.id_curso;