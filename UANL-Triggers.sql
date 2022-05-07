USE [UANL]

DROP TRIGGER deleteAllFromStudent
DROP TRIGGER deleteAllFromTeacher
DROP TRIGGER deleteAllFromClassroom
DROP TRIGGER deleteAllFromSchedule
GO


CREATE TRIGGER deleteAllFromStudent
	ON Kardex
	AFTER DELETE AS
		DECLARE @id INT
		SET @id = (SELECT ID_student FROM deleted)

		DELETE FROM studentSchedule
		WHERE ID_student = @id

		DELETE FROM Student
		WHERE ID_student = @id
GO

CREATE TRIGGER deleteALLFromTeacher
	ON studentSchedule
	AFTER DELETE AS
		DECLARE @id INT
		SET @id = (SELECT ID_teacher FROM deleted)

		DELETE FROM Schedule
		WHERE ID_schedule = @id

		DELETE FROM Teacher
		WHERE ID_teacher = @id
GO

CREATE TRIGGER deleteAllFromClassroom
	ON studentSchedule
	AFTER DELETE AS
		DECLARE @id INT
		SET @id = (SELECT ID_classroom FROM deleted)

		DELETE FROM Schedule
		WHERE ID_classroom = @id

		DELETE FROM Classroom
		WHERE ID_classroom = @id
GO

CREATE TRIGGER deleteAllFromSchedule
	ON studentSchedule
		AFTER DELETE AS
			DECLARE @id INT
			SET @id = (SELECT d.ID_schedule FROM deleted d)

			DELETE FROM Schedule
			WHERE ID_schedule = @id
GO













