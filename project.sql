Drop table Test_taker  purge;
create table Test_taker
( SlateNo number(20) primary key,
  MName varchar2(10) not null,
  SubjectNo number(5) REFERENCES TestInfo(SubjectNo),
  Obstacle varchar2(200),
  PlaceNo number(5) REFERENCES Place(PlaceNo));

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
  /***********************************************************************/
  
  insert into
