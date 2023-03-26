SELECT BOOK.CATEGORY, SUM(sales) AS TOTAL_SALES
FROM BOOK
LEFT JOIN BOOK_SALES ON BOOK.BOOK_ID = BOOK_SALES.BOOK_ID
WHERE YEAR(BOOK_SALES.SALES_DATE) = 2022 AND MONTH(BOOK_SALES.SALES_DATE) = 1
GROUP BY CATEGORY
ORDER BY CATEGORY ASC

-- 카테고리 별 도서 판매량 집계하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/144855
-- 0. 도서 아이디별로 판매기록이 있는 상황이고, 필요한 것은 도서의 카테고리별로 도서의 판매 기록 레코드의 합계임.
-- 1. 따라서 아이디를 기준으로 LEFT JOIN 시행. 둘다 필드는 NOT NULL 상황이니 어느쪽으로 해도 좋다고 생각함.
-- 2. 요구 조건에 맞는 기간에 따라 먼저 필터링해야함. 필요한 것은 기간 내에 존재하는 개별 레코드의 값임.
-- 3. 요구 조건에서는 카테고리 별로 집계된 판매 데이터이기 때문에 이를 기준으로 GROUP BY 시행.