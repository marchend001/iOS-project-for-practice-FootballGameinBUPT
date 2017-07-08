/*==============================================================*/
/* DBMS name:      SQLite3 DB                                   */
/* Created on:     2016/11/21 15:59:37                          */
/*==============================================================*/

drop table if exists FootballTeam;

drop table if exists Competion;


/*==============================================================*/
/* Table: Teams                                                */
/*==============================================================*/
create table FootballTeam 
(
   TeamID            INTEGER   primary key autoincrement     not null,
   TeamName          VARCHAR(20),
   TeamInfo           CLOB
   
);

/*==============================================================*/
/* Table: Competion                                              */
/*==============================================================*/
create table Competion 
(
   CompetionID         INTEGER   primary key autoincrement     not null,
   CompetionDate           DATE                 not null,
   CompetionType           VARCHAR(20)          not null,
   CompetionPK             VARCHAR(20)          not null,
   ImageInfo               VARCHAR(20)          not null,
   CompetionInfo           CLOB,
   TeamOneID           INTEGER,
   TeamTwoID           INTEGER,
   constraint FK_Competion_REFERENCE_TeamS foreign key (TeamOneID) references FootballTeam (TeamID)
);



insert into FootballTeam(TeamID,TeamName,TeamInfo) values (1,'电子队','本科校长杯冠军,网研队开球。1分钟，网研7号邓国川中场送出妙传，可惜计算机队员即时拦截。5分钟，网研队20号隋建威边路内切送出第一脚打门，皮球贴着边网飞出。11分钟，网研21号高尚送出妙传给66号刘鎏，后者接球便射，无奈没打上力量，皮球被计算机门将没收。比赛第13和19分钟，网研11号关哲连续内切寻求突破，然而计算机中路防守密集，11号只得潦草打门，没有太大威胁。不过，经过这几轮下来，网研队已经牢牢控制比赛节奏，一直压迫计算机在半场。不过在第21分钟，计算机获得了全场最好的一次机会！也许是长时间控制节奏，网研队员稍有放松，在一次边后卫回传中卫时出现严重失误，皮球直接传到了计算机前锋的脚下，也许是幸福来得太突然，计算机前锋稍有犹豫，停球不太理想，正准备面对空门起脚，已被即时赶上的网研队员破坏，丧失了全场最好的一次机会。从这以后直至上半场结束，计算机气势稍有上升，但比赛大部分节奏还在网眼对手中。');
insert into FootballTeam(TeamID,TeamName,TeamInfo) values (2,'网研2队','2016年新成立网研2队');
insert into FootballTeam(TeamID,TeamName,TeamInfo) values (3,'信通2队','弱队');
insert into FootballTeam(TeamID,TeamName,TeamInfo) values (4,'计算机联队1队','传统强队');



insert into FootballTeam(TeamID,TeamName,TeamInfo) values (5,'四合院队','弱');
insert into FootballTeam(TeamID,TeamName,TeamInfo) values (6,'光研队','还可以');
insert into FootballTeam(TeamID,TeamName,TeamInfo) values (7,'自动化队','三足');
insert into FootballTeam(TeamID,TeamName,TeamInfo) values (8,'经管队','不造');


insert into FootballTeam(TeamID,TeamName,TeamInfo) values (9,'信通1队','传统强队，连续四年冠军');
insert into FootballTeam(TeamID,TeamName,TeamInfo) values (10,'网研1队','We are the best!');
insert into FootballTeam(TeamID,TeamName,TeamInfo) values (11,'计算机联队2队','ruo');



/*==============================================================*/
/*小组赛A组                                             */
/* 2016-09-26                                            */
/*==============================================================*/

insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (1,'2016-09-26','GroupPk','A1VSA2，电子队VS网研2队','GroupA1','小组赛A组A1VSA2，电子队VS网研2队');
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (2,'2016-09-26','GroupPk','A3VSA4，信通2队VS计算机联队1队','GroupA2','小组赛A组A3VSA4，信通2队VS计算机联队1队');


/*==============================================================*/
/*小组赛B组                                             */
/* 2016-09-27                                            */
/*==============================================================*/
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (3,'2016-09-27','GroupPk','B1VSB2，四合院队VS光研队','GroupB1','小组赛B组B1VSB2，四合院队VS光研队');
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (4,'2016-09-27','GroupPk','B3VSB4，自动化队VS经管队','GroupB2','小组赛B组B3VSB4，自动化队VS经管队');

/*==============================================================*/
/*小组赛C组                                             */
/* 2016-09-28                                            */
/*==============================================================*/

insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (5,'2016-09-28','GroupPk','C1VSC2，信通1队VS网研1队','GroupC1','北京邮电大学2016年“诺基亚杯”研究生足球赛在大家的期待中进入了第三天的赛程。宁静的夜空下，风雨操场显得格外热闹，今晚对阵的双方分别是信通一队和网研一队，由于两队的球服都是白色，经过协商，信通一队将身着黄色训练背心上场。

上半场：
随着裁判一声哨响，信通一队率先开球。网研一队开场就展开猛烈的攻势，不到2分钟就在中场将球抢断，并造成信通一队在后场边线处犯规，网研一队得到一记任意球的机会，任意球由4号张兴贤开出，落到信通一队的禁区内，由信通一队后卫大脚解围。这是本场比赛的第一次门前威胁。紧接着，网研一队的66号刘鎏接队友传球后，带球连续突破，禁区外一脚远射，球直奔球门而去，稍稍高出球门，飞出了底线。信通一队稍作调整，开始反击，首先在第6分钟，由24号李沁哲在中后场将球长传给前场的7号茂罗，后者带球下底线后传中，中路18号马炳谦迅速插上，无奈传中球稍高了一点，没有完成门前头球。紧接着第9分钟，双方在中场激烈拼抢，信通一队24号李沁哲最终将球抢下来，并长传到前场边线处，网研一队被迫将球解围出底线，给了信通一队今晚的第一个角球机会。可惜信通一队的角球开出了一个水平球，被网研一队后卫轻而易举的解围了。第12分钟，又是信通一队的24号李沁哲，与2号陈博宇在中场配合互相传球过人，动作如行云流水，面对网研一队两名后卫上前防守，24号李沁哲突然加速后，在禁区线外10米左右起脚远射，这一球势大力沉，守门员第一次接球并没有接稳。网研一队也不甘示弱，马上又组织了一波有威胁的进攻，第13分钟，由网研一队66号刘鎏传中，11号关哲接球后转身，看到边线队友无人防守后果断起球传边，这一传分散了中路信通一队的防守力量，当球从边线再次传中时，11号关哲附近的防守人员无法快速回防，给了11号关哲一次头球的机会，无奈头球稍稍高出了横梁，飞出了底线。第15分钟，信通一队的24号李沁哲和2号陈博宇又一次打出一波中场控球流，在2号陈博宇接球沿边线快速插上时，网研一队7号岳毅犯规导致信通一队2号陈博宇摔倒，吃到了本场比赛的第一张黄牌。第20分钟，网研一队前场任意球发出，直奔信通一队的球门左上角，守门员在接球时受到了网研一队7号岳毅的干扰，又一次吃到了一张黄牌，合计两张黄牌，被裁判罚下球场。此时，网研一队场上剩下10个人，局势对网研一队不利。信通一队抓紧进攻的节奏，由16号王刚和24号李沁哲在前场配合创造的两次角球都对网研一队的大门造成了威胁，无奈网研一队的后卫和守门员两次都将球拒之门外。尽管网研一队场上人数处于劣势，可是队员们的士气似乎没有收到什么影响，第25分钟网研一队20号隋建威在前场由边线传中，66号刘鎏接球后禁区线外大脚抽射，无奈射偏。接着67号刘思辰后场抢断后，短传中场66号刘鎏，后者胸口停球后转身甩开防守队员，随即向前突破，无奈前方仍有两人协防，球被断下。第27分钟，网研一队10号邓国川带球突破，在禁区边线处遭犯规，裁判给了网研一队一个禁区边线处的任意球。第28分钟，网研一队11号关哲主罚任意球，球在空中划过一道弧线，直奔球门右上角，虽然守门员意识到了，可是这一球带着旋转，在守门员手中停留了一秒，就脱手落地，弹进了球门！网研一队拿到了本场比赛的第一分，1:0领先信通一队。第30分钟，信通一队24号李沁哲长传精准找到7号茂罗，可惜后者在接球时故意手球，裁判给了一张黄牌，加上前面的一张黄牌，7号被罚下场。在上半场比赛结束时，场上两队人数持平，加上网研一队率先进球，局势对网研一队稍微利好。

下半场：
双方交换场地，信通一队换人，由4号韦壮焜换下8号张萌。开场后，信通一队24号李沁哲表现突出，不仅在中场与2号陈博宇配合控球找机会，还带球过人直传或者长传前场，可惜前场接球队友无法跟上。第39分钟到第42分钟，两队在中场进行了激烈的争夺，双方你来我往，球权不断更替。第43分钟，网研一队在自家禁区边角上推人犯规，信通一队24号李沁哲主罚任意球，球带着旋转飞向球门，无奈稍稍高出了横梁，飞出了底线。第45分钟，网研一队20号隋建威受伤，换上18号肖建昕。第47分钟，信通一队后场解围，2号陈博宇拿球后长传24号李沁哲，后者快速突破到网研一队禁区，网研一队67号刘思辰在争抢中拉人犯规，吃了一张黄牌，同时也给了信通一队一次点球的机会。第48分钟信通一队24号李沁哲主罚点球，随着哨声响起，24号助跑，推射，球朝着球门右侧飞去，守门员已来不及反应，球进了！信通一队扳回了比分，1:1，比赛又回到了同一起跑线上。此后，明显感觉到信通一队的士气有所上涨，队员的拼抢更加积极。第53分钟，信通一队2号带球沿着禁区线突破时遭到网研一队防守队员犯规，11号Amsa主罚任意球，网研一队守门员已看出球的轨迹，接到球后网研一队快速将球发出，经过中场的拼抢后，由11号关哲拿下球权并进行突破，无奈遭到了信通一队的三人包夹抢断。第55分钟，又是网研一队11号关哲带球沿边线突破，传门前时球离守门员太近，正中守门员怀中。第60分钟，信通一队4号韦壮焜接24号李沁哲传中球后大力抽射，可惜球高出横梁。第61分钟，网研一队10号邓国川突然抽筋，躺在中场，不得不换上8号富泽萌。距离比赛结束还剩不到10分钟，两队开始最后发力，肢体接触的次数越来越多，激烈程度也越来越高，也起了一些小争执。随着裁判的一声哨响，比赛结束，双方战成1:1。

感谢两支实力强劲的队伍为我们献上了一场精彩的比赛，也希望两支队伍能在接下来的比赛中能取得更好的成绩！我们国庆之后，不见不散！');


/*==============================================================*/
/*小组赛A组                                             */
/* 2016-10-10                                           */
/*==============================================================*/

insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (6,'2016-10-10','GroupPk','A1VSA3，电子队VS信通2队','GroupA3','小组赛A组A1VSA3，电子队VS信通2队');
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (7,'2016-10-10','GroupPk','A2VSA4，网研2队VS计算机联1队','GroupA4','小组赛A组A2VSA4，网研2队VS计算机联1队');



/*==============================================================*/
/*小组赛B组                                             */
/* 2016-10-11                                           */
/*==============================================================*/

insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (8,'2016-10-11','GroupPk','B1VSB3，四合院队VS自动化队','GroupB3','小组赛B组B1VSB3，四合院队VS自动化队');
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (9,'2016-10-11','GroupPk','B2VSB4，光研队VS经管队','GroupB4','小组赛B组B2VSB4，光研队VS经管队');



/*==============================================================*/
/* 小组赛C组                                             */
/* 2016-10-12                                           */
/*==============================================================*/

insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (10,'2016-10-12','GroupPk','C1VSC3，信通1队VS计算机联2队','GroupC2','小组赛C组C1VSC3，信通1队VS计算机联2队');

/*==============================================================*/
/* 小组赛A组                                             */
/* 2016-10-17                                           */
/*==============================================================*/
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (11,'2016-10-17','GroupPk','A1VSA4，电子队VS计算机联队','GroupA5','小组赛A组A1VSA4，电子队VS计算机联队');
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (12,'2016-10-17','GroupPk','A2VSA3，网研2队VS信通2队','GroupA6','小组赛A组A2VSA3，网研2队VS信通2队');



/*==============================================================*/
/* 小组赛B组                                             */
/* 2016-10-18                                           */
/*==============================================================*/
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (13,'2016-10-18','GroupPk','B1VSB4，四合院队VS经管队','GroupB5','小组赛B组B1VSB4，四合院队VS经管队');
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (14,'2016-10-18','GroupPk','B2VSB3，光研队V自动化队','GroupB6','小组赛B组B2VSB3，光研队V自动化队');


/*==============================================================*/
/* 小组赛C组                                             */
/* 2016-10-19                                           */
/*==============================================================*/
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (15,'2016-10-19','GroupPk','C2VSC3，网研1队VS计算机联2队','GroupC3','小组赛C组C2VSC3，网研1队VS计算机联2队');



/*==============================================================*/
/* 淘汰赛                                             */
/* 2016-10-24                                           */
/*==============================================================*/

insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (16,'2016-10-24','OutPk','计算机联1队VS四合院队','OutCom1','淘汰赛，计算机联1队VS四合院队');
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (17,'2016-10-24','OutPk','信通1队VS电子队','OutCom2','淘汰赛，信通1队VS电子队');



/*==============================================================*/
/* 淘汰赛                                             */
/* 2016-10-26                                           */
/*==============================================================*/

insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (18,'2016-10-26','OutPk','网研2队VS光研队','OutCom3','淘汰赛，网研2队VS光研队');
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (19,'2016-10-26','OutPk','网研1队VS自动化队','OutCom4','淘汰赛，网研1队VS自动化队');


/*==============================================================*/
/* 半决赛                                             */
/* 2016-10-31                                           */
/*==============================================================*/
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (20,'2016-10-31','SemiPk','计算机联1队VS信通1队','SemiCom1','半决赛，计算机联1队VS信通1队');



/*==============================================================*/
/* 半决赛                                             */
/* 2016-11-02                                           */
/*==============================================================*/

insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (21,'2016-11-02','SemiPk','光研队VS网研1队','SemiCom2','半决赛，光研队VS网研1队');


/*==============================================================*/
/* 决赛对决                                             */
/* 2016-11-11                                           */
/*==============================================================*/

insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (22,'2016-11-11','TopPk','冠亚之争','TopCom1','巅峰对决计算机联1队VS网研1队');
insert into Competion (CompetionID,CompetionDate,CompetionType,CompetionPK,ImageInfo,CompetionInfo) values (23,'2016-11-09','TopPk','季军争夺赛','TopCom2','北京邮电大学2016年“诺基亚杯”研究生足球赛在大家的期待中进入了半决赛三四名的争夺战。宁静的夜空下，风雨操场显得格外热闹，今晚对阵的双方分别是光研队和计算机联一队，本场比赛，光研队身披白色战袍，而计算机这边则是一身绿色队服，与绿茵赛场相呼应。
上半场：
随着裁判一声哨响，光研队率先开球。而计算机联一队开场就展开猛烈的攻势，不到2分钟就在中场将球抢断，并造成光研队在中场附近处犯规，计算机联一队得到一记任意球的机会，任意球由9号吴京宸开出，落到光研队的禁区内，由光研队后卫大脚解围。这是本场比赛的第一次门前威胁。紧接着，光研队的16号贾鹏飞接队友传球后，带球连续突破，禁区外一脚远射，球直奔球门而去，稍稍高出球门，飞出了底线，造成了一次有利威胁。光研攻势有增无减，16号贾鹏飞的任意球也是力道十足，但是计算机后卫巧妙解围。反过来计算机一队稍作调整，开始反击，首先在第7分钟，由91号黄昉在中后场将球长传给前场的10号童云翔，后者带球下底线后传中，中路21号甘如饴迅速插上，接球就是一脚射门，但被对方后卫破坏掉制造了一次角球机会，这是本场比赛的第一例角球，可惜计算机一队的角球开出了一个水平球，被光研队后卫轻而易举的解围了。紧接着第10分钟，双方在中场激烈拼抢，光研队11号郑文浩最终将球抢下来，带球突破过人，假动作晃过俩个人提起一脚，被对方门将扑出底线，获得了一个角球机会，这是本场比赛的第一次球门威胁。光研队占据着场上的主动，前锋15号霍庆源加速过人，面对计算机后卫的防守就是一脚抽射，可惜球越过球门。第15分钟，又是光研队的15号霍庆源，与10号马克西姆在中场配合互相传球过人，动作如行云流水，面对计算机一队两名后卫上前防守，15号霍庆源突然加速后，在禁区线外10米左右起脚远射，这一球势大力沉，守门员没有来得及做出扑救，率先破门，得到了全场比赛的第一粒进球。计算机一队也不甘示弱，但是比分落后的情况下明显有些着急，一次攻防中91号黄昉吃到了一张黄牌警告，随着比赛激烈进行，双方的取胜欲望被点燃，球场上身体对抗也变得激烈，光研队10号也吃到了一张黄牌警告。上半场进行到第30分钟，计算机一队前场角球发出，直奔光研队的球门左上角，守门员奋力扑出，禁区外造成犯规，计算机一队半场的最好的一次任意球机会，10号童云翔主罚，大力一脚球直奔球门而去，光研门将上演了一波世界级扑救，保护住自家球门。上半场比赛就此结束，光研队凭借15号霍庆源的进球领先一分，局势对光研队稍微利好。

下半场：
双方交换场地，计算机一队换人，由12号沈月东换下21号甘如饴，14号李琪换下9号吴京宸。开场后，计算机一队16号赵喆子健表现突出，不仅在中场与10号童云翔配合控球找机会，还带球过人直传或者长传前场，可惜前场接球队友无法跟上。第39分钟到第42分钟，两队在中场进行了激烈的争夺，双方你来我往，球权不断更替。第43分钟，计算机一队16号赵喆子健前场找机会快速突破，过掉对方一名后卫，抽射底角，皮球滚落入网，球进了！计算机一队扳回了比分，1:1，比赛又回到了同一起跑线上。此后，明显感觉到计算机一队的士气有所上涨，队员的拼抢更加积极。第63分钟，双方在禁区外有一次激烈对抗，光研守门员与计算机16号前场碰撞，导致16号赵喆子健受伤下场，裁判判给光研守门员黄牌警告，计算机一对前场任意球机会。 11号孙鸿青主罚任意球，可能受到队友受伤的鼓励，孙鸿青主罚毫不犹豫，一大脚直奔球门，球进了！计算机实现了反超，将比分扮成了2:1。此时，光研队的求胜欲望明显加强，大力压迫前场，而又给计算机一对造成机会。第66分钟，又是计算机一队11号孙鸿青带球沿边线突破，传门给10号童云翔，面对这个好机会，后者当然不能浪费掉，一个变向一脚推射球再次滚入网中，3：1。尽管后来光研队试图追进比分，但体力消耗过大，队员体力也消耗得严重，最终3：1的比分直到终场哨声响起。

感谢两支实力强劲的队伍为我们献上了一场精彩的比赛，让我们享受到如此激烈的半决赛，祝贺计算机一队获得本次比赛的第三名，同时也感谢光研的队员们，是你们让比赛如此精彩。');


