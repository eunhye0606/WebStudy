SELECT USER
FROM DUAL;
--==>>SCOTT
---------------------------------------------------------------
--※ 환경 세팅.

--○ 기존 테이블 제거
DROP TABLE TBL_BOARD PURGE;
--==>>Table TBL_BOARD이(가) 삭제되었습니다.
---------------------------------------------------------------


--○ TBL_BOARD 테이블 생성(게시판 전용 테이블 생성)
CREATE TABLE TBL_BOARD
(NUM       NUMBER(9)                            NOT NULL    -- 게시물 번호
,NAME      VARCHAR2(30)                         NOT NULL    -- 게시물 작성자
,PWD       VARCHAR2(20)                         NOT NULL    -- 게시물 암호
,EMAIL     VARCHAR2(50)                                     -- 작성자 이메일
,SUBJECT   VARCHAR2(100)                        NOT NULL    -- 게시물 제목
,CONTENT   VARCHAR2(4000)                       NOT NULL    -- 게시물 내용
,IPADDR    VARCHAR2(20)                                     -- 접속한 클라이언트 IP 주소
,HITCOUNT  NUMBER           DEFAULT 0           NOT NULL    -- 게시물 조회수
,CREATED   DATE             DEFAULT SYSDATE     NOT NULL    -- 게시물 작성일
,CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)                   -- 게시물 번호에 PK 제약조건 설정
);
--==>>Table TBL_BOARD이(가) 생성되었습니다.

--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성
SELECT NVL(MAX(NUM),0) AS MAXNUM
FROM TBL_BOARD;
--> 한 줄 구성
SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD
;
--==>>0

--○ 게시물 작성 쿼리문 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '이지연', '1234', 'ljy@test.com', '작성테스트', '게시물내용작성', '211.238.142.160', 0, SYSDATE);
--> 한 줄 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(1, '이지연', '1234', 'ljy@test.com', '작성테스트', '게시물내용작성', '211.238.142.160', 0, SYSDATE)
;
--==>>1 행 이(가) 삽입되었습니다.

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ DB 레코드의 갯수를 가져오는 쿼리문 구성(1페이지, 2페이지,...)
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
-->한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
--==>>0

-- ※WHERE NUM>=1 AND NUM<=10 하면 삭제한 글도 카운트됨..
--                1       10
--○ 특정 영역의(시작번호~끝번호) 게시물 목록을 읽어오는 쿼리문 구성
--   번호, 작성자, 제목, 조회수, 작성일
SELECT ROWNUM RNUM, DAT
FROM
(
    SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
    FROM TBL_BOARD
    ORDER BY NUM DESC
) DATA;

SELECT *
FROM
(
    SELECT ROWNUM RNUM, DATA.*
    FROM
    (
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM>=1 AND RNUM<=10;
-->한 줄 구성
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM (     SELECT ROWNUM RNUM, DATA.*     FROM     (         SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED         FROM TBL_BOARD         ORDER BY NUM DESC     ) DATA ) WHERE RNUM>=1 AND RNUM<=10
;


--○ 특정 게시물 조회에 따른 조회 횟수 증가 쿼리문 구성
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT+1       -- HITCOUNT +=1, HITCOUNT++ 둘 다 없어.
WHERE NUM=1;
--> 한 줄 구성
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT+1 WHERE NUM=1
;
-- 조회수 증명 : 로그화 ! 열람 리스트 만들기.

--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성(게시물 조회)
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
       ,TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
FROM TBL_BOARD
WHERE NUM=3;
-->한 줄 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT ,TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM=3
;


--○ 특정 게시물을 삭제하는 쿼리문 구성
DELETE
FROM TBL_BOARD
WHERE NUM=12;
-->한 줄 구성
DELETE FROM TBL_BOARD WHERE NUM=12
;

--○ 특정 게시물을 수정하는 쿼리문 구성
--   (게시물 상세보기 페이지 →  Article.jsp 내에서의 처리)
--   작성자, 패스워드, 이메일, 제목, 내용
UPDATE TBL_BOARD
SET NAME='김민성', PWD='1234', EMAIL='kms@test.com', SUBJECT='수정제목', CONTENT='수정내용'
WHERE NUM=5;
--> 한 줄 구성
UPDATE TBL_BOARD SET NAME='김민성', PWD='1234', EMAIL='kms@test.com', SUBJECT='수정제목', CONTENT='수정내용' WHERE NUM=5
;

--○ 특정 게시물(50번)의 다음 번호 읽어오는 쿼리문 구성
SELECT NVL(MIN(NUM),-1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM > 50;
--> 한 줄 구성
SELECT NVL(MIN(NUM),-1) AS NEXTNUM FROM TBL_BOARD WHERE NUM > 50
;
--○ 특정 게시물(50번)의 이전 번호 읽어오는 쿼리문 구성
SELECT NVL(MAX(NUM),-1) AS BEFORENUM
FROM TBL_BOARD
WHERE NUM < 50;
--> 한 줄 구성
SELECT NVL(MAX(NUM),-1) AS BEFORENUM FROM TBL_BOARD WHERE NUM < 50
;



--------------------------------------------------------------------------------
--■■■ 실습 진행간 테스트■■■--

SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
--==>> 0

--○ 게시물 작성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)
VALUES(1, '김태형', '1234', 'kth@test.com' , '작성테스트' ,'내용물작성', '211.238.142.154', 0 ,SYSDATE);

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 게시물 삭제
DELETE
FROM TBL_BOARD;
--==>>1 행 이(가) 삭제되었습니다.

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--------------------------------------------------------------------------------
--○ 프로시저 실행 이후 테이블 조회
SELECT MIN(NUM)
FROM TBL_BOARD;


--○ 검색 데이터 갯수 조회 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE SUBJECT LIKE '%음식%';
--==>>180
--한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD WHERE SUBJECT LIKE '%음식%'
;
--==>>180
SELECT *
FROM TBL_BOARD
ORDER BY NUM DESC;



--○
--○
--○







































