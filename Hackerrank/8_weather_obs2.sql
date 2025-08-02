-- Problem: Query a list of CITY names from STATION for cities that have an even ID number.
-- Print the results in any order, but exclude duplicates from the answer.

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
(4, 'Seattle', 'WA', 47.6062, 122.3321),
(5, 'Miami', 'FL', 25.7617, 80.1918),
(6, 'New York', 'NY', 40.7128, 74.0060); -- duplicate CITY on even ID

-- Query to retrieve distinct CITY names with even ID

SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;
