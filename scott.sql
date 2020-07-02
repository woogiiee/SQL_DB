select * from DEPT;

select ENAME,SAL,SAL+100 from emp;

select * from emp where deptno=20;
select * from emp where deptno <>20;

select empno, ename, sal from emp where ename='FORD';

select empno, ename, sal from emp where hiredate>='1982/01/01';

select * from emp where deptno=10 and job='MANAGER';

select * from emp where deptno=10 or job='MANAGER';

select * from emp where deptno<>10;

select * from emp where sal between 2000 and 3000;
select * from emp where sal not between 2000 and 3000;

select * from emp where hiredate between '1980/01/01' and '1980/12/31';
select* from emp where comm in(300,500,1400);
--커미션이 300혹은 500혹은 1400이 아닌 사원이 있는지 검색하는 쿼리문
select * from emp where COMM not in (300, 500, 1400);

--LIKE연산자와 와일드 카드
--이름이 F로 시작하는 사람을 찾는 뭐리
select * from emp where ename like'F%';
--위치 상관없이 이름 중에 A가 들어있는 사람을 찾는 쿼리문
select * from emp where ename LIKE '%A%';
--이름이 N으로 끝나는 사람을 찾는 쿼리문
select * from emp where ename like '%N';
--이름의 두 번째 글자가 A인 사원을 찾는 쿼리문
select * from emp where ename like '_A%';
--이름의 세 번째 글자가 A인 사원을 찾는 쿼리문
select * from emp where ename like'__A%';
--이름에 A를 포함하지 않는 사람의 쿼리문
select * from emp where ename not like '%A%';

--NULL을 위한 연산자
--커미션을 받지 못하는 사원을 검색하는 쿼리
select ename, job, comm from emp where comm=null; --잘못된 null
--(NULL의 의미: 미확정, 알 수 없는 값을 의미한다. 고로 연산, 할당, 비교가 불가능하다.)
select ename, job, comm from emp where comm is null;--맞는 null

--정렬을 위한 ORDER BY절
--사원들의 급여를 오름차순으로 정렬하는 쿼리문
select * from emp order by sal desc;--asc는 내림차순
--가장 최근에 입사한 사원부터 출력하는 쿼리문
select * from emp order by hiredate desc;


--DISTINCT(중복제거)
--사원들이 소속되어 있는 부서의 번호를 출력하는 쿼리문
select distinct deptno from emp;

--dual은 테스트용 테이블.  한 행으로 결과를 출력하기 위한 테이블이다. 산술연산의 결과를 한 줄로 얻기 위해서 오라클에서 제공하는 테이블이다.
select 24*60 from DUAL;
select sysdate from DUAL;


--*숫자함수*
--  -10에 대한 절대값을 구하는 쿼리문
select ABS(-10) from DUAL;
-- 소수점 아래를 버리는 함수.
select 34.5432, floor(34.5432) from dual;
-- 반올림 함수
select 34.5432, round(34.5432) from dual;
-- 특정 자릿수에서 반올림하는 쿼리문
select 34.5678, round(34.5678,2) from dual;
-- 특정 자릿수에서 잘라내는 함수
select trunc(34.4567,2), trunc(34.5678,-1), trunc(34.5678), trunc(34.5678,0) from dual;

-- 나누기 연산을 한 후 나머지를 결과로 돌려주는 함수
select mod(27,2), mod(27,5), mod(27,7) from dual;

-- 대문자로 변환하는 함수
select 'Welcome to Oracle' "적용전", upper('welcome to oracle') as "upper적용후" from dual; --as생략가능
-- 소문자로 변환하는 함수
select 'Welcome to Oracle' "적용전", lower('welcome to oracle') as "lower적용후" from dual; --as생략가능

select lengthb('oracle'), lengthb('오라클') from dual;
--한글 문자는 글자하나당 3바이트씩 차지하여 9가 나오고, 영어는 ascii코드로 변환되어 코드한개로 쳐준다.


--특정 문자의 위치를 구하는 함수.
--'welcome to oracle'에서 'o'가 저장된 위치 값을 구하는 퀴리문
select instr('welcome to oracle','o')from dual;

--인덱스 4부터 시작해서 문자 3개를 추출하는 쿼리문(오라클에서 인덱스는 0이 아닌 1부터 시작한다.)
select substr('welcome to oracle',4,3)from dual;
--사원들의 입사일에서 입사 년도와 달을 출력하는 퀴리뭔
select ename, 19||substr(hiredate, 1, 2) as년도, substr(hiredate, 4, 2) as 달 from emp;

--LPAD/RPAD
select LPAD('ORACLE', 20, '#') from dual;

select RPAD('ORACLE',20, '#')from dual;

--LTRIM/RTRIM
--공백문자를 삭제하는 함수

select LTRIM(' oracle') from dual;
select RTRIM('oracle ') from dual;
select TRIM(' ORACLE ') from dual;

select TRIM('a' from 'aaaaORACLEaaaaa') from dual;


--10번 부서의 월급 평균, 최대값, 최소값을 구하시오
select avg(sal),max(sal), min(sal) from emp where deptno=10;


-- A로 시작하는 사원 이름과 급여 출력하시오
select ename, sal from emp where ename like 'A%'
