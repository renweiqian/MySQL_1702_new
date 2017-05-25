DROP TABLE IF EXISTS db_1702.ip;
CREATE TABLE db_1702.ip (
  id  INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  min VARCHAR(255) COMMENT '起始 IP 地址',
  max VARCHAR(255) COMMENT '终止 IP 地址',
  geo VARCHAR(255) COMMENT '地理位置'
)
  COMMENT 'IP 地址表';

SELECT *
FROM db_1702.ip;

SELECT count(*)
FROM db_1702.ip
WHERE geo RLIKE '呼和浩特';

SELECT count(*)
FROM db_1702.ip;

TRUNCATE TABLE db_1702.ip;

SELECT *
FROM db_1702.ip
WHERE inet_aton('127.0.0.1') BETWEEN inet_aton(min) AND inet_aton(max);

-- 166.111.123.45 A.B.C.D [0, 255] 59.66
-- ip Internet Protocol 互联网协议
-- https Hyper text transfer protocol secure
-- tcp/ip
-- ssh
-- telnet
-- ftp File transfer protocol


SELECT *
FROM db_1702.ip
WHERE geo RLIKE '日喀则';

DROP TABLE IF EXISTS db_1702.city;
CREATE TABLE db_1702.city (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  city  VARCHAR(255) COMMENT '城市名',
  lon   VARCHAR(255) COMMENT '经度',
  lat   VARCHAR(255) COMMENT '纬度',
  zoom  INT COMMENT '放大级别',
  count INT COMMENT 'IP 地址数量'
)
  COMMENT '城市表';

LOAD DATA LOCAL INFILE '/Users/mingfei/IdeaProjects/MySQL_1702/ip/data/BaiduMap_cityCenter.txt'
INTO TABLE db_1702.city
FIELDS TERMINATED BY ',' (city, lon, lat, zoom)
SET id = NULL, count = NULL;

SELECT *
FROM db_1702.city;

SELECT sum(count)
FROM db_1702.city; -- 350410

SELECT count(*)
FROM db_1702.ip; -- 447621

SELECT *
FROM db_1702.ip
WHERE
  geo NOT RLIKE
  '北京|上海|天津|重庆|安庆|蚌埠|亳州|巢湖|池州|滁州|阜阳|淮北|淮南|黄山|六安|马鞍山|宿州|铜陵|芜湖|宣城|福州|龙岩|南平|宁德|莆田|泉州|三明|厦门|漳州|兰州|白银|定西|甘南州|嘉峪关|金昌|酒泉|临夏州|陇南|平凉|庆阳|天水|武威|张掖|广州|潮州|东莞|佛山|河源|惠州|江门|揭阳|茂名|梅州|清远|汕头|汕尾|韶关|深圳|阳江|云浮|湛江|肇庆|中山|珠海|南宁|百色|北海|崇左|防城港|桂林|贵港|河池|贺州|来宾|柳州|钦州|梧州|玉林|贵阳|安顺|毕节地区|六盘水|铜仁地区|遵义|黔西南州|黔东南州|黔南州|海口|白沙|保亭|昌江|儋州|澄迈|东方|定安|琼海|琼中|乐东|临高|陵水|三亚|屯昌|万宁|文昌|五指山|石家庄|保定|沧州|承德|邯郸|衡水|廊坊|秦皇岛|唐山|邢台|张家口|郑州|安阳|鹤壁|焦作|开封|洛阳|漯河|南阳|平顶山|濮阳|三门峡|商丘|新乡|信阳|许昌|周口|驻马店|哈尔滨|大庆|大兴安岭地区|鹤岗|黑河|鸡西|佳木斯|牡丹江|七台河|齐齐哈尔|双鸭山|绥化|伊春|武汉|鄂州|恩施|黄冈|黄石|荆门|荆州|潜江|神农架林区|十堰|随州|天门|仙桃|咸宁|襄阳|孝感|宜昌|长沙|常德|郴州|衡阳|怀化|娄底|邵阳|湘潭|湘西州|益阳|永州|岳阳|张家界|株洲|南京|常州|淮安|连云港|南通|苏州|宿迁|泰州|无锡|徐州|盐城|扬州|镇江|南昌|抚州|赣州|吉安|景德镇|九江|萍乡|上饶|新余|宜春|鹰潭|长春|白城|白山|吉林市|辽源|四平|松原|通化|延边|沈阳|鞍山|本溪|朝阳|大连|丹东|抚顺|阜新|葫芦岛|锦州|辽阳|盘锦|铁岭|营口|呼和浩特|阿拉善盟|包头|巴彦淖尔|赤峰|鄂尔多斯|呼伦贝尔|通辽|乌海|乌兰察布|锡林郭勒盟|兴安盟|银川|固原|石嘴山|吴忠|中卫|西宁|果洛州|海东地区|海北州|海南州|海西州|黄南州|玉树州|济南|滨州|东营|德州|菏泽|济宁|莱芜|聊城|临沂|青岛|日照|泰安|威海|潍坊|烟台|枣庄|淄博|太原|长治|大同|晋城|晋中|临汾|吕梁|朔州|忻州|阳泉|运城|西安|安康|宝鸡|汉中|商洛|铜川|渭南|咸阳|延安|榆林|成都|阿坝州|巴中|达州|德阳|甘孜州|广安|广元|乐山|凉山州|泸州|南充|眉山|绵阳|内江|攀枝花|遂宁|雅安|宜宾|资阳|自贡|拉萨|阿里地区|昌都地区|林芝地区|那曲地区|日喀则地区|山南地区|乌鲁木齐|阿拉尔|阿克苏地区|阿勒泰地区|巴音郭楞|博尔塔拉州|昌吉州|哈密地区|和田地区|喀什地区|克拉玛依|克孜勒苏州|石河子|塔城地区|图木舒克|吐鲁番地区|五家渠|伊犁州|昆明|保山|楚雄州|大理州|德宏州|迪庆州|红河州|丽江|临沧|怒江州|普洱|曲靖|昭通|文山|西双版纳|玉溪|杭州|湖州|嘉兴|金华|丽水|宁波|衢州|绍兴|台州|温州|舟山|香港|澳门|台湾'
  AND geo RLIKE '市';
-- 103838

/*
GRANT ALL PRIVILEGES
ON db_1702.*
TO 'root'@'localhost'
IDENTIFIED BY 'system';

FLUSH PRIVILEGES;

GRANT FILE ON *.* TO 'root';

SELECT
  city,
  lon,
  lat,
  count
FROM db_1702.city
ORDER BY count DESC
INTO OUTFILE '/Users/mingfei/IdeaProjects/MySQL_1702/ip/data/result.csv'
FIELDS TERMINATED BY ','
  ENCLOSED BY '"'
LINES TERMINATED BY '\n';
*/