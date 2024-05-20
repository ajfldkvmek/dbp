alter table SOL_TABLE add err_code number;

update sol_table set err_code = 100
where sol_code = 101;

update sol_table set err_code = 100
where sol_code = 102;

update sol_table set err_code = 200
where sol_code = 201;

update sol_table set err_code = 200
where sol_code = 202;

update sol_table set err_code = 300
where sol_code = 301;

update sol_table set err_code = 300
where sol_code = 302;

update sol_table set err_code = 300
where sol_code = 303;

update sol_table set err_code = 400
where sol_code = 401;

update sol_table set err_code = 400
where sol_code = 402;

update sol_table set err_code = 400
where sol_code = 403;

update sol_table set err_code = 400
where sol_code = 404;

update sol_table set err_code = 400
where sol_code = 405;

alter table sol_table
add constraint sol_err_fk 
foreign key (err_code) references err_table (err_code);
