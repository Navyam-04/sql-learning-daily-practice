============================================================================
-- Problem: Calculate the number of unique subjects taught by each teacher.
--
-- Table: Teacher
--   - teacher_id  INT  : ID of the teacher
--   - subject_id  INT  : ID of the subject
--   - dept_id     INT  : ID of the department
--
-- Notes:
--   - (subject_id, dept_id) is the primary key.
--   - A teacher may teach the same subject in different departments, 
--     but for counting unique subjects, we only consider distinct subject_ids.
--
-- Expected Output:
--   teacher_id | cnt
--   (cnt = number of distinct subjects taught by the teacher)
--   Order of results does not matter.
============================================================================

-- Drop the Teacher table if it already exists
IF OBJECT_ID('dbo.Teacher', 'U') IS NOT NULL
    DROP TABLE dbo.Teacher;
GO

-- Create the Teacher table
CREATE TABLE Teacher (
    teacher_id  INT,
    subject_id  INT,
    dept_id     INT,
    PRIMARY KEY (subject_id, dept_id)
);
GO

-- Insert sample data
INSERT INTO Teacher (teacher_id, subject_id, dept_id) VALUES
(1, 2, 3),
(1, 2, 4),
(1, 3, 3),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 4, 1);
GO

-- Verify inserted data
SELECT * FROM Teacher;
GO

-- =======================
-- Solution Query
-- =======================
/*
Count distinct subjects per teacher:
  - Group by teacher_id
  - Use COUNT(DISTINCT subject_id)
*/
SELECT teacher_id,
       COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
GO
