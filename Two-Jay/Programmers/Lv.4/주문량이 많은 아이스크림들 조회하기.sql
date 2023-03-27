-- 코드를 입력하세요
SELECT f.FLAVOR
FROM FIRST_HALF AS f RIGHT JOIN JULY AS j
ON f.FLAVOR = j.FLAVOR
GROUP BY FLAVOR 
ORDER BY SUM(f.TOTAL_ORDER) + SUM(j.TOTAL_ORDER) DESC
LIMIT 3

-- 주문량이 많은 아이스크림들 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/133027

-- 0. 기준이 되는 집계해야할 데이터가 FLAVOR이니 GROUP BY로 FLAVOR을 집계하고
-- 1. SUM()으로 두 테이블의 TOTAL_ORDER를 합산하고
-- 2. ORDER BY로 정렬하고
-- 3. LIMIT로 상위 3개만 가져온다.



/*
WANING :
원래 이 문제는 INNER JOIN으로 풀면 안된다.
FIRST_HALF와 JULY 테이블에 존재하는 데이터 모두를 가지고 와야하는데
JOIN으로만 풀면 한쪽에만 존재하는 데이터는 가져오지 못한다.

FULL OUTER JOIN을 사용하면 되지만,
FULL OUTER JOIN은 MySQL에서 지원하지 않는다.
따라서 두 테이블을 모두 가져온 뒤 UNION ALL로 합쳐서 풀어야 한다.
*/
SELECT FLAVOR
FROM (
    SELECT FLAVOR, TOTAL_ORDER
    FROM FIRST_HALF
    UNION ALL
    SELECT FLAVOR, TOTAL_ORDER
    FROM JULY
) AS T
GROUP BY FLAVOR
ORDER BY  SUM(TOTAL_ORDER) DESC
LIMIT 3