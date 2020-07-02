--직업이 Clerk 또는 Analyst 이면서 급여가 1000,3000,5000 이 아닌 모든 사원의 이름, 직업 및 급여를 출력하라.
select ename, job, sal
from emp
where job = 'CLERK' or job = 'ANALYST'
and sal not in (1000, 3000, 5000);

--부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력하라.
--그리고 각각의 컬럼명을 부서명,위치,사원의 수,평균급여로 표시하라
select d.deptno 부서번호, d.dname 부서명, d.loc 위치, count(*) 사원의수, avg(sal) 평균급여
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno,dname, d.loc;

--Smith와 동일한 부서에 속한 모든 사원의 이름 및 입사일을 출력하라.
--단, Smith는 제외하고 출력하시오
select ename, hiredate
from emp
where deptno in(select deptno from emp where ename='SMITH')
and ename not in('SMITH');

--KING에게 보고하는 모든 사원의 이름과 급여를 출력하라.
select ename, sal
from emp
where mgr in(select empno from emp where ename= 'KING' );
