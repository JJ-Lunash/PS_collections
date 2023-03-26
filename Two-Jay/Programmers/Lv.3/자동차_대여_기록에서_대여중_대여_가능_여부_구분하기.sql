SELECT
    rh.CAR_ID,
    IF(SUM(IF(rh.START_DATE <= '2022-10-16' AND rh.END_DATE >= '2022-10-16', 1, 0)) > 0 , '대여중', '대여 가능') AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS rh
GROUP BY rh.CAR_ID
ORDER BY rh.CAR_ID DESC

-- -- 자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기
-- -- https://school.programmers.co.kr/learn/courses/30/lessons/157340
-- 0. 요구 조건에 따라서 대여 기록 테이블을 기준으로 GROUP BY를 시행하고, 그룹별로 대여 기록이 존재하는지 체크해야함.
-- 1. 요구 조건에 따라서 대여 기록이 존재하는지 체크하는 기준은 대여 기록의 시작일과 종료일이 특정 날짜를 포함하는지 체크해야함.
-- 2. 따라서 IF문을 사용하여 특정 날짜를 포함하는지 체크하고, 그 결과를 SUM으로 합산함. 합산한 값을 기준으로 AVAILABILITY을 판단함.
-- 3. 요구 조건에 따라서 자동차 아이디를 기준으로 내림차순 정렬해야함.

/*
MAX 를 사용한 풀이
MAX 함수를 DATE 에 사용하면 DATE 가 가장 큰 값을 반환한다.
따라서 MAX(CASE WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN '대여중' ELSE '대여 가능' END) AS AVAILABILTY
이렇게 사용하면 가장 값이 큰 DATE 값만 반환되고 나머지는 다 버릴 수 있으므로 '2022-10-16' 이 포함된 기간이 있는지 없는지를 판단할 수 있다.
*/
SELECT 
    CAR_ID,
    MAX(CASE WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN '대여중'
    ELSE '대여 가능' END) AVAILABILTY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC

/*
CTE와 JOIN을 사용한 풀이

CTE를 사용한 임시테이블로 대여중인 자동차를 구하고
LEFT JOIN 으로 대여중인 자동차와 전체 자동차를 JOIN 한다.
*/

WITH USED_LIST AS (
    SELECT
        CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE TO_DATE('2022-10-16', 'YYYY-MM-DD') BETWEEN START_DATE AND END_DATE
)
SELECT
    DISTINCT A.CAR_ID
    , CASE
        WHEN B.CAR_ID IS NULL THEN '대여 가능'
        ELSE '대여중'
    END
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY A
    LEFT JOIN USED_LIST B
        ON A.CAR_ID = B.CAR_ID
ORDER BY CAR_ID DESC