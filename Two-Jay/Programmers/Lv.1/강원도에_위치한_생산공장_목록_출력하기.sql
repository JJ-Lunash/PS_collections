-- Title : 강원도에 위치한 생산공장 목록 출력하기
-- Level : 1
-- Category : 프로그래머스
-- URL : https://school.programmers.co.kr/learn/courses/30/lessons/131112
-- =========================================================================
/*
테이블 구조

Table FOOD_FACTORY {
  FACTORY_ID  varchar(10)
  FACTORY_NAME  varchar(50)
  ADDRESS varchar(100)
  TLNO  varchar(20) [null]
}
*/

SELECT factories.FACTORY_ID,
    factories.FACTORY_NAME,
    factories.ADDRESS
FROM FOOD_FACTORY AS factories
WHERE factories.ADDRESS LIKE '%강원도%'
ORDER BY factories.FACTORY_ID ASC;