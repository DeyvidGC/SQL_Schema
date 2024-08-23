#Vista para ver el detalle de los estudiantes
CREATE VIEW StudentCourseDetails AS
SELECT s.id_student, s.name AS student_name, c.name AS course_name, m.mark AS exam_mark
FROM Student s
JOIN Student_course sc ON s.id_student = sc.id_student
JOIN Course c ON sc.id_course = c.id_course
JOIN Exam e ON c.id_course = e.id_course
JOIN Mark m ON e.id_exam = m.id_exam;

#Vista para ver el horario de clases de todos los cursos
CREATE VIEW CourseSchedules AS
SELECT c.name AS course_name, cs.start_date, cs.end_date, cs.start_time, cs.end_time
FROM Course c
JOIN Course_schedule cs ON c.id_course = cs.id_course;

#Vista del horario y los profesores de todos los cursos 	
CREATE VIEW CourseTeacherSchedule AS
SELECT c.name AS course_name, t.name AS teacher_name, cs.start_date, cs.end_date, cs.start_time, cs.end_time
FROM Course c
JOIN Teacher t ON c.id_teacher = t.id_teacher
JOIN Course_schedule cs ON c.id_course = cs.id_course;

#Vista de la programación de los clubes y su información
CREATE VIEW ClubScheduleDetails AS
SELECT cl.name AS club_name, cc.name AS category_name, cs.start_date, cs.end_date, cs.start_time, cs.end_time
FROM Club_schedule cs
JOIN Club cl ON cs.id_club = cl.id_club
JOIN Club_category cc ON cl.id_club_category = cc.id_club_category;