create table heartpet_adopt_reg (
    adopt_reg_regno number(5) primary key,
    adopt_reg_userno number(5),
    adopt_reg_dogno number(5),
    adopt_reg_regdate date,
    adopt_reg_duedate date,
    adopt_reg_adoptdate date
);

insert into heartpet_adopt_reg values (1, 1, 1, '2022-10-14', '2022-11-10', sysdate);
insert into heartpet_adopt_reg values (2, 2, 2, '2022-10-24', '2022-11-20', sysdate);
insert into heartpet_adopt_reg values (3, 3, 3, '2022-11-01', '2022-11-25', sysdate);