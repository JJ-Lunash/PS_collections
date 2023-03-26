SELECT NAME, COUNT(*) AS COUNT
FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) >= 2
ORDER BY NAME ASC

-- # 동명 동물 수 찾기
-- # https://school.programmers.co.kr/learn/courses/30/lessons/59041
-- # 0. 기준이 되는 집계해야할 데이터가 NAME이니 GROUP BY로 NAME을 집계하고
-- # 1. HAVING으로 사용된 수를 체크했다.