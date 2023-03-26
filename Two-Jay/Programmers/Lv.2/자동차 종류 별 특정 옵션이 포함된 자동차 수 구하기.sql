WITH t AS (
    SELECT CAR_ID, CAR_TYPE, OPTIONS
    FROM CAR_RENTAL_COMPANY_CAR
    WHERE OPTIONS LIKE '%통풍시트%' OR OPTIONS LIKE '%열선시트%' OR OPTIONS LIKE '%가죽시트%'
)

SELECT CAR_TYPE, COUNT(*) AS CARS
FROM t
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE

-- 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/151137
-- 0. 특정 옵션이 포함되어 있는 자동차의 종류를 먼저 구해서 CTE로 저장
-- 1. CTE를 기준으로 GROUP BY로 자동차 종류를 집계하고
-- 2. 집계된 자동차 종류별로 COUNT(*)로 각각의 레코드 수를 구함


/*
정규표현식을 사용한 풀이
*/
-- # SELECT CAR_TYPE, COUNT(car_type) AS CARS
-- # FROM CAR_RENTAL_COMPANY_CAR
-- # WHERE options REGEXP ('통풍시트|열선시트|가죽시트')
-- # GROUP BY car_type
-- # ORDER BY 1;

