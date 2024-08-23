#Trigger para actualizar la edad del estudiante
DELIMITER //
CREATE TRIGGER update_student_age
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    SET NEW.age = GetStudentAge(NEW.birthday);
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_student_age_on_update
BEFORE UPDATE ON Student
FOR EACH ROW
BEGIN
    SET NEW.age = GetStudentAge(NEW.birthday);
END//
DELIMITER ;


#Trigger para evitar la inserción de una reserva de una hora anterior a la actual
DELIMITER //
CREATE TRIGGER CheckReservationTimes
BEFORE INSERT ON Reservation
FOR EACH ROW
BEGIN
    IF NEW.start_time >= NEW.end_time THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La hora de fin debe ser posterior a la hora de inicio.';
    END IF;
END//
DELIMITER ;


#Trigger para asegurarse de que un estudiante no pueda reservar dos actividades en el mismo horario
DELIMITER //
CREATE TRIGGER CheckStudentReservationOverlap
BEFORE INSERT ON Reservation
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Reservation r
        WHERE r.id_student = NEW.id_student
          AND r.date = NEW.date
          AND (
              (r.start_time < NEW.end_time AND r.end_time > NEW.start_time)
          )
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El estudiante ya tiene una reserva en este horario.';
    END IF;
END//
DELIMITER ;
