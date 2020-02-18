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
alter column 학교명 nchar(25)
alter table neis
alter column 학교약어명 nchar(25)
alter table neis
alter column 우편번호 int
alter table neis
alter column 주소 nvarchar(40)
alter table neis
alter column 전화번호 char(12)

select max(len(주소))from neis
select max(len(전화번호))from neis

alter table exam_emp
alter column 고교졸업일자 datetime

alter table exam
alter column 부서 nchar(8)
alter table exam
alter column 성명 nchar(6)
alter table exam
alter column 학력 nchar(8)
alter table exam
alter column 영어 tinyint
alter table exam
alter column 수학 tinyint
alter table exam
alter column 전형구분 nchar(4)

alter table exam_emp
alter column 전화번호 nchar(14)
alter table exam_emp
alter column 비상연락처 nchar(14)
alter table exam_emp
alter column 합격여부 bit

alter table exam_emp
alter column  우편번호 int

alter table exam_emp
alter column 적용구분 nchar(5)

alter table exam_emp
alter column 고교코드 char(10)



--컬럼 이름 바꾸기
SELECT 성명 AS 이름, 부서  AS '(팀)' from exam 

--변수 선언
DECLARE @id INT, @name CHAR(10)
SET @id = 0
SET @name = '이선민'
SELECT @id, @name

--SELECT에서 자료형 바꾸기
select * from neis
SELECT 주소 FROM neis
SELECT 주소, CONVERT(CHAR(4),주소) as '줄인주소' FROM neis --자료길이 및 형 변환
SELECT 주소, SUBSTRING(주소,1,2) as '줄인주소' FROM neis -- 자료길이 만 변환

--연산함수
SELECT FLOOR(29.9),FLOOR(29.1),FLOOR(29.25) --소수점 내림
SELECT CEILING(29.9),CEILING(29.1),CEILING(29.25) --소수점 올림
SELECT ROUND(29.1,0), ROUND(29.9,0), ROUND(29.953,1), round(29,-1) --소수점 자리수 반올림.
SELECT ABS(-123),ABS(123) --절대값
SELECT COS(RADIANS(60)), SIN(90),TAN(45) --sin,cos,tan
SELECT LOG10(10) --log
SELECT SQUARE(2), SQRT(4), PI() --제곱, 루트, 파이

--문자함수
SELECT '이'+'선' + '민'
SELECT ASCII('이'),ASCII('A')
SELECT CHAR(65)
SELECT REPLACE('홍길동','동','똥') --글자 교체
SELECT REPLICATE('이선민',4) --단어 반복
SELECT REVERSE('이선민') --단어 반대로
SELECT LEFT('이선민',1),RIGHT('이선민',2)
SELECT SUBSTRING('한글ABCD데이타',1,2) -- x에서 y까지 단어출력
SELECT SUBSTRING('한글ABCD데이타',3,3)
SELECT DIFFERENCE('ABCD','SDF'), DIFFERENCE('한글','선민') --단어의 비슷한 점을 찾는 함수(4가 가장 비슷한 단어라는 뜻) 인데 한글에서는 무용지물이다.
SELECT STUFF('이선민',2,2,'길동'),STUFF('이선민',2,1,'길동') --x부터 y까지 단어를 지우고 새로운 단어 추가

--날짜함수
SELECT GETDATE()
SELECT CONVERT(NVARCHAR(30),GETDATE(),2) --convertert함수로 숫자x에 해당하는 유형을 나타냄.
SELECT CONVERT(NVARCHAR(30),GETDATE(),8)
SELECT DATEPART(mm,GETDATE()), DATEPART(dd,GETDATE()), DATEPART(yy,GETDATE())
SELECT DATENAME(DW,GETDATE()), DATENAME(MM,GETDATE()), DATENAME(dd,getdate())



--NULL
SELECT 성명 FROM exam
WHERE 부서 IS NOT NULL

SELECT 성명 FROM exam
WHERE 부서 is not NULL

--정렬
select 성명 from exam
order by 성명
select 성명 from exam
order by 성명 desc
 
 --top
 select top 15 성명, 영어 from exam
 order by 영어 desc
 
 select top 15 with ties 성명, 영어 from exam
 order by 영어 desc

 --in
 select 성명 ,영어 from exam
 where 영어 in (99,80,55)

 
 select 성명 ,영어 from exam
 where 영어  = 99 or 영어  = 80 or 영어  = 55

--%,_,[],[^]
begin tran
update exam
set 성명 = RTRIM(성명)
rollback
sp_help exam_emp

select * from exam
--김길동
select 성명 from exam
where 성명 like '__동' --exam 타입에 빈공간에는 null값이 존재

select 성명 from exam
where RTRIM(성명) like '__동'

select 성명 from exam
where RTRIM(성명) like '김_'

select 성명 from exam
where RTRIM(성명) like '김__'

select 성명 from exam
where 성명 like '김%'

select 성명 from exam
where 성명 like '%김'


select 성명 from exam
where 성명 like '%김%'

select PATINDEX('%Mi%','James Mike')

select PATINDEX('M[^C]%','McAthur')

select PATINDEX('M[^C]%','Mike')

select PATINDEX('M[^C]%','M')

--distinct(중복행 제거)
select distinct 영어 from exam
order by 영어 desc


--select 연산
select 부서 from exam_emp
group by 부서

select b.부서, count(*) from exam a join exam_emp b
on a.성명 = b.성명
where a.영어 >=60
group by b.부서



--rollup -------------앞에 그룹을 통합하여 계산 함.

select *from exam_emp
select b.부서,b.전형구분,avg(a.영어) from exam a join exam_emp b
on a.성명 = b.성명
group by b.부서,b.전형구분

select b.부서,b.전형구분,avg(isnull(a.영어, 0)) from exam a join exam_emp b
on a.성명 = b.성명
group by b.부서,b.전형구분

select b.부서,b.전형구분,avg(a.영어) from exam a join exam_emp b
on a.성명 = b.성명
group by b.부서,b.전형구분
with rollup------------- 부서 기준으로 영어 평균을 따로 구하고, 전체 영어 평균도 구함.

select b.부서,b.전형구분,avg(a.영어) from exam a join exam_emp b
on a.성명 = b.성명
group by b.전형구분,b.부서
with rollup------------- 전형구분 기준으로 영어 평균을 따로 구하고, 전체 영어 평균도 구함.


--cube   ---------------- 그룹한 모든 것을 통합 하여 결과로 표시
select b.부서,b.전형구분,avg(a.영어) from exam a join exam_emp b
on a.성명 = b.성명
group by b.전형구분,b.부서
with cube -------------------------------- 전형구분 기준으로 영어 평균을 구하고 맨 끝에 표시, 또한 rollup과 달리 부서기준으로 영어 평균을 따라 만들어줌.

select b.부서,b.전형구분,avg(a.영어) from exam a join exam_emp b
on a.성명 = b.성명
group by b.부서,b.전형구분
with cube


--cross join  -------------테이블의 모든 행을 서로 연결함.
--select * from exam join exam_emp 

select * from exam cross join exam_emp 


--하위질의
select 성명 from exam
where 영어 >= 90 and 성명 in (select 성명 from exam_emp)


--상관하위질의
select * from exam_emp
select 성명, 영어 from exam
where  성명 in (select 성명 from exam_emp where exam.성명 = exam_emp.성명)
select 성명, 영어 from exam
where  성명 in (select 성명 from exam_emp)

--in
--exam에 성명 2개인 1명이 있어서 211개
select 성명 from exam
where 성명 in (select 성명 from exam_emp)
order by 성명

select  a.성명 from exam  a join exam_emp b
on a.성명 = b.성명
order by a.성명

--
use LSM
select a.성명, b.부서 from exam a right join exam_emp b
on a.성명 = b.성명

--distinct가 중복된 것을 제거해서 210개
select distinct a.성명 from exam  a join exam_emp b
on a.성명 = b.성명
order by a.성명

select 성명 from exam
order by 성명

select 성명, count(성명) from exam
where 성명 in (select 성명 from exam_emp)
group by 성명


select  a.성명,count(a.성명)  from exam  a join exam_emp b
on a.성명 = b.성명
group by a.성명

select 성명,count(성명) from exam
group by 성명
having count(성명) >=2

--union  ---------------------------2개의 select 문을 통합함.

select 성명 from exam
select 성명 from exam_emp
--263
select 성명, count(*) from exam
group by 성명


--798
select 성명, count(*) from exam_emp
group by 성명


--881--------------------------------------------------> count(*)의 데이터를 다르다고 인식하여 중복에서 제외해 30명이 더 추가 된 것.
select 성명, count(*) from exam
group by 성명
union
select 성명, count(*) from exam_emp
group by 성명

--851 
select 성명 from exam
group by 성명
union
select 성명 from exam_emp
group by 성명

--1
select 성명, count(*) from exam
group by 성명
having COUNT(*) >= 2
--87
select 성명, count(*) from exam_emp
group by 성명
having COUNT(*) >= 2

--87
select 성명, count(*) from exam
group by 성명
having COUNT(*) >= 2
union
select 성명, count(*) from exam_emp
group by 성명
having COUNT(*) >= 2

--210
select 성명,COUNT(*) from exam
where 성명 in(select 성명 from exam_emp)
group by 성명


--53
select 성명 from exam
where 성명 not in(select 성명 from exam_emp)
group by 성명

--588
select 성명 from exam_emp
where 성명 not in(select 성명 from exam)
group by 성명


--테이블 만들기
create table SONMIN
(
	id int not null, name nchar(4)
)

--컬럼 추가
alter table SONMIN
add adr nvarchar(30) not null
--컬럼 수정
alter table SONMIN
alter column name nchar(4) not null

--컬럼 삭제
alter table SONMIN
drop column adr
--테이블 삭제
drop table SONMIN

--기본키 추가
--테이블 만들떄
create table SONMIN
(
	id int primary key, name nchar(4)
)
--테이블 있을 때
alter table SONMIN
alter column id int not null
alter table SONMIN
ADD constraint PK_ID primary key (id)




--테이블 값 추가
BEGIN TRAN
INSERT SONMIN VALUES (123, '홍길동', '서울')
ROLLBACK
SELECT * FROM SONMIN

-- 테이블 만들 면서 기본 값 자동 추가(DEFAULT) 및 증가값 자동 추가(IDENTITY)
CREATE TABLE SONMIN2
(
ID INT IDENTITY(1,1) PRIMARY KEY , NAME NCHAR(4) NOT NULL, ADR NVARCHAR(30) DEFAULT '서울'
)


SELECT * FROM SONMIN2
INSERT SONMIN2 (NAME)VALUES ('홍길동')
INSERT SONMIN2 VALUES ('홍길동',DEFAULT)

--테이블 수정(alter)해서 기본값 자동 추가 및 증가값 자동 추가 ---------> 안된다.



--timestamp   --------------- SQL서버가 자동으로 데이터를 입력합.
create table times
(
id int identity primary key,timestamp
)


insert times (qty) values(1)
insert times (qty) values(2)

select * from times

--IDENTITY, NULL,TIMESTAMP, DEFAULT로 이루어진 테이블은 INSERT 테이블명 DEFAULT VALUES로 값 추가 가능.


INSERT SONMIN2 (NAME) VALUES ('이선민')
INSERT SONMIN2 (NAME) VALUES ('김길동')

SELECT * FROM SONMIN2


--INSERT SELECT문 
SELECT * INTO SONMIN3 FROM SONMIN2  -------------into는  결과값을 새로운 테이블을 만들어 저장
SELECT * FROM SONMIN3
SELECT * INTO SONMIN2 FROM SONMIN3 --오류발생(이미 테이블 존재)으로 INSEERT SELECT문 사용
INSERT SONMIN2 SELECT NAME,ADR FROM SONMIN3 --------------------insert select 사용시 컬럼값을 맞게 해야 한다.

--DELETE
SELECT * FROM SONMIN3

BEGIN TRAN
DELETE SONMIN3
WHERE ID >1
COMMIT

SELECT * FROM exam
SELECT * FROM exam_emp
SELECT 성명 FROM exam WHERE 성명 NOT IN  (SELECT 성명 FROM exam_emp)

BEGIN TRAN
DELETE EXAM
WHERE 성명 NOT IN (SELECT 성명 FROM exam_emp)
ROLLBACK
COMMIT

BEGIN TRAN
DELETE exam
WHERE 성명 IN (SELECT 성명 FROM exam GROUP BY 성명 HAVING COUNT(성명) >1)
COMMIT
SELECT * FROM exam_emp


--TRUNCATE TABLE 테이블에 있는 모든 데이터 빠른 삭제
BEGIN TRAN
TRUNCATE TABLE SONMIN2
SELECT * FROM SONMIN2
COMMIT

--UPDATE 


SELECT * FROM exam
SELECT A.부서,A.성명 FROM exam_emp A JOIN exam B
ON A.성명 = B.성명
GROUP BY A.성명

BEGIN TRAN
UPDATE EXAM
SET 부서 = (SELECT 부서 FROM exam_emp WHERE EXAM.성명 =  exam_emp.성명)
SELECT * FROM exam
SELECT * FROM exam_emp
UPDATE EXAM
SET 학력 = (SELECT 학력 FROM exam_emp WHERE EXAM.성명 =  exam_emp.성명)
UPDATE EXAM
SET 전형구분 = (SELECT 전형구분 FROM exam_emp WHERE EXAM.성명 =  exam_emp.성명)
COMMIT

SP_HELP EXAM_EMP
SELECT * FROM exam_emp
BEGIN TRAN
UPDATE exam_emp
SET 합격여부 = 0
WHERE 성명 NOT IN (SELECT 성명 FROM EXAM WHERE 영어 >=60 AND 수학 >=60)
ROLLBACK
COMMIT

SELECT 성명 FROM EXAM WHERE 영어 >=60 AND 수학 >=60 ORDER BY 성명
SELECT 성명 FROM exam_emp WHERE 성명 IN (SELECT 성명 FROM EXAM WHERE 영어 >=60 AND 수학 >=60) ORDER BY 성명
SELECT 성명 FROM exam_emp ORDER BY 성명
SELECT 성명 FROM EXAM WHERE 영어 >=60 AND 수학 >=60 ORDER BY 성명

SELECT 성명 FROM EXAM WHERE 성명 IN (SELECT 성명 FROM exam_emp) ORDER BY 성명
SELECT 성명 FROM exam_emp WHERE 성명 IN (SELECT 성명 FROM exam) ORDER BY 성명


--NULL
SELECT 'A' + 'B'
SELECT 1 + 2
SELECT '1' + 2
SELECT 'A' + NULL + 'B'


--기본키 만들기
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


--기본키 2개 만들기
create table test2
(
id int not null, name nchar(4) not null,
constraint PK_IdName primary key (id,name)
)

insert test2 values (1,'홍길동')
insert test2 values (1,'홍길동')
select * from test2

--고유제약(unique)
create table test3
(
id int constraint U_id unique
)

insert test3 values(1)
insert test3 values(1)
insert test3 values(null)
select * from test3

--identity 추가설명_---> 책에서는 중간 값을 제거하고 insert하면 중간값을 채우지 않고 증가한다고 했는데 개선 된 것 같다.

use LSM
create table test4
(
id int identity(1,5)
)

alter table test4 
add name nchar(4)
insert test4 (name) values('이선민')
select * from test4
insert test4 (name) values('이3')

delete test4
where id = 6
insert test4 (name) values('이4')
insert test4 (name) values('이5')


--절차적 방법 DEFAULT
create table test5
(
id int, city nchar(10) null
)

create default DFcity
as '서울'


sp_bindefault DFcity, 'test5.city'

insert test5 (id) values(2)
select * from test5

--사용자 정의 자료형
sp_addtype Tcity, 'nchar(10)'
sp_bindefault DFcity, 'Tcity'
create table test6
(
id int, city Tcity null
)
insert test6 (id) values(1)
select * from test6

--절차적 디폴트 지우기, 풀기
sp_unbindefault 'test5.city'
drop default DFcity --Tcity가 사용중이라 삭제 못함.

sp_unbindefault Tcity
drop default DFcity 
insert test6 (id) values(2)
select * from test6


drop table test6


--check
create table tst1
(
city nchar(10) check (city in ('서울','대전','대구','부산','인천'))
)

insert tst1 values ('서울')
select * from tst1

insert tst1 values ('부천') --check 때문에 오류발생
update tst1
set city = '부천'--check 때문에 오류발생

--rule(절차적 방법)
create rule rcity
as @city in ('서울', '대전','대구','부산','인천')
create table tst2
(city nchar(10)
)
sp_bindrule rcity, 'tst2.city'

insert tst2 values ('서울')
select * from tst2
insert tst2 values ('부천') -- rule 때문에 오류 발생

sp_unbindrule 'tst2.city' --rule 해제
drop rule rcity


--참조키

select * from exam
select * from exam_emp
select * from neis

alter table exam
add 수험번호 int

begin tran
update exam
set 수험번호 = (select 수험번호 from exam_emp where 성명 = exam.성명)
commit

alter table exam
add constraint FK_exam_emp_수험번호 foreign key(수험번호)
references exam_emp (수험번호)
on update cascade
on delete cascade

sp_help exam_emp
alter table exam_emp
alter column 수험번호 int not null

alter table exam_emp
add constraint PK_수험번호 primary key(수험번호)

sp_help neis
sp_help exam_emp
alter table neis
alter column 학교코드 char(10) not null
alter table neis
add constraint PK_학교코드 primary key (학교코드)

alter table exam_emp
add constraint FK_학교코드 foreign key (고교코드)
references neis(학교코드)
on update cascade
on delete cascade



select * from neis
select * from exam_emp

select 고교코드 from exam_emp
where 고교코드 not in (select 학교코드 from neis)


select * from exam_emp
where 고교코드 = 'S100003175' or 고교코드 = 'ZZZZZZZZ'

select * from exam
where 성명 = '최지성' or 성명 = '정회림' --정회림 없음

begin tran
delete exam_emp
where 성명 = '정회림'
commit

insert neis (학교코드) values ('S100003175')--neis에 추가

alter table exam_emp
add constraint FK_학교코드 foreign key (고교코드)
references neis(학교코드)
on update cascade
on delete cascade
		

--select/print
declare @tst int, @tst2 char(20)
--set @tst2 = '1'
select @tst2 = 'a'
print @tst2 --문자형만 출력 가능
select @tst = 10 --set처럼 변수 초기화 가능
select @tst

select @tst2

--raiserror 오류메시지 출력
raiserror('에러발생',10,1) --로그에 기록 않함.
raiserror('에러발생',10,1) with log --로그에 기록.
raiserror('입력한 숫자는 %d 입니다.',10,1,45)

--sp_addmessage 오류메세지 추가(오류번호는 50000이상)
sp_addmessage 51105,16,'log is almost full', us_english,'true',replace -- 영어 버전 부터 추가해야함.
exec sp_addmessage 51105, 16, '로그가 거의 다 찼다', default,'true',replace --항상 로그에 기록
sp_dropmessage 51105 --메세지 삭제

--if
declare @a int, @b int
set @a = 1
set @b = 2
if @a > @b 
begin select 'a가 크다.'
end
else
begin select 'b가 크다.'
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

select 성명, case when 합격여부 = 0 then '불합격' else '합격' end as '합격여부', 부서 --case when 합격여부 = 0 then '불합격' else '합격' end as '합격여부' case문
from exam_emp

select 성명, case when 합격여부 = 0 then '불합격' else '합격' end as '합격여부', 부서 --case when 합격여부 = 0 then '불합격' else '합격' end as '합격여부' case문
from exam_emp
where 합격여부 = 1

select 성명, 영어, 수학 from exam
where 영어 >= 60 and 수학 >=60


select 성명, 영어, 수학, case when 영어>=60 and 수학 >=60 then '합격' else '불합격' end as '합격여부' 
from exam order by 합격여부 desc, 성명

select 수험번호, 성명 ,영어, case when 영어 >= 90 then 'A' when 영어 >= 80 then 'B' else 'C' end as '영어등급'
from exam order by 영어 desc

--set rowcount n ---------------->select top와 비슷하나 insert/update/delete문에도 사용 가능
set rowcount 5
select * from exam

set rowcount 0 --해제
select * from exam


--nullif
select nullif(2,3) --같지 않으면 2로 반환
select nullif(3,3) --참이면 NULL로 반환


--coalesce  : null이 아닌 첫 번째 값을 반환
select coalesce(null,1,2)
select coalesce(null,2,1)
select coalesce(1,null,2)
select coalesce(2,null,1)
select coalesce(2,1,1)
select coalesce(3,2,1)
select coalesce(null,null,null)

------------------------------------------------------색인 ------------------------------------------------------------------
use LSM
select * from exam_emp
select * from neis
--create index exam_pk on exam (성명 asc, 부서 desc) --> 넌클러스터 색인이 기본값
drop index exam.exam_pk
sp_help exam

create unique clustered index exam_pk2
on exam (성명 asc, 부서 desc)  ----------> 클러스터로 세팅

select * from exam
SET STATISTICS TIME ON --> 실행 속도 측정 설정
SET STATISTICS IO ON --> i/o 발생 확인

select * from exam
where 영어 >= 50 and 수학 >=50

create index exam_pk on exam(성명 asc, 영어 desc, 수학 desc)
drop index exam.exam_pk
sp_help neis
select * from neis
select * from neis
where 시도교육청 = '경기도'
order by 학교코드

select * from exam_emp
--색인 만드는 순서
--클러스터 색인
--넌클러스터 색인

--시도교육청, 학교명 확인
select 시도교육청, 학교명 from neis --io수75
select 시도교육청, 학교명 from neis --io수75
where 시도교육청 = '경기도'
--create clustered index schoolname on neis(시도교육청, 학교명) --> primary key 선언으로 자동으로 클러스터 색인이 만들어짐.
create index schoolname on neis(시도교육청, 학교명)
select 시도교육청, 학교명 from neis --io수35!!!!
select 시도교육청, 학교명 from neis --io수 7!!!!
where 시도교육청 = '경기도'

select * from exam
select * from exam_emp

sp_help exam_emp

--exam 수험번호 primary 키 설정
alter table exam
alter column 수험번호 int not null

alter table exam
add constraint PK_exam_수험번호 primary key(수험번호)


--성명, 성적, 합격여부 출력
select a.성명, 영어, 수학, 합격여부 from exam a join exam_emp b --io 총 합계 17 + 4 = 21
on a.성명 = b.성명

create index examscore on exam(영어 desc, 수학 desc, 성명 asc)
create index exam_emp_pass on exam_emp(합격여부 desc, 성명 asc)

select a.성명, 영어, 수학, 합격여부 from exam a join exam_emp b --io 총 합계 4 + 2 = 6 !!!!!!!
on a.성명 = b.성명

select a.성명, 영어, 수학, 합격여부 from exam a join exam_emp b --io 총 합계 4 + 17 = 21 ??????????
on a.수험번호 = b.수험번호

drop index exam.examscore
drop index exam_emp.exam_emp_pass
create index examscore on exam(영어 desc, 수학 desc, 수험번호 asc)
create index exam_emp_pass on exam_emp(합격여부 desc, 수험번호 asc)

select a.성명, 영어, 수학, 합격여부 from exam a join exam_emp b --io 총 합계 4 + 17 = 21 똑같다???????????????????????????? 
on a.수험번호 = b.수험번호

--@@trancount 트랜잭션 횟수를 셈
use LSM
select * from tst1

begin tran
update tst1
set city = '부산'
where city = '서울'
select @@TRANCOUNT -- 1
commit
select @@TRANCOUNT -- 0


--트랜잭션 save tran
insert tst1 values('대전')


begin tran
save tran savepoint1 --세이브 지정1
delete tst1
where city = '대전'

save tran savepoint2 --세이브 지정 2
delete tst1
where city = '부산'

rollback tran savepoint1 --세이브 지정 1로 복구
select * from tst1


--트랜잭션 잠금 정보 보기
sp_lock @@spid

select DB_NAME(5), DB_NAME(1),DB_NAME(32767) --dbid 데이터 베이스 이름


select OBJECT_NAME(1467152272)

--트랜잭션 고립화 수준
--read uncommitted < read committed < repeatable read < serializable
--read uncommitted (트랜잭션 중에도 데이터 읽음)
-- read committed 일반적인 트랜잭션
-- repeatable read : select문에서는 select 끝날 때 까지 잠금이지만, 이 것을 하면 트랜잭션이 끝날 때 까지 잠금을 유지
--  serializable : 1,2,4,5라는 키값이 존재하면 repeatable read에서는 1,2,4,5 값만 잠금하지만, serializable은 없는 값(3)도 잠금을 유지한다.
--예시
--데이블 수정
--select * from tst1
--delete tst1
--where city = '대전'
--insert tst1 (city) values('서울')
--insert tst1 (city) values('대전')
--insert tst1 (city) values('대구')
--insert tst1 (city) values('부산')
--insert tst1 (city) values('인천')
SET TRANSACTION ISOLATION LEVEL read committed
begin tran
update tst1
set city = '대구'
where city = '대전'
SELECT @@TRANCOUNT
rollback
select * from tst1 with (readcommitted)

sp_who

--뷰
--뷰 만들기
select * from exam_emp
select * from neis

create view neisView
as
select 학교코드, 학교명, 주소, 전화번호 from neis

select * from neisView

create view examview
as
select 수험번호, 성명, 합격여부 from exam_emp
select * from examview

create view examview2
as
select 수험번호, 성명, 합격여부,cast(주소 as nchar(6)) from exam_emp
----컬럼 이름이 없어서 오류 발생


create view examview2([수험번호],[성명],[합격여부],[주소])
as
select 수험번호, 성명, 합격여부,cast(주소 as nchar(6)) from exam_emp
select * from examview2


--뷰 고치기
alter view neisView
as
select 학교코드, left(학교명,4) as 학교명 , 주소, 전화번호 from neis
select * from neisView

alter view examview
as
select 수험번호, 성명, 합격여부, 주소 from exam_emp
select * from examview

create view dbo.examview
as
select 수험번호, 성명, 합격여부, 주소 from exam_emp

--뷰 지우기
drop view dbo.neisView
drop view dbo.examview2

sp_help examview
sp_depends examview ---의존성 검사

select * from exam_emp
where 성명='홍길동'

-- 뷰데이터 추가
insert examview values(1234,'홍길동',1,'충남')
select * from examview

-- 뷰데이터 수정
update examview
set 수험번호 = 123456
where 성명 = '홍길동'
select * from examview

-- 두개 테이블 조인한 것을 뷰로 만들기
create view examview2
as
select a.수험번호, a.성명, b.합격여부, a.영어, a.수학 from exam a join exam_emp b
on a.수험번호 = b.수험번호
select * from examview2

--with check option 뷰 범위 설정 체크
select * from exam_emp
create view examview3
as
select 수험번호, 성명, 합격여부 from exam_emp
where 합격여부 = 1

select * from examview3
update examview3
set 합격여부 = 0
where 성명 = '홍길동'


create view examview4
as
select 수험번호, 성명, 합격여부 from exam_emp
where 합격여부 = 1
with check option

select * from examview4


update examview4
set 합격여부 = 0
where 성명 = '홍길동' --- 수정이 안된다.

select * from exam_emp

update exam_emp
set 합격여부 = 1
where 성명 = '홍길동'


--시스템 뷰
select * from INFORMATION_SCHEMA.VIEWS  -------시스템에 있는 뷰를 불러온다.


--프로시져
alter proc Psum
@a int, @b int
as
declare @sum int
set @sum = @a + @b
select @sum

exec Psum 1000 , 13


create proc test1
as
select 수험번호, 성명 from exam
where 영어 >=60 and 수학 >= 60
order by 수험번호

exec test1

alter proc test1  --프로시져 수정
as
select 수험번호, 성명 from exam
where 영어 >=60 and 수학 >= 60
order by 수험번호
set nocount on

exec test1

create proc test2
@a int
as
set nocount on
select 수험번호, 성명 from exam
where 영어 >= @a


exec test2 90


alter proc test2
@a int, @b int output
as
set nocount on
select 수험번호, 성명 from exam
where 영어 >= @a
select @b = @@ROWCOUNT

declare @r int
set @r = 0
exec test2 80, @r output -- 값 반환 ex) c의 return하고 비슷.
select @r

alter proc Psum
@a int, @b int
as
declare @sum int
set @sum = @a + @b*2
select @sum



create proc test3 -----return 사용
@a int
as
set nocount on
select 수험번호, 성명 from exam
where 영어 >= @a
return @@rowcount

declare @r int
exec @r = test3 60
select @r

--프로스져 서버 시작시 자동 시작
sp_procoption test1, startup, true

--프로시저가 재컴파일 하도록 실행
alter proc test3
@a int
with recompile ---------------------------------- 실행 할 때 마다 컴파일 실행
as
set nocount on
select 수험번호, 성명 from exam
where 영어 >= @a
return @@rowcount

--	With recompile
exec test1 with recompile -- 컴파일 후 실행



--트리거
--트리거 만들기
select * from exam
select * from exam_emp

--exam_emp에 정보가 입력되면 자동으로 exam에 등록하는 트리거
CREATE TRIGGER examin
on exam_emp
for insert -- after insert와 같다
as
insert exam (부서, 성명, 학력, 전형구분, 수험번호)
select 부서, 성명, 학력, 전형구분, 수험번호 from inserted --inserted에 데이터 임시 저장하여 값을 전달

insert exam_emp (부서, 성명, 학력, 전형구분, 수험번호)values ('부서','홍길동','대졸','수시',123456)
insert exam_emp (성명, 수험번호) values ('김길동',12345)

select * from exam

select * from exam_emp

create table testTrigger1
(
id int not null, 성명 nchar(10), 주소 nchar(10), 생년월 int
)

create table testTrigger2
(
성명 nchar(10), 생년월 int
)

create trigger testT
on testTrigger1
for insert
as
insert testTrigger2(성명, 생년월) select 성명, 생년월 from inserted

insert testTrigger1 values(1,'이', '서울',980521)
select * from testTrigger1
select * from testTrigger2

-- 사용자 함수
--사용자 함수 만들기
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
--사용자 함수 수정
alter function fnDateGap (@a int, @b datetime)
returns datetime
as
begin
return dateadd(dd,@a,@b)
end

select DATEADD(dd,3,'2019.05.21')
select dbo.fnDateGap(3,'2019.05.21')

--사용자 함수 삭제
drop function fnDateGap


--커서
--커서 예제 테이블

CREATE TABLE MY_FRIEND(
NAME NVARCHAR(20),
AGE NUMERIC(3)
)

INSERT INTO MY_FRIEND(NAME,AGE)VALUES('홍길동',20)
INSERT INTO MY_FRIEND(NAME,AGE)VALUES('홍길순',25)
INSERT INTO MY_FRIEND(NAME,AGE)VALUES('김철수',22)
INSERT INTO MY_FRIEND(NAME,AGE)VALUES('김민수',27)

----- 조회할 컬럼을 담을 변수 선언
declare @name nchar(4), @age int


--커서선언
declare cur cursor
for
select name,age from MY_FRIEND

--커서 오픈
open cur
--select @@CURSOR_ROWS

--커서 fetch
fetch next from cur into @name, @age
--select @@FETCH_STATUS


while @@FETCH_STATUS = 0 --@@FETCH_STATUS = 0 이면 값을 정상적으로 가져옴, -1이면 실패
begin
update MY_FRIEND
set AGE = @age + 1
where name = @name
fetch next from cur into @name, @age
end

select @@FETCH_STATUS -- 반복문 종료 -1값 표시
close cur -- 커서 닫기
deallocate cur --커서 종료

select * from MY_FRIEND


drop table testCursor
create table testCursor
(
id int, 업뎃가능 int
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
select id, 업뎃가능 from testCursor

open testCur
fetch next from testCur into @idnum, @up
while @@FETCH_STATUS = 0 --@@FETCH_STATUS = 0 이면 값을 정상적으로 가져옴, -1이면 실패
begin
update testCursor
set id = @idnum + 10
where id = @idnum and @up = 1
select * from testCursor
fetch next from testCur into @idnum, @up
end


close testCur -- 커서 닫기
deallocate testCur --커서 종료

select * from testCursor

--전체텍스트 색인
--카탈로그 만들기
create fulltext catalog Cexam
-- 전체 텍스트 인덱스 만들기
create fulltext index on Iexam
(
	mall_body LANGUAGE [korean]
)
-- 이 버전에서는 오류가 발생

