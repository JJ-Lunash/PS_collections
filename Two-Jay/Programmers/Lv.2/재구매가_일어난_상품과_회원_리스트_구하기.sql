Title : 재구매가 일어난 상품과 회원 리스트 구하기
Level : 2
Category : 프로그래머스
URL : https://school.programmers.co.kr/learn/courses/30/lessons/131536
=========================================================================
/*
테이블 구조

Table ONLINE_SALE {
  ONLINE_SALE_ID  INTEGER
  USER_ID INTEGER
  PRODUCT_ID  INTEGER
  SALES_AMOUNT  INTEGER
  SALES_DATE  DATE
}
*/

SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE AS sales
GROUP BY sales.USER_ID, sales.PRODUCT_ID
HAVING COUNT(sales.USER_ID) >= 2
ORDER BY sales.USER_ID ASC, sales.PRODUCT_ID DESC;