SELECT USER
FROM DUAL;
--==>>SCOTT


--○ 기존 테이블 삭제
DROP TABLE TBL_MEMBER;
--==>>Table TBL_MEMBER이(가) 삭제되었습니다.

--○ 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
(SID    NUMBER
,NAME   VARCHAR2(30)    NOT NULL
,TEL    VARCHAR2(40)
,CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>>Table TBL_MEMBER이(가) 생성되었습니다.

--○ 기존 시퀀스 제거
DROP SEQUENCE MEMBERSEQ;
--==>>Sequence MEMBERSEQ이(가) 삭제되었습니다.

--○ 시퀀스 생성
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>>Sequence MEMBERSEQ이(가) 생성되었습니다.

--------------------------------------------------------------------------------
--○ 데이터 삽입 (샘플 데이터 입력 (TBL_MEMBER))
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL,'이윤태','010-1111-1111');
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL,'오이삭','010-2222-2222');
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL,'신시은','010-3333-3333');
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL,'최문정','010-4444-4444');
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL,'이호석','010-5555-5555');
--> 한 줄 구성
INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL,'이호석','010-5555-5555')
;
--==>>1 행 이(가) 삽입되었습니다.*5


--○ 데이터 조회(전체)
SELECT SID,NAME,TEL
FROM TBL_MEMBER
ORDER BY SID;
-->한 줄 구성
SELECT SID,NAME,TEL FROM TBL_MEMBER ORDER BY SID
;
/*
1	이윤태	010-1111-1111
2	오이삭	010-2222-2222
3	신시은	010-3333-3333
4	최문정	010-4444-4444
5	이호석	010-5555-5555
*/


--○ 데이터 조회(인원수)
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
-->한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;
-->>5

--○ 커밋
COMMIT;
--==>>커밋 완료.

--○ 데이터 조회(SID, 회원 정보 검색)
SELECT SID,NAME,TEL
FROM TBL_MEMBER
WHERE SID = 1;
--> 한 줄 구성
SELECT SID,NAME,TEL FROM TBL_MEMBER WHERE SID = 1
;
--==>>1	이윤태	010-1111-1111


--○ 데이터 수정(회원 정보 수정)
UPDATE TBL_MEMBER
SET NAME='이윤태', TEL='010-1100-1100'
WHERE SID=1;
--> 한 줄 구성
UPDATE TBL_MEMBER SET NAME='이윤태', TEL='010-1100-1100' WHERE SID=1
;
--==>>1 행 이(가) 업데이트되었습니다.


--○ 롤백
ROLLBACK;
--==>>롤백 완료.
--○ 확인
SELECT SID,NAME,TEL
FROM TBL_MEMBER
ORDER BY SID;
/*
1	이윤태	010-1111-1111
2	오이삭	010-2222-2222
3	신시은	010-3333-3333
4	최문정	010-4444-4444
5	이호석	010-5555-5555
*/

--○ 데이터 삭제(회원 정보 삭제)
DELETE
FROM TBL_MEMBER
WHERE SID=1;
--> 한 줄 구성
DELETE FROM TBL_MEMBER WHERE SID=1
;
--==>>1 행 이(가) 삭제되었습니다.

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.
--○ 확인
SELECT *
FROM TBL_MEMBER
ORDER BY 1;
/*
1	이윤태	010-1111-1111
2	오이삭	010-2222-2222
3	신시은	010-3333-3333
4	최문정	010-4444-4444
5	이호석	010-5555-5555
*/

--------------------------------------------------------------------------------
--○ 기존 테이블 제거
DROP TABLE TBL_SCORE;
--==>>Table TBL_SCORE이(가) 삭제되었습니다.

--○ 테이블 생성(TBL_MEMBERSCORE)
CREATE TABLE TBL_MEMBERSCORE
(SID    NUMBER
,KOR    NUMBER(3)
,ENG    NUMBER(3)
,MAT    NUMBER(3)
,CONSTRAINT MEMBERSCORE_SID_PK PRIMARY KEY(SID)
,CONSTRAINT MEMBERSCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
,CONSTRAINT MEMBERSCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
,CONSTRAINT MEMBERSCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100)
,CONSTRAINT MEMBERSCORE_SID_FK FOREIGN KEY(SID)
            REFERENCES TBL_MEMBER(SID)
);
--==>>Table TBL_MEMBERSCORE이(가) 생성되었습니다.


--○ 샘플 데이터 입력
INSERT INTO TBL_MEMBERSCORE(SID,KOR,ENG,MAT) VALUES(1,90,80,70);
--==>>1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_MEMBERSCORE(SID,KOR,ENG,MAT) VALUES(2,80,70,60);
--==>>1 행 이(가) 삽입되었습니다.

--○ 성적 테이블 조회
SELECT SID,KOR,ENG,MAT
FROM TBL_MEMBERSCORE
ORDER BY SID;
--> 한 줄 구성
SELECT SID,KOR,ENG,MAT FROM TBL_MEMBERSCORE ORDER BY SID
;
/*
1	90	80	70
2	80	70	60
*/


--○ 커밋 
COMMIT;
--==>> 커밋 완료.


--○ 성적 데이터 조회(입력된 성적 데이터 갯수 확인)
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE;
-->한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE
;
--==>>2



--○ 성적 데이터 수정
UPDATE TBL_MEMBERSCORE
SET KOR=91, ENG=81, MAT=71
WHERE SID=1;
--> 한 줄 구성
UPDATE TBL_MEMBERSCORE SET KOR=91, ENG=81, MAT=71 WHERE SID=1
;
--==>>1 행 이(가) 업데이트되었습니다.


--○ 확인
SELECT *
FROM TBL_MEMBERSCORE;
/*
1	91	81	71
2	80	70	60
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 성적 데이터 삭제
DELETE
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> 한 줄 구성
DELETE FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>>1 행 이(가) 삭제되었습니다.


--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 전체 리스트 조회 쿼리문 구성(TBL_MEMBER & TBL_MEMBERSCORE)
SELECT M.SID,M.NAME,M.TEL
       ,S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID;
/*
1	이윤태	010-1111-1111	90	80	70
2	오이삭	010-2222-2222	80	70	60
*/


--○ 성적데이터가 없어도 조회할 수 있는 쿼리문 → LEFT JOIN(왼쪽이 주인공)
SELECT M.SID, M.NAME, M.TEL
      ,S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
/*
1	이윤태	010-1111-1111	90	80	70
2	오이삭	010-2222-2222	80	70	60
3	신시은	010-3333-3333  (NULL)(NULL)(NULL)
4	최문정	010-4444-4444  (NULL)(NULL)(NULL)		
5	이호석	010-5555-5555  (NULL)(NULL)(NULL)			
*/

--○ 성적데이터가 없어도 조회할 수 있는 쿼리문 → LEFT JOIN → 개선 → NVL
SELECT M.SID, M.NAME, M.TEL
      ,NVL(S.KOR,-1) AS KOR
      , NVL(S.ENG,-1) AS ENG
      , NVL(S.MAT,-1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
/*
1	이윤태	010-1111-1111	91	81	71
2	오이삭	010-2222-2222	80	70	60
3	신시은	010-3333-3333	-1	-1	-1
4	최문정	010-4444-4444	-1	-1	-1
5	이호석	010-5555-5555	-1	-1	-1
*/


--○ 전체 리스트 조회 전용 뷰 생성(VIEW_MEMBERSCORE)
CREATE OR REPLACE VIEW VIEW_MEMBERSCORE
AS
SELECT M.SID, M.NAME, M.TEL
      ,NVL(S.KOR,-1) AS KOR
      , NVL(S.ENG,-1) AS ENG
      , NVL(S.MAT,-1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>View VIEW_MEMBERSCORE이(가) 생성되었습니다.


--○ 생성한 뷰(VIEW_MEMBERSCORE)를 활용한 리스트 조회
SELECT SID,NAME,KOR,ENG,MAT
      ,(KOR+ENG+MAT) AS TOT
      ,ROUND(((KOR+ENG+MAT)/3),2) AS AVG
      ,RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK
FROM VIEW_MEMBERSCORE
ORDER BY SID;
--> 한 줄 구성
SELECT SID,NAME,KOR,ENG,MAT ,(KOR+ENG+MAT) AS TOT ,ROUND(((KOR+ENG+MAT)/3),2) AS AVG ,RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM VIEW_MEMBERSCORE ORDER BY SID
;
/*
1	이윤태	91	81	71	243	81	1
2	오이삭	80	70	60	210	70	2
3	신시은	-1	-1	-1	-3	-1	3
4	최문정	-1	-1	-1	-3	-1	3
5	이호석	-1	-1	-1	-3	-1	3
*/




--○ 생성한 뷰(VIEW_MEMBERSCORE)를 활용한 번호 검색
SELECT SID,NAME,KOR,ENG,MAT
FROM VIEW_MEMBERSCORE
WHERE SID=1;
--> 한 줄 구성
SELECT SID,NAME,KOR,ENG,MAT FROM VIEW_MEMBERSCORE WHERE SID=1
;
--==>>1	이윤태	91	81	71




--○ 참조 데이터 레코드 수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE
WHERE SID=1;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>>1




COMMIT;

DELETE FROM TBL_MEMBERSCORE WHERE SID=1
;

commit;
















