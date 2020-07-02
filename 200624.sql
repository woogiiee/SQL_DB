
--그룹함수
-- 커미션(comm) 총액을 구하는 쿼리문
select sum(comm) from emp;
-- 가장 높은 급여와 가장 낮은 급여를 구하는 쿼리문
SELECT MAX(SAL), MIN(SAL) FROM EMP;
-- 사원 테이블의 사원들 중에서 커미션(COMM)을 받은 사원의 수를 구하는 쿼리문
SELECT COUNT(COMM) FROM EMP;
-- 중복 제거를 반영하여 담당업무의 개수를 구하는 쿼리문
SELECT COUNT(DISTINCT JOB) FROM EMP;


--GROUP BY 절, HAVING 절
--*특정 컬럼*을 기준으로 그룹화
--사원 테이블을 부서 번호출력
SELECT DISTINCT DEPTNO FROM EMP;
SELECT DEPTNO FROM EMP GROUP BY DEPTNO;

--소속 부서별 평균 급여를 구하는 쿼리문
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;
--소속 부서별 급여 총액과 평균 급여를 구하는 쿼리문
SELECT DEPTNO  AS 부서번호, SUM(SAL) AS 총액, AVG(SAL) AS 평균 FROM EMP GROUP BY DEPTNO;
--소속 부서별 최대급여와 최소급여를 구하는 쿼리문
SELECT DEPTNO AS 부서번호, MAX(SAL) AS 최대급여, MIN(SAL)AS 최소급여 FROM EMP GROUP BY DEPTNO;
--부서별 사원의 수와 커미션을 받는 사원의 수를 계산하는 쿼리문
SELECT DEPTNO, COUNT(*), COUNT(COMM) FROM EMP GROUP BY DEPTNO;
--부서별 평균급여가 2000이상인 부서의 번호와 부서별 평균급여를 출력
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL)>=2000;
--부서의 SALARY 최대값과 최소값을 구하되, 최대급여가 2900 이상인 부서만 출력하는 쿼리문
SELECT DEPTNO, MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO HAVING MAX(SAL)>=2900;
--10번 부서의 총급여
SELECT SUM(SAL) FROM EMP WHERE DEPTNO=10;

--이름이 SMITH인 사람의 부서명을 출력해 보는 쿼리문
SELECT *FROM EMP, DEPT WHERE EMP.DEPTNO= DEPT.DEPTNO; 



--10번 부서의 월급 평균, 최대값, 최소값을 구하시오.
SELECT AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP WHERE DEPTNO=10;
SELECT AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP WHERE DEPTNO=10;
--부서별 월급 평균, 최대값, 최소값을 구하시오.
SELECT DEPTNO,AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO;
--10번 부서에 속한 사람들의 직책별 월급 평균을 구하시오.(모르겠따)
SELECT JOB, AVG(SAL) FROM EMP WHERE DEPTNO=10 GROUP BY JOB; 
--부서별 월급 평균, 최대값, 최소값을 구하되 월급평균이 3000이상인 부서에 대하여 구하시오
SELECT DEPTNO, AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL)>=3000;
--직책별 월급평균, 최대값, 최소값을 구하되 월급의 최대값이 4000보다 큰 직책에 대하여 구하시오
SELECT JOB, AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP GROUP BY JOB HAVING MAX(SAL)>=4000;
--10번 부서에 속한 사람들의 직책별 월급평균을 구하되 월급평균이 3500이하인 직책에 대하여 구하시오.
SELECT JOB, AVG(SAL) FROM EMP WHERE DEPTNO=10 GROUP BY JOB HAVING AVG(SAL)<=3500;
--이름에 ER이 들어있는 사람들의 직책별 월급평균, 최대값, 최소값을 구하시오.
SELECT JOB, AVG(SAL), MAX(SAL), MIN(SAL) FROM EMP WHERE ENAME LIKE '%ER%' GROUP BY JOB;