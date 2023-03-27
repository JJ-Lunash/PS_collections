SELECT 
    e.BOOK_ID,
    a.AUTHOR_NAME,
    DATE_FORMAT(e.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM (
    SELECT *
    FROM BOOK
    WHERE CATEGORY LIKE '경제'
) AS e JOIN AUTHOR AS a
ON e.AUTHOR_ID = a.AUTHOR_ID
ORDER BY PUBLISHED_DATE ASC

-- 조건에 맞는 도서와 저자 리스트 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/144854

-- 0. 경제도서에 해당하는 테이블만 서브쿼리로 가져온 다음에
-- 1. 둘다 NULL이 허용된 상황이 아니므로 JOIN으로 병합
-- 2. 요구조건에 맞게 데이터를 가공