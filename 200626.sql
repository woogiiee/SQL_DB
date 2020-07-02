create table mvc_board(
bId number(4) primary key,
bName VARCHAR2(20),
bTitle VARCHAR2(100),
bContent VARCHAR2(300),
bDate DATE DEFAULT SYSDATE,
bHit NUMBER(4) DEFAULT 0,
bGroup NUMBER(4),
bStep NUMBER(4),
bIndent NUMBER(4)
);
commit;

create sequence mvc_board_seq;
commit;

insert into mvc_board(bid, bname, btitle, bcontent, bhit, bgroup,
bstep, bindent) values (mvc_board_seq.nextval, 'abcd', 'is title',
'is content',0, mvc_board_seq.currval, 0, 0);
select * from mvc_board;
commit;

--서브쿼리(SELECT문에서 ()안에 문장이 하나 더 들어가는)
--Allen 이 속한 부서이름
--단일행 서브 쿼리(서브 쿼리를 수행한 결과가 1건)
SELECT DNAME FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME ='ALLEN');
--사원들의 평균 급여보다 더 많은 급여를 받는 사원을 검색하는 쿼리문
SELECT ENAME, SAL FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);
--ALLEN의 급여와 동일하거나 급여를 더 많이 받는 사원과 급여를 출력하는 쿼리문
SELECT ENAME, SAL FROM EMP WHERE SAL >=(SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');


--다중연산자
--연봉을 3000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보를 출력하는 쿼리문(IN을 써서 다중)
SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >=3000;
SELECT ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO IN (SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >=3000);


--ANY, SOME
--부서 번호가 30번인 사원들의 급여중 가장 낮은 값(950)보다 높은 급여를 받는 사원의 이름, 급여를 출력하는 쿼리문
SELECT ENAME, SAL FROM EMP WHERE SAL <ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

--1. A로 시작하는 사원이름과 급여 출력하시오.
SELECT ENAME, SAL FROM EMP WHERE ENAME LIKE 'A%';
--2. EMP TABLE에서 급여가 가장 높은 사람의 사번, 성명, 부서명, 급여를 출력하시오.
SELECT E.EMPNO, E.ENAME, D.DNAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND sal =(select max(sal)from emp);
--3. 각 부서별로 급여 서열 2위까지 부서코드, 이름을 출력.
SELECT DEPTNO, ENAME
FROM EMP E
WHERE 2>(SELECT COUNT(*) FROM EMP WHERE SAL > E.SAL AND DEPTNO = E.DEPTNO) ORDER BY DEPTNO, SAL DESC;
--4. 부서별로 그룹하여 부서번호, 인원수, 급여의 평균, 급여의 합을 구하여 출력 하라
SELECT DEPTNO AS 부서번호, COUNT(*) AS 인원수, AVG(SAL) AS 급여의평균, SUM(SAL) AS 급여의합
FROM EMP
GROUP BY DEPTNO;
--5. 'SMITH'와 같은 부서에서 일하는 사원의 이름과 부서명 출력하시오.
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME='SMITH');
--6. 부서별 급여평균을 출력
SELECT D.DNAME, AVG(E.SAL) 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY DNAME;

--7. 부서별로 급여의 총합을 나타내고자 한다. 10번 부서보다 급여의 평균이 많은 부서만 출력하시오.
SELECT DNAME AS 부서명, SUM(SAL) AS 급여총액
FROM EMP E, DEPT D --FROM뒤에 테이블이 2개 이상 나오면 조인 꼭 해줘야 한다.
WHERE E.DEPTNO = D.DEPTNO --테이블이 두개면 조인 1개 세개면 조인 2개 조인을 안하면 EMP*DEPT의 칼럼수가 나온다(카티션 곱)CARTESIAN PRODUCT 
GROUP BY DNAME--부서별로 라고 했기 때문에 DNAME명으로 그룹지었다.
HAVING AVG(SAL)>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 10);--10번이 제일 높아서 (급여의 평균) 값은 안나옴.