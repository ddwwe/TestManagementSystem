Drop table Test_taker  purge;
create table Test_taker
( SlateNo number(20) primary key,
  MName varchar2(10) not null,
  SubjectNo number(5) REFERENCES TestInfo(SubjectNo),
  Obstacle varchar2(200),
  PlaceNo number(5) REFERENCES Place(PlaceNo));
  
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