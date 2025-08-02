-- Problem: Find the difference between the total number of CITY entries in the table 
-- and the number of distinct CITY entries in the table.

-- The STATION table is described as follows:
-- ID:      NUMBER         - unique identifier for the station
-- CITY:    VARCHAR2(21)   - name of the city
-- STATE:   VARCHAR2(2)    - state abbreviation
-- LAT_N:   NUMBER         - northern latitude
-- LONG_W:  NUMBER         - western longitude

-- Table creation

CREATE TABLE STATION (
    ID NUMBER PRIMARY KEY,
    CITY VARCHAR2(21),
    STATE VARCHAR2(2),
    LAT_N NUMBER,
    LONG_W NUMBER
);

-- Insert sample data into STATION table

INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'San Francisco', 'CA', 37.7749, 122.4194),
(2, 'New York', 'NY', 40.7128, 74.0060),
(3, 'Austin', 'TX', 30.2672, 97.7431),
(4, 'New York', 'NY', 40.7128, 74.0060),
(5, 'Seattle', 'WA', 47.6062, 122.3321),
(6, 'Miami', 'FL', 25.7617, 80.1918),
(7, 'Austin', 'TX', 30.2672, 97.7431);

-- Query to find the difference between total CITY entries and distinct CITY entries

SELECT 
    COUNT(CITY) - COUNT(DISTINCT CITY) AS CITY_NAME_DUPLICATES
FROM 
    STATION;
