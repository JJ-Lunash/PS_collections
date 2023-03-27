-- 코드를 입력하세요
SELECT (p.PRICE div 10000) * 10000 AS PRICE_GROUP,
    COUNT(*) AS PRODUCTS
FROM PRODUCT AS p
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP

-- # 가격대 별 상품 개수 구하기
-- # https://school.programmers.co.kr/learn/courses/30/lessons/131530