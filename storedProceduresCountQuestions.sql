CREATE TABLE questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT,
    question_text VARCHAR(255),
    FOREIGN KEY (quiz_id) REFERENCES quiz(quiz_id)
);
INSERT INTO questions (quiz_id, question_text)
VALUES
(1, 'What is JSX in React?'),
(1, 'Which hook is used for managing state in React?'),
(2, 'What does HTML stand for?'),
(2, 'Which tag is used to create a hyperlink in HTML?'),
(3, 'How do you write a comment in JavaScript?'),
(3, 'What is the output of typeof null in JavaScript?'),
(4, 'What is Python primarily used for?');

DELIMITER //

CREATE PROCEDURE CountQuestions(IN q_quiz_id INT)
BEGIN
    SELECT COUNT(*) AS total_questions
    FROM questions
    WHERE quiz_id = q_quiz_id;
END //

DELIMITER ;
call CountQuestions(3);