DELIMITER //
CREATE TRIGGER before_user_insert
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF EXISTS (select 1 from users where email = NEW.email ) THEN
		signal sqlstate '45000'
		set message_text= 'Duplicate Email';
    END IF;
END //
DELIMITER ;