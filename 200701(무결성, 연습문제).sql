--foreign key만드는 방법
DROP TABLE EMP06;

CREATE TABLE EMP06(EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL, 
JOB VARCHAR(9), 
DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO));

--시퀀스
CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 100000;
select emp_seq.currval from dual;

--rownum 페이징 할 때 -mysql(limit)과 오라클에 차이 있음.

select rownum rn, empno from emp ; --rownum = 행에 번호 붙이는거
select rownum, bid from mvc_board;


--*지금까지 연습문제*

--현재 날짜를 구하는 쿼리문
select sysdate from dual;
--34.5678을 반올림하는 쿼리문
select 34.5678,round(34.5678) from dual;
--특정 자릿수(수소점 3자리에서 반올림)에서 34.5678을 반올림하는 쿼리문
select 34.5678, round(34.5678,2) from dual;
--사원의 총 급여를 구하는 쿼리문
select sum(sal) from emp;
--사원의 커미션 총액
select sum(comm) from emp;
--급여 평균
select avg(sal)from emp;
--총 사원수
select count(*) from emp;
--중복제거를 반영하여 담당업무의 개수
select count(distinct job)업무수 from emp;
--부서별 평균 급여
select deptno, avg(sal)
from emp 
group by deptno;
--소속 부서별 평균 급여와 급여총액
select deptno, avg(sal), sum(sal)
from emp
group by deptno;
--소속 부서별 최대 급여, 최소급여
select deptno 부서번호, max(sal)최대급여, min(sal)최소급여
from emp
group by deptno;
--그룹지어진 부서별 평균 급여가 2000이상인 부서의 번호와 부서별 평균 급여를 출력
select deptno 부서번호, avg(sal)평균급여
from emp
group by deptno
having avg(sal)>=2000;
--부서의 최대값과 최소값을 구하되, 최대 급여가 2900이상인 부서만 출력하는 쿼리문
select deptno 부서번호, max(sal) 최대급여, min(sal) 최소급여
from emp
group by deptno
having max(sal)>=2900;
--부서테이블의 모든 데이터를 출력
select * from emp;


--족보
--이름에 A가 들어가는 사원과 같은 직업을 가진 사원의 이름과 월급, 부서번호를 출력
select ename, sal, deptno
from emp
where job in(select job from emp where ename like '%A%');
--NEW YORK 에서 근무하는 사원과 급여 및 커미션이 같은 사원의 사원이름과 부서명을 출력
select * from emp join dept
on emp.deptno = dept.deptno
and dept.loc = 'NEW YORK';

select e.ename, d.dname,e.comm,e.sal
    from emp e, dept d
    where e.deptno = d.deptno
    and e.sal in (
        select e.sal from emp e, dept d 
        where e.deptno = d.deptno and loc='NEW YORK')
    and nvl(comm,0) in(
        select nvl(comm,0) from emp e, dept d 
        where e.deptno = d.deptno and loc ='NEW YORK');

--Dallas에서 근무하는 사원과 직업 및 관리자가 같은 사원의 사원번호,사원이름,
--직업,월급,부서명,커미션을 출력하되 커미션이 책정되지 않은 사원은 NoCommission으로 표시하고,
--커미션의 컬럼명은 Comm으로 나오게 출력하시오. (단, 최고월급부터 출력되게 하시오)
select * from emp join dept
on emp.deptno = dept.deptno
and dept.loc ='DALLAS';

select e.empno, e.ename, e.job, e.sal, d.dname, 
nvl((to_char(comm)), 'NoCommision') as Comm
from emp e, dept d
where e.deptno = d.deptno
and e.job in(
select e.job from emp e, dept d
where e.deptno = d.deptno and d.loc = 'DALLAS')
and mgr in(
select e.mgr from emp e, dept d
where e.deptno = d.deptno and d.loc = 'DALLAS');

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DNAME,
NVL((TO_CHAR(E.COMM)),'NoCommision') as "comm"
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND JOB IN(SELECT JOB
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS')
AND MGR IN(SELECT MGR
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS')