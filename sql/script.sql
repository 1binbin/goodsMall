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
INSERT INTO goodsims.customer (cid, cpassword, cname, cnickname, csex) VALUES ('19129214652', '123456a', '顾客1', 'aaaa', 'fmale');

INSERT INTO goodsims.employee (eid, epassword, eaddress, esex, ename, estorename, ephone) VALUES ('15875195553', '123456a', '广东省广州市', 'male', '商家1', '测试1', '15875195553');
INSERT INTO goodsims.employee (eid, epassword, eaddress, esex, ename, estorename, ephone) VALUES ('19129214652', '123456a', '广东省揭阳市', 'fmale', '商家2', '测试店铺2', '19129214652');

INSERT INTO goodsims.goodsc (gcategory) VALUES ('-空-');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('个人清洁');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('二手');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('农贸绿植');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('医药保健');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('厨具');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('图书');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('女装');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('女鞋');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('安装');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('宠物');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('家具');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('家居');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('家用电器');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('家装');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('户外');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('房产');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('手机');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('教育');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('数码');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('文娱');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('母婴');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('汽车');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('汽车用品');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('清洗');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('特产');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('玩具乐器');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('珠宝');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('生鲜');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('电子书');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('电脑');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('男装');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('男鞋');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('礼品鲜花');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('童装');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('箱包');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('维修');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('美妆');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('艺术');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('运动');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('运营商');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('酒类');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('钟表');
INSERT INTO goodsims.goodsc (gcategory) VALUES ('食品');

INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '348872347934', '玩具乐器', '澳贝AUBY 婴儿童牙胶玩具', 1, 30, 0, '澳贝AUBY 婴儿童牙胶玩具男女孩摇铃宝宝新生儿玩具0-6-12个月0-1岁放心煮5pcs马卡龙新配色礼物', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '348879633934', '电脑', '微软（Microsoft） Xbox', 2169, 2000, 100, '微软（Microsoft） Xbox Series S X xs 新世代主机 家用家庭高清电视游戏机 Xbox Series S【日版】 主机', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '348879667934', '家用电器', '欧普照明（OPPLE）', 19.9, 15.9, 96, '欧普照明（OPPLE）led吸顶灯改造灯板圆形节能灯泡灯条贴片12瓦白光替换灯盘光源灯珠灯管', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '462346742135', '个人清洁', '康夫（CONFU）电吹风机', 88, 80, 100, ' 康夫（CONFU）电吹风机家用大功率2300W吹风筒 恒温护发理发店发廊款大风力速干冷热风速干电风筒 KF-8905', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '586854975364', '数码', 'FIIL CC Pro主动降噪真无线蓝牙耳机', 359, 330, 100, 'FIIL CC Pro主动降噪真无线蓝牙耳机苹果华为小米手机通用 深空灰', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '788654655673', '箱包', '金利来（Goldlion) 公文包头层牛皮休闲手提包', 890, 800, 100, '金利来（Goldlion) 公文包头层牛皮休闲手提包时尚男包横款电脑包大容量商务包 黑 FA118363-511A 生日礼物送男友老公爸爸朋友送礼', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '874467865435', '食品', '三只松鼠每日坚果', 149, 139, 96, '三只松鼠每日坚果 750g/30袋 送礼坚果礼盒零食大礼包孕妇混合干果夏威夷果核桃仁开心果', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '896486538975', '家装', '富居 墙纸', 19.9, 15.9, 91, ' 富居 墙纸自粘白色墙贴 带背胶墙壁贴纸自粘防水防潮客厅寝室卧室旧家具衣柜翻新贴纸10米长45cm宽 白色', 'no', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '89764654802', '男装', '颂乐牛 夏季薄款休闲裤男', 99, 89, 99, '【两条装】颂乐牛 夏季薄款休闲裤男 弹力直筒宽松商务韩版潮流微修身百搭时尚速干冰丝松紧腰系带两用长裤 1063黑色+黑色【薄款/微弹/速干】 32码【（2尺5）体重140-150斤】', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '983347801243', '食品', '良品铺子 纯肉零食大礼包', 189, 169, 100, '良品铺子 纯肉零食大礼包12袋61礼物端午送礼节日送礼宅家零食牛肉干肉干肉脯休闲零食礼盒1450g多版本随机发', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '986475357532', '酒类', '白云边十五年15年陈酿42度高度白酒', 829, 788, 100, '白云边十五年15年陈酿42度高度白酒450ml浓酱兼香型固态发酵整箱装 整箱装', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '986576765452', '图书', '国家地理儿童百科全书', 100, 89, 100, ' 国家地理儿童百科全书（套装共12册） [7-10岁]', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '987546542434', '电脑', '联想(Lenovo)天逸510Pro个人商务台式机电脑', 4699, 4300, 95, '联想(Lenovo)天逸510Pro个人商务台式机电脑整机(12代i5-12400 16G 1T+256G SSD win11)23英寸', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '987567865452', '图书', '追梦的孩子', 132.8, 120, 98, '长青藤国际大奖小说书系 全6册 追梦的孩子 吹号手 儿童文学 三四五六年级必读 中小学生课外阅读 [8-14岁] [7-14岁]', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('15875195553', '98757754688643', '钟表', '博之轮（BOZLUN）运动智能手表', 199, 189, 100, '博之轮（BOZLUN）运动智能手表蓝牙通话心率监测来电提醒多功能防水男女智能手表 黑色', 'yes', null);
INSERT INTO goodsims.goods (eid, gid, gcategory, gname, gprice, ginprice, gnum, gdescribe, gvip, gdate) VALUES ('19129214652', '9832312801243', '食品', '零食大礼包 麻辣味网红小吃休闲食品', 49.8, 39, 100, ' 零食大礼包 麻辣味网红小吃休闲食品卤味肉类充饥夜宵整箱即食休闲食品 【拍1 发3】3箱78包【1箱微辣+2箱香辣】', 'yes', null);

INSERT INTO goodsims.myfocus (cid, eid) VALUES ('15875195553', '15875195553');
INSERT INTO goodsims.myfocus (cid, eid) VALUES ('19129214652', '15875195553');

INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206090043534652', '19129214652', '洪晓彬15875195553', '2022-06-09 00:44:01', 19.9, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206090054084652', '19129214652', '洪晓彬15875195553', '2022-06-09 00:54:09', 4699, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206090913364652', '19129214652', '洪晓彬15875195553', '2022-06-09 09:13:38', 22.5, 'no', 'no', 'no', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206090913514652', '19129214652', '洪晓彬15875195553', '2022-06-09 09:13:53', 149, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206091624334652', '19129214652', '洪晓彬15875195553', '2022-06-09 16:24:38', 1.38, 'yes', 'yes', 'no', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206091627414652', '19129214652', '11', '2022-06-09 16:27:47', 82.49, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206091632494652', '19129214652', '洪晓彬15875195553', '2022-06-09 16:33:07', 2.4, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206091633254652', '19129214652', '11', '2022-06-09 16:33:27', 99, 'yes', 'yes', 'yes', 'no');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206142250594652', '19129214652', '洪晓彬19129214652', '2022-06-14 22:51:35', 8.76, 'yes', 'yes', 'yes', 'yes');
INSERT INTO goodsims.ticket (oid, cid, rname, tdate, tpay, tisdelivey, tispay, tisover, tisdelete) VALUES ('2206222330084652', '19129214652', '洪晓彬15875195553', '2022-06-22 23:30:14', 4718.9, 'yes', 'yes', 'no', 'no');
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
INSERT INTO goodsims.raddress (cid, rname, radd) VALUES ('19129214652', '洪晓彬15875195553', '广东省广州市');
INSERT INTO goodsims.raddress (cid, rname, radd) VALUES ('19129214652', '洪晓彬19129214652', '广东省揭阳市');

INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '348872347934');
INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '348879667934');
INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '89764654802');
INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '987546542434');
INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '987567865452');
INSERT INTO goodsims.shoppingcart (cid, eid, gid) VALUES ('19129214652', '15875195553', '98757754688643');

INSERT INTO goodsims.vip (cid, vcategory, vindate, voutdate, vstatus) VALUES ('19129214652', 'month', '2022-06-09', '2022-07-09', 'yes');