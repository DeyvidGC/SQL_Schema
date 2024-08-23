use upc;

drop function if exists GetStudentAge
#Función para calcular la edad de un estudiante a partir de su fecha de nacimiento (YYYY-MM-DD)
DELIMITER //
CREATE FUNCTION GetStudentAge(birthday DATE)
RETURNS INT
NO SQL
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, birthday, CURDATE());
    RETURN age;
END//
DELIMITER ;
#Función para obtener el número total de cursos en los que está inscrito un estudiante
drop function if exists GetStudentInfo
DELIMITER //
CREATE FUNCTION GetStudentInfo(student_id INT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE course_count INT;
    DECLARE student_name VARCHAR(100);

    SELECT COUNT(*), su.name INTO course_count, student_name
    FROM Student_course st
    JOIN Student su
    ON st.id_student = su.id_student
    WHERE st.id_student = student_id
    GROUP BY su.name;

    RETURN CONCAT('Nombre: ', student_name, ', Cursos: ', course_count);
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



