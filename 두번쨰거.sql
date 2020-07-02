create table member(
 id varchar2(20) primary key,
 pw varchar2(20),
 name varchar2(20),
 phone varchar2(20));
commit;

insert into member (id, pw, name, phone) values('abc','123','ȫ�浿','010-1234-5678');
commit;
insert into member
 values('abcd','123','�����','010','011','018','woman');
SELECT  * from member;
desc member;
select * from emp;
desc emp;
commit;

--��¥ ����
--��¥-����
--��¥+����
select sysdate -1 from dual;
select sysdate +1 from dual;
select sysdate -1 as ����, sysdate as ����, sysdate +1 as ���� from dual;
--�� �������� �ٹ��� ���� ���� ���ϴ� ������
select ename, sysdate, hiredate,
trunc(months_between(sysdate, hiredate)) �ٹ������� from emp;
--�Ի糯¥���� 4������ �߰��� ������� ��Ÿ���� ������(add month)
select ename, hiredate, add_months(hiredate, 4) from emp;
--�ش� ���� ������ ��¥�� ��ȯ�ϴ� �Լ�
select ename, hiredate, last_day(sysdate) from emp;


--2)�� ��ȯ �Լ�(������, ������, ��¥��)
-- ���� ��¥�� ���������� ��ȯ�Ͽ� ����ϴ� ������
select to_char(sysdate,'YYYY-MM-DD') from dual;
-- ���� ��¥�� �ð��� ����ϴ� ������(sysdate���� �ð����� ���ԵǾ� �ִ�.)
select to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as �ð� from dual;
-- �� ������ ��ȭ ��ȣ�� �տ� ���̰� õ �������� �޸��� �ٿ��� ����ϴ� ������(��: 1,230,000)
select ename, sal, to_char(sal, 'L999,999') from emp;

--�ڸ����� �������� ��� 0�� 0���� ä��� 9�� ä���� �ʴ´�.
select to_char(123456, '000000000'), to_char(123456,'999,999,999')from dual;
--TO_DATE
select ename, hiredate from emp where hiredate=to_date(19810220, 'YYYYMMDD');

--���� ��ĥ�� �������� ���� ��¥���� 2016/01/01�� �� ����� ����ϴ� ������
select trunc(sysdate- to_date('2016/01/01','YYYY/MM/DD')) from dual;
--TO NUMBER
select to_number('20,000', '99,999') - to_number('10,000','99,999') from dual;

--NULL���� �ٸ� ������ ��ȯ�ϴ� NVL�Լ�
select ename, sal, comm, job from emp order by job;
--null�� Ŀ�̼��� nvl�Լ��� ���� 0���� �ٲ���
select ename, sal, nvl(comm,0), job from emp order by job;

--DECODE �Լ� ��ɾ�
select deptno, decode(deptno,10,'A',20,'B','DEFAULT') from emp order by deptno;

--CASE �Լ�
select ename, deptno,
case when deptno=10 then 'ACCOUNTING'
    when deptno=20 then 'RESEARCH'
    WHEN DEPTNO=30 THEN 'SALES'
    WHEN DEPTNO=40 THEN 'OPERATIONS'
END AS �μ��̸�
FROM EMP;

--�׷� �Լ�
--��� �޿��� ��ü ��
SELECT SUM(SAL) FROM EMP;
--Ŀ�̼�(COMM) �Ѿ��� ���ϴ� ������
SELECT SUM(COMM) FROM EMP;
--�޿� ����� ���ϴ� ������
SELECT AVG(COMM) FROM EMP;
--���� ���� �޿��� ���� ���� �޿��� ���ϴ� ������
SELECT MAX(SAL), MIN(SAL) FROM EMP;


select * from emp;
desc emp;
commit;



