CREATE TABLE quiz ( quiz_id INT AUTO_INCREMENT PRIMARY KEY, quiz_title VARCHAR(100), total_questions INT );
insert into quiz(quiz_title, total_questions)values("React Basics","20");
insert into quiz(quiz_title, total_questions)values("HTML Basics","15");
insert into quiz(quiz_title, total_questions)values("Java Script Basics","10");

DELIMITER //
create procedure AddQuiz(
	in quiz_name VARCHAR(100), 
    in total_numberof_question INT
)
BEGIN
	insert into quiz(quiz_title, total_questions)values(quiz_name,total_numberof_question);
END//
call AddQuiz("Python","20")