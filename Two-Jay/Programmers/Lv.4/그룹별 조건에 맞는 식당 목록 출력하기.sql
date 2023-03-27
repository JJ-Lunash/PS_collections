-- 코드를 입력하세요
SELECT
    m.MEMBER_NAME,
    r.REVIEW_TEXT,
    DATE_FORMAT(r.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE as m INNER JOIN REST_REVIEW as r
ON m.MEMBER_ID = r.MEMBER_ID
WHERE m.MEMBER_ID = (
    SELECT MEMBER_ID
    FROM REST_REVIEW
    GROUP BY MEMBER_ID
    ORDER BY COUNT(REVIEW_ID) DESC LIMIT 1
)
ORDER BY REVIEW_DATE, r.REVIEW_TEXT

-- 그룹별 조건에 맞는 식당 목록 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131124

-- 0.가장 많이 리플을 단 사람의 데이터가 필요하기에 서브쿼리로 그에 맞는 테이블을 구한다.
--     0.0 멤버 아이디 기준으로 GROUP BY 하고
--     0.1 가장 많은 리플이 기준이니 COUNT(REVIEW_ID) 기준으로 LIMIT 1로 내림차순 정렬
-- 1.서브쿼리에서 가져온 테이블에서 MEMBER_ID를 기준으로 MEMBER_PROFILE과 REST_REVIEW를 INNER JOIN한다.
--     * REST_REVIEW에서는 MEMBER_ID가 NULLABLE 하기 때문에 공통된 데이터인 MEMBER_ID가 NULLABLE 하지 않은 MEMBER_PROFILE를 기준으로 JOIN 진행
-- 2. 요구사항에 맞게 정렬한다.


/*
rank() 이용하면 더 간단하게 풀 수 있음
*/
select b.MEMBER_NAME,a.REVIEW_TEXT,to_char(a.REVIEW_DATE,'yyyy-mm-dd') REVIEW_DATE
from REST_REVIEW a right outer join  MEMBER_PROFILE b on a.MEMBER_ID=b.MEMBER_ID
where a.MEMBER_ID||1 in (
    SELECT MEMBER_ID||rank() over(order by count(* )desc)
    from REST_REVIEW 
    group by MEMBER_ID
)
order by a.REVIEW_DATE ,a.REVIEW_TEXT

