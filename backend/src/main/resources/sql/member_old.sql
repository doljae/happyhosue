use happyhouse;


create table member3 (
 id varchar(30) NOT NULL primary key,
  name varchar(30) NOT NULL,  
  pass varchar(50) NOT NULL,
  tel varchar(30) NOT NULL
) ;

insert into member3(id,name,pass,tel)  values( 'yoojeong97','박유정','yoo123','01074843800');
insert into member3(id,name,pass,tel)  values( 'yoojeong972','박유정1','yoo123','01074843800');
insert into member3(id,name,pass,tel)  values( 'yoojeong927','박유정2','yoo123','01074843800');

select *
from member;