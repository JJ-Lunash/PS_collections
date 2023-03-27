WITH sales AS (
    SELECT b.BOOK_ID, b.AUTHOR_ID, b.CATEGORY, SUM(b.PRICE * bs.SALES) AS TOTAL_SALES
    FROM BOOK AS b LEFT JOIN BOOK_SALES AS bs
    ON b.BOOK_ID = bs.BOOK_ID
    WHERE YEAR(sales_date) = 2022 AND MONTH(sales_date) = 1
    GROUP BY AUTHOR_ID, CATEGORY
)

SELECT a.AUTHOR_ID, a.AUTHOR_NAME, sales.CATEGORY, TOTAL_SALES
FROM AUTHOR AS a JOIN sales 
ON a.AUTHOR_ID = sales.AUTHOR_ID
ORDER BY AUTHOR_ID ASC, CATEGORY DESC

-- # 저자 별 카테고리 별 매출액 집계하기
-- # https://school.programmers.co.kr/learn/courses/30/lessons/144856
-- 0. 우선 기간 내에 도서 판매량을 구하고, 저자별-카테고리별로 GROUP BY하는 CTE를 만든다.
--     0.0. 공통된 BOOK_ID 칼럼을 BOOK과 BOOK_SALES에 둘 다 있으니 이를 기준으로 JOIN을 하고
--     0.1. 기간 조건으로 필터링
--     0.2. 구하는 것은 저자별-카테고리별 데이터이기에 이를 기준으로 필터링
    
-- 1. CTE로 가져온 데이터를 AUTHOR 테이블과 조인하고
-- 2. 주어진 요구조건에 따라 정렬하고 서빙

