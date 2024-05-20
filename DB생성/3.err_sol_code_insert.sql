insert into ERR_TABLE values (100, 'human error');
insert into ERR_TABLE values (200, 'measuring environment error');
insert into ERR_TABLE values (300, 'material error');
insert into ERR_TABLE values (400, 'machine error');


insert into SOL_TABLE values(101, 'restart wafer cleaning');
insert into SOL_TABLE values(102, 'reset measurement position');


insert into SOL_TABLE values(201, 'check temperature');
insert into SOL_TABLE values(202, 'humidity');

insert into SOL_TABLE values(301, 'discard wafer');
insert into SOL_TABLE values(302, 'reorder wafer');
insert into SOL_TABLE values(303, 'restart wafer cutting');

insert into SOL_TABLE values (401, 'realign laser cavity'); 
insert into SOL_TABLE values (402, 'adjust wavelength of laser');
insert into SOL_TABLE values (403, 'adjust laser beam power');
insert into SOL_TABLE values (404, 'check transfomer');
insert into SOL_TABLE values (405, 'reboot system');

