create table member(
	user_id varchar(20) PRIMARY KEY,
	user_pw varchar(30)
);


create table default_data(
	section NUMBER primary key,
	value NUMBER
);

create table err_Table(
	err_Code number,
	err_Msg varchar2(50)
	);
	
alter table err_Table add constraint pk_err primary key(err_Code);

create table sol_Table(
	sol_Code number,
	sol_Msg varchar2(50)
	);
	
alter table sol_Table add constraint pk_sol primary key(sol_Code);

create table err_Log(
	wafer_No number,
	wafer_Sec number,
	err_Code number,
	sol_Code number
	);
	
alter table err_Log add constraint pk_log primary key(wafer_No, wafer_Sec);

alter table err_Log add constraint fk_err foreign key(err_Code) references err_table(err_code);

alter table err_Log add constraint fk_sol foreign key(sol_Code) references sol_table(sol_code);


 create table WAFER(
 	WAFER_NO number primary key,
 	section1 number,
 	section2 number,
 	section3 number,
 	section4 number,
 	section5 number,
 	section6 number,
 	section7 number,
 	section8 number,
 	section9 number,
 	section10 number,
 	section11 number,
 	section12 number,
 	section13 number,
 	section14 number,
 	section15 number,
 	section16 number,
 	section17 number,
 	section18 number,
 	section19 number,
 	section20 number,
 	section21 number,
 	section22 number,
 	section23 number,
 	section24 number,
 	section25 number,
  abnormal varchar(2)
 );


