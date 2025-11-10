CREATE TABLE user_log ( log_id INT AUTO_INCREMENT PRIMARY KEY, 
    user_id INT,  FOREIGN KEY (user_id) REFERENCES users(user_id),
    activity VARCHAR(100), 
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

DELIMITER //

CREATE TRIGGER after_answer_submit
AFTER INSERT ON user_answers
FOR EACH ROW
BEGIN
    INSERT INTO user_log (user_id, activity)
    VALUES (NEW.user_id, ' submitted an answer.');
END //

DELIMITER ;

INSERT INTO user_answers (user_id, question_id, selected_option_id)
VALUES (2, 2, 4);
SELECT * FROM user_log;

