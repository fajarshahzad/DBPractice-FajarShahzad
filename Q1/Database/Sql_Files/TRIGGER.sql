Use  UET
Select * from user_details
--update the salary 0 as default
UPDATE user_details
set salary  = 0
--Add working days defaults as 0
Alter table user_details
add work_days int default 0
-- Set the even days as 30
Update user_details
set work_days=28
where user_id%2='0'
--Update odd days
Update user_details
set work_days=29
where user_id%2!='0'
--Trigger creation
CREATE TRIGGER update_salary_based_on_work_days
ON user_details
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @daily_wage DECIMAL(10, 2)
    SET @daily_wage = 1000.00

    -- Update salary for affected rows in user_details
    UPDATE user_details
    SET salary = work_days * @daily_wage
    WHERE user_id IN (SELECT user_id FROM user_details)
END;
-- Trigger activation 
UPDATE user_details
SET work_days = 25
WHERE user_id = 1
