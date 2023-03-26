-- 코드를 입력하세요
SELECT EXTRACT(hour FROM DATETIME) AS HOUR, COUNT(*)
FROM ANIMAL_OUTS as outs
GROUP BY EXTRACT(hour FROM DATETIME)
HAVING HOUR BETWEEN 9 AND 19
ORDER BY HOUR

-- # 입양 시각 구하기(1)
-- # https://school.programmers.co.kr/learn/courses/30/lessons/59412
-- # 0. 몇 시를 기준으로 시간별 데이터가 필요한 상황이기에 시간을 기준으로 GROUP BY
-- # 1. 필요한 데이터는 합산된 입양 건수이므로, 전체 레코드의 카운터를 가져옴
-- # 2. 합산된 전체 레코드를 합산한 후에 필요한 레코드의 시간대에 따라 HAVING 으로 체크!