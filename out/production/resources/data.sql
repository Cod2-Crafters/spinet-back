select 1;
select 2;
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't0@t0.com', 'BASIC', NULL, now(), 't0@t0.com', '000-0000-0000', 't0', 't0shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't1@t1.com', 'BASIC', NULL, now(), 't1@t1.com', '111-1111-1111', 't1', 't1shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't2@t2.com', 'BASIC', NULL, now(), 't2@t2.com', '222-2222-2222', 't2', 't2shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't3@t3.com', 'BASIC', NULL, now(), 't3@t3.com', '333-3333-3333', 't3', 't3shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't4@t4.com', 'BASIC', NULL, now(), 't4@t4.com', '444-4444-4444', 't4', 't4shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't5@t5.com', 'BASIC', NULL, now(), 't5@t5.com', '555-5555-5555', 't5', 't5shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't6@t6.com', 'BASIC', NULL, now(), 't6@t6.com', '666-6666-6666', 't6', 't6shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't7@t7.com', 'BASIC', NULL, now(), 't7@t7.com', '777-7777-7777', 't7', 't7shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't8@t8.com', 'BASIC', NULL, now(), 't8@t8.com', '888-8888-8888', 't8', 't8shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't9@t9.com', 'BASIC', NULL, now(), 't9@t9.com', '999-9999-9999', 't9', 't9shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't10@t10.com', 'BASIC', NULL, now(), 't10@t10.com', '111-1111-1111', 't10', 't10shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't11@t11.com', 'BASIC', NULL, now(), 't11@t11.com', '111-1111-1111', 't11', 't11shop');
# insert into MEMBER (created_at, description, email, login_type, logo_path, modified_at, password, phone, real_name,
#                     shop_name)
# values (now(), 'test', 't12@t12.com', 'BASIC', NULL, now(), 't12@t12.com', '111-1111-1111', 't12', 't12shop');

insert into FOLLOW(follower_id, following_id, created_at)
values (1, 2, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (1, 3, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (1, 4, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (1, 5, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (1, 6, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (2, 3, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (2, 4, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (2, 5, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (2, 1, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (3, 1, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (4, 1, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (5, 1, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (6, 1, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (7, 1, now());
insert into FOLLOW(follower_id, following_id, created_at)
values (8, 1, now());