-- 수험생 person : 장애 여부, rpost1~raddr2 : 실제 거주지  
create table examinee 
( id varchar2(20) constraint examinee_id_pk primary key,
  birth date not null,
  nation varchar2(6) constraint examinee_nation_ck check(nation in('내국인', '외국인')),
  sex varchar2(4) constraint examinee_sex_ck check(sex in('남자', '여자')),
  name varchar2(20) not null,
  passwd varchar2(20) not null,
  pw_question varchar2(100) not null,
  pw_answer varchar2(100) not null,
  person varchar2(6) constraint taker_person_ck check(person in('예', '아니요')),
  email varchar2(30) not null,
  post1 varchar2(3) not null,
  post2 varchar2(3) not null,
  addr1 varchar2(100) not null,
  addr2 varchar2(100) not null,
  rpost1 varchar2(3) not null,
  rpost2 varchar2(3) not null,
  raddr1 varchar2(100) not null,
  raddr2 varchar2(100) not null );

  Drop table Place  purge;
  create table Place
( Megalopolis varchar2(200) not null,
  City varchar2(200) not null,
  Place varchar2(200) not null,
  Room varchar2(100) not null,
  PlaceNo number(5) primary key);
  
  Drop table Supervisor  purge;
  create table Supervisor
( SupervisorNo number(20) primary key,
  SupervisorName varchar2(10) not null,
  PlaceNo number(5) REFERENCES Place(PlaceNo));
  
  Drop table Board  purge;
  create table Board
( BoardNo number(20) primary key,
  BoardTitle varchar2(100) not null,
  BoardContent varchar2(1000) not null,
  SupervisorNo number(20) REFERENCES Supervisor(SupervisorNo),
  SubjectNo number(5) REFERENCES TestInfo(SubjectNo));
  
  Drop table TestInfo purge;
  create table TestInfo
( SubjectNo number(5) Primary key,
  Subject varchar2(30) not null,
  TestDate date not null);
  
  create SEQUENCE seq_SlateNo;
  create SEQUENCE seq_PlaceNo;
  create SEQUENCE seq_SupervisorNo;
  create SEQUENCE seq_BoardNo;
  create SEQUENCE seq_SubjectNo;
  
  select *
  from tab;
  
  insert into EXAMINEE
  VALUES ('asdf', '1992-01-01', '내국인', '남자', '킴철쑤', '1234', '비번질문, 답은 a',
           'a', '예', 'asdf@naver.com', '335', '448', '서울 특별시 영등포구 여의도동', '22번지', '335', '448', '서울 특별시 영등포구 여의도동', '22번지');
  commit;
  select
		id,birth, nation, sex, name, passwd, pw_question, pw_answer, person, email,
		post1, post2, addr1, addr2, rpost1, rpost2, raddr1, raddr2
		from examinee
		where id = 'asdf' and passwd='1234';
    
/*새 테이블 새 테이블 새 테이블 새 테이블 새 테이블 새 테이블 새 테이블 새 테이블 새 테이블 새 테이블 새 테이블 새 테이블 새 테이블*/

drop table EXAMINEE purge;

create table EXAMINEE
( eId VARCHAR2(20) CONSTRAINT EXAMINEE_eId_pk PRIMARY KEY,
  ePw VARCHAR2(20) NOT NULL,
  eName VARCHAR2(20) NOT NULL,
  eEmail VARCHAR2(40) NOT NULL,
  ePhone VARCHAR2(15) NOT NULL,
  ePost VARCHAR2(6) NOT NULL,
  eAddr1 VARCHAR2(100) NOT NULL,
  eAddr2 VARCHAR2(100) NOT NULL,
  ePath VARCHAR2(40) NOT NULL);
  
  
  
drop table SUPERVISOR purge;

create table SUPERVISOR
( sId VARCHAR2(20) CONSTRAINT SUPERVISOR_sId_pk PRIMARY KEY,
  sPw VARCHAR2(20) NOT NULL,
  sName VARCHAR2(20) NOT NULL,
  sEmail VARCHAR2(40) NOT NULL,
  sPhone VARCHAR2(15) NOT NULL,
  sPost VARCHAR2(6) NOT NULL,
  sAddr1 VARCHAR2(100) NOT NULL,
  sAddr2 VARCHAR2(100) NOT NULL,
  sPath VARCHAR2(40) NOT NULL);
  
  
  
drop table LICENSE purge;

create table LICENSE
( eId VARCHAR2(20),
  qCode NUMBER,*******
  lDate DATE NOT NULL);
  
  
  
drop table QUALIFICATION purge;

create table QUALIFICATION
( qCode NUMBER,*******
  qName VARCHAR2(40) NOT NULL,
  qFiled VARCHAR2(20) NOT NULL);
  
  
  
drop table SUBJECT purge;

create table SUBJECT
( qCode NUMBER,*******
  sCategory VARCHAR2(4) CONSTRAINT SUBJECT_sCategory_ck CHECK(sCategory in('필기', '실기')),
  subject1 VARCHAR2(40),
  subject2 VARCHAR2(40),
  subject3 VARCHAR2(40),
  subject4 VARCHAR2(40),
  subject5 VARCHAR2(40),
  subject6 VARCHAR2(40));
  
  
  
drop table TEST_PLACE purge;

create table TEST_PLACE
( tpNo NUMBER(5) CONSTRAINT TEST_PLACE_tpNo_pk PRIMARY KEY,
  tpTitle VARCHAR2(100) NOT NULL,
  pNo NUMBER(5) CONSTRAINT TEST_PLACE_pNo_fk REFERENCES PLACE(pNo) NOT NULL,
  tpRoom VARCHAR2(100) NOT NULL,
  tpDate DATE NOT NULL,
  Admission_Time VARCHAR2(20) NOT NULL,
  SUPERVISOR1 VARCHAR2(40) CONSTRAINT TEST_PLACE_SUPERVISOR1_fk REFERENCES SUPERVISOR(sId),
  SUPERVISOR2 VARCHAR2(40) CONSTRAINT TEST_PLACE_SUPERVISOR2_fk REFERENCES SUPERVISOR(sId));
  
  
  
drop table PLACE purge;

create table PLACE
( pNo NUMBER(5) CONSTRAINT TEST_PLACE_pNo_pk PRIMARY KEY,
  pRegion VARCHAR2(100) NOT NULL,
  pCity VARCHAR2(100) NOT NULL,
  pPlace VARCHAR2(100) NOT NULL);
  
  
  
drop table TEST_IDENTIFICATION_SLIP purge;

create table TEST_IDENTIFICATION_SLIP
( eNumber NUMBER(8) CONSTRAINT TEST_IDENTIFICATION_SLIP_eNumber_pk PRIMARY KEY,
  Title VARCHAR2(50) NOT NULL,
  qCode NUMBER CONSTRAINT TEST_IDENTIFICATION_SLIP_qCode_fk REFERENCES QUALIFICATION(qCode) NOT NULL,
  Type VARCHAR2(1) CONSTRAINT TEST_IDENTIFICATION_SLIP_Type_ck CHECK(Type in('필기', '실기')),
  Category VARCHAR2(4) CONSTRAINT TEST_IDENTIFICATION_SLIP_Category_ck CHECK(sCategory in('필기', '실기')),
  tpNo NUMBER(5) CONSTRAINT TEST_IDENTIFICATION_SLIP_tpNo_fk REFERENCES TEST_PLACE(tpNo) NOT NULL,
  Seat VARCHAR2(20) NOT NULL,
  Attendance VARCHAR2(3) CONSTRAINT TEST_IDENTIFICATION_SLIP_Attendance_ck CHECK(Type in('YES', 'NO')));