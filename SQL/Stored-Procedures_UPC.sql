#Procedimiento almacenado para insertar un nuevo estudiante y asignar un club
DELIMITER //
CREATE PROCEDURE InsertStudent(
    IN p_club INT,
    IN p_degree INT,
    IN p_dni VARCHAR(8),
    IN p_email VARCHAR(50),
    IN p_name VARCHAR(50),
    IN p_birthday DATE
)
BEGIN
    DECLARE p_age INT;
    SET p_age = GetStudentAge(p_birthday);
    INSERT INTO Student (id_club, id_degree, dni, email, name, birthday, age)
    VALUES (p_club, p_degree, p_dni, p_email, p_name, p_birthday, p_age);
END//
DELIMITER ;

#Procedimiento almacenado para actualizar la información de un curso y sus horarios
DELIMITER //
CREATE PROCEDURE UpdateCourseInfo(
    IN p_course_id INT,
    IN p_name VARCHAR(50),
    IN p_credits SMALLINT,
    IN p_semester SMALLINT,
    IN p_start_date DATE,
    IN p_end_date DATE,
    IN p_start_time TIME,
    IN p_end_time TIME
)
BEGIN
    UPDATE Course
    SET name = p_name, credits = p_credits, semester = p_semester
    WHERE id_course = p_course_id;

    UPDATE Course_schedule
    SET start_date = p_start_date, end_date = p_end_date, start_time = p_start_time, end_time = p_end_time
    WHERE id_course = p_course_id;
END//
DELIMITER ;
