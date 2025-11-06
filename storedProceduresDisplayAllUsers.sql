create table users (user_id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50), email VARCHAR(100) ); 
insert into users(username, email)values("person1","person1@gmail.com");
insert into users(username, email)values("person2","person2@gmail.com");
insert into users(username, email)values("person3","person3@gmail.com");
insert into users(username, email)values("person4","person4@gmail.com");
DELIMITER //
CREATE PROCEDURE ShowAllUsers()
BEGIN
    SELECT * FROM users;
END //
DELIMITER ;
call ShowAllUsers()

