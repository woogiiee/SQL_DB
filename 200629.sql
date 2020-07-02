rename emp05 to test
select* from test;

--데이터 딕셔너리
--데이터베이스 자원을 효율적으로 관리하기 위한 다양한 정보를 저장하는 시스템 테이블이다.

DESC USER_TABLES;
SELECT TABLE_NAME FROM USER_TABLES;

DESC ALL TABLES;

SELECT OWNER FROM ALL_TABLES;

--INSERT
CREATE TABLE DEPT02 AS SELECT * FROM DEPT WHERE 1=0;
SELECT * FROM DEPT02;

INSERT INTO DEPT02(DEPTNO, DNAME, LOC) VALUES (10, 'ACCOUNTING', 'NEW YORK')
COMMIT;
--INSERT 구문을 이용하여 컬럼명을 생략(DESC를 같이 써줘야 한다.)
INSERT INTO DEPT02 VALUES(20, 'RESEARCH', 'DALLAS');
DESC DEPT02

DROP TABLE DEPT03;
CREATE TABLE DEPT03 AS SELECT * FROM DEPT WHERE 1=0;
SELECT * FROM DEPT03;
INSERT INTO DEPT03 SELECT * FROM DEPT;

--UPDATE
--테이블에 저장된 데이터를 수정하기 위해서 사용하는 명령문이다.
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;
SELECT * FROM EMP01;
--모든 사원의 부서번호를 30번으로 수정 후 확인
UPDATE EMP01 SET DEPTNO=30;
COMMIT;
--사원의 급여를 10% 인상시키는 문.
UPDATE EMP01 SET SAL=SAL*1.1;
--모든 입사일을 오늘로 수정하는 쿼리문,
UPDATE EMP01 SET HIREDATE=SYSDATE;

DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP WHERE 1=0;
SELECT * FROM EMP01;


--부서번호가 10번인 사원의 부서번호르르 40번으로 수정하고 확인
UPDATE EMP01 SET DEPTNO = 40 WHERE DEPTNO = 10;
--JOB컬럼값이 MANAGER인 경우, 급여를 10% 인상하는 쿼리문
UPDATE EMP01 SET SAL = SAL*1.1 WHERE JOB = 'MANAGER' 

--EMP테이블에서 JOB별로 급여의 평균을 출력하고자한다. 'SALESMAN'이라는 JOB보다 급여의 평균이 큰 JOB만 출력
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB HAVING AVG(SAL) > (SELECT AVG(SAL) FROM EMP WHERE JOB='SALESMAN');
SELECT JOB, AVG(SAL) FROM EMP GROUP BY JOB HAVING AVG(SAL) > (SELECT AVG(SAL) FROM EMP WHERE JOB ='SALESMAN');

select max(sal), min(sal) from emp group by deptno having max(sal)>=2900;

>=(select deptno from emp where max(sal)>=2900);
select deptno from emp where max(sal) >=2900;
select * from tab;

select * from emp;

insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent)
values (mvc_board_seq.nextval, 'na', 'is na', 'is what', 0, mvc_board_seq.currval, 0,0);

commit;
insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent)
values (mvc_board_seq.nextval, '김', '김1', '왜안돼', 0, mvc_board_seq.currval, 0,0);
insert into mvc_board (bId, bName, bTitle, bContent, bHit, bGroup, bStep, bIndent)
values (mvc_board_seq.nextval, 'na', 'is na', 'is what', 0, mvc_board_seq.currval, 0,0);
commit;

delete from mvc_board where bId = 62;
update mvc_board set bName = 'mal', bTitle = 'moal', bContent = 'iswgat' where bId = 41;
update mvc_board set bName='maldd', bTitle='moal', bContent='iswgat', where bId=41;
commit;