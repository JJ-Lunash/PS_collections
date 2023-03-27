-- 코드를 입력하세요
SELECT i.INGREDIENT_TYPE, SUM(f.TOTAL_ORDER) AS TOTAL_ORDER  
FROM FIRST_HALF AS f LEFT JOIN ICECREAM_INFO AS i
ON f.FLAVOR = i.FLAVOR
GROUP BY INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC

-- # 성분으로 구분한 아이스크림 총 주문량
-- # https://school.programmers.co.kr/learn/courses/30/lessons/133026