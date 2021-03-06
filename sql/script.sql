create database goodsims ;
use goodsims;
create table admin
(
    aid       char(16) not null,
    apassword char(32) null,
    constraint admin_aid_uindex
        unique (aid)
);

alter table admin
    add primary key (aid);

create table customer
(
    cid       char(16)  not null,
    cpassword char(32)  null,
    cname     char(10)  null,
    cnickname char(128) null,
    csex      char(8)   null,
    constraint customer_cid_uindex
        unique (cid)
);

alter table customer
    add primary key (cid);

create table employee
(
    eid        char(16)                 not null,
    epassword  char(32)                 null,
    eaddress   char(255) default '-'    null,
    esex       char(8)   default 'male' null,
    ename      char(10)  default '-'    null,
    estorename char(128) default '-'    null,
    ephone     char(64)  default '-'    null,
    constraint employee_eid_uindex
        unique (eid)
);

alter table employee
    add primary key (eid);

create table goodsc
(
    gcategory char(32) not null,
    constraint goodsc_gcategory_uindex
        unique (gcategory)
);

alter table goodsc
    add primary key (gcategory);

create table goods
(
    eid       char(16)     not null,
    gid       char(32)     not null,
    gcategory char(32)     null,
    gname     char(32)     null,
    gprice    double(8, 2) null,
    ginprice  double(8, 2) null,
    gnum      int          null,
    gdescribe char(255)    null,
    gvip      char(4)      null,
    gdate     date         null,
    primary key (eid, gid),
    constraint goods_employee_eid_fk
        foreign key (eid) references employee (eid)
            on update cascade on delete cascade,
    constraint goods_goodsc_gcategory_fk
        foreign key (gcategory) references goodsc (gcategory)
            on update cascade on delete cascade
);

create index goods_gid_index
    on goods (gid);

create table myfocus
(
    cid char(16) not null,
    eid char(16) not null,
    primary key (cid, eid),
    constraint myfocus_customer_cid_fk
        foreign key (cid) references customer (cid)
            on update cascade on delete cascade,
    constraint myfocus_employee_eid_fk
        foreign key (eid) references employee (eid)
            on update cascade on delete cascade
);

create table raddress
(
    cid   char(16)  not null,
    rname char(255) not null,
    radd  char(255) not null,
    primary key (cid, rname, radd),
    constraint raddress_customer_cid_fk
        foreign key (cid) references customer (cid)
            on update cascade on delete cascade
);

create index raddress_cid_index
    on raddress (cid);

create table shoppingcart
(
    cid char(16) not null,
    eid char(16) not null,
    gid char(32) not null,
    primary key (cid, eid, gid),
    constraint shoppingcart_ibfk_1
        foreign key (cid) references customer (cid)
            on update cascade on delete cascade,
    constraint shoppingsart_goods_eid_fk
        foreign key (eid) references goods (eid)
            on update cascade on delete cascade,
    constraint shoppingsart_goods_gid_fk
        foreign key (gid) references goods (gid)
            on update cascade on delete cascade
);

create table ticket
(
    oid        char(16)      not null,
    cid        char(16)      not null,
    rname      char(32)      null,
    tdate      datetime      null,
    tpay       double(12, 2) null,
    tisdelivey char(4)       null,
    tispay     char(4)       null,
    tisover    char(4)       null,
    tisdelete  char(4)       null,
    primary key (oid, cid),
    constraint ticket_oid_uindex
        unique (oid),
    constraint ticket_customer_cid_fk
        foreign key (cid) references customer (cid)
            on update cascade on delete cascade
);

create table myorder
(
    oid  char(16) not null,
    gid  char(32) not null,
    eid  char(16) null,
    mnum int      null,
    primary key (oid, gid),
    constraint myorder_ticket_oid_fk
        foreign key (oid) references ticket (oid)
            on update cascade on delete cascade
);

create index order_goods_eid_fk
    on myorder (eid);

create table vip
(
    cid       char(16) not null,
    vcategory char(8)  null,
    vindate   date     null,
    voutdate  date     null,
    vstatus   char(4)  null,
    constraint table_name_cid_uindex
        unique (cid),
    constraint table_name_customer_cid_fk
        foreign key (cid) references customer (cid)
            on update cascade on delete cascade
);

alter table vip
    add primary key (cid);


INSERT INTO goodsims.admin (aid, apassword) VALUES ('admin', 'admin');

INSERT INTO goodsims.customer (cid, cpassword, cname, cnickname, csex) VALUES ('15875195553', '123456a', null, null, null);
INSERT INTO goodsims.customer (cid, cpassword, cname, cnickname, csex) VALUES ('15876195553', '123456a', null, null, null);
INSERT INTO goodsims.customer (cid, cpassword, cname, cnickname, csex) VALUES ('19129214652', '123456a', '??????1', 'aaaa', 'fmale');

INSERT INTO goodsims.employee (eid, epassword, eaddress, esex, ename, estorename, ephone) VALUES ('15875195553', '123456a', '??????????????????', 'male', '??????1', '??????1', '15875195553');
INSERT INTO goodsims.employee (eid, epassword, eaddress, esex, ename, estorename, ephone) VALUES ('19129214652', '123456a', '??????????????????', 'fmale', '??????2', '????????????2', '19129214652');

INSERT INTO goodsims.goodsc (gcategory) VALUES ('-???-');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('????????????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('????????????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('????????????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('????????????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('????????????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('????????????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('?????????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('????????????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('?????????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('??????');

INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '348872347934', '????????????', '??????AUBY ?????????????????????', 1, 30, 0, '??????AUBY ?????????????????????????????????????????????????????????0-6-12??????0-1????????????5pcs????????????????????????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '348879633934', '??????', '?????????Microsoft??? Xbox', 2169, 2000, 100, '?????????Microsoft??? Xbox Series S X xs ??????????????? ????????????????????????????????? Xbox Series S???????????? ??????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '348879667934', '????????????', '???????????????OPPLE???', 19.9, 15.9, 96, '???????????????OPPLE???led???????????????????????????????????????????????????12???????????????????????????????????????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '462346742135', '????????????', '?????????CONFU???????????????', 88, 80, 100, ' ?????????CONFU??????????????????????????????2300W????????? ????????????????????????????????????????????????????????????????????? KF-8905', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '586854975364', '??????', 'FIIL CC Pro?????????????????????????????????', 359, 330, 100, 'FIIL CC Pro??????????????????????????????????????????????????????????????? ?????????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '788654655673', '??????', '????????????Goldlion) ????????????????????????????????????', 890, 800, 100, '????????????Goldlion) ????????????????????????????????????????????????????????????????????????????????? ??? FA118363-511A ?????????????????????????????????????????????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '874467865435', '??????', '????????????????????????', 149, 139, 96, '???????????????????????? 750g/30??? ?????????????????????????????????????????????????????????????????????????????????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '896486538975', '??????', '?????? ??????', 19.9, 15.9, 91, ' ?????? ???????????????????????? ????????????????????????????????????????????????????????????????????????????????????10??????45cm??? ??????', 'no', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '89764654802', '??????', '????????? ????????????????????????', 99, 89, 99, '???????????????????????? ???????????????????????? ???????????????????????????????????????????????????????????????????????????????????????????????? 1063??????+???????????????/??????/????????? 32?????????2???5?????????140-150??????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '983347801243', '??????', '???????????? ?????????????????????', 189, 169, 100, '???????????? ?????????????????????12???61?????????????????????????????????????????????????????????????????????????????????1450g??????????????????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '986475357532', '??????', '??????????????????15?????????42???????????????', 829, 788, 100, '??????????????????15?????????42???????????????450ml???????????????????????????????????? ?????????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '986576765452', '??????', '??????????????????????????????', 100, 89, 100, ' ??????????????????????????????????????????12?????? [7-10???]', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '987546542434', '??????', '??????(Lenovo)??????510Pro???????????????????????????', 4699, 4300, 95, '??????(Lenovo)??????510Pro?????????????????????????????????(12???i5-12400 16G 1T+256G SSD win11)23??????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '987567865452', '??????', '???????????????', 132.8, 120, 98, '????????????????????????????????? ???6??? ??????????????? ????????? ???????????? ???????????????????????? ???????????????????????? [8-14???] [7-14???]', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '98757754688643', '??????', '????????????BOZLUN?????????????????????', 199, 189, 100, '????????????BOZLUN?????????????????????????????????????????????????????????????????????????????????????????? ??????', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('19129214652', '9832312801243', '??????', '??????????????? ?????????????????????????????????', 49.8, 39, 100, ' ??????????????? ????????????????????????????????????????????????????????????????????????????????? ??????1 ???3???3???78??????1?????????+2????????????', 'yes', null);

INSERT INTO goodsims.myfocus (cid, eid) VALUES ('15875195553', '15875195553');
INSERT INTO goodsims.myfocus (cid, eid) VALUES ('19129214652', '15875195553');

INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206090043534652', '19129214652', '?????????15875195553', '2022-06-09 00:44:01', 19.9, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206090054084652', '19129214652', '?????????15875195553', '2022-06-09 00:54:09', 4699, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206090913364652', '19129214652', '?????????15875195553', '2022-06-09 09:13:38', 22.5, 'no', 'no', 'no', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206090913514652', '19129214652', '?????????15875195553', '2022-06-09 09:13:53', 149, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206091624334652', '19129214652', '?????????15875195553', '2022-06-09 16:24:38', 1.38, 'yes', 'yes', 'no', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206091627414652', '19129214652', '11', '2022-06-09 16:27:47', 82.49, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206091632494652', '19129214652', '?????????15875195553', '2022-06-09 16:33:07', 2.4, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206091633254652', '19129214652', '11', '2022-06-09 16:33:27', 99, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206142250594652', '19129214652', '?????????19129214652', '2022-06-14 22:51:35', 8.76, 'yes', 'yes', 'yes', 'yes');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206222330084652', '19129214652', '?????????15875195553', '2022-06-22 23:30:14', 4718.9, 'yes', 'yes', 'no', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206230104274652', '19129214652', '11', '2022-06-23 01:07:25', 19.9, 'no', 'no', 'no', 'no');

INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206090043534652', '896486538975', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206090054084652', '987546542434', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206090913364652', '234689065433', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206090913514652', '874467865435', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206091624334652', '234689065433', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206091627414652', '234689065433', '15875195553', 5);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206091627414652', '896486538975', '15875195553', 4);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206091632494652', '234689065433', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206091632494652', '896486538975', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206091633254652', '89764654802', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206142250594652', '348872347934', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206142250594652', '348879667934', '15875195553', 2);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206222330084652', '348879667934', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206222330084652', '987546542434', '15875195553', 1);
INSERT INTO goodsims.myorder (oid, gid, eid, mnum) VALUES ('2206230104274652', '348879667934', '15875195553', 1);

INSERT INTO goodsims.raddress (cid, rname, radd) VALUES ('19129214652', '11', '1');
INSERT INTO goodsims.raddress (cid, rname, radd) VALUES ('19129214652', '231233123', '3123');
INSERT INTO goodsims.raddress (cid, rname, radd) VALUES ('19129214652', '?????????15875195553', '??????????????????');
INSERT INTO goodsims.raddress (cid, rname, radd) VALUES ('19129214652', '?????????19129214652', '??????????????????');

INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '348872347934');
INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '348879667934');
INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '89764654802');
INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '987546542434');
INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '987567865452');
INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '98757754688643');

INSERT INTO goodsims.vip (cid, vcategory, vindate, voutdate, vstatus) VALUES ('19129214652', 'month', '2022-06-09', '2022-07-09', 'yes');