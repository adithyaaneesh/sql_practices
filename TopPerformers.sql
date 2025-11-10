DELIMITER //

CREATE PROCEDURE TopPerformers()
BEGIN
    SELECT 
        u.user_id,
        u.username,
        COUNT(*) AS total_correct_answers
    FROM 
        users u
        JOIN user_answers ua ON u.user_id = ua.user_id
        JOIN options o ON ua.selected_option_id = o.option_id
    WHERE 
        o.is_correct = TRUE
    GROUP BY 
        u.user_id, u.username
    ORDER BY 
        total_correct_answers DESC
    LIMIT 3;
END //

DELIMITER ;
