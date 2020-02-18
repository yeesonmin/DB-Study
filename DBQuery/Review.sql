use Review
select * from exam
select * from exam_emp
select * from neis
select * from zipcode

sp_help exam
alter table exam	
alter column �μ� nvarchar(10)
alter table exam
alter column ����  nvarchar(10)
alter table exam
alter column �з�  nvarchar(10)
alter table exam
alter column ����  tinyint
alter table exam
alter column ���� tinyint
alter table exam
alter column �������� nvarchar(10)

sp_help exam_emp
select max(len(�����ȣ)) as [�����ȣ],max(len(�μ�))as �μ�,max(len(����))as ����,max(len(�հݿ���))as �հݿ���
,max(len(�ֹε�Ϲ�ȣ))as �ֹε�Ϲ�ȣ,max(len(��������))as ��������
,max(len(���뱸��))as ���뱸��,max(len(�з�))as �з�,max(len(����))as ����,max(len(���ڵ�))as ���ڵ�,
max(len(����������))as ����������,max(len(�����ȣ))as �����ȣ
,max(len(�ּ�))as �ּ�,max(len(��󿬶�ó))as ��󿬶�ó,max(len(��ȭ��ȣ))as ��ȭ��ȣ from exam_emp

alter table exam_emp
alter column �����ȣ nvarchar(10)
alter table exam_emp
alter column �μ� nvarchar(10)
alter table exam_emp
alter column ���� nvarchar(5)
alter table exam_emp
alter column �հݿ��� nvarchar(5)
alter table exam_emp
alter column �ֹε�Ϲ�ȣ nvarchar(10)
alter table exam_emp
alter column �������� nvarchar(5)
alter table exam_emp
alter column ���뱸�� nvarchar(5)
alter table exam_emp
alter column �з� nvarchar(4)
alter table exam_emp
alter column ���� nvarchar(2)
alter table exam_emp
alter column ���ڵ� nvarchar(10)
alter table exam_emp
alter column ���������� smalldatetime
alter table exam_emp
alter column �����ȣ nvarchar(6)
alter table exam_emp
alter column �ּ� nvarchar(30)
alter table exam_emp
alter column ��ȭ��ȣ nvarchar(20)
alter table exam_emp
alter column ��󿬶�ó nvarchar(20)

sp_help neis
select max(len(�б��ڵ�)) as �б��ڵ�,max(len(�õ�����û)) as �õ�����û,max(len(�б�����)) as �б�����,max(len(�б���)) as �б���,
max(len(�����ȣ)) as �����ȣ,max(len(�ּ�)) as �ּ�,max(len(��ȭ��ȣ)) as ��ȭ��ȣ from neis
alter table neis
alter column �б��ڵ� nvarchar(10)
alter table neis
alter column �õ�����û nvarchar(5)
alter table neis
alter column �б����� nvarchar(25)
alter table neis
alter column �б��� nvarchar(25)
alter table neis
alter column �����ȣ nvarchar(6)
alter table neis
alter column �ּ� nvarchar(40)
alter table neis
alter column ��ȭ��ȣ nvarchar(15)

sp_help zipcode

--�÷����� �ٲٱ�
select zipcode as [�����ȣ], sido as [�õ�], GUGUN as [��], DONG as [��] from zipcode

--isnull
select isnull(�հݿ���,0) from exam_emp

--group by
select b.�μ�, count(*) from exam a join exam_emp b
on a.���� = b.����
where a.���� >= 60 and a.���� >= 60
group by b.�μ�


--rollup
select b.�μ�,b.��������, avg(����),AVG(����) from exam a join exam_emp b
on a.���� = b.����
group by b.�μ�,b.��������
with rollup

select b.�μ�,b.��������, avg(����),AVG(����) from exam a join exam_emp b
on a.���� = b.����
group by b.��������,b.�μ�
with rollup

--cube
select b.�μ�,b.��������, avg(����),AVG(����) from exam a join exam_emp b
on a.���� = b.����
group by b.��������,b.�μ�
with cube

--������� ����
select ���� from exam
where ���� not in (select ���� from exam_emp where ���� = exam.����)

--union
select ���� from exam
group by ����
union
select ���� from exam_emp
group by ����

--���̺����
create table test.tst1(
 id int
)



-- ���̺� ����
alter table test.tst1
add ���� nvarchar(5)

alter table test.tst1
drop column ����

alter table test.tst1
add id int identity(1,1) primary key

alter table test.tst1
add  ���� nvarchar(5) default('ȫ�浿')

-- ������ ����
insert test.tst1 values(default)
select * from test.tst1

begin tran
update test.tst1
set ���� = '��浿'
where id = 5
select * from test.tst1
commit

begin tran
delete test.tst1
where id > 5
select * from test.tst1
commit

--�⺻Ű
--��������Ű
create table test.People(
id int identity(1,1) primary key, ���� nvarchar(10) not null,
�ֹι�ȣ char(13) unique check(SUBSTRING(�ֹι�ȣ,7,1) in (1,2,3,4) ),
���� nvarchar(10) default '����'
)

insert test.People values('ȫ�浿','9901011234567',default)
select * from test.People
insert test.People values('��浿','9901012234567',default)
insert test.People values('��浿','0001012334567',default)
insert test.People values('��浿','0001012534567',default)
insert test.People values('��浿','0001015534567',default)

create rule rcity
as
@city in ('����', '����', '�뱸', '�λ�', '��õ','����','����')

sp_bindrule rcity, 'test.People.����'

insert test.People values('��浿','0001013534567','����')
insert test.People values('��浿','0001013534567','����')
select * from test.People


--����Ű
sp_help 'test.People'

create table test.CityNumber
(
Cityid int,
���� nvarchar(10) not null
)
sp_bindrule rcity, 'test.CityNumber.����'

alter table test.CityNumber
alter column Cityid int not null
alter table test.CityNumber
add constraint PK_Cityid primary key(Cityid)


alter table test.CityNumber
add constraint UK_City unique(����)
sp_help 'test.CityNumber'

insert test.CityNumber values(01,'����')
insert test.CityNumber values(02,'�λ�')
insert test.CityNumber values(03,'��õ')
insert test.CityNumber values(04,'����')
insert test.CityNumber values(05,'�뱸')
insert test.CityNumber values(06,'����')
insert test.CityNumber values(07,'����')

select * from test.CityNumber
order by Cityid asc

create table test.People2
(
id int identity(1,1) primary key, ���� nvarchar(10) not null,
�ֹι�ȣ char(13) unique check(SUBSTRING(�ֹι�ȣ,7,1) in (1,2,3,4) ),
CityId int
,
���� nvarchar(10) default '����'
)

alter table test.People2
add constraint FK_Cityid foreign key(CityId)
references test.CityNumber (Cityid)
on update cascade
on delete cascade

insert test.People2 values('ȫ�浿','9901011234567',1,default)
insert test.People2 values('��浿','9801011234567',2,default)
insert test.People2 values('�ڱ浿','8801011234567',2,'�λ�')
insert test.People2 values('ȫ�浿','7801011234567',2,'����')
insert test.People2 values('�̱浿','9701011234567',8,default)
select * from test.People2



select * from test.People2
where ���� not in (select ���� from test.CityNumber where test.People2.Cityid = test.CityNumber.Cityid)

--������ ���� �� ���� �ڵ� �˻��ϱ�
create rule CheckCity
as
@id = i
@Cityname not in (select ���� from test.CityNumber where test.People2.Cityid = �Էµ�id��)