DELIMITER //

CREATE PROCEDURE customer_bonus
(
    INOUT p_bonus INT
)

BEGIN

    IF p_bonus <= 100 THEN

        SET p_bonus = p_bonus + 10;

    ELSEIF p_bonus <= 500 THEN

        SET p_bonus = p_bonus + 50;

    ELSE

        SET p_bonus = p_bonus + 100;

    END IF;

END //

DELIMITER ;


SET @bonus = 80;

CALL customer_bonus(@bonus);

SELECT @bonus;