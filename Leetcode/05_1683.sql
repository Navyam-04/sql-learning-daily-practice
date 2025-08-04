============================================================================
-- Problem: Find the IDs of tweets that are invalid.
--
-- Table: Tweets
--   - tweet_id   INT     : ID of the tweet
--   - content    VARCHAR : The text content of the tweet
--
-- Notes:
--   - A tweet is invalid if the length of its content is strictly greater than 15 characters.
--   - Return the IDs of invalid tweets.
--   - Return result table in any order.
============================================================================

-- Drop the Tweets table if it exists
IF OBJECT_ID('dbo.Tweets', 'U') IS NOT NULL
    DROP TABLE dbo.Tweets;
GO

-- Create the Tweets table
CREATE TABLE Tweets (
    tweet_id INT,
    content  VARCHAR(255)
);
GO

-- Insert sample data
INSERT INTO Tweets (tweet_id, content) VALUES
(1, 'Vote for Biden'),
(2, 'Let us make America great again!'),
(3, 'Covid19 is not the flu'),
(4, 'STOP THE STEAL'),
(5, 'this is sparta');
GO

-- Verify inserted data
SELECT * FROM Tweets;
GO

-- =======================
-- Solution Query
-- =======================
/*
  Select tweet IDs where the length of the content is strictly greater than 15.
  Use LEN() in SQL Server to get the character count.
*/

SELECT tweet_id
FROM Tweets
WHERE LEN(content) > 15;
GO
