-- ============================================================================
-- Problem: Find all authors who viewed at least one of their own articles.
--
-- Table: Views
--   - article_id  INT    : ID of the article
--   - author_id   INT    : Author of the article
--   - viewer_id   INT    : User who viewed the article
--   - view_date   DATE   : Date of the view
--
-- Notes:
--   - A user viewing their own article will have author_id = viewer_id.
--   - Return distinct author_ids (as id) sorted in ascending order.
-- ============================================================================

-- Drop the Views table if it exists
IF OBJECT_ID('dbo.Views', 'U') IS NOT NULL
    DROP TABLE dbo.Views;
GO

-- Create the Views table
CREATE TABLE Views (
    article_id  INT,
    author_id   INT,
    viewer_id   INT,
    view_date   DATE
);
GO

-- Insert sample data
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'),  -- self-view
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),  -- self-view
(3, 4, 4, '2019-07-21');  -- duplicate
GO

-- Verify data
SELECT * FROM Views;
GO

-- =======================
-- Solution Query
-- =======================
/*
  Identify rows where author_id = viewer_id,
  then select distinct author_ids and rename column to id.
*/

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
GO
