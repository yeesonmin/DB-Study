use LSM
select * from zipcode

sp_help exam
sp_help exam_emp
sp_help zipcode
select * from neis
select * from zipcode

select max(len(zipcode))from zipcode

select max(len(sido))from zipcode
select max(len(gugun))from zipcode
select max(len(DONG))from zipcode
select max(len(bldg))from zipcode

select max(len(st_bunji))from zipcode
select max(len(ED_bunji))from zipcode
select max(len(seq))from zipcode

alter table zipcode
alter column zipcode char(10)

alter table zipcode
alter column sido nchar(2)
alter table zipcode
alter column gugun nchar(8)

alter table zipcode
alter column DONG nchar(15)
alter table zipcode
alter column bldg nvarchar(30)

alter table zipcode
alter column st_bunji char(15)
alter table zipcode
alter column ED_bunji char(15)
alter table zipcode
alter column seq int


alter table neis
alter column  nchar(5)
alter table neis
alter column �б��� nchar(25)
alter table neis
alter column �б����� nchar(25)
alter table neis
alter column �����ȣ int
alter table neis
alter column �ּ� nvarchar(40)
alter table neis
alter column ��ȭ��ȣ char(12)

select max(len(�ּ�))from neis
select max(len(��ȭ��ȣ))from neis

alter table exam_emp
alter column ���������� datetime

alter table exam
alter column �μ� nchar(8)
alter table exam
alter column ���� nchar(6)
alter table exam
alter column �з� nchar(8)
alter table exam
alter column ���� tinyint
alter table exam
alter column ���� tinyint
alter table exam
alter column �������� nchar(4)

alter table exam_emp
alter column ��ȭ��ȣ nchar(14)
alter table exam_emp
alter column ��󿬶�ó nchar(14)
alter table exam_emp
alter column �հݿ��� bit

alter table exam_emp
alter column  �����ȣ int

alter table exam_emp
alter column ���뱸�� nchar(5)

alter table exam_emp
alter column ���ڵ� char(10)



--�÷� �̸� �ٲٱ�
SELECT ���� AS �̸�, �μ�  AS '(��)' from exam 

--���� ����
DECLARE @id INT, @name CHAR(10)
SET @id = 0
SET @name = '�̼���'
SELECT @id, @name

--SELECT���� �ڷ��� �ٲٱ�
select * from neis
SELECT �ּ� FROM neis
SELECT �ּ�, CONVERT(CHAR(4),�ּ�) as '�����ּ�' FROM neis --�ڷ���� �� �� ��ȯ
SELECT �ּ�, SUBSTRING(�ּ�,1,2) as '�����ּ�' FROM neis -- �ڷ���� �� ��ȯ

--�����Լ�
SELECT FLOOR(29.9),FLOOR(29.1),FLOOR(29.25) --�Ҽ��� ����
SELECT CEILING(29.9),CEILING(29.1),CEILING(29.25) --�Ҽ��� �ø�
SELECT ROUND(29.1,0), ROUND(29.9,0), ROUND(29.953,1), round(29,-1) --�Ҽ��� �ڸ��� �ݿø�.
SELECT ABS(-123),ABS(123) --���밪
SELECT COS(RADIANS(60)), SIN(90),TAN(45) --sin,cos,tan
SELECT LOG10(10) --log
SELECT SQUARE(2), SQRT(4), PI() --����, ��Ʈ, ����

--�����Լ�
SELECT '��'+'��' + '��'
SELECT ASCII('��'),ASCII('A')
SELECT CHAR(65)
SELECT REPLACE('ȫ�浿','��','��') --���� ��ü
SELECT REPLICATE('�̼���',4) --�ܾ� �ݺ�
SELECT REVERSE('�̼���') --�ܾ� �ݴ��
SELECT LEFT('�̼���',1),RIGHT('�̼���',2)
SELECT SUBSTRING('�ѱ�ABCD����Ÿ',1,2) -- x���� y���� �ܾ����
SELECT SUBSTRING('�ѱ�ABCD����Ÿ',3,3)
SELECT DIFFERENCE('ABCD','SDF'), DIFFERENCE('�ѱ�','����') --�ܾ��� ����� ���� ã�� �Լ�(4�� ���� ����� �ܾ��� ��) �ε� �ѱۿ����� ���������̴�.
SELECT STUFF('�̼���',2,2,'�浿'),STUFF('�̼���',2,1,'�浿') --x���� y���� �ܾ ����� ���ο� �ܾ� �߰�

--��¥�Լ�
SELECT GETDATE()
SELECT CONVERT(NVARCHAR(30),GETDATE(),2) --convertert�Լ��� ����x�� �ش��ϴ� ������ ��Ÿ��.
SELECT CONVERT(NVARCHAR(30),GETDATE(),8)
SELECT DATEPART(mm,GETDATE()), DATEPART(dd,GETDATE()), DATEPART(yy,GETDATE())
SELECT DATENAME(DW,GETDATE()), DATENAME(MM,GETDATE()), DATENAME(dd,getdate())



--NULL
SELECT ���� FROM exam
WHERE �μ� IS NOT NULL

SELECT ���� FROM exam
WHERE �μ� is not NULL

--����
select ���� from exam
order by ����
select ���� from exam
order by ���� desc
 
 --top
 select top 15 ����, ���� from exam
 order by ���� desc
 
 select top 15 with ties ����, ���� from exam
 order by ���� desc

 --in
 select ���� ,���� from exam
 where ���� in (99,80,55)

 
 select ���� ,���� from exam
 where ����  = 99 or ����  = 80 or ����  = 55

--%,_,[],[^]
begin tran
update exam
set ���� = RTRIM(����)
rollback
sp_help exam_emp

select * from exam
--��浿
select ���� from exam
where ���� like '__��' --exam Ÿ�Կ� ��������� null���� ����

select ���� from exam
where RTRIM(����) like '__��'

select ���� from exam
where RTRIM(����) like '��_'

select ���� from exam
where RTRIM(����) like '��__'

select ���� from exam
where ���� like '��%'

select ���� from exam
where ���� like '%��'


select ���� from exam
where ���� like '%��%'

select PATINDEX('%Mi%','James Mike')

select PATINDEX('M[^C]%','McAthur')

select PATINDEX('M[^C]%','Mike')

select PATINDEX('M[^C]%','M')

--distinct(�ߺ��� ����)
select distinct ���� from exam
order by ���� desc


--select ����
select �μ� from exam_emp
group by �μ�

select b.�μ�, count(*) from exam a join exam_emp b
on a.���� = b.����
where a.���� >=60
group by b.�μ�



--rollup -------------�տ� �׷��� �����Ͽ� ��� ��.

select *from exam_emp
select b.�μ�,b.��������,avg(a.����) from exam a join exam_emp b
on a.���� = b.����
group by b.�μ�,b.��������

select b.�μ�,b.��������,avg(isnull(a.����, 0)) from exam a join exam_emp b
on a.���� = b.����
group by b.�μ�,b.��������

select b.�μ�,b.��������,avg(a.����) from exam a join exam_emp b
on a.���� = b.����
group by b.�μ�,b.��������
with rollup------------- �μ� �������� ���� ����� ���� ���ϰ�, ��ü ���� ��յ� ����.

select b.�μ�,b.��������,avg(a.����) from exam a join exam_emp b
on a.���� = b.����
group by b.��������,b.�μ�
with rollup------------- �������� �������� ���� ����� ���� ���ϰ�, ��ü ���� ��յ� ����.


--cube   ---------------- �׷��� ��� ���� ���� �Ͽ� ����� ǥ��
select b.�μ�,b.��������,avg(a.����) from exam a join exam_emp b
on a.���� = b.����
group by b.��������,b.�μ�
with cube -------------------------------- �������� �������� ���� ����� ���ϰ� �� ���� ǥ��, ���� rollup�� �޸� �μ��������� ���� ����� ���� �������.

select b.�μ�,b.��������,avg(a.����) from exam a join exam_emp b
on a.���� = b.����
group by b.�μ�,b.��������
with cube


--cross join  -------------���̺��� ��� ���� ���� ������.
--select * from exam join exam_emp 

select * from exam cross join exam_emp 


--��������
select ���� from exam
where ���� >= 90 and ���� in (select ���� from exam_emp)


--�����������
select * from exam_emp
select ����, ���� from exam
where  ���� in (select ���� from exam_emp where exam.���� = exam_emp.����)
select ����, ���� from exam
where  ���� in (select ���� from exam_emp)

--in
--exam�� ���� 2���� 1���� �־ 211��
select ���� from exam
where ���� in (select ���� from exam_emp)
order by ����

select  a.���� from exam  a join exam_emp b
on a.���� = b.����
order by a.����

--
use LSM
select a.����, b.�μ� from exam a right join exam_emp b
on a.���� = b.����

--distinct�� �ߺ��� ���� �����ؼ� 210��
select distinct a.���� from exam  a join exam_emp b
on a.���� = b.����
order by a.����

select ���� from exam
order by ����

select ����, count(����) from exam
where ���� in (select ���� from exam_emp)
group by ����


select  a.����,count(a.����)  from exam  a join exam_emp b
on a.���� = b.����
group by a.����

select ����,count(����) from exam
group by ����
having count(����) >=2

--union  ---------------------------2���� select ���� ������.

select ���� from exam
select ���� from exam_emp
--263
select ����, count(*) from exam
group by ����


--798
select ����, count(*) from exam_emp
group by ����


--881--------------------------------------------------> count(*)�� �����͸� �ٸ��ٰ� �ν��Ͽ� �ߺ����� ������ 30���� �� �߰� �� ��.
select ����, count(*) from exam
group by ����
union
select ����, count(*) from exam_emp
group by ����

--851 
select ���� from exam
group by ����
union
select ���� from exam_emp
group by ����

--1
select ����, count(*) from exam
group by ����
having COUNT(*) >= 2
--87
select ����, count(*) from exam_emp
group by ����
having COUNT(*) >= 2

--87
select ����, count(*) from exam
group by ����
having COUNT(*) >= 2
union
select ����, count(*) from exam_emp
group by ����
having COUNT(*) >= 2

--210
select ����,COUNT(*) from exam
where ���� in(select ���� from exam_emp)
group by ����


--53
select ���� from exam
where ���� not in(select ���� from exam_emp)
group by ����

--588
select ���� from exam_emp
where ���� not in(select ���� from exam)
group by ����


--���̺� �����
create table SONMIN
(
	id int not null, name nchar(4)
)

--�÷� �߰�
alter table SONMIN
add adr nvarchar(30) not null
--�÷� ����
alter table SONMIN
alter column name nchar(4) not null

--�÷� ����
alter table SONMIN
drop column adr
--���̺� ����
drop table SONMIN

--�⺻Ű �߰�
--���̺� ���鋚
create table SONMIN
(
	id int primary key, name nchar(4)
)
--���̺� ���� ��
alter table SONMIN
alter column id int not null
alter table SONMIN
ADD constraint PK_ID primary key (id)




--���̺� �� �߰�
BEGIN TRAN
INSERT SONMIN VALUES (123, 'ȫ�浿', '����')
ROLLBACK
SELECT * FROM SONMIN

-- ���̺� ���� �鼭 �⺻ �� �ڵ� �߰�(DEFAULT) �� ������ �ڵ� �߰�(IDENTITY)
CREATE TABLE SONMIN2
(
ID INT IDENTITY(1,1) PRIMARY KEY , NAME NCHAR(4) NOT NULL, ADR NVARCHAR(30) DEFAULT '����'
)


SELECT * FROM SONMIN2
INSERT SONMIN2 (NAME)VALUES ('ȫ�浿')
INSERT SONMIN2 VALUES ('ȫ�浿',DEFAULT)

--���̺� ����(alter)�ؼ� �⺻�� �ڵ� �߰� �� ������ �ڵ� �߰� ---------> �ȵȴ�.



--timestamp   --------------- SQL������ �ڵ����� �����͸� �Է���.
create table times
(
id int identity primary key,timestamp
)


insert times (qty) values(1)
insert times (qty) values(2)

select * from times

--IDENTITY, NULL,TIMESTAMP, DEFAULT�� �̷���� ���̺��� INSERT ���̺�� DEFAULT VALUES�� �� �߰� ����.


INSERT SONMIN2 (NAME) VALUES ('�̼���')
INSERT SONMIN2 (NAME) VALUES ('��浿')

SELECT * FROM SONMIN2


--INSERT SELECT�� 
SELECT * INTO SONMIN3 FROM SONMIN2  -------------into��  ������� ���ο� ���̺��� ����� ����
SELECT * FROM SONMIN3
SELECT * INTO SONMIN2 FROM SONMIN3 --�����߻�(�̹� ���̺� ����)���� INSEERT SELECT�� ���
INSERT SONMIN2 SELECT NAME,ADR FROM SONMIN3 --------------------insert select ���� �÷����� �°� �ؾ� �Ѵ�.

--DELETE
SELECT * FROM SONMIN3

BEGIN TRAN
DELETE SONMIN3
WHERE ID >1
COMMIT

SELECT * FROM exam
SELECT * FROM exam_emp
SELECT ���� FROM exam WHERE ���� NOT IN  (SELECT ���� FROM exam_emp)

BEGIN TRAN
DELETE EXAM
WHERE ���� NOT IN (SELECT ���� FROM exam_emp)
ROLLBACK
COMMIT

BEGIN TRAN
DELETE exam
WHERE ���� IN (SELECT ���� FROM exam GROUP BY ���� HAVING COUNT(����) >1)
COMMIT
SELECT * FROM exam_emp


--TRUNCATE TABLE ���̺� �ִ� ��� ������ ���� ����
BEGIN TRAN
TRUNCATE TABLE SONMIN2
SELECT * FROM SONMIN2
COMMIT

--UPDATE 


SELECT * FROM exam
SELECT A.�μ�,A.���� FROM exam_emp A JOIN exam B
ON A.���� = B.����
GROUP BY A.����

BEGIN TRAN
UPDATE EXAM
SET �μ� = (SELECT �μ� FROM exam_emp WHERE EXAM.���� =  exam_emp.����)
SELECT * FROM exam
SELECT * FROM exam_emp
UPDATE EXAM
SET �з� = (SELECT �з� FROM exam_emp WHERE EXAM.���� =  exam_emp.����)
UPDATE EXAM
SET �������� = (SELECT �������� FROM exam_emp WHERE EXAM.���� =  exam_emp.����)
COMMIT

SP_HELP EXAM_EMP
SELECT * FROM exam_emp
BEGIN TRAN
UPDATE exam_emp
SET �հݿ��� = 0
WHERE ���� NOT IN (SELECT ���� FROM EXAM WHERE ���� >=60 AND ���� >=60)
ROLLBACK
COMMIT

SELECT ���� FROM EXAM WHERE ���� >=60 AND ���� >=60 ORDER BY ����
SELECT ���� FROM exam_emp WHERE ���� IN (SELECT ���� FROM EXAM WHERE ���� >=60 AND ���� >=60) ORDER BY ����
SELECT ���� FROM exam_emp ORDER BY ����
SELECT ���� FROM EXAM WHERE ���� >=60 AND ���� >=60 ORDER BY ����

SELECT ���� FROM EXAM WHERE ���� IN (SELECT ���� FROM exam_emp) ORDER BY ����
SELECT ���� FROM exam_emp WHERE ���� IN (SELECT ���� FROM exam) ORDER BY ����


--NULL
SELECT 'A' + 'B'
SELECT 1 + 2
SELECT '1' + 2
SELECT 'A' + NULL + 'B'


--�⺻Ű �����
create table test1
(
id int constraint PK_ID primary key nonclustered
)

insert test1 values (1)
insert test1 values (1)
insert test1 values (null)

update test1
set id = 2
where id =1


--�⺻Ű 2�� �����
create table test2
(
id int not null, name nchar(4) not null,
constraint PK_IdName primary key (id,name)
)

insert test2 values (1,'ȫ�浿')
insert test2 values (1,'ȫ�浿')
select * from test2

--��������(unique)
create table test3
(
id int constraint U_id unique
)

insert test3 values(1)
insert test3 values(1)
insert test3 values(null)
select * from test3

--identity �߰�����_---> å������ �߰� ���� �����ϰ� insert�ϸ� �߰����� ä���� �ʰ� �����Ѵٰ� �ߴµ� ���� �� �� ����.

use LSM
create table test4
(
id int identity(1,5)
)

alter table test4 
add name nchar(4)
insert test4 (name) values('�̼���')
select * from test4
insert test4 (name) values('��3')

delete test4
where id = 6
insert test4 (name) values('��4')
insert test4 (name) values('��5')


--������ ��� DEFAULT
create table test5
(
id int, city nchar(10) null
)

create default DFcity
as '����'


sp_bindefault DFcity, 'test5.city'

insert test5 (id) values(2)
select * from test5

--����� ���� �ڷ���
sp_addtype Tcity, 'nchar(10)'
sp_bindefault DFcity, 'Tcity'
create table test6
(
id int, city Tcity null
)
insert test6 (id) values(1)
select * from test6

--������ ����Ʈ �����, Ǯ��
sp_unbindefault 'test5.city'
drop default DFcity --Tcity�� ������̶� ���� ����.

sp_unbindefault Tcity
drop default DFcity 
insert test6 (id) values(2)
select * from test6


drop table test6


--check
create table tst1
(
city nchar(10) check (city in ('����','����','�뱸','�λ�','��õ'))
)

insert tst1 values ('����')
select * from tst1

insert tst1 values ('��õ') --check ������ �����߻�
update tst1
set city = '��õ'--check ������ �����߻�

--rule(������ ���)
create rule rcity
as @city in ('����', '����','�뱸','�λ�','��õ')
create table tst2
(city nchar(10)
)
sp_bindrule rcity, 'tst2.city'

insert tst2 values ('����')
select * from tst2
insert tst2 values ('��õ') -- rule ������ ���� �߻�

sp_unbindrule 'tst2.city' --rule ����
drop rule rcity


--����Ű

select * from exam
select * from exam_emp
select * from neis

alter table exam
add �����ȣ int

begin tran
update exam
set �����ȣ = (select �����ȣ from exam_emp where ���� = exam.����)
commit

alter table exam
add constraint FK_exam_emp_�����ȣ foreign key(�����ȣ)
references exam_emp (�����ȣ)
on update cascade
on delete cascade

sp_help exam_emp
alter table exam_emp
alter column �����ȣ int not null

alter table exam_emp
add constraint PK_�����ȣ primary key(�����ȣ)

sp_help neis
sp_help exam_emp
alter table neis
alter column �б��ڵ� char(10) not null
alter table neis
add constraint PK_�б��ڵ� primary key (�б��ڵ�)

alter table exam_emp
add constraint FK_�б��ڵ� foreign key (���ڵ�)
references neis(�б��ڵ�)
on update cascade
on delete cascade



select * from neis
select * from exam_emp

select ���ڵ� from exam_emp
where ���ڵ� not in (select �б��ڵ� from neis)


select * from exam_emp
where ���ڵ� = 'S100003175' or ���ڵ� = 'ZZZZZZZZ'

select * from exam
where ���� = '������' or ���� = '��ȸ��' --��ȸ�� ����

begin tran
delete exam_emp
where ���� = '��ȸ��'
commit

insert neis (�б��ڵ�) values ('S100003175')--neis�� �߰�

alter table exam_emp
add constraint FK_�б��ڵ� foreign key (���ڵ�)
references neis(�б��ڵ�)
on update cascade
on delete cascade
		

--select/print
declare @tst int, @tst2 char(20)
--set @tst2 = '1'
select @tst2 = 'a'
print @tst2 --�������� ��� ����
select @tst = 10 --setó�� ���� �ʱ�ȭ ����
select @tst

select @tst2

--raiserror �����޽��� ���
raiserror('�����߻�',10,1) --�α׿� ��� ����.
raiserror('�����߻�',10,1) with log --�α׿� ���.
raiserror('�Է��� ���ڴ� %d �Դϴ�.',10,1,45)

--sp_addmessage �����޼��� �߰�(������ȣ�� 50000�̻�)
sp_addmessage 51105,16,'log is almost full', us_english,'true',replace -- ���� ���� ���� �߰��ؾ���.
exec sp_addmessage 51105, 16, '�αװ� ���� �� á��', default,'true',replace --�׻� �α׿� ���
sp_dropmessage 51105 --�޼��� ����

--if
declare @a int, @b int
set @a = 1
set @b = 2
if @a > @b 
begin select 'a�� ũ��.'
end
else
begin select 'b�� ũ��.'
end

--while
declare @i int, @sum int
set @i = 0
set @sum = 0
while @i <= 10
begin
set @sum = @sum + @i
set @i = @i + 1
end
select @sum


--case
select * from exam_emp

select ����, case when �հݿ��� = 0 then '���հ�' else '�հ�' end as '�հݿ���', �μ� --case when �հݿ��� = 0 then '���հ�' else '�հ�' end as '�հݿ���' case��
from exam_emp

select ����, case when �հݿ��� = 0 then '���հ�' else '�հ�' end as '�հݿ���', �μ� --case when �հݿ��� = 0 then '���հ�' else '�հ�' end as '�հݿ���' case��
from exam_emp
where �հݿ��� = 1

select ����, ����, ���� from exam
where ���� >= 60 and ���� >=60


select ����, ����, ����, case when ����>=60 and ���� >=60 then '�հ�' else '���հ�' end as '�հݿ���' 
from exam order by �հݿ��� desc, ����

select �����ȣ, ���� ,����, case when ���� >= 90 then 'A' when ���� >= 80 then 'B' else 'C' end as '������'
from exam order by ���� desc

--set rowcount n ---------------->select top�� ����ϳ� insert/update/delete������ ��� ����
set rowcount 5
select * from exam

set rowcount 0 --����
select * from exam


--nullif
select nullif(2,3) --���� ������ 2�� ��ȯ
select nullif(3,3) --���̸� NULL�� ��ȯ


--coalesce  : null�� �ƴ� ù ��° ���� ��ȯ
select coalesce(null,1,2)
select coalesce(null,2,1)
select coalesce(1,null,2)
select coalesce(2,null,1)
select coalesce(2,1,1)
select coalesce(3,2,1)
select coalesce(null,null,null)

------------------------------------------------------���� ------------------------------------------------------------------
use LSM
select * from exam_emp
select * from neis
--create index exam_pk on exam (���� asc, �μ� desc) --> ��Ŭ������ ������ �⺻��
drop index exam.exam_pk
sp_help exam

create unique clustered index exam_pk2
on exam (���� asc, �μ� desc)  ----------> Ŭ�����ͷ� ����

select * from exam
SET STATISTICS TIME ON --> ���� �ӵ� ���� ����
SET STATISTICS IO ON --> i/o �߻� Ȯ��

select * from exam
where ���� >= 50 and ���� >=50

create index exam_pk on exam(���� asc, ���� desc, ���� desc)
drop index exam.exam_pk
sp_help neis
select * from neis
select * from neis
where �õ�����û = '��⵵'
order by �б��ڵ�

select * from exam_emp
--���� ����� ����
--Ŭ������ ����
--��Ŭ������ ����

--�õ�����û, �б��� Ȯ��
select �õ�����û, �б��� from neis --io��75
select �õ�����û, �б��� from neis --io��75
where �õ�����û = '��⵵'
--create clustered index schoolname on neis(�õ�����û, �б���) --> primary key �������� �ڵ����� Ŭ������ ������ �������.
create index schoolname on neis(�õ�����û, �б���)
select �õ�����û, �б��� from neis --io��35!!!!
select �õ�����û, �б��� from neis --io�� 7!!!!
where �õ�����û = '��⵵'

select * from exam
select * from exam_emp

sp_help exam_emp

--exam �����ȣ primary Ű ����
alter table exam
alter column �����ȣ int not null

alter table exam
add constraint PK_exam_�����ȣ primary key(�����ȣ)


--����, ����, �հݿ��� ���
select a.����, ����, ����, �հݿ��� from exam a join exam_emp b --io �� �հ� 17 + 4 = 21
on a.���� = b.����

create index examscore on exam(���� desc, ���� desc, ���� asc)
create index exam_emp_pass on exam_emp(�հݿ��� desc, ���� asc)

select a.����, ����, ����, �հݿ��� from exam a join exam_emp b --io �� �հ� 4 + 2 = 6 !!!!!!!
on a.���� = b.����

select a.����, ����, ����, �հݿ��� from exam a join exam_emp b --io �� �հ� 4 + 17 = 21 ??????????
on a.�����ȣ = b.�����ȣ

drop index exam.examscore
drop index exam_emp.exam_emp_pass
create index examscore on exam(���� desc, ���� desc, �����ȣ asc)
create index exam_emp_pass on exam_emp(�հݿ��� desc, �����ȣ asc)

select a.����, ����, ����, �հݿ��� from exam a join exam_emp b --io �� �հ� 4 + 17 = 21 �Ȱ���???????????????????????????? 
on a.�����ȣ = b.�����ȣ

--@@trancount Ʈ����� Ƚ���� ��
use LSM
select * from tst1

begin tran
update tst1
set city = '�λ�'
where city = '����'
select @@TRANCOUNT -- 1
commit
select @@TRANCOUNT -- 0


--Ʈ����� save tran
insert tst1 values('����')


begin tran
save tran savepoint1 --���̺� ����1
delete tst1
where city = '����'

save tran savepoint2 --���̺� ���� 2
delete tst1
where city = '�λ�'

rollback tran savepoint1 --���̺� ���� 1�� ����
select * from tst1


--Ʈ����� ��� ���� ����
sp_lock @@spid

select DB_NAME(5), DB_NAME(1),DB_NAME(32767) --dbid ������ ���̽� �̸�


select OBJECT_NAME(1467152272)

--Ʈ����� ��ȭ ����
--read uncommitted < read committed < repeatable read < serializable
--read uncommitted (Ʈ����� �߿��� ������ ����)
-- read committed �Ϲ����� Ʈ�����
-- repeatable read : select�������� select ���� �� ���� ���������, �� ���� �ϸ� Ʈ������� ���� �� ���� ����� ����
--  serializable : 1,2,4,5��� Ű���� �����ϸ� repeatable read������ 1,2,4,5 ���� ���������, serializable�� ���� ��(3)�� ����� �����Ѵ�.
--����
--���̺� ����
--select * from tst1
--delete tst1
--where city = '����'
--insert tst1 (city) values('����')
--insert tst1 (city) values('����')
--insert tst1 (city) values('�뱸')
--insert tst1 (city) values('�λ�')
--insert tst1 (city) values('��õ')
SET TRANSACTION ISOLATION LEVEL read committed
begin tran
update tst1
set city = '�뱸'
where city = '����'
SELECT @@TRANCOUNT
rollback
select * from tst1 with (readcommitted)

sp_who

--��
--�� �����
select * from exam_emp
select * from neis

create view neisView
as
select �б��ڵ�, �б���, �ּ�, ��ȭ��ȣ from neis

select * from neisView

create view examview
as
select �����ȣ, ����, �հݿ��� from exam_emp
select * from examview

create view examview2
as
select �����ȣ, ����, �հݿ���,cast(�ּ� as nchar(6)) from exam_emp
----�÷� �̸��� ��� ���� �߻�


create view examview2([�����ȣ],[����],[�հݿ���],[�ּ�])
as
select �����ȣ, ����, �հݿ���,cast(�ּ� as nchar(6)) from exam_emp
select * from examview2


--�� ��ġ��
alter view neisView
as
select �б��ڵ�, left(�б���,4) as �б��� , �ּ�, ��ȭ��ȣ from neis
select * from neisView

alter view examview
as
select �����ȣ, ����, �հݿ���, �ּ� from exam_emp
select * from examview

create view dbo.examview
as
select �����ȣ, ����, �հݿ���, �ּ� from exam_emp

--�� �����
drop view dbo.neisView
drop view dbo.examview2

sp_help examview
sp_depends examview ---������ �˻�

select * from exam_emp
where ����='ȫ�浿'

-- �䵥���� �߰�
insert examview values(1234,'ȫ�浿',1,'�泲')
select * from examview

-- �䵥���� ����
update examview
set �����ȣ = 123456
where ���� = 'ȫ�浿'
select * from examview

-- �ΰ� ���̺� ������ ���� ��� �����
create view examview2
as
select a.�����ȣ, a.����, b.�հݿ���, a.����, a.���� from exam a join exam_emp b
on a.�����ȣ = b.�����ȣ
select * from examview2

--with check option �� ���� ���� üũ
select * from exam_emp
create view examview3
as
select �����ȣ, ����, �հݿ��� from exam_emp
where �հݿ��� = 1

select * from examview3
update examview3
set �հݿ��� = 0
where ���� = 'ȫ�浿'


create view examview4
as
select �����ȣ, ����, �հݿ��� from exam_emp
where �հݿ��� = 1
with check option

select * from examview4


update examview4
set �հݿ��� = 0
where ���� = 'ȫ�浿' --- ������ �ȵȴ�.

select * from exam_emp

update exam_emp
set �հݿ��� = 1
where ���� = 'ȫ�浿'


--�ý��� ��
select * from INFORMATION_SCHEMA.VIEWS  -------�ý��ۿ� �ִ� �並 �ҷ��´�.


--���ν���
alter proc Psum
@a int, @b int
as
declare @sum int
set @sum = @a + @b
select @sum

exec Psum 1000 , 13


create proc test1
as
select �����ȣ, ���� from exam
where ���� >=60 and ���� >= 60
order by �����ȣ

exec test1

alter proc test1  --���ν��� ����
as
select �����ȣ, ���� from exam
where ���� >=60 and ���� >= 60
order by �����ȣ
set nocount on

exec test1

create proc test2
@a int
as
set nocount on
select �����ȣ, ���� from exam
where ���� >= @a


exec test2 90


alter proc test2
@a int, @b int output
as
set nocount on
select �����ȣ, ���� from exam
where ���� >= @a
select @b = @@ROWCOUNT

declare @r int
set @r = 0
exec test2 80, @r output -- �� ��ȯ ex) c�� return�ϰ� ���.
select @r

alter proc Psum
@a int, @b int
as
declare @sum int
set @sum = @a + @b*2
select @sum



create proc test3 -----return ���
@a int
as
set nocount on
select �����ȣ, ���� from exam
where ���� >= @a
return @@rowcount

declare @r int
exec @r = test3 60
select @r

--���ν��� ���� ���۽� �ڵ� ����
sp_procoption test1, startup, true

--���ν����� �������� �ϵ��� ����
alter proc test3
@a int
with recompile ---------------------------------- ���� �� �� ���� ������ ����
as
set nocount on
select �����ȣ, ���� from exam
where ���� >= @a
return @@rowcount

--	With recompile
exec test1 with recompile -- ������ �� ����



--Ʈ����
--Ʈ���� �����
select * from exam
select * from exam_emp

--exam_emp�� ������ �ԷµǸ� �ڵ����� exam�� ����ϴ� Ʈ����
CREATE TRIGGER examin
on exam_emp
for insert -- after insert�� ����
as
insert exam (�μ�, ����, �з�, ��������, �����ȣ)
select �μ�, ����, �з�, ��������, �����ȣ from inserted --inserted�� ������ �ӽ� �����Ͽ� ���� ����

insert exam_emp (�μ�, ����, �з�, ��������, �����ȣ)values ('�μ�','ȫ�浿','����','����',123456)
insert exam_emp (����, �����ȣ) values ('��浿',12345)

select * from exam

select * from exam_emp

create table testTrigger1
(
id int not null, ���� nchar(10), �ּ� nchar(10), ����� int
)

create table testTrigger2
(
���� nchar(10), ����� int
)

create trigger testT
on testTrigger1
for insert
as
insert testTrigger2(����, �����) select ����, ����� from inserted

insert testTrigger1 values(1,'��', '����',980521)
select * from testTrigger1
select * from testTrigger2

-- ����� �Լ�
--����� �Լ� �����
create function fnDateGap (@a datetime, @b datetime)
returns int
as
begin
return datediff(dd, @a, @b)
end

declare @a datetime, @b datetime
set @a = '2019.5.21'
set @b ='2020.5.21' 


select DATEDIFF(dd,'2019.05.21','2019.05.22')

select dbo.fnDateGap('2019.05.21','2019.05.22')

create function fnTest (@a int, @b int)
returns int
as
begin
return (@a + @b) / 2
end

select dbo.fnTest(1,19)
--����� �Լ� ����
alter function fnDateGap (@a int, @b datetime)
returns datetime
as
begin
return dateadd(dd,@a,@b)
end

select DATEADD(dd,3,'2019.05.21')
select dbo.fnDateGap(3,'2019.05.21')

--����� �Լ� ����
drop function fnDateGap


--Ŀ��
--Ŀ�� ���� ���̺�

CREATE TABLE MY_FRIEND(
NAME NVARCHAR(20),
AGE NUMERIC(3)
)

INSERT INTO MY_FRIEND(NAME,AGE)VALUES('ȫ�浿',20)
INSERT INTO MY_FRIEND(NAME,AGE)VALUES('ȫ���',25)
INSERT INTO MY_FRIEND(NAME,AGE)VALUES('��ö��',22)
INSERT INTO MY_FRIEND(NAME,AGE)VALUES('��μ�',27)

----- ��ȸ�� �÷��� ���� ���� ����
declare @name nchar(4), @age int


--Ŀ������
declare cur cursor
for
select name,age from MY_FRIEND

--Ŀ�� ����
open cur
--select @@CURSOR_ROWS

--Ŀ�� fetch
fetch next from cur into @name, @age
--select @@FETCH_STATUS


while @@FETCH_STATUS = 0 --@@FETCH_STATUS = 0 �̸� ���� ���������� ������, -1�̸� ����
begin
update MY_FRIEND
set AGE = @age + 1
where name = @name
fetch next from cur into @name, @age
end

select @@FETCH_STATUS -- �ݺ��� ���� -1�� ǥ��
close cur -- Ŀ�� �ݱ�
deallocate cur --Ŀ�� ����

select * from MY_FRIEND


drop table testCursor
create table testCursor
(
id int, �������� int
)

declare @i int
set @i = 0
while @i < 20
begin
set @i = @i +1
if @i % 2 = 0
begin
insert testCursor values (@i, 1)
end
else
begin
insert testCursor values (@i, 0)
end
end
select * from testCursor

declare @idnum int, @up int
declare testCur cursor
for
select id, �������� from testCursor

open testCur
fetch next from testCur into @idnum, @up
while @@FETCH_STATUS = 0 --@@FETCH_STATUS = 0 �̸� ���� ���������� ������, -1�̸� ����
begin
update testCursor
set id = @idnum + 10
where id = @idnum and @up = 1
select * from testCursor
fetch next from testCur into @idnum, @up
end


close testCur -- Ŀ�� �ݱ�
deallocate testCur --Ŀ�� ����

select * from testCursor

--��ü�ؽ�Ʈ ����
--īŻ�α� �����
create fulltext catalog Cexam
-- ��ü �ؽ�Ʈ �ε��� �����
create fulltext index on Iexam
(
	mall_body LANGUAGE [korean]
)
-- �� ���������� ������ �߻�

