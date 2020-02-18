﻿use Review
select * from exam
select * from exam_emp
select * from neis
select * from zipcode

sp_help exam
alter table exam	
alter column 부서 nvarchar(10)
alter table exam
alter column 성명  nvarchar(10)
alter table exam
alter column 학력  nvarchar(10)
alter table exam
alter column 영어  tinyint
alter table exam
alter column 수학 tinyint
alter table exam
alter column 전형구분 nvarchar(10)

sp_help exam_emp
select max(len(수험번호)) as [수험번호],max(len(부서))as 부서,max(len(성명))as 성명,max(len(합격여부))as 합격여부
,max(len(주민등록번호))as 주민등록번호,max(len(전형구분))as 전형구분
,max(len(적용구분))as 적용구분,max(len(학력))as 학력,max(len(병역))as 병역,max(len(고교코드))as 고교코드,
max(len(고교졸업일자))as 고교졸업일자,max(len(우편번호))as 우편번호
,max(len(주소))as 주소,max(len(비상연락처))as 비상연락처,max(len(전화번호))as 전화번호 from exam_emp

alter table exam_emp
alter column 수험번호 nvarchar(10)
alter table exam_emp
alter column 부서 nvarchar(10)
alter table exam_emp
alter column 성명 nvarchar(5)
alter table exam_emp
alter column 합격여부 nvarchar(5)
alter table exam_emp
alter column 주민등록번호 nvarchar(10)
alter table exam_emp
alter column 전형구분 nvarchar(5)
alter table exam_emp
alter column 적용구분 nvarchar(5)
alter table exam_emp
alter column 학력 nvarchar(4)
alter table exam_emp
alter column 병역 nvarchar(2)
alter table exam_emp
alter column 고교코드 nvarchar(10)
alter table exam_emp
alter column 고교졸업일자 smalldatetime
alter table exam_emp
alter column 우편번호 nvarchar(6)
alter table exam_emp
alter column 주소 nvarchar(30)
alter table exam_emp
alter column 전화번호 nvarchar(20)
alter table exam_emp
alter column 비상연락처 nvarchar(20)

sp_help neis
select max(len(학교코드)) as 학교코드,max(len(시도교육청)) as 시도교육청,max(len(학교약어명)) as 학교약어명,max(len(학교명)) as 학교명,
max(len(우편번호)) as 우편번호,max(len(주소)) as 주소,max(len(전화번호)) as 전화번호 from neis
alter table neis
alter column 학교코드 nvarchar(10)
alter table neis
alter column 시도교육청 nvarchar(5)
alter table neis
alter column 학교약어명 nvarchar(25)
alter table neis
alter column 학교명 nvarchar(25)
alter table neis
alter column 우편번호 nvarchar(6)
alter table neis
alter column 주소 nvarchar(40)
alter table neis
alter column 전화번호 nvarchar(15)

sp_help zipcode

--컬럼제목 바꾸기
select zipcode as [우편번호], sido as [시도], GUGUN as [구], DONG as [동] from zipcode

--isnull
select isnull(합격여부,0) from exam_emp

--group by
select b.부서, count(*) from exam a join exam_emp b
on a.성명 = b.성명
where a.영어 >= 60 and a.수학 >= 60
group by b.부서


--rollup
select b.부서,b.전형구분, avg(영어),AVG(수학) from exam a join exam_emp b
on a.성명 = b.성명
group by b.부서,b.전형구분
with rollup

select b.부서,b.전형구분, avg(영어),AVG(수학) from exam a join exam_emp b
on a.성명 = b.성명
group by b.전형구분,b.부서
with rollup

--cube
select b.부서,b.전형구분, avg(영어),AVG(수학) from exam a join exam_emp b
on a.성명 = b.성명
group by b.전형구분,b.부서
with cube

--상관하의 질의
select 성명 from exam
where 성명 not in (select 성명 from exam_emp where 성명 = exam.성명)

--union
select 성명 from exam
group by 성명
union
select 성명 from exam_emp
group by 성명

--테이블만들기
create table test.tst1(
 id int
)



-- 테이블 수정
alter table test.tst1
add 성명 nvarchar(5)

alter table test.tst1
drop column 성명

alter table test.tst1
add id int identity(1,1) primary key

alter table test.tst1
add  성명 nvarchar(5) default('홍길동')

-- 데이터 수정
insert test.tst1 values(default)
select * from test.tst1

begin tran
update test.tst1
set 성명 = '김길동'
where id = 5
select * from test.tst1
commit

begin tran
delete test.tst1
where id > 5
select * from test.tst1
commit

--기본키
--고유제약키
create table test.People(
id int identity(1,1) primary key, 성명 nvarchar(10) not null,
주민번호 char(13) unique check(SUBSTRING(주민번호,7,1) in (1,2,3,4) ),
도시 nvarchar(10) default '서울'
)

insert test.People values('홍길동','9901011234567',default)
select * from test.People
insert test.People values('김길동','9901012234567',default)
insert test.People values('김길동','0001012334567',default)
insert test.People values('김길동','0001012534567',default)
insert test.People values('김길동','0001015534567',default)

create rule rcity
as
@city in ('서울', '대전', '대구', '부산', '인천','광주','제주')

sp_bindrule rcity, 'test.People.도시'

insert test.People values('김길동','0001013534567','대전')
insert test.People values('김길동','0001013534567','서산')
select * from test.People


--참조키
sp_help 'test.People'

create table test.CityNumber
(
Cityid int,
도시 nvarchar(10) not null
)
sp_bindrule rcity, 'test.CityNumber.도시'

alter table test.CityNumber
alter column Cityid int not null
alter table test.CityNumber
add constraint PK_Cityid primary key(Cityid)


alter table test.CityNumber
add constraint UK_City unique(도시)
sp_help 'test.CityNumber'

insert test.CityNumber values(01,'서울')
insert test.CityNumber values(02,'부산')
insert test.CityNumber values(03,'인천')
insert test.CityNumber values(04,'대전')
insert test.CityNumber values(05,'대구')
insert test.CityNumber values(06,'광주')
insert test.CityNumber values(07,'제주')

select * from test.CityNumber
order by Cityid asc

create table test.People2
(
id int identity(1,1) primary key, 성명 nvarchar(10) not null,
주민번호 char(13) unique check(SUBSTRING(주민번호,7,1) in (1,2,3,4) ),
CityId int
,
도시 nvarchar(10) default '서울'
)

alter table test.People2
add constraint FK_Cityid foreign key(CityId)
references test.CityNumber (Cityid)
on update cascade
on delete cascade


insert test.People2 values('홍길동','9901011234567',1,default)
insert test.People2 values('김길동','9801011234567',2,default)
insert test.People2 values('박길동','8801011234567',2,'부산')
insert test.People2 values('홍길동','7801011234567',2,'대전')
insert test.People2 values('이길동','9701011234567',8,default)
select * from test.People2



select * from test.People2
where 도시 not in (select 도시 from test.CityNumber where test.People2.Cityid = test.CityNumber.Cityid)

--데이터 삽입 시 도시 코드 검사하기
create table test.People3
(
id int identity(1,1) primary key, 성명 nvarchar(10) not null,
주민번호 char(13) unique check(SUBSTRING(주민번호,7,1) in (1,2,3,4) ),
CityId int
,
도시 nvarchar(10) default '서울' check (도시 in (select 도시 from test.CityNumber where test.People2.Cityid = test.CityNumber.Cityid))
)
-- rule 만들 때 city id 읽지 못함. ㅡㅡ
create rule CheckCity
as
@city
--------------- 않된다. 다른 언어로 프로그래밍해야 할 것 같다.

--case
select 성명,
case
when 영어>=90 and 수학 >= 90 then 'A'
when 영어>=80 and 수학 >= 80 then 'B'
when 영어>=70 and 수학 >= 70 then 'C'
when 영어>=60 and 수학 >= 60 then 'D'
else '불합격'
end as '등급'
,영어, 수학
from exam

--nullif
select nullif(2,3) -- 다르면 2 출력
select nullif(3,3) -- 같으면 null 출력

--coalesce
select coalesce(null, 1, 3) -- 처음으로 널이 아닌 것 출력
select coalesce(null, 3, 1)
select coalesce(3,null, 1)
select coalesce(1,null, 3)
