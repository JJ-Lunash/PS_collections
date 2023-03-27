SELECT ANIMAL_TYPE, COUNT(*) AS count
FROM ANIMAL_INS AS i
GROUP BY ANIMAL_TYPE
ORDER BY ANIMAL_TYPE ASC

-- # 고양이와 개는 몇 마리 있을까
-- # https://school.programmers.co.kr/learn/courses/30/lessons/59040