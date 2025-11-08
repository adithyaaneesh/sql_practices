CREATE TABLE questions ( question_id INT AUTO_INCREMENT PRIMARY KEY, quiz_id INT, question_text VARCHAR(25) ); 

DELIMITER //

CREATE PROCEDURE CountQuestions(IN q_quiz_id INT)
BEGIN
    SELECT COUNT(*) AS total_questions
    FROM questions
    WHERE quiz_id = q_quiz_id;
END //

DELIMITER ;
