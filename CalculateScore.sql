CREATE TABLE user_answers ( answer_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,FOREIGN KEY (user_id) REFERENCES users(user_id), 
question_id INT,FOREIGN KEY (question_id) REFERENCES questions(question_id), selected_option_id INT ); 

CREATE TABLE options ( option_id INT AUTO_INCREMENT PRIMARY KEY,
question_id INT, FOREIGN KEY (question_id) REFERENCES questions(question_id),
option_text VARCHAR(25), is_correct BOOLEAN ); 

INSERT INTO users (username, email)
VALUES ('Adithya', 'adithya@example.com'),('Jani', 'jani@example.com'),('Sneha', 'sneha@example.com');

INSERT INTO options (question_id, option_text, is_correct)
VALUES (1, 'Python', TRUE),(1, 'C++', FALSE),(1, 'Java', FALSE),(2, 'HTML', TRUE),(2, 'CSS', FALSE),(2, 'Python', FALSE);

INSERT INTO user_answers (user_id, question_id, selected_option_id)
VALUES (1, 1, 1), (1, 2, 4),  (2, 1, 1),(2, 2, 5),(3, 1, 2),(3, 2, 4);  

DELIMITER //

CREATE PROCEDURE CalculateUserScore(IN p_user_id INT)
BEGIN
    SELECT u.user_id, u.username, COUNT(*) AS total_correct_answers FROM users u JOIN user_answers ua ON 
    u.user_id = ua.user_id JOIN options o ON ua.selected_option_id = o.option_id WHERE 
    u.user_id = p_user_id AND o.is_correct = TRUE GROUP BY u.user_id, u.username;
END //

DELIMITER ;

