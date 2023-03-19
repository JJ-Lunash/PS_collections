-- Title : 동물의 아이디와 이름
-- Level : 1
-- Category : 프로그래머스
-- URL : https://school.programmers.co.kr/learn/courses/30/lessons/59403
-- =========================================================================
/*
테이블 구조

Table ANIMAL_INS {
  ANIMAL_ID VARCHAR(N)
  ANIMAL_TYPE VARCHAR(N)
  DATETIME  DATETIME
  INTAKE_CONDITION  VARCHAR(N)
  NAME  VARCHAR(N)  [null]
  SEX_UPON_INTAKE VARCHAR(N)
}
*/

SELECT animals.ANIMAL_ID,
    animals.NAME
FROM ANIMAL_INS AS animals
ORDER BY animals.ANIMAL_ID ASC;