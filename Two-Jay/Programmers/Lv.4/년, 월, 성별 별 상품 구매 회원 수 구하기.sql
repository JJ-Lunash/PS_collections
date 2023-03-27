SELECT 
    EXTRACT(year FROM s.SALES_DATE) AS YEAR,
    EXTRACT(month FROM s.SALES_DATE) AS MONTH,
    u.GENDER,
    COUNT(DISTINCT u.USER_ID) AS USERS
FROM USER_INFO AS u JOIN ONLINE_SALE AS s
ON u.USER_ID = s.USER_ID
WHERE u.GENDER IS NOT NULL
GROUP BY YEAR, MONTH, u.GENDER
ORDER BY YEAR, MONTH, u.GENDER

-- # 년, 월, 성별 별 상품 구매 회원 수 구하기
-- # https://school.programmers.co.kr/learn/courses/30/lessons/131532

-- 0. 두 테이블을 JOIN하여 유저와 판매기록 데이터를 병합하여 가져온 뒤
-- 1. 성별이 NULL이 아닌 데이터만 필터링
-- 2. 년, 월, 성별을 기준으로 GROUP BY
-- 3. 요구조건에 맞게 정렬
-- 4. 유저 아이디 기준으로 중복을 제거하고 순수한 유저의 수만 세어야 하기 때문에 COUNT(DISTINCT)를 사용