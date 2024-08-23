#Función para calcular la edad de un estudiante a partir de su fecha de nacimiento (YYYY/MM/DD)
DELIMITER //
CREATE FUNCTION GetStudentAge(birthday DATE)
RETURNS INT
NO SQL
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END//
DELIMITER ;
#Función para obtener el número total de cursos en los que está inscrito un estudiante
DELIMITER //
CREATE FUNCTION GetStudentCourseCount(student_id INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE course_count INT;
    SELECT COUNT(*) INTO course_count
    FROM Student_course
    WHERE id_student = student_id;
    RETURN course_count;
END//
DELIMITER ;
#Función para contar la cantidad de reservas en una categoría específica
DELIMITER //
CREATE FUNCTION CountReservationsByCategory(category_id INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE reservation_count INT;
    SELECT COUNT(*) INTO reservation_count
    FROM Reservation
    WHERE id_category_reservation = category_id;
    RETURN reservation_count;
END//
DELIMITER ;

#Función para obtener el número de preguntas en un examen
DELIMITER //
CREATE FUNCTION GetExamQuestionCount(exam_id INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE question_count INT;
    SELECT quantity_question INTO question_count
    FROM Exam
    WHERE id_exam = exam_id;
    RETURN question_count;
END//
DELIMITER ;



