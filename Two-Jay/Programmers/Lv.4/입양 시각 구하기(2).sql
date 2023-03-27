WITH RECURSIVE HOURS AS (
    SELECT 0 AS HOUR
    UNION ALL
    SELECT HOUR + 1 FROM HOURS
    WHERE HOUR < 23
)

SELECT
    h.HOUR,
    COUNT(DISTINCT a.ANIMAL_ID) AS COUNT
FROM ANIMAL_OUTS AS a RIGHT JOIN HOURS AS h
ON EXTRACT(hour FROM a.DATETIME) = h.HOUR
GROUP BY h.HOUR
ORDER BY h.HOUR

-- 입양 시각 구하기(2)
-- https://school.programmers.co.kr/learn/courses/30/lessons/59413
/*
Recursive 쿼리를 통해 반복문을 돌리는 것과 같은 효과를 얻을 수 있다.

WITH RECURSICVE 테이블명 AS (
    초기 sql 값
    UNION ALL (혹은 UNION)
    연산 작업
    종료 조건
)
*/