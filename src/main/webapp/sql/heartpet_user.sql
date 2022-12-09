create table heartpet_user(
    user_no varchar2(10) primary key, 
    user_id varchar2(20) unique, 
    user_pwd varchar2(30),
    user_name varchar2(20),
    user_grade varchar2(20) default 'user',
    user_email varchar2(50),
    user_phone varchar2(30),
    user_addr varchar2(100),
    user_image varchar2(1000),
    user_totalprice number default 0,
    user_animalexp varchar2(2)
);

insert into heartpet_user values
('1', 'admin', '1234', '관리자', 1, 'admin@naver.com', '010-1111-1111', '광주광역시 광산구 이등대로', '', 0, 'Y');
insert into heartpet_user values
('2', 'user', '1234', '더미씨', 3, 'user@naver.com', '010-2222-2222', '서울시 강동구 명일동', '', 0, 'N');
insert into heartpet_user values
('3', 'user1', '1234', '아몬드', 3, 'almond@naver.com', '010-3333-3333', '서울시 강남구 테헤란로', '', 0, 'Y');