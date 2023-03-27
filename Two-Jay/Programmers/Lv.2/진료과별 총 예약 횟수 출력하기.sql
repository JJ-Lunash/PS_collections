-- 코드를 입력하세요
SELECT MCDP_CD AS 진료과코드,
    COUNT(*) AS 5월예약건수
FROM APPOINTMENT AS a
WHERE YEAR(APNT_YMD) = 2022 AND MONTH(APNT_YMD) = 5
GROUP BY 진료과코드
ORDER BY 5월예약건수 ASC, 진료과코드 ASC

-- 진료과별 총 예약 횟수 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/132202