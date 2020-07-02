drop table dept01;
create table dept01 as select* from dept;

select*from dept01;

--생성한 dept01 부서 테이블의 모든 데이터를 삭제
delete from dept01;
--30번 부서를 삭제한 후 부서 테이블을 확인하는 쿼리문
delete from dept01 where deptno=30;

drop table emp01;
create table emp01 as select * from emp;
select * from emp01;
--부서명이 sales인 부서의 번호부터 알아낸 뒤 sales부서 소속의 사원을 삭제하는 쿼리문
delete from emp01 where job='salesman';
delete from emp01 where deptno = (select deptno from dept where dname='SALES');

--트랜젝션
drop table dept02;
create table dept02 as select * from dept;
select * from dept02;

truncate table dept02;

rollback;

delete from dept02 where deptno=40;
select * from dept02;
rollback;--롤백의 대상이 되는 것

--현재 접속되어 있는 사용자의 계정을 확인하려면
show user;

--emp테이블에 같은 이름이 있는 사원의 사원번호와 이름을 출력하시오.
insert into emp01 (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7777,'SMITH','ANALYST',0,SYSDATE,0,0,10);
COMMIT;

select e.empno, e.ename,d.empno, d.ename
from emp01 e, emp01 d
where e.ename=d.ename and e.empno != d.empno;

--이름에 A가 들어가는 사원과 같은 직업을 가진 사원의 이름과 월급, 부서번호를 출력하시오.
select ename, sal, deptno
from emp
where job in(select job from emp where ename like '%A%');

--DALLAS에서 근무하는 사원과 직업이 일치하는 사원의 이름, 부서이름, 및 급여를 출력하시오.
select e.ename, d.dname, e.sal--틀린거
from emp e, dept d
where e.deptno = d.deptno and job in( select job from emp where loc='DALLAS');

--10번 및 30번 부서에 속하는 모든 사원의 이름과 부서번호를 출력하되, 이름을 알파벳순으로 정렬하여 출력.
select ename, deptno
from emp
where deptno=10 or deptno=30
order by ename asc;
--10번 및 30번 부서에 속하는 모든 사원중 급여가 1500을 넘는 사원의 이름 및 급여를 출력하라.(단 컬럼명을 각각 employee 및 monthly salary로 지정)
select ename as employee, sal as monthlysalary, deptno
from emp
where sal>1500 and deptno in(select deptno from emp where deptno=10 or deptno=30);
--DALLAS 에서 근무하는 사원과 직업이 일치하는 사원의 이름, 부서이름, 및 급여를 출력
select e.ename, d.dname, e.sal--이게 정답
from emp e, dept d
where e.deptno = d.deptno 
and job in(select e.job from emp e, dept d where e.deptno = d.deptno and d.loc ='DALLAS');

select * from mvc_board order by bId desc;

