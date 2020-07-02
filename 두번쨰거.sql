create table member(
 id varchar2(20) primary key,
 pw varchar2(20),
 name varchar2(20),
 phone varchar2(20));
commit;

insert into member (id, pw, name, phone) values('abc','123','홍길동','010-1234-5678');
commit;
insert into member
 values('abcd','123','김재욱','010','011','018','woman');
SELECT  * from member;
desc member;
select * from emp;
desc emp;
commit;

--날짜 연산
--날짜-숫자
--날짜+숫자
select sysdate -1 from dual;
select sysdate +1 from dual;
select sysdate -1 as 어제, sysdate as 오늘, sysdate +1 as 내일 from dual;
--각 직원들이 근무한 개월 수를 구하는 쿼리문
select ename, sysdate, hiredate,
trunc(months_between(sysdate, hiredate)) 근무개월수 from emp;
--입사날짜에서 4개월을 추가한 결과값을 나타내는 쿼리문(add month)
select ename, hiredate, add_months(hiredate, 4) from emp;
--해당 달의 마지막 날짜를 반환하는 함수
select ename, hiredate, last_day(sysdate) from emp;


--2)형 변환 함수(숫자형, 문자형, 날짜형)
-- 현재 날짜를 문자형으로 변환하여 출력하는 쿼리문
select to_char(sysdate,'YYYY-MM-DD') from dual;
-- 현재 날짜와 시간을 출력하는 쿼리문(sysdate에는 시간까지 포함되어 있다.)
select to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as 시간 from dual;
-- 각 지역별 통화 기호를 앞에 붙이고 천 단위마다 콤마를 붙여서 출력하는 쿼리문(예: 1,230,000)
select ename, sal, to_char(sal, 'L999,999') from emp;

--자릿수가 맞지않을 경우 0은 0으로 채우고 9는 채우지 않는다.
select to_char(123456, '000000000'), to_char(123456,'999,999,999')from dual;
--TO_DATE
select ename, hiredate from emp where hiredate=to_date(19810220, 'YYYYMMDD');

--올해 며칠이 지났는지 현재 날짜에서 2016/01/01을 뺀 결과를 출력하는 쿼리문
select trunc(sysdate- to_date('2016/01/01','YYYY/MM/DD')) from dual;
--TO NUMBER
select to_number('20,000', '99,999') - to_number('10,000','99,999') from dual;

--NULL값을 다른 값으로 변환하는 NVL함수
select ename, sal, comm, job from emp order by job;
--null인 커미션은 nvl함수를 통해 0으로 바꿔줌
select ename, sal, nvl(comm,0), job from emp order by job;

--DECODE 함수 명령어
select deptno, decode(deptno,10,'A',20,'B','DEFAULT') from emp order by deptno;

--CASE 함수
select ename, deptno,
case when deptno=10 then 'ACCOUNTING'
    when deptno=20 then 'RESEARCH'
    WHEN DEPTNO=30 THEN 'SALES'
    WHEN DEPTNO=40 THEN 'OPERATIONS'
END AS 부서이름
FROM EMP;

--그룹 함수
--사원 급여의 전체 합
SELECT SUM(SAL) FROM EMP;
--커미션(COMM) 총액을 구하는 쿼리문
SELECT SUM(COMM) FROM EMP;
--급여 평균을 구하는 쿼리문
SELECT AVG(COMM) FROM EMP;
--가장 높은 급여와 가장 낮은 급여를 구하는 쿼리문
SELECT MAX(SAL), MIN(SAL) FROM EMP;


select * from emp;
desc emp;
commit;



