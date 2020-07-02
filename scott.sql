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
--Ŀ�̼��� 300Ȥ�� 500Ȥ�� 1400�� �ƴ� ����� �ִ��� �˻��ϴ� ������
select * from emp where COMM not in (300, 500, 1400);

--LIKE�����ڿ� ���ϵ� ī��
--�̸��� F�� �����ϴ� ����� ã�� ����
select * from emp where ename like'F%';
--��ġ ������� �̸� �߿� A�� ����ִ� ����� ã�� ������
select * from emp where ename LIKE '%A%';
--�̸��� N���� ������ ����� ã�� ������
select * from emp where ename like '%N';
--�̸��� �� ��° ���ڰ� A�� ����� ã�� ������
select * from emp where ename like '_A%';
--�̸��� �� ��° ���ڰ� A�� ����� ã�� ������
select * from emp where ename like'__A%';
--�̸��� A�� �������� �ʴ� ����� ������
select * from emp where ename not like '%A%';

--NULL�� ���� ������
--Ŀ�̼��� ���� ���ϴ� ����� �˻��ϴ� ����
select ename, job, comm from emp where comm=null; --�߸��� null
--(NULL�� �ǹ�: ��Ȯ��, �� �� ���� ���� �ǹ��Ѵ�. ��� ����, �Ҵ�, �񱳰� �Ұ����ϴ�.)
select ename, job, comm from emp where comm is null;--�´� null

--������ ���� ORDER BY��
--������� �޿��� ������������ �����ϴ� ������
select * from emp order by sal desc;--asc�� ��������
--���� �ֱٿ� �Ի��� ������� ����ϴ� ������
select * from emp order by hiredate desc;


--DISTINCT(�ߺ�����)
--������� �ҼӵǾ� �ִ� �μ��� ��ȣ�� ����ϴ� ������
select distinct deptno from emp;

--dual�� �׽�Ʈ�� ���̺�.  �� ������ ����� ����ϱ� ���� ���̺��̴�. ��������� ����� �� �ٷ� ��� ���ؼ� ����Ŭ���� �����ϴ� ���̺��̴�.
select 24*60 from DUAL;
select sysdate from DUAL;


--*�����Լ�*
--  -10�� ���� ���밪�� ���ϴ� ������
select ABS(-10) from DUAL;
-- �Ҽ��� �Ʒ��� ������ �Լ�.
select 34.5432, floor(34.5432) from dual;
-- �ݿø� �Լ�
select 34.5432, round(34.5432) from dual;
-- Ư�� �ڸ������� �ݿø��ϴ� ������
select 34.5678, round(34.5678,2) from dual;
-- Ư�� �ڸ������� �߶󳻴� �Լ�
select trunc(34.4567,2), trunc(34.5678,-1), trunc(34.5678), trunc(34.5678,0) from dual;

-- ������ ������ �� �� �������� ����� �����ִ� �Լ�
select mod(27,2), mod(27,5), mod(27,7) from dual;

-- �빮�ڷ� ��ȯ�ϴ� �Լ�
select 'Welcome to Oracle' "������", upper('welcome to oracle') as "upper������" from dual; --as��������
-- �ҹ��ڷ� ��ȯ�ϴ� �Լ�
select 'Welcome to Oracle' "������", lower('welcome to oracle') as "lower������" from dual; --as��������

select lengthb('oracle'), lengthb('����Ŭ') from dual;
--�ѱ� ���ڴ� �����ϳ��� 3����Ʈ�� �����Ͽ� 9�� ������, ����� ascii�ڵ�� ��ȯ�Ǿ� �ڵ��Ѱ��� ���ش�.


--Ư�� ������ ��ġ�� ���ϴ� �Լ�.
--'welcome to oracle'���� 'o'�� ����� ��ġ ���� ���ϴ� ������
select instr('welcome to oracle','o')from dual;

--�ε��� 4���� �����ؼ� ���� 3���� �����ϴ� ������(����Ŭ���� �ε����� 0�� �ƴ� 1���� �����Ѵ�.)
select substr('welcome to oracle',4,3)from dual;
--������� �Ի��Ͽ��� �Ի� �⵵�� ���� ����ϴ� ������
select ename, 19||substr(hiredate, 1, 2) as�⵵, substr(hiredate, 4, 2) as �� from emp;

--LPAD/RPAD
select LPAD('ORACLE', 20, '#') from dual;

select RPAD('ORACLE',20, '#')from dual;

--LTRIM/RTRIM
--���鹮�ڸ� �����ϴ� �Լ�

select LTRIM(' oracle') from dual;
select RTRIM('oracle ') from dual;
select TRIM(' ORACLE ') from dual;

select TRIM('a' from 'aaaaORACLEaaaaa') from dual;


--10�� �μ��� ���� ���, �ִ밪, �ּҰ��� ���Ͻÿ�
select avg(sal),max(sal), min(sal) from emp where deptno=10;


-- A�� �����ϴ� ��� �̸��� �޿� ����Ͻÿ�
select ename, sal from emp where ename like 'A%'
