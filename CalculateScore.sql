CREATE TABLE user_answers ( answer_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,FOREIGN KEY (user_id) REFERENCES users(user_id), 
question_id INT,FOREIGN KEY (question_id) REFERENCES questions(question_id), selected_option_id INT ); 

CREATE TABLE options ( option_id INT AUTO_INCREMENT PRIMARY KEY,
question_id INT, FOREIGN KEY (question_id) REFERENCES questions(question_id),
option_text VARCHAR(25), is_correct BOOLEAN ); 

INSERT INTO users (username, email)
VALUES ('Adithya', 'adithya@example.com'),('Jani', 'jani@example.com'),('Sneha', 'sneha@example.com');

INSERT INTO options (question_id, option_text, is_correct)
VALUES (1, 'JavaScript XML', TRUE),(1, 'C++', FALSE),(1, 'Java', FALSE),
(2, 'useState()', TRUE),(2, 'useEffect()', FALSE),(2, 'useRef()', FALSE),
(3, 'HyperText Markup Language', TRUE),(3, 'CascadingStyleSheet', FALSE),(3, 'HyperText Transfer', FALSE),
(4, '<a>', TRUE),(4, '<b>', FALSE),(4, '<h1>', FALSE),
(5, '// , /*..*/', TRUE),(5, 'll', FALSE),(5, 'bb', FALSE),
(6, '"object"', TRUE),(6, '"class"', FALSE),(6, 'datatype', FALSE),
(7, 'web development', TRUE),(7, 'frontend design', FALSE),(7, 'UI/UX', FALSE);

INSERT INTO user_answers (user_id, question_id, selected_option_id)
VALUES(1, 1, 1),(1, 3, 7),(1, 5, 13),(1, 7, 19),
(2, 2, 4),(2, 4, 10),(2, 6, 16),
(3, 1, 1),(3, 2, 4);

DELIMITER //

CREATE PROCEDURE CalculateUserScore(IN p_user_id INT)
BEGIN
    SELECT u.user_id, u.username, COUNT(*) AS total_correct_answers FROM users u JOIN user_answers ua ON 
    u.user_id = ua.user_id JOIN options o ON ua.selected_option_id = o.option_id WHERE 
    u.user_id = p_user_id AND o.is_correct = TRUE GROUP BY u.user_id, u.username;
END //

DELIMITER ;

ALTER TABLE options
DROP FOREIGN KEY options_ibfk_1;

ALTER TABLE user_answers
DROP FOREIGN KEY user_answers_ibfk_2;

ALTER TABLE options
ADD CONSTRAINT options_ibfk_1
    FOREIGN KEY (question_id)
    REFERENCES questions(question_id)
    ON DELETE CASCADE;

ALTER TABLE user_answers
ADD CONSTRAINT user_answers_ibfk_2
    FOREIGN KEY (question_id)
    REFERENCES questions(question_id)
    ON DELETE CASCADE;

