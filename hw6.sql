CREATE DATABASE hw6;
USE hw6;



-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER // 
CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result VARCHAR(255);

    SET days = seconds DIV 86400;
    SET seconds = seconds % 86400;
    SET hours = seconds DIV 3600;
    SET seconds = seconds % 3600;
    SET minutes = seconds DIV 60;
    SET seconds = seconds % 60;

    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');

    RETURN result;
END //

DELIMITER ;

SELECT format_seconds(123456);


-- Создайте процедуру, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DROP PROCEDURE numbers;
DELIMITER =-
CREATE PROCEDURE numbers()
BEGIN
 	DECLARE num INT DEFAULT 2;
    DECLARE result VARCHAR(50) DEFAULT NULL;
	-- DECLARE num2 INT DEFAULT 2; 
    WHILE num < 11 DO
		IF(num % 2 = 0) THEN 
			IF (result IS NULL) THEN
				SET result = CONCAT(num);
			ELSE 
				SET result = CONCAT(result, ', ', num);
			END IF;
        END IF;
	SET num = num + 1;

	END WHILE;
	SELECT result;
END =-
DELIMITER ;
CALL numbers();

