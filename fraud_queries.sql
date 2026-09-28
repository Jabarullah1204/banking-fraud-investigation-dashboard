CREATE TABLE BANK_AI_DB.TRANSACTIONS.INVESTIGATION_LOG (
    TRANSACTION_ID VARCHAR(20),
    CUSTOMER_ID VARCHAR(10),
    CUSTOMER_NAME VARCHAR(100),
    AMOUNT NUMBER(12,2),
    RISK_SCORE NUMBER(10,2),
    RISK_LEVEL VARCHAR(20),
    AI_INVESTIGATION_SUMMARY VARCHAR(10000),
    ALERT_SENT VARCHAR(10),
    INVESTIGATION_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);



SELECT *
FROM BANK_AI_DB.TRANSACTIONS.INVESTIGATION_LOG
ORDER BY CREATED_AT DESC;

SELECT *
FROM BANK_AI_DB.TRANSACTIONS.INVESTIGATION_LOG;


SELECT
    CURRENT_ORGANIZATION_NAME(),
    CURRENT_ACCOUNT_NAME(),
    CURRENT_WAREHOUSE();

    SELECT CURRENT_USER();
    DESC USER JABARULLAH;

    SHOW USERS LIKE 'JABARULLAH';



SHOW PARAMETERS LIKE 'AUTHENTICATION_POLICY' IN USER JABARULLAH;

SHOW PARAMETERS LIKE 'AUTHENTICATION_POLICY' IN ACCOUNT;


SELECT
    EVENT_TIMESTAMP,
    USER_NAME,
    REPORTED_CLIENT_TYPE,
    FIRST_AUTHENTICATION_FACTOR,
    IS_SUCCESS,
    ERROR_CODE,
    ERROR_MESSAGE
FROM TABLE(
    INFORMATION_SCHEMA.LOGIN_HISTORY_BY_USER(
        USER_NAME => 'JABARULLAH',
        RESULT_LIMIT => 20
    )
)
ORDER BY EVENT_TIMESTAMP DESC;

SELECT
    EVENT_TIMESTAMP,
    USER_NAME,
    REPORTED_CLIENT_TYPE,
    FIRST_AUTHENTICATION_FACTOR,
    IS_SUCCESS,
    ERROR_CODE,
    ERROR_MESSAGE
FROM TABLE(INFORMATION_SCHEMA.LOGIN_HISTORY_BY_USER(
    USER_NAME => 'JABARULLAH',
    RESULT_LIMIT => 20
))
ORDER BY EVENT_TIMESTAMP DESC;

SELECT
    EVENT_TIMESTAMP,
    USER_NAME,
    REPORTED_CLIENT_TYPE,
    FIRST_AUTHENTICATION_FACTOR,
    IS_SUCCESS,
    ERROR_CODE,
    ERROR_MESSAGE
FROM TABLE(INFORMATION_SCHEMA.LOGIN_HISTORY_BY_USER(
    USER_NAME => 'JABARULLAH',
    RESULT_LIMIT => 20
))
ORDER BY EVENT_TIMESTAMP DESC;


SELECT
    EVENT_TIMESTAMP,
    USER_NAME,
    REPORTED_CLIENT_TYPE,
    FIRST_AUTHENTICATION_FACTOR,
    IS_SUCCESS,
    ERROR_CODE,
    ERROR_MESSAGE
FROM TABLE(
    BANK_AI_DB.INFORMATION_SCHEMA.LOGIN_HISTORY_BY_USER(
        USER_NAME => 'JABARULLAH',
        RESULT_LIMIT => 20
    )
)
ORDER BY EVENT_TIMESTAMP DESC;


SELECT
    EVENT_TIMESTAMP,
    USER_NAME,
    REPORTED_CLIENT_TYPE,
    IS_SUCCESS,
    ERROR_CODE,
    ERROR_MESSAGE
FROM TABLE(
    BANK_AI_DB.INFORMATION_SCHEMA.LOGIN_HISTORY_BY_USER(
        USER_NAME => 'JABARULLAH'
    )
)
ORDER BY EVENT_TIMESTAMP DESC
LIMIT 5;

SHOW PARAMETERS LIKE 'NETWORK_POLICY' IN ACCOUNT;

SHOW NETWORK POLICIES;




SELECT TRANSACTION_ID, AMOUNT_SCORE, DEVICE_SCORE, LOCATION_SCORE, RISK_SCORE FROM RISK_ANALYSIS; 


SELECT TRANSACTION_ID, RISK_SCORE, RISK_LEVEL,
  CASE 
    WHEN RISK_SCORE >= 60 THEN 'HIGH'
    WHEN RISK_SCORE >= 20 THEN 'MEDIUM'
    ELSE 'LOW'
  END AS CALCULATED_LEVEL
FROM RISK_ANALYSIS;



CREATE DATABASE BANK_AI_DB;
CREATE SCHEMA BANK_AI_DB.TRANSACTIONS;
USE DATABASE BANK_AI_DB;

USE SCHEMA TRANSACTIONS;
SHOW DATABASES;
SHOW SCHEMAS;

CREATE TABLE CUSTOMERS (
    CUSTOMER_ID VARCHAR(10),
    CUSTOMER_NAME VARCHAR(100),
    CITY VARCHAR(50),
    ACCOUNT_TYPE VARCHAR(30),
    MONTHLY_AVG_SPEND NUMBER(12,2)
);

SHOW TABLES;


DESC TABLE CUSTOMERS;


INSERT INTO CUSTOMERS
(CUSTOMER_ID, CUSTOMER_NAME, CITY, ACCOUNT_TYPE, MONTHLY_AVG_SPEND)
VALUES
('C001','Arun','Chennai','Savings',25000),
('C002','Rahim','Trichy','Savings',30000),
('C003','Kumar','Madurai','Current',75000),
('C004','Priya','Coimbatore','Savings',20000),
('C005','Suresh','Bangalore','Current',100000),
('C006','Meena','Chennai','Savings',35000),
('C007','Vijay','Salem','Savings',40000),
('C008','Aisha','Trichy','Current',60000),
('C009','Karthik','Madurai','Savings',28000),
('C010','Divya','Coimbatore','Savings',45000);


SELECT * FROM CUSTOMERS;
SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CITY,
    ACCOUNT_TYPE,
    MONTHLY_AVG_SPEND
FROM CUSTOMERS
ORDER BY CUSTOMER_ID;




SELECT CURRENT_DATABASE(), CURRENT_SCHEMA();
CREATE TABLE TRANSACTIONS (
    TRANSACTION_ID VARCHAR(20),
    CUSTOMER_ID VARCHAR(10),
    TRANSACTION_DATE TIMESTAMP,
    AMOUNT NUMBER(12,2),
    LOCATION VARCHAR(50),
    CHANNEL VARCHAR(30),
    DEVICE_ID VARCHAR(30),
    STATUS VARCHAR(20)
);


SHOW TABLES;

DESC TABLE TRANSACTIONS;




INSERT INTO TRANSACTIONS
(
    TRANSACTION_ID,
    CUSTOMER_ID,
    TRANSACTION_DATE,
    AMOUNT,
    LOCATION,
    CHANNEL,
    DEVICE_ID,
    STATUS
)
VALUES

('T001','C001','2026-09-15 09:30:00',5000,'Chennai','ATM','D001','SUCCESS'),

('T002','C002','2026-09-15 10:00:00',3000,'Trichy','UPI','D002','SUCCESS'),

('T003','C003','2026-09-15 10:15:00',25000,'Madurai','ONLINE','D003','SUCCESS'),

('T004','C004','2026-09-15 10:30:00',4000,'Coimbatore','POS','D004','SUCCESS'),

('T005','C005','2026-09-15 11:00:00',50000,'Bangalore','ONLINE','D005','SUCCESS'),

('T006','C006','2026-09-15 11:30:00',7000,'Chennai','UPI','D006','SUCCESS'),

('T007','C007','2026-09-15 12:00:00',8000,'Salem','ATM','D007','SUCCESS'),

('T008','C008','2026-09-15 12:30:00',15000,'Trichy','POS','D008','SUCCESS'),

('T009','C009','2026-09-15 13:00:00',6000,'Madurai','UPI','D009','SUCCESS'),

('T010','C010','2026-09-15 13:30:00',10000,'Coimbatore','ONLINE','D010','SUCCESS');

INSERT INTO TRANSACTIONS
(
    TRANSACTION_ID,
    CUSTOMER_ID,
    TRANSACTION_DATE,
    AMOUNT,
    LOCATION,
    CHANNEL,
    DEVICE_ID,
    STATUS
)
VALUES

('T011','C001','2026-09-15 14:00:00',250000,'Dubai','ONLINE','D999','SUCCESS'),

('T012','C001','2026-09-15 14:10:00',100000,'Dubai','ONLINE','D999','SUCCESS'),

('T013','C001','2026-09-15 14:15:00',75000,'Dubai','ONLINE','D999','SUCCESS');

SELECT COUNT(*) AS TOTAL_TRANSACTIONS
FROM TRANSACTIONS;

SELECT *
FROM TRANSACTIONS
ORDER BY TRANSACTION_DATE;


SELECT
    TRANSACTION_ID,
    CUSTOMER_ID,
    AMOUNT,
    LOCATION,
    CHANNEL,
    DEVICE_ID
FROM TRANSACTIONS
WHERE AMOUNT >= 100000
ORDER BY AMOUNT DESC;

SELECT
    T.TRANSACTION_ID,
    T.CUSTOMER_ID,
    C.CUSTOMER_NAME,
    C.CITY AS CUSTOMER_CITY,
    C.MONTHLY_AVG_SPEND,
    T.AMOUNT,
    T.LOCATION,
    T.CHANNEL,
    T.DEVICE_ID,
    T.STATUS
FROM TRANSACTIONS T
JOIN CUSTOMERS C
    ON T.CUSTOMER_ID = C.CUSTOMER_ID;





    SELECT
    T.TRANSACTION_ID,
    T.CUSTOMER_ID,
    C.CUSTOMER_NAME,
    C.MONTHLY_AVG_SPEND,
    T.AMOUNT,

    CASE
        WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
        THEN 30
        ELSE 0
    END AS AMOUNT_SCORE

FROM TRANSACTIONS T
JOIN CUSTOMERS C
    ON T.CUSTOMER_ID = C.CUSTOMER_ID;




    SELECT
    T.TRANSACTION_ID,
    C.CUSTOMER_NAME,
    C.CITY AS CUSTOMER_CITY,
    T.LOCATION,

    CASE
        WHEN T.LOCATION <> C.CITY
        THEN 25
        ELSE 0
    END AS LOCATION_SCORE

FROM TRANSACTIONS T
JOIN CUSTOMERS C
    ON T.CUSTOMER_ID = C.CUSTOMER_ID;





    SELECT
    T.TRANSACTION_ID,
    T.CUSTOMER_ID,
    C.CUSTOMER_NAME,
    T.AMOUNT,
    C.MONTHLY_AVG_SPEND,
    C.CITY AS CUSTOMER_CITY,
    T.LOCATION,

    CASE
        WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
        THEN 30
        ELSE 0
    END AS AMOUNT_SCORE,

    CASE
        WHEN T.LOCATION <> C.CITY
        THEN 25
        ELSE 0
    END AS LOCATION_SCORE,

    (
        CASE
            WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
            THEN 30
            ELSE 0
        END
        +
        CASE
            WHEN T.LOCATION <> C.CITY
            THEN 25
            ELSE 0
        END
    ) AS TOTAL_RISK_SCORE

FROM TRANSACTIONS T
JOIN CUSTOMERS C
    ON T.CUSTOMER_ID = C.CUSTOMER_ID;


    SELECT
    T.TRANSACTION_ID,
    T.CUSTOMER_ID,
    C.CUSTOMER_NAME,
    T.AMOUNT,
    C.CITY AS CUSTOMER_CITY,
    T.LOCATION,

    (
        CASE
            WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
            THEN 30
            ELSE 0
        END
        +
        CASE
            WHEN T.LOCATION <> C.CITY
            THEN 25
            ELSE 0
        END
    ) AS RISK_SCORE,

    CASE
        WHEN
            (
                CASE
                    WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
                    THEN 30
                    ELSE 0
                END
                +
                CASE
                    WHEN T.LOCATION <> C.CITY
                    THEN 25
                    ELSE 0
                END
            ) >= 60
        THEN 'HIGH'

        WHEN
            (
                CASE
                    WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
                    THEN 30
                    ELSE 0
                END
                +
                CASE
                    WHEN T.LOCATION <> C.CITY
                    THEN 25
                    ELSE 0
                END
            ) >= 30
        THEN 'MEDIUM'

        ELSE 'LOW'
    END AS RISK_LEVEL

FROM TRANSACTIONS T
JOIN CUSTOMERS C
    ON T.CUSTOMER_ID = C.CUSTOMER_ID;

    SELECT *
FROM (
    SELECT
        T.TRANSACTION_ID,
        T.CUSTOMER_ID,
        C.CUSTOMER_NAME,
        T.AMOUNT,
        C.MONTHLY_AVG_SPEND,
        C.CITY AS CUSTOMER_CITY,
        T.LOCATION,

        (
            CASE
                WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
                THEN 30
                ELSE 0
            END
            +
            CASE
                WHEN T.LOCATION <> C.CITY
                THEN 25
                ELSE 0
            END
        ) AS RISK_SCORE

    FROM TRANSACTIONS T
    JOIN CUSTOMERS C
        ON T.CUSTOMER_ID = C.CUSTOMER_ID
)
WHERE RISK_SCORE >= 30
ORDER BY RISK_SCORE DESC;







CREATE OR REPLACE VIEW RISK_ANALYSIS AS

SELECT
    T.TRANSACTION_ID,
    T.CUSTOMER_ID,
    C.CUSTOMER_NAME,
    C.CITY AS CUSTOMER_CITY,
    C.MONTHLY_AVG_SPEND,

    T.TRANSACTION_DATE,
    T.AMOUNT,
    T.LOCATION,
    T.CHANNEL,
    T.DEVICE_ID,
    T.STATUS,

    CASE
        WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
        THEN 30
        ELSE 0
    END AS AMOUNT_SCORE,

    CASE
        WHEN T.LOCATION <> C.CITY
        THEN 25
        ELSE 0
    END AS LOCATION_SCORE,

    (
        CASE
            WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
            THEN 30
            ELSE 0
        END
        +
        CASE
            WHEN T.LOCATION <> C.CITY
            THEN 25
            ELSE 0
        END
    ) AS RISK_SCORE,

    CASE
        WHEN
            (
                CASE
                    WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
                    THEN 30
                    ELSE 0
                END
                +
                CASE
                    WHEN T.LOCATION <> C.CITY
                    THEN 25
                    ELSE 0
                END
            ) >= 60
        THEN 'HIGH'

        WHEN
            (
                CASE
                    WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
                    THEN 30
                    ELSE 0
                END
                +
                CASE
                    WHEN T.LOCATION <> C.CITY
                    THEN 25
                    ELSE 0
                END
            ) >= 30
        THEN 'MEDIUM'

        ELSE 'LOW'
    END AS RISK_LEVEL

FROM TRANSACTIONS T

JOIN CUSTOMERS C
    ON T.CUSTOMER_ID = C.CUSTOMER_ID;

    SHOW VIEWS;

    SELECT *
FROM RISK_ANALYSIS;

SELECT
    TRANSACTION_ID,
    CUSTOMER_ID,
    CUSTOMER_NAME,
    AMOUNT,
    CUSTOMER_CITY,
    LOCATION,
    RISK_SCORE,
    RISK_LEVEL
FROM RISK_ANALYSIS
WHERE RISK_LEVEL = 'HIGH'
ORDER BY RISK_SCORE DESC;
SELECT
    TRANSACTION_ID,
    CUSTOMER_NAME,
    AMOUNT,
    CUSTOMER_CITY,
    LOCATION,
    RISK_SCORE,
    RISK_LEVEL
FROM RISK_ANALYSIS
WHERE RISK_LEVEL = 'MEDIUM'
ORDER BY RISK_SCORE DESC;


ALTER TABLE CUSTOMERS
ADD COLUMN USUAL_DEVICE_ID VARCHAR(30);

UPDATE CUSTOMERS
SET USUAL_DEVICE_ID = CASE CUSTOMER_ID
    WHEN 'C001' THEN 'D001'
    WHEN 'C002' THEN 'D002'
    WHEN 'C003' THEN 'D003'
    WHEN 'C004' THEN 'D004'
    WHEN 'C005' THEN 'D005'
    WHEN 'C006' THEN 'D006'
    WHEN 'C007' THEN 'D007'
    WHEN 'C008' THEN 'D008'
    WHEN 'C009' THEN 'D009'
    WHEN 'C010' THEN 'D010'
END;

SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CITY,
    USUAL_DEVICE_ID
FROM CUSTOMERS
ORDER BY CUSTOMER_ID;

SELECT
    T.TRANSACTION_ID,
    T.CUSTOMER_ID,
    C.CUSTOMER_NAME,
    C.USUAL_DEVICE_ID,
    T.DEVICE_ID,

    CASE
        WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
        THEN 15
        ELSE 0
    END AS DEVICE_SCORE

FROM TRANSACTIONS T
JOIN CUSTOMERS C
    ON T.CUSTOMER_ID = C.CUSTOMER_ID;

    SELECT
    T.TRANSACTION_ID,
    T.CUSTOMER_ID,
    C.CUSTOMER_NAME,

    C.MONTHLY_AVG_SPEND,
    T.AMOUNT,

    C.CITY AS CUSTOMER_CITY,
    T.LOCATION,

    C.USUAL_DEVICE_ID,
    T.DEVICE_ID,

    CASE
        WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
        THEN 30
        ELSE 0
    END AS AMOUNT_SCORE,

    CASE
        WHEN T.LOCATION <> C.CITY
        THEN 25
        ELSE 0
    END AS LOCATION_SCORE,

    CASE
        WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
        THEN 15
        ELSE 0
    END AS DEVICE_SCORE,

    (
        CASE
            WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
            THEN 30
            ELSE 0
        END
        +
        CASE
            WHEN T.LOCATION <> C.CITY
            THEN 25
            ELSE 0
        END
        +
        CASE
            WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
            THEN 15
            ELSE 0
        END
    ) AS RISK_SCORE

FROM TRANSACTIONS T
JOIN CUSTOMERS C
    ON T.CUSTOMER_ID = C.CUSTOMER_ID;

    SELECT
    T.TRANSACTION_ID,
    T.CUSTOMER_ID,
    C.CUSTOMER_NAME,
    T.AMOUNT,
    T.LOCATION,
    T.DEVICE_ID,

    (
        CASE
            WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
            THEN 30
            ELSE 0
        END
        +
        CASE
            WHEN T.LOCATION <> C.CITY
            THEN 25
            ELSE 0
        END
        +
        CASE
            WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
            THEN 15
            ELSE 0
        END
    ) AS RISK_SCORE,

    CASE
        WHEN (
            CASE
                WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
                THEN 30
                ELSE 0
            END
            +
            CASE
                WHEN T.LOCATION <> C.CITY
                THEN 25
                ELSE 0
            END
            +
            CASE
                WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
                THEN 15
                ELSE 0
            END
        ) >= 60
        THEN 'HIGH'

        WHEN (
            CASE
                WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
                THEN 30
                ELSE 0
            END
            +
            CASE
                WHEN T.LOCATION <> C.CITY
                THEN 25
                ELSE 0
            END
            +
            CASE
                WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
                THEN 15
                ELSE 0
            END
        ) >= 30
        THEN 'MEDIUM'

        ELSE 'LOW'
    END AS RISK_LEVEL

FROM TRANSACTIONS T
JOIN CUSTOMERS C
    ON T.CUSTOMER_ID = C.CUSTOMER_ID;

    SELECT *
FROM (
    SELECT
        T.TRANSACTION_ID,
        T.CUSTOMER_ID,
        C.CUSTOMER_NAME,
        T.AMOUNT,
        T.LOCATION,
        T.DEVICE_ID,

        (
            CASE
                WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
                THEN 30
                ELSE 0
            END
            +
            CASE
                WHEN T.LOCATION <> C.CITY
                THEN 25
                ELSE 0
            END
            +
            CASE
                WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
                THEN 15
                ELSE 0
            END
        ) AS RISK_SCORE

    FROM TRANSACTIONS T
    JOIN CUSTOMERS C
        ON T.CUSTOMER_ID = C.CUSTOMER_ID
)
WHERE RISK_SCORE >= 60
ORDER BY RISK_SCORE DESC;


CREATE OR REPLACE VIEW RISK_ANALYSIS AS

SELECT
    T.TRANSACTION_ID,
    T.CUSTOMER_ID,
    C.CUSTOMER_NAME,

    C.CITY AS CUSTOMER_CITY,
    T.LOCATION AS TRANSACTION_LOCATION,

    C.MONTHLY_AVG_SPEND,
    T.AMOUNT,

    T.TRANSACTION_DATE,
    T.CHANNEL,

    C.USUAL_DEVICE_ID,
    T.DEVICE_ID,

    CASE
        WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
        THEN 30
        ELSE 0
    END AS AMOUNT_SCORE,

    CASE
        WHEN T.LOCATION <> C.CITY
        THEN 25
        ELSE 0
    END AS LOCATION_SCORE,

    CASE
        WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
        THEN 15
        ELSE 0
    END AS DEVICE_SCORE,

    (
        CASE
            WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
            THEN 30
            ELSE 0
        END
        +
        CASE
            WHEN T.LOCATION <> C.CITY
            THEN 25
            ELSE 0
        END
        +
        CASE
            WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
            THEN 15
            ELSE 0
        END
    ) AS RISK_SCORE,

    CASE
        WHEN (
            CASE
                WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
                THEN 30
                ELSE 0
            END
            +
            CASE
                WHEN T.LOCATION <> C.CITY
                THEN 25
                ELSE 0
            END
            +
            CASE
                WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
                THEN 15
                ELSE 0
            END
        ) >= 60
        THEN 'HIGH'

        WHEN (
            CASE
                WHEN T.AMOUNT > C.MONTHLY_AVG_SPEND * 5
                THEN 30
                ELSE 0
            END
            +
            CASE
                WHEN T.LOCATION <> C.CITY
                THEN 25
                ELSE 0
            END
            +
            CASE
                WHEN T.DEVICE_ID <> C.USUAL_DEVICE_ID
                THEN 15
                ELSE 0
            END
        ) >= 30
        THEN 'MEDIUM'

        ELSE 'LOW'
    END AS RISK_LEVEL

FROM TRANSACTIONS T

JOIN CUSTOMERS C
    ON T.CUSTOMER_ID = C.CUSTOMER_ID;

    SHOW VIEWS;

    SELECT *
FROM RISK_ANALYSIS
ORDER BY RISK_SCORE DESC;

SELECT
    TRANSACTION_ID,
    CUSTOMER_ID,
    CUSTOMER_NAME,
    AMOUNT,
    CUSTOMER_CITY,
    TRANSACTION_LOCATION,
    CHANNEL,
    DEVICE_ID,
    RISK_SCORE,
    RISK_LEVEL
FROM RISK_ANALYSIS
WHERE RISK_LEVEL = 'HIGH'
ORDER BY RISK_SCORE DESC;