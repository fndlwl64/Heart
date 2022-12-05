create table heartpet_adopt_exp(
    adopt_exp_userno varchar2(10) primary key,
    adopt_exp_exp varchar2(2) not null,
    adopt_exp_currenthave varchar2(2) not null,
    adopt_exp_dogno varchar2(20)
);

insert into heartpet_adopt_exp values
('2', 'N', 'N', NULL);
insert into heartpet_adopt_exp values
('3', 'Y', 'Y', '1');

COMMIT;
