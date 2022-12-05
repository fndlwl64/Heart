create table heartpet_support (
    support_no number(5) primary key,
    support_userno number(10),
    support_price number(20),
    support_date date
);

insert into heartpet_support values (1, 1, 10000, '2022-11-11');
insert into heartpet_support values (2, 2, 50000, '2022-11-04');
insert into heartpet_support values (3, 1, 100000, '2022-10-30');