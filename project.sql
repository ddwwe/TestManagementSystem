  select *
  from tab;

/* ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� */
select *
from Qualification;
/* ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� ���� */

/* ����� ����� ����� ����� ����� ����� ����� ����� ����� ����� ����� ����� */
select *
from EXAMINEE;

Drop table EXAMINEE  purge;

create table EXAMINEE
  (eId varchar2(20) primary key,
  ePw varchar2(20) not null,
  eName varchar2(20) not null,
  eBirth date not null,
  eEmail varchar2(40) not null,
  ePhone varchar2(15) not null,
  ePost varchar2(8) not null,
  eAddr1 varchar2(100) not null,
  eAddr2 varchar2(100) not null,
  ePath varchar2(100) not null);
/* ����� ����� ����� ����� ����� ����� ����� ����� ����� ����� ����� ����� */

/* ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ */
  select *
  from TEST_IDENTIFICATION_SLIP;
  
  desc TEST_IDENTIFICATION_SLIP;
  
  Drop table TEST_IDENTIFICATION_SLIP  purge;
  create table TEST_IDENTIFICATION_SLIP
  (eNo varchar2(14) primary key,
  qCode number(4) references Qualification(qCode) not null,
  eId varchar2(20)references EXAMINEE(eId) not null);
/* ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ */

/* ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ */
create table Supervisor
  (ssId varchar2(20) primary key,
  sPw varchar2(20) not null,
  sName varchar2(20) not null,
  sGroup varchar2(100) not null,
  sPhone varchar2(15) not null,
  sPost varchar2(8) not null,
  sAddr1 varchar2(100) not null,
  sAddr2 varchar2(100) not null,
  sBirth date not null,
  sPath varchar2(100) not null);

  insert into Supervisor (ssId, sPw, sName, sGroup, sPhone, sPost, sAddr1, sAddr2, sBirth, sPath)
  values ('20011', '1234', 'ȫ����', '���ִ��б� ��ǻ�Ͱ��к�', '010-9877-3688', '36554', '����� ������ ����2��', '���־���Ʈ', '82/05/02', '123');
  commit;
  update Supervisor
  set spost='34568'
  where ssid='20013';
/* ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ */

/* ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ */
select *
from EXAM_MANAGER;

  Drop table region  purge;
  create table EXAM_MANAGER
  (mId varchar2(20) primary key,
   mPw varchar2(20) NOT NULL);
   
   insert into EXAM_MANAGER (mId, mPw)
   values ('1234', '1234');
/* ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ ������ */

/* �ʱ��հݿ��� �ʱ��հݿ��� �ʱ��հݿ��� �ʱ��հݿ��� �ʱ��հݿ��� �ʱ��հݿ��� �ʱ��հݿ��� */
Drop table Written_pass  purge;

create table Written_pass
( eId VARCHAR2(20) references EXAMINEE(eId) NOT NULL,
  qCode NUMBER(4) references Qualification(qCode) NOT NULL,
  wpDate DATE NOT NULL);
/* �ʱ��հݿ��� �ʱ��հݿ��� �ʱ��հݿ��� �ʱ��հݿ��� �ʱ��հݿ��� �ʱ��հݿ��� �ʱ��հݿ��� */

/* �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� */
create table Write_Subject
( qCode NUMBER(4) references Qualification(qCode) NOT NULL,
  wsName VARCHAR2(40) NOT NULL);
  
delete Write_Subject
where qcode = '1900';

insert into Write_Subject
values (1511, '������� �� ��');

select *
from Write_Subject
order by 1;

select a.WSNAME
from (select wsname from WRITE_SUBJECT where qcode = '1320') a, (select wsname from WRITE_SUBJECT where qcode = '1322') b
where a.WSNAME = b.WSNAME;
/* �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� �ʱ���� */

/* �������� �������� �������� �������� �������� �������� �������� �������� �������� �������� */
select *
from Test_Schedule; 

create table Test_Schedule
( tsNo number(4) primary key,
  tsTitle VARCHAR2(40) NOT NULL,
  tpDate DATE NOT NULL);

insert into Test_Schedule
values (1603, '3�� ������', '16/08/21');

delete Test_Schedule
where TSNO = 1603;
/* �������� �������� �������� �������� �������� �������� �������� �������� �������� �������� */

/* ����_������ ����_������ ����_������ ����_������ ����_������ ����_������ ����_������ ����_������ */
drop table SCHEDULE_SUPERVISOR purge;

create table SCHEDULE_SUPERVISOR
( tsNo NUMBER(4) references TEST_SCHEDULE(tsNo) NOT NULL,
  ssId  VARCHAR2(20) references SUPERVISOR(ssId) NOT NULL,
  S_CODE VARCHAR2(8) references SCHOOL(S_CODE) NOT NULL
);

select *
from SCHEDULE_SUPERVISOR
order by s_code;
/* ����_������ ����_������ ����_������ ����_������ ����_������ ����_������ ����_������ ����_������ */

/* �������� �������� �������� �������� �������� �������� �������� �������� �������� �������� �������� */
drop table PERSONAL_DATA purge;

create table PERSONAL_DATA
( ppNo VARCHAR2(14) references TEST_IDENTIFICATION_SLIP(eNo) primary key,
  pType VARCHAR2(1) NOT NULL,
  pCategory VARCHAR2(4) NOT NULL,
  pSeat VARCHAR2(2) NOT NULL,
  pAttendance VARCHAR2(1) NOT NULL,
  pNote VARCHAR2(200),
  CHECK (pType = 'A' or pType = 'B' and pCategory = '�ʱ�' or pCategory = '�Ǳ�' and pAttendance = 'Y' or pAttendance = 'N')
  );
  
select *
from PERSONAL_DATA;
  
insert into personal_data
values ('5000301001','A','�ʱ�','3','N','23');
/* �������� �������� �������� �������� �������� �������� �������� �������� �������� �������� �������� */


/* ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ */
drop table ERRATA_BOARD purge;

create table ERRATA_BOARD
( bNo NUMBER(10) primary key,
  ssId VARCHAR2(20) references SUPERVISOR(ssId) NOT NULL,
  bContent VARCHAR2(1000) NOT NULL,
  bDate DATE NOT NULL
);

select *
from ERRATA_BOARD;

insert into ERRATA_BOARD
values( 0, '20011', '�� ���� ����ǥ ����� ���Դϴ�', sysdate);
/* ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ ����ǥ */