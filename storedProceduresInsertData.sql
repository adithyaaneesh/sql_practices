CREATE TABLE quiz (
    quiz_id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_title VARCHAR(100),
    total_questions INT
);
INSERT INTO quiz (quiz_title, total_questions)
VALUES 
('React Basics', 20),
('HTML Basics', 15),
('JavaScript Basics', 10);

DELIMITER //

CREATE PROCEDURE AddQuiz(
    IN quiz_name VARCHAR(100), 
    IN total_numberof_question INT
)
BEGIN
    INSERT INTO quiz (quiz_title, total_questions)
    VALUES (quiz_name, total_numberof_question);
END //

DELIMITER ;
