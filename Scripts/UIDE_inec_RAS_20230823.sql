
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --
-- SCHEMA: ras -> Esquema para crear las tablas para implementar en python los analisis
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --

-- DROP SCHEMA ras;
CREATE SCHEMA ras AUTHORIZATION inec;
DROP TABLE IF EXISTS ras.inec_tbl_ras_2015;
CREATE TABLE ras.inec_tbl_ras_2015(
 Anio      integer
 ,prov_ubi  integer
 ,cant_ubi  integer
 ,parr_ubi  integer
 ,clase     integer
 ,tipo      integer
 ,entidad   integer
 ,sector    integer
 ,Farm      integer
 ,Botq      integer
 ,lcli      integer
 ,lhis      integer
 ,lotro     integer
 ,k1        integer
 ,k6        integer
 ,k10       integer
 ,k11       integer
 ,k16       integer
 ,k21       integer
 ,k26       integer
 ,k31       integer
 ,k36       integer
 ,k41       integer
 ,k46       integer
 ,k51       integer
 ,k56       integer
 ,k61       integer
 ,k66       integer
 ,k71       integer
 ,k76       integer
 ,k81       integer
 ,k86       integer
 ,k91       integer
 ,k96       integer
 ,k101      integer
 ,k106      integer
 ,k111      integer
 ,k116      integer
 ,k121      integer
 ,k126      integer
 ,k131      integer
 ,k136      integer
 ,k141      integer
 ,k146      integer
 ,k151      integer
 ,k156      integer
 ,k161      integer
 ,k166      integer
 ,k171      integer
 ,k176      integer
 ,k181      integer
 ,k186      integer
 ,k191      integer
 ,k201      integer
 ,k211      integer
 ,k221       integer
 ,k226      integer
 ,k231      integer
 ,k251      integer
 ,k311      integer);

SELECT * FROM ras.inec_tbl_ras_2015;

SELECT * FROM inec_tbl_ras_2015;

DROP TABLE IF EXISTS ras.inec_tbl_ras_2016;
CREATE TABLE ras.inec_tbl_ras_2016(
 Anio      integer
 ,prov_ubi  integer
 ,cant_ubi  integer
 ,parr_ubi  integer
 ,clase     integer
 ,tipo      integer
 ,entidad   integer
 ,sector    integer
 ,Farm      integer
 ,Botq      integer
 ,lcli      integer
 ,lhis      integer
 ,lotro     integer
 ,k1        integer
 ,k6        integer
 ,k10       integer
 ,k11       integer
 ,k16       integer
 ,k21       integer
 ,k26       integer
 ,k31       integer
 ,k36       integer
 ,k41       integer
 ,k46       integer
 ,k51       integer
 ,k56       integer
 ,k61       integer
 ,k66       integer
 ,k71       integer
 ,k76       integer
 ,k81       integer
 ,k86       integer
 ,k91       integer
 ,k96       integer
 ,k101      integer
 ,k106      integer
 ,k111      integer
 ,k116      integer
 ,k121      integer
 ,k126      integer
 ,k131      integer
 ,k136      integer
 ,k141      integer
 ,k146      integer
 ,k151      integer
 ,k156      integer
 ,k161      integer
 ,k166      integer
 ,k171      integer
 ,k176      integer
 ,k181      integer
 ,k186      integer
 ,k191      integer
 ,k201      integer
 ,k211      integer
 ,k221       integer
 ,k226      integer
 ,k231      integer
 ,k251      integer
 ,k311      integer);

SELECT * FROM ras.inec_tbl_ras_2016;

DROP TABLE IF EXISTS ras.inec_tbl_ras_2017;
CREATE TABLE ras.inec_tbl_ras_2017(
 Anio      integer
 ,prov_ubi  integer
 ,cant_ubi  integer
 ,parr_ubi  integer
 ,clase     integer
 ,tipo      integer
 ,entidad   integer
 ,sector    integer
 ,k1        integer
 ,k6        integer
 ,k10       integer
 ,k11       integer
 ,k16       integer
 ,k21       integer
 ,k26       integer
 ,k31       integer
 ,k36       integer
 ,k41       integer
 ,k46       integer
 ,k51       integer
 ,k56       integer
 ,k61       integer
 ,k66       integer
 ,k71       integer
 ,k76       integer
 ,k81       integer
 ,k86       integer
 ,k91       integer
 ,k96       integer
 ,k101      integer
 ,k106      integer
 ,k111      integer
 ,k116      integer
 ,k121      integer
 ,k126      integer
 ,k131      integer
 ,k136      integer
 ,k141      integer
 ,k146      integer
 ,k151      integer
 ,k156      integer
 ,k161      integer
 ,k166      integer
 ,k171      integer
 ,k176      integer
 ,k181      integer
 ,k186      integer
 ,k191      integer
 ,k201      integer
 ,k211      integer
 ,k221       integer
 ,k226      integer
 ,k231      integer
 ,k251      integer
 ,k311      integer);

SELECT * FROM ras.inec_tbl_ras_2017;


DROP TABLE IF EXISTS ras.inec_tbl_ras_2018;
CREATE TABLE ras.inec_tbl_ras_2018(
 Anio      text
 ,prov_ubi  text
 ,cant_ubi  text
 ,parr_ubi  text
 ,clase     text
 ,tipo      text
 ,entidad   text
 ,sector    text
 ,k1        text
 ,k6        text
 ,k10       text
 ,k11       text
 ,k16       text
 ,k21       text
 ,k26       text
 ,k31       text
 ,k36       text
 ,k41       text
 ,k46       text
 ,k51       text
 ,k56       text
 ,k61       text
 ,k66       text
 ,k71       text
 ,k76       text
 ,k81       text
 ,k86       text
 ,k91       text
 ,k96       text
 ,k101      text
 ,k106      text
 ,k111      text
 ,k116      text
 ,k121      text
 ,k126      text
 ,k131      text
 ,k136      text
 ,k141      text
 ,k146      text
 ,k151      text
 ,k156      text
 ,k161      text
 ,k166      text
 ,k171      text
 ,k176      text
 ,k181      text
 ,k186      text
 ,k191      text
 ,k201      text
 ,k211      text
 ,k221      text
 ,k226      text
 ,k231      text
 ,k251      text
 ,k311      text);

SELECT * FROM ras.inec_tbl_ras_2018;


DROP TABLE IF EXISTS ras.inec_tbl_ras_2019;
CREATE TABLE ras.inec_tbl_ras_2019(
 Anio      text
 ,prov_ubi  text
 ,cant_ubi  text
 ,parr_ubi  text
 ,clase     text
 ,tipo      text
 ,entidad   text
 ,sector    text
 ,k1        text
 ,k6        text
 ,k10       text
 ,k11       text
 ,k16       text
 ,k21       text
 ,k26       text
 ,k31       text
 ,k36       text
 ,k41       text
 ,k46       text
 ,k51       text
 ,k56       text
 ,k61       text
 ,k66       text
 ,k71       text
 ,k76       text
 ,k81       text
 ,k86       text
 ,k91       text
 ,k96       text
 ,k101      text
 ,k106      text
 ,k111      text
 ,k116      text
 ,k121      text
 ,k126      text
 ,k131      text
 ,k136      text
 ,k141      text
 ,k146      text
 ,k151      text
 ,k156      text
 ,k161      text
 ,k166      text
 ,k171      text
 ,k176      text
 ,k181      text
 ,k186      text
 ,k191      text
 ,k201      text
 ,k211      text
 ,k221      text
 ,k226      text
 ,k231      text
 ,k251      text
 ,k311      text);

SELECT * FROM ras.inec_tbl_ras_2019;

DROP TABLE IF EXISTS ras.inec_tbl_ras_2020;
CREATE TABLE ras.inec_tbl_ras_2020(
 Anio      text
 ,prov_ubi  text
 ,cant_ubi  text
 ,parr_ubi  text
 ,clase     text
 ,tipo      text
 ,entidad   text
 ,sector    text
 ,k1        text
 ,k6        text
 ,k10       text
 ,k11       text
 ,k16       text
 ,k21       text
 ,k26       text
 ,k31       text
 ,k36       text
 ,k41       text
 ,k46       text
 ,k51       text
 ,k56       text
 ,k61       text
 ,k66       text
 ,k71       text
 ,k76       text
 ,k81       text
 ,k86       text
 ,k91       text
 ,k96       text
 ,k101      text
 ,k106      text
 ,k111      text
 ,k116      text
 ,k121      text
 ,k126      text
 ,k131      text
 ,k136      text
 ,k141      text
 ,k146      text
 ,k151      text
 ,k156      text
 ,k161      text
 ,k166      text
 ,k171      text
 ,k176      text
 ,k181      text
 ,k186      text
 ,k191      text
 ,k201      text
 ,k211      text
 ,k221      text
 ,k226      text
 ,k231      text
 ,k251      text
 ,k311      text);

SELECT * FROM ras.inec_tbl_ras_2020;

DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl1_2015;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl1_2015 AS 
SELECT anio::integer AS i_yr
,prov_ubi::integer AS i_prv_cde
,cant_ubi::integer AS i_cnt_cde
,sum(k1) AS k1
,sum(k6) AS k6
,sum(k10) AS k10
,sum(k11) AS k11
,sum(k16) AS k16
,sum(k21) AS k21
,sum(k26) AS k26
,sum(k31) AS k31
,sum(k36) AS k36
,sum(k41) AS k41
,sum(k46) AS k46
,sum(k51) AS k51
,sum(k56) AS k56
,sum(k61) AS k61
,sum(k66) AS k66
,sum(k71) AS k71
,sum(k76) AS k76
,sum(k81) AS k81
,sum(k86) AS k86
,sum(k91) AS k91
,sum(k96) AS k96
,sum(k101) AS k101
,sum(k106) AS k106
,sum(k111) AS k111
,sum(k116) AS k116
,sum(k121) AS k121
,sum(k126) AS k126
,sum(k131) AS k131
,sum(k136) AS k136
,sum(k141) AS k141
,sum(k146) AS k146
,sum(k151) AS k151
,sum(k156) AS k156
,sum(k161) AS k161
,sum(k166) AS k166
,sum(k171) AS k171
,sum(k176) AS k176
,sum(k181) AS k181
,sum(k186) AS k186
,sum(k191) AS k191
,sum(k201) AS k201
,sum(k211) AS k211
,sum(k221) AS k221
,sum(k226) AS k226
,sum(k231) AS k231
,sum(k251) AS k251
,sum(k311) AS k311
,(sum(k1) 
+ sum(k6) 
+ sum(k10) 
+ sum(k11) 
+ sum(k16) 
+ sum(k21) 
+ sum(k26) 
+ sum(k31) 
+ sum(k36) 
+ sum(k41) 
+ sum(k46) 
+ sum(k51) 
+ sum(k56) 
+ sum(k61) 
+ sum(k66) 
+ sum(k71) 
+ sum(k76) 
+ sum(k81) 
+ sum(k86) 
+ sum(k91) 
+ sum(k96) 
+ sum(k101)
+ sum(k106)
+ sum(k111)
+ sum(k116)
+ sum(k121)
+ sum(k126)
+ sum(k131)
+ sum(k136)
+ sum(k141)
+ sum(k146)
+ sum(k151)
+ sum(k156)
+ sum(k161)
+ sum(k166)
+ sum(k171)
+ sum(k176)
+ sum(k181)
+ sum(k186)
+ sum(k191)
+ sum(k201)
+ sum(k211)
+ sum(k221)
+ sum(k226)
+ sum(k231)
+ sum(k251)
+ sum(k311)) AS i_ttl_lvl1_2015
FROM ras.inec_tbl_ras_2015
WHERE entidad::integer = 1
AND clase::integer IN (20,21,22,23,24,25,26)
GROUP BY anio
,prov_ubi
,cant_ubi
ORDER BY cant_ubi;

DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl2_2015;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl2_2015 AS 
SELECT anio::integer AS i_yr
,prov_ubi::integer AS i_prv_cde
,cant_ubi::integer AS i_cnt_cde
,sum(k1) AS k1
,sum(k6) AS k6
,sum(k10) AS k10
,sum(k11) AS k11
,sum(k16) AS k16
,sum(k21) AS k21
,sum(k26) AS k26
,sum(k31) AS k31
,sum(k36) AS k36
,sum(k41) AS k41
,sum(k46) AS k46
,sum(k51) AS k51
,sum(k56) AS k56
,sum(k61) AS k61
,sum(k66) AS k66
,sum(k71) AS k71
,sum(k76) AS k76
,sum(k81) AS k81
,sum(k86) AS k86
,sum(k91) AS k91
,sum(k96) AS k96
,sum(k101) AS k101
,sum(k106) AS k106
,sum(k111) AS k111
,sum(k116) AS k116
,sum(k121) AS k121
,sum(k126) AS k126
,sum(k131) AS k131
,sum(k136) AS k136
,sum(k141) AS k141
,sum(k146) AS k146
,sum(k151) AS k151
,sum(k156) AS k156
,sum(k161) AS k161
,sum(k166) AS k166
,sum(k171) AS k171
,sum(k176) AS k176
,sum(k181) AS k181
,sum(k186) AS k186
,sum(k191) AS k191
,sum(k201) AS k201
,sum(k211) AS k211
,sum(k221) AS k221
,sum(k226) AS k226
,sum(k231) AS k231
,sum(k251) AS k251
,sum(k311) AS k311
,(sum(k1) 
+ sum(k6) 
+ sum(k10) 
+ sum(k11) 
+ sum(k16) 
+ sum(k21) 
+ sum(k26) 
+ sum(k31) 
+ sum(k36) 
+ sum(k41) 
+ sum(k46) 
+ sum(k51) 
+ sum(k56) 
+ sum(k61) 
+ sum(k66) 
+ sum(k71) 
+ sum(k76) 
+ sum(k81) 
+ sum(k86) 
+ sum(k91) 
+ sum(k96) 
+ sum(k101)
+ sum(k106)
+ sum(k111)
+ sum(k116)
+ sum(k121)
+ sum(k126)
+ sum(k131)
+ sum(k136)
+ sum(k141)
+ sum(k146)
+ sum(k151)
+ sum(k156)
+ sum(k161)
+ sum(k166)
+ sum(k171)
+ sum(k176)
+ sum(k181)
+ sum(k186)
+ sum(k191)
+ sum(k201)
+ sum(k211)
+ sum(k221)
+ sum(k226)
+ sum(k231)
+ sum(k251)
+ sum(k311)) AS i_ttl_lvl2_2015
FROM ras.inec_tbl_ras_2015
WHERE entidad::integer = 1
AND clase::integer IN (1,2,12,28,29)
GROUP BY anio
,prov_ubi
,cant_ubi
ORDER BY cant_ubi;

DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl3_2015;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl3_2015 AS 
SELECT anio::integer AS i_yr
,prov_ubi::integer AS i_prv_cde
,cant_ubi::integer AS i_cnt_cde
,sum(k1) AS k1
,sum(k6) AS k6
,sum(k10) AS k10
,sum(k11) AS k11
,sum(k16) AS k16
,sum(k21) AS k21
,sum(k26) AS k26
,sum(k31) AS k31
,sum(k36) AS k36
,sum(k41) AS k41
,sum(k46) AS k46
,sum(k51) AS k51
,sum(k56) AS k56
,sum(k61) AS k61
,sum(k66) AS k66
,sum(k71) AS k71
,sum(k76) AS k76
,sum(k81) AS k81
,sum(k86) AS k86
,sum(k91) AS k91
,sum(k96) AS k96
,sum(k101) AS k101
,sum(k106) AS k106
,sum(k111) AS k111
,sum(k116) AS k116
,sum(k121) AS k121
,sum(k126) AS k126
,sum(k131) AS k131
,sum(k136) AS k136
,sum(k141) AS k141
,sum(k146) AS k146
,sum(k151) AS k151
,sum(k156) AS k156
,sum(k161) AS k161
,sum(k166) AS k166
,sum(k171) AS k171
,sum(k176) AS k176
,sum(k181) AS k181
,sum(k186) AS k186
,sum(k191) AS k191
,sum(k201) AS k201
,sum(k211) AS k211
,sum(k221) AS k221
,sum(k226) AS k226
,sum(k231) AS k231
,sum(k251) AS k251
,sum(k311) AS k311
,(sum(k1) 
+ sum(k6) 
+ sum(k10) 
+ sum(k11) 
+ sum(k16) 
+ sum(k21) 
+ sum(k26) 
+ sum(k31) 
+ sum(k36) 
+ sum(k41) 
+ sum(k46) 
+ sum(k51) 
+ sum(k56) 
+ sum(k61) 
+ sum(k66) 
+ sum(k71) 
+ sum(k76) 
+ sum(k81) 
+ sum(k86) 
+ sum(k91) 
+ sum(k96) 
+ sum(k101)
+ sum(k106)
+ sum(k111)
+ sum(k116)
+ sum(k121)
+ sum(k126)
+ sum(k131)
+ sum(k136)
+ sum(k141)
+ sum(k146)
+ sum(k151)
+ sum(k156)
+ sum(k161)
+ sum(k166)
+ sum(k171)
+ sum(k176)
+ sum(k181)
+ sum(k186)
+ sum(k191)
+ sum(k201)
+ sum(k211)
+ sum(k221)
+ sum(k226)
+ sum(k231)
+ sum(k251)
+ sum(k311)) AS i_ttl_lvl3_2015
FROM ras.inec_tbl_ras_2015
WHERE entidad::integer = 1
AND clase::integer IN (8,30,31)
GROUP BY anio
,prov_ubi
,cant_ubi
ORDER BY cant_ubi;

SELECT DISTINCT clase FROM ras.inec_tbl_ras_2015 ORDER BY 1;


DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl1_2016;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl1_2016 AS 
SELECT anio::integer AS i_yr
,prov_ubi::integer AS i_prv_cde
,cant_ubi::integer AS i_cnt_cde
,sum(k1) AS k1
,sum(k6) AS k6
,sum(k10) AS k10
,sum(k11) AS k11
,sum(k16) AS k16
,sum(k21) AS k21
,sum(k26) AS k26
,sum(k31) AS k31
,sum(k36) AS k36
,sum(k41) AS k41
,sum(k46) AS k46
,sum(k51) AS k51
,sum(k56) AS k56
,sum(k61) AS k61
,sum(k66) AS k66
,sum(k71) AS k71
,sum(k76) AS k76
,sum(k81) AS k81
,sum(k86) AS k86
,sum(k91) AS k91
,sum(k96) AS k96
,sum(k101) AS k101
,sum(k106) AS k106
,sum(k111) AS k111
,sum(k116) AS k116
,sum(k121) AS k121
,sum(k126) AS k126
,sum(k131) AS k131
,sum(k136) AS k136
,sum(k141) AS k141
,sum(k146) AS k146
,sum(k151) AS k151
,sum(k156) AS k156
,sum(k161) AS k161
,sum(k166) AS k166
,sum(k171) AS k171
,sum(k176) AS k176
,sum(k181) AS k181
,sum(k186) AS k186
,sum(k191) AS k191
,sum(k201) AS k201
,sum(k211) AS k211
,sum(k221) AS k221
,sum(k226) AS k226
,sum(k231) AS k231
,sum(k251) AS k251
,sum(k311) AS k311
,(sum(k1) 
+ sum(k6) 
+ sum(k10) 
+ sum(k11) 
+ sum(k16) 
+ sum(k21) 
+ sum(k26) 
+ sum(k31) 
+ sum(k36) 
+ sum(k41) 
+ sum(k46) 
+ sum(k51) 
+ sum(k56) 
+ sum(k61) 
+ sum(k66) 
+ sum(k71) 
+ sum(k76) 
+ sum(k81) 
+ sum(k86) 
+ sum(k91) 
+ sum(k96) 
+ sum(k101)
+ sum(k106)
+ sum(k111)
+ sum(k116)
+ sum(k121)
+ sum(k126)
+ sum(k131)
+ sum(k136)
+ sum(k141)
+ sum(k146)
+ sum(k151)
+ sum(k156)
+ sum(k161)
+ sum(k166)
+ sum(k171)
+ sum(k176)
+ sum(k181)
+ sum(k186)
+ sum(k191)
+ sum(k201)
+ sum(k211)
+ sum(k221)
+ sum(k226)
+ sum(k231)
+ sum(k251)
+ sum(k311)) AS i_ttl_lvl1_2016
FROM ras.inec_tbl_ras_2016
WHERE entidad::integer = 1
AND clase::integer IN (20,21,22,23,24,25,26)
GROUP BY anio
,prov_ubi
,cant_ubi
ORDER BY cant_ubi;

DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl2_2016;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl2_2016 AS 
SELECT anio::integer AS i_yr
,prov_ubi::integer AS i_prv_cde
,cant_ubi::integer AS i_cnt_cde
,sum(k1) AS k1
,sum(k6) AS k6
,sum(k10) AS k10
,sum(k11) AS k11
,sum(k16) AS k16
,sum(k21) AS k21
,sum(k26) AS k26
,sum(k31) AS k31
,sum(k36) AS k36
,sum(k41) AS k41
,sum(k46) AS k46
,sum(k51) AS k51
,sum(k56) AS k56
,sum(k61) AS k61
,sum(k66) AS k66
,sum(k71) AS k71
,sum(k76) AS k76
,sum(k81) AS k81
,sum(k86) AS k86
,sum(k91) AS k91
,sum(k96) AS k96
,sum(k101) AS k101
,sum(k106) AS k106
,sum(k111) AS k111
,sum(k116) AS k116
,sum(k121) AS k121
,sum(k126) AS k126
,sum(k131) AS k131
,sum(k136) AS k136
,sum(k141) AS k141
,sum(k146) AS k146
,sum(k151) AS k151
,sum(k156) AS k156
,sum(k161) AS k161
,sum(k166) AS k166
,sum(k171) AS k171
,sum(k176) AS k176
,sum(k181) AS k181
,sum(k186) AS k186
,sum(k191) AS k191
,sum(k201) AS k201
,sum(k211) AS k211
,sum(k221) AS k221
,sum(k226) AS k226
,sum(k231) AS k231
,sum(k251) AS k251
,sum(k311) AS k311
,(sum(k1) 
+ sum(k6) 
+ sum(k10) 
+ sum(k11) 
+ sum(k16) 
+ sum(k21) 
+ sum(k26) 
+ sum(k31) 
+ sum(k36) 
+ sum(k41) 
+ sum(k46) 
+ sum(k51) 
+ sum(k56) 
+ sum(k61) 
+ sum(k66) 
+ sum(k71) 
+ sum(k76) 
+ sum(k81) 
+ sum(k86) 
+ sum(k91) 
+ sum(k96) 
+ sum(k101)
+ sum(k106)
+ sum(k111)
+ sum(k116)
+ sum(k121)
+ sum(k126)
+ sum(k131)
+ sum(k136)
+ sum(k141)
+ sum(k146)
+ sum(k151)
+ sum(k156)
+ sum(k161)
+ sum(k166)
+ sum(k171)
+ sum(k176)
+ sum(k181)
+ sum(k186)
+ sum(k191)
+ sum(k201)
+ sum(k211)
+ sum(k221)
+ sum(k226)
+ sum(k231)
+ sum(k251)
+ sum(k311)) AS i_ttl_lvl2_2016
FROM ras.inec_tbl_ras_2016
WHERE entidad::integer = 1
AND clase::integer IN (1,12,2,28,29)
GROUP BY anio
,prov_ubi
,cant_ubi
ORDER BY cant_ubi;

DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl3_2016;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl3_2016 AS 
SELECT anio::integer AS i_yr
,prov_ubi::integer AS i_prv_cde
,cant_ubi::integer AS i_cnt_cde
,sum(k1) AS k1
,sum(k6) AS k6
,sum(k10) AS k10
,sum(k11) AS k11
,sum(k16) AS k16
,sum(k21) AS k21
,sum(k26) AS k26
,sum(k31) AS k31
,sum(k36) AS k36
,sum(k41) AS k41
,sum(k46) AS k46
,sum(k51) AS k51
,sum(k56) AS k56
,sum(k61) AS k61
,sum(k66) AS k66
,sum(k71) AS k71
,sum(k76) AS k76
,sum(k81) AS k81
,sum(k86) AS k86
,sum(k91) AS k91
,sum(k96) AS k96
,sum(k101) AS k101
,sum(k106) AS k106
,sum(k111) AS k111
,sum(k116) AS k116
,sum(k121) AS k121
,sum(k126) AS k126
,sum(k131) AS k131
,sum(k136) AS k136
,sum(k141) AS k141
,sum(k146) AS k146
,sum(k151) AS k151
,sum(k156) AS k156
,sum(k161) AS k161
,sum(k166) AS k166
,sum(k171) AS k171
,sum(k176) AS k176
,sum(k181) AS k181
,sum(k186) AS k186
,sum(k191) AS k191
,sum(k201) AS k201
,sum(k211) AS k211
,sum(k221) AS k221
,sum(k226) AS k226
,sum(k231) AS k231
,sum(k251) AS k251
,sum(k311) AS k311
,(sum(k1) 
+ sum(k6) 
+ sum(k10) 
+ sum(k11) 
+ sum(k16) 
+ sum(k21) 
+ sum(k26) 
+ sum(k31) 
+ sum(k36) 
+ sum(k41) 
+ sum(k46) 
+ sum(k51) 
+ sum(k56) 
+ sum(k61) 
+ sum(k66) 
+ sum(k71) 
+ sum(k76) 
+ sum(k81) 
+ sum(k86) 
+ sum(k91) 
+ sum(k96) 
+ sum(k101)
+ sum(k106)
+ sum(k111)
+ sum(k116)
+ sum(k121)
+ sum(k126)
+ sum(k131)
+ sum(k136)
+ sum(k141)
+ sum(k146)
+ sum(k151)
+ sum(k156)
+ sum(k161)
+ sum(k166)
+ sum(k171)
+ sum(k176)
+ sum(k181)
+ sum(k186)
+ sum(k191)
+ sum(k201)
+ sum(k211)
+ sum(k221)
+ sum(k226)
+ sum(k231)
+ sum(k251)
+ sum(k311)) AS i_ttl_lvl3_2016
FROM ras.inec_tbl_ras_2016
WHERE entidad::integer = 1
AND clase::integer IN (8,13,30,31)
GROUP BY anio
,prov_ubi
,cant_ubi
ORDER BY cant_ubi;

SELECT DISTINCT  clase FROM ras.inec_tbl_ras_2016 ORDER BY 1;



DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl1_2017;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl1_2017 AS 
SELECT anio::integer AS i_yr
,prov_ubi::integer AS i_prv_cde
,cant_ubi::integer AS i_cnt_cde
,sum(k1) AS k1
,sum(k6) AS k6
,sum(k10) AS k10
,sum(k11) AS k11
,sum(k16) AS k16
,sum(k21) AS k21
,sum(k26) AS k26
,sum(k31) AS k31
,sum(k36) AS k36
,sum(k41) AS k41
,sum(k46) AS k46
,sum(k51) AS k51
,sum(k56) AS k56
,sum(k61) AS k61
,sum(k66) AS k66
,sum(k71) AS k71
,sum(k76) AS k76
,sum(k81) AS k81
,sum(k86) AS k86
,sum(k91) AS k91
,sum(k96) AS k96
,sum(k101) AS k101
,sum(k106) AS k106
,sum(k111) AS k111
,sum(k116) AS k116
,sum(k121) AS k121
,sum(k126) AS k126
,sum(k131) AS k131
,sum(k136) AS k136
,sum(k141) AS k141
,sum(k146) AS k146
,sum(k151) AS k151
,sum(k156) AS k156
,sum(k161) AS k161
,sum(k166) AS k166
,sum(k171) AS k171
,sum(k176) AS k176
,sum(k181) AS k181
,sum(k186) AS k186
,sum(k191) AS k191
,sum(k201) AS k201
,sum(k211) AS k211
,sum(k221) AS k221
,sum(k226) AS k226
,sum(k231) AS k231
,sum(k251) AS k251
,sum(k311) AS k311
,(sum(k1) 
+ sum(k6) 
+ sum(k10) 
+ sum(k11) 
+ sum(k16) 
+ sum(k21) 
+ sum(k26) 
+ sum(k31) 
+ sum(k36) 
+ sum(k41) 
+ sum(k46) 
+ sum(k51) 
+ sum(k56) 
+ sum(k61) 
+ sum(k66) 
+ sum(k71) 
+ sum(k76) 
+ sum(k81) 
+ sum(k86) 
+ sum(k91) 
+ sum(k96) 
+ sum(k101)
+ sum(k106)
+ sum(k111)
+ sum(k116)
+ sum(k121)
+ sum(k126)
+ sum(k131)
+ sum(k136)
+ sum(k141)
+ sum(k146)
+ sum(k151)
+ sum(k156)
+ sum(k161)
+ sum(k166)
+ sum(k171)
+ sum(k176)
+ sum(k181)
+ sum(k186)
+ sum(k191)
+ sum(k201)
+ sum(k211)
+ sum(k221)
+ sum(k226)
+ sum(k231)
+ sum(k251)
+ sum(k311)) AS i_ttl_lvl1_2017
FROM ras.inec_tbl_ras_2017
WHERE entidad::integer = 1
AND clase::integer IN (20,21,22,23,24,25,26)
GROUP BY anio
,prov_ubi
,cant_ubi
ORDER BY cant_ubi;

DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl2_2017;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl2_2017 AS 
SELECT anio::integer AS i_yr
,prov_ubi::integer AS i_prv_cde
,cant_ubi::integer AS i_cnt_cde
,sum(k1) AS k1
,sum(k6) AS k6
,sum(k10) AS k10
,sum(k11) AS k11
,sum(k16) AS k16
,sum(k21) AS k21
,sum(k26) AS k26
,sum(k31) AS k31
,sum(k36) AS k36
,sum(k41) AS k41
,sum(k46) AS k46
,sum(k51) AS k51
,sum(k56) AS k56
,sum(k61) AS k61
,sum(k66) AS k66
,sum(k71) AS k71
,sum(k76) AS k76
,sum(k81) AS k81
,sum(k86) AS k86
,sum(k91) AS k91
,sum(k96) AS k96
,sum(k101) AS k101
,sum(k106) AS k106
,sum(k111) AS k111
,sum(k116) AS k116
,sum(k121) AS k121
,sum(k126) AS k126
,sum(k131) AS k131
,sum(k136) AS k136
,sum(k141) AS k141
,sum(k146) AS k146
,sum(k151) AS k151
,sum(k156) AS k156
,sum(k161) AS k161
,sum(k166) AS k166
,sum(k171) AS k171
,sum(k176) AS k176
,sum(k181) AS k181
,sum(k186) AS k186
,sum(k191) AS k191
,sum(k201) AS k201
,sum(k211) AS k211
,sum(k221) AS k221
,sum(k226) AS k226
,sum(k231) AS k231
,sum(k251) AS k251
,sum(k311) AS k311
,(sum(k1) 
+ sum(k6) 
+ sum(k10) 
+ sum(k11) 
+ sum(k16) 
+ sum(k21) 
+ sum(k26) 
+ sum(k31) 
+ sum(k36) 
+ sum(k41) 
+ sum(k46) 
+ sum(k51) 
+ sum(k56) 
+ sum(k61) 
+ sum(k66) 
+ sum(k71) 
+ sum(k76) 
+ sum(k81) 
+ sum(k86) 
+ sum(k91) 
+ sum(k96) 
+ sum(k101)
+ sum(k106)
+ sum(k111)
+ sum(k116)
+ sum(k121)
+ sum(k126)
+ sum(k131)
+ sum(k136)
+ sum(k141)
+ sum(k146)
+ sum(k151)
+ sum(k156)
+ sum(k161)
+ sum(k166)
+ sum(k171)
+ sum(k176)
+ sum(k181)
+ sum(k186)
+ sum(k191)
+ sum(k201)
+ sum(k211)
+ sum(k221)
+ sum(k226)
+ sum(k231)
+ sum(k251)
+ sum(k311)) AS i_ttl_lvl2_2017
FROM ras.inec_tbl_ras_2017
WHERE entidad::integer = 1
AND clase::integer IN (1,2,12,28,29)
GROUP BY anio
,prov_ubi
,cant_ubi
ORDER BY cant_ubi;

DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl3_2017;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl3_2017 AS 
SELECT anio::integer AS i_yr
,prov_ubi::integer AS i_prv_cde
,cant_ubi::integer AS i_cnt_cde
,sum(k1) AS k1
,sum(k6) AS k6
,sum(k10) AS k10
,sum(k11) AS k11
,sum(k16) AS k16
,sum(k21) AS k21
,sum(k26) AS k26
,sum(k31) AS k31
,sum(k36) AS k36
,sum(k41) AS k41
,sum(k46) AS k46
,sum(k51) AS k51
,sum(k56) AS k56
,sum(k61) AS k61
,sum(k66) AS k66
,sum(k71) AS k71
,sum(k76) AS k76
,sum(k81) AS k81
,sum(k86) AS k86
,sum(k91) AS k91
,sum(k96) AS k96
,sum(k101) AS k101
,sum(k106) AS k106
,sum(k111) AS k111
,sum(k116) AS k116
,sum(k121) AS k121
,sum(k126) AS k126
,sum(k131) AS k131
,sum(k136) AS k136
,sum(k141) AS k141
,sum(k146) AS k146
,sum(k151) AS k151
,sum(k156) AS k156
,sum(k161) AS k161
,sum(k166) AS k166
,sum(k171) AS k171
,sum(k176) AS k176
,sum(k181) AS k181
,sum(k186) AS k186
,sum(k191) AS k191
,sum(k201) AS k201
,sum(k211) AS k211
,sum(k221) AS k221
,sum(k226) AS k226
,sum(k231) AS k231
,sum(k251) AS k251
,sum(k311) AS k311
,(sum(k1) 
+ sum(k6) 
+ sum(k10) 
+ sum(k11) 
+ sum(k16) 
+ sum(k21) 
+ sum(k26) 
+ sum(k31) 
+ sum(k36) 
+ sum(k41) 
+ sum(k46) 
+ sum(k51) 
+ sum(k56) 
+ sum(k61) 
+ sum(k66) 
+ sum(k71) 
+ sum(k76) 
+ sum(k81) 
+ sum(k86) 
+ sum(k91) 
+ sum(k96) 
+ sum(k101)
+ sum(k106)
+ sum(k111)
+ sum(k116)
+ sum(k121)
+ sum(k126)
+ sum(k131)
+ sum(k136)
+ sum(k141)
+ sum(k146)
+ sum(k151)
+ sum(k156)
+ sum(k161)
+ sum(k166)
+ sum(k171)
+ sum(k176)
+ sum(k181)
+ sum(k186)
+ sum(k191)
+ sum(k201)
+ sum(k211)
+ sum(k221)
+ sum(k226)
+ sum(k231)
+ sum(k251)
+ sum(k311)) AS i_ttl_lvl3_2017
FROM ras.inec_tbl_ras_2017
WHERE entidad::integer = 1
AND clase::integer IN (8,30,31)
GROUP BY anio
,prov_ubi
,cant_ubi
ORDER BY cant_ubi;

SELECT DISTINCT clase FROM ras.inec_tbl_ras_2017 ORDER BY 1;


SELECT DISTINCT clase FROM ras.inec_tbl_ras_2018 ORDER BY 1;
SELECT DISTINCT k1 FROM ras.inec_tbl_ras_2018 ORDER BY 1;

SELECT anio::integer AS i_yr
,prov_ubi::TEXT AS s_prv_nme
,cant_ubi::TEXT AS s_cnt_nme
,sum(replace(k1, '.0', '')::integer) AS k1
FROM ras.inec_tbl_ras_2018
WHERE trim(BOTH entidad) IN ('Ministerio de Salud Público')
AND trim(BOTH clase) IN ('Puesto de Salud','Consultorio General','Centro de Salud A','Centro de Salud B','Centro de Salud C')
GROUP BY anio
,prov_ubi
,cant_ubi;

-- NIVEL 1
DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl1_2018;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl1_2018 AS 
SELECT anio::integer AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_despro::TEXT AS s_prv_nme
,cnt.dpa_canton::integer AS i_cnt_cde
,cnt.dpa_descan::TEXT AS s_cnt_nme
,sum(replace(k1, '.0', '')::integer) AS k1
,sum(replace(k6, '.0', '')::integer) AS k6
,sum(replace(k10, '.0', '')::integer) AS k10
,sum(replace(k11, '.0', '')::integer) AS k11
,sum(replace(k16, '.0', '')::integer) AS k16
,sum(replace(k21, '.0', '')::integer) AS k21
,sum(replace(k26, '.0', '')::integer) AS k26
,sum(replace(k31, '.0', '')::integer) AS k31
,sum(replace(k36, '.0', '')::integer) AS k36
,sum(replace(k41, '.0', '')::integer) AS k41
,sum(replace(k46, '.0', '')::integer) AS k46
,sum(replace(k51, '.0', '')::integer) AS k51
,sum(replace(k56, '.0', '')::integer) AS k56
,sum(replace(k61, '.0', '')::integer) AS k61
,sum(replace(k66, '.0', '')::integer) AS k66
,sum(replace(k71, '.0', '')::integer) AS k71
,sum(replace(k76, '.0', '')::integer) AS k76
,sum(replace(k81, '.0', '')::integer) AS k81
,sum(replace(k86, '.0', '')::integer) AS k86
,sum(replace(k91, '.0', '')::integer) AS k91
,sum(replace(k96, '.0', '')::integer) AS k96
,sum(replace(k101, '.0', '')::integer) AS k101
,sum(replace(k106, '.0', '')::integer) AS k106
,sum(replace(k111, '.0', '')::integer) AS k111
,sum(replace(k116, '.0', '')::integer) AS k116
,sum(replace(k121, '.0', '')::integer) AS k121
,sum(replace(k126, '.0', '')::integer) AS k126
,sum(replace(k131, '.0', '')::integer) AS k131
,sum(replace(k136, '.0', '')::integer) AS k136
,sum(replace(k141, '.0', '')::integer) AS k141
,sum(replace(k146, '.0', '')::integer) AS k146
,sum(replace(k151, '.0', '')::integer) AS k151
,sum(replace(k156, '.0', '')::integer) AS k156
,sum(replace(k161, '.0', '')::integer) AS k161
,sum(replace(k166, '.0', '')::integer) AS k166
,sum(replace(k171, '.0', '')::integer) AS k171
,sum(replace(k176, '.0', '')::integer) AS k176
,sum(replace(k181, '.0', '')::integer) AS k181
,sum(replace(k186, '.0', '')::integer) AS k186
,sum(replace(k191, '.0', '')::integer) AS k191
,sum(replace(k201, '.0', '')::integer) AS k201
,sum(replace(k211, '.0', '')::integer) AS k211
,sum(replace(k221, '.0', '')::integer) AS k221
,sum(replace(k226, '.0', '')::integer) AS k226
,sum(replace(k231, '.0', '')::integer) AS k231
,sum(replace(k251, '.0', '')::integer) AS k251
,sum(replace(k311, '.0', '')::integer) AS k311
,(sum(replace(k1, '.0', '')::integer) 
+ sum(replace(k6, '.0', '')::integer) 
+ sum(replace(k10, '.0', '')::integer) 
+ sum(replace(k11, '.0', '')::integer) 
+ sum(replace(k16, '.0', '')::integer) 
+ sum(replace(k21, '.0', '')::integer) 
+ sum(replace(k26, '.0', '')::integer) 
+ sum(replace(k31, '.0', '')::integer) 
+ sum(replace(k36, '.0', '')::integer) 
+ sum(replace(k41, '.0', '')::integer) 
+ sum(replace(k46, '.0', '')::integer) 
+ sum(replace(k51, '.0', '')::integer) 
+ sum(replace(k56, '.0', '')::integer) 
+ sum(replace(k61, '.0', '')::integer) 
+ sum(replace(k66, '.0', '')::integer) 
+ sum(replace(k71, '.0', '')::integer) 
+ sum(replace(k76, '.0', '')::integer) 
+ sum(replace(k81, '.0', '')::integer) 
+ sum(replace(k86, '.0', '')::integer) 
+ sum(replace(k91, '.0', '')::integer) 
+ sum(replace(k96, '.0', '')::integer) 
+ sum(replace(k101, '.0', '')::integer)
+ sum(replace(k106, '.0', '')::integer)
+ sum(replace(k111, '.0', '')::integer)
+ sum(replace(k116, '.0', '')::integer)
+ sum(replace(k121, '.0', '')::integer)
+ sum(replace(k126, '.0', '')::integer)
+ sum(replace(k131, '.0', '')::integer)
+ sum(replace(k136, '.0', '')::integer)
+ sum(replace(k141, '.0', '')::integer)
+ sum(replace(k146, '.0', '')::integer)
+ sum(replace(k151, '.0', '')::integer)
+ sum(replace(k156, '.0', '')::integer)
+ sum(replace(k161, '.0', '')::integer)
+ sum(replace(k166, '.0', '')::integer)
+ sum(replace(k171, '.0', '')::integer)
+ sum(replace(k176, '.0', '')::integer)
+ sum(replace(k181, '.0', '')::integer)
+ sum(replace(k186, '.0', '')::integer)
+ sum(replace(k191, '.0', '')::integer)
+ sum(replace(k201, '.0', '')::integer)
+ sum(replace(k211, '.0', '')::integer)
+ sum(replace(k221, '.0', '')::integer)
+ sum(replace(k226, '.0', '')::integer)
+ sum(replace(k231, '.0', '')::integer)
+ sum(replace(k251, '.0', '')::integer)
+ sum(replace(k311, '.0', '')::integer)) AS i_ttl_lvl1_2018
FROM inec_vct_cnt_2012 cnt
LEFT JOIN ras.inec_tbl_ras_2018 ras ON upper(trim(BOTH cnt.dpa_descan)) = upper(ras.cant_ubi)
WHERE trim(BOTH entidad) IN ('Ministerio de Salud Público')
AND trim(BOTH clase) IN ('Puesto de Salud','Consultorio General','Centro de Salud A','Centro de Salud B','Centro de Salud C','Dispensario Médico (Policlínico)')
AND cnt.dpa_provin::integer = 13
GROUP BY anio
,cnt.dpa_provin 
,cnt.dpa_despro 
,cnt.dpa_canton 
,cnt.dpa_descan
ORDER BY cnt.dpa_canton::integer;

-- NIVEL 2
DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl2_2018;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl2_2018 AS 
SELECT anio::integer AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_despro::TEXT AS s_prv_nme
,cnt.dpa_canton::integer AS i_cnt_cde
,cnt.dpa_descan::TEXT AS s_cnt_nme
,sum(replace(k1, '.0', '')::integer) AS k1
,sum(replace(k6, '.0', '')::integer) AS k6
,sum(replace(k10, '.0', '')::integer) AS k10
,sum(replace(k11, '.0', '')::integer) AS k11
,sum(replace(k16, '.0', '')::integer) AS k16
,sum(replace(k21, '.0', '')::integer) AS k21
,sum(replace(k26, '.0', '')::integer) AS k26
,sum(replace(k31, '.0', '')::integer) AS k31
,sum(replace(k36, '.0', '')::integer) AS k36
,sum(replace(k41, '.0', '')::integer) AS k41
,sum(replace(k46, '.0', '')::integer) AS k46
,sum(replace(k51, '.0', '')::integer) AS k51
,sum(replace(k56, '.0', '')::integer) AS k56
,sum(replace(k61, '.0', '')::integer) AS k61
,sum(replace(k66, '.0', '')::integer) AS k66
,sum(replace(k71, '.0', '')::integer) AS k71
,sum(replace(k76, '.0', '')::integer) AS k76
,sum(replace(k81, '.0', '')::integer) AS k81
,sum(replace(k86, '.0', '')::integer) AS k86
,sum(replace(k91, '.0', '')::integer) AS k91
,sum(replace(k96, '.0', '')::integer) AS k96
,sum(replace(k101, '.0', '')::integer) AS k101
,sum(replace(k106, '.0', '')::integer) AS k106
,sum(replace(k111, '.0', '')::integer) AS k111
,sum(replace(k116, '.0', '')::integer) AS k116
,sum(replace(k121, '.0', '')::integer) AS k121
,sum(replace(k126, '.0', '')::integer) AS k126
,sum(replace(k131, '.0', '')::integer) AS k131
,sum(replace(k136, '.0', '')::integer) AS k136
,sum(replace(k141, '.0', '')::integer) AS k141
,sum(replace(k146, '.0', '')::integer) AS k146
,sum(replace(k151, '.0', '')::integer) AS k151
,sum(replace(k156, '.0', '')::integer) AS k156
,sum(replace(k161, '.0', '')::integer) AS k161
,sum(replace(k166, '.0', '')::integer) AS k166
,sum(replace(k171, '.0', '')::integer) AS k171
,sum(replace(k176, '.0', '')::integer) AS k176
,sum(replace(k181, '.0', '')::integer) AS k181
,sum(replace(k186, '.0', '')::integer) AS k186
,sum(replace(k191, '.0', '')::integer) AS k191
,sum(replace(k201, '.0', '')::integer) AS k201
,sum(replace(k211, '.0', '')::integer) AS k211
,sum(replace(k221, '.0', '')::integer) AS k221
,sum(replace(k226, '.0', '')::integer) AS k226
,sum(replace(k231, '.0', '')::integer) AS k231
,sum(replace(k251, '.0', '')::integer) AS k251
,sum(replace(k311, '.0', '')::integer) AS k311
,(sum(replace(k1, '.0', '')::integer) 
+ sum(replace(k6, '.0', '')::integer) 
+ sum(replace(k10, '.0', '')::integer) 
+ sum(replace(k11, '.0', '')::integer) 
+ sum(replace(k16, '.0', '')::integer) 
+ sum(replace(k21, '.0', '')::integer) 
+ sum(replace(k26, '.0', '')::integer) 
+ sum(replace(k31, '.0', '')::integer) 
+ sum(replace(k36, '.0', '')::integer) 
+ sum(replace(k41, '.0', '')::integer) 
+ sum(replace(k46, '.0', '')::integer) 
+ sum(replace(k51, '.0', '')::integer) 
+ sum(replace(k56, '.0', '')::integer) 
+ sum(replace(k61, '.0', '')::integer) 
+ sum(replace(k66, '.0', '')::integer) 
+ sum(replace(k71, '.0', '')::integer) 
+ sum(replace(k76, '.0', '')::integer) 
+ sum(replace(k81, '.0', '')::integer) 
+ sum(replace(k86, '.0', '')::integer) 
+ sum(replace(k91, '.0', '')::integer) 
+ sum(replace(k96, '.0', '')::integer) 
+ sum(replace(k101, '.0', '')::integer)
+ sum(replace(k106, '.0', '')::integer)
+ sum(replace(k111, '.0', '')::integer)
+ sum(replace(k116, '.0', '')::integer)
+ sum(replace(k121, '.0', '')::integer)
+ sum(replace(k126, '.0', '')::integer)
+ sum(replace(k131, '.0', '')::integer)
+ sum(replace(k136, '.0', '')::integer)
+ sum(replace(k141, '.0', '')::integer)
+ sum(replace(k146, '.0', '')::integer)
+ sum(replace(k151, '.0', '')::integer)
+ sum(replace(k156, '.0', '')::integer)
+ sum(replace(k161, '.0', '')::integer)
+ sum(replace(k166, '.0', '')::integer)
+ sum(replace(k171, '.0', '')::integer)
+ sum(replace(k176, '.0', '')::integer)
+ sum(replace(k181, '.0', '')::integer)
+ sum(replace(k186, '.0', '')::integer)
+ sum(replace(k191, '.0', '')::integer)
+ sum(replace(k201, '.0', '')::integer)
+ sum(replace(k211, '.0', '')::integer)
+ sum(replace(k221, '.0', '')::integer)
+ sum(replace(k226, '.0', '')::integer)
+ sum(replace(k231, '.0', '')::integer)
+ sum(replace(k251, '.0', '')::integer)
+ sum(replace(k311, '.0', '')::integer)) AS i_ttl_lvl2_2018
FROM inec_vct_cnt_2012 cnt
LEFT JOIN ras.inec_tbl_ras_2018 ras ON upper(trim(BOTH cnt.dpa_descan)) = upper(ras.cant_ubi)
WHERE trim(BOTH entidad) IN ('Ministerio de Salud Público')
AND trim(BOTH clase) IN ('Centro Clínico-Quirúrgico (Hospital del Día)','Centro de Especialidades','Hospital Básico','Hospital General','Clinica General( Sin Especialidad)','Hospitales del Día Con Internación')
AND cnt.dpa_provin::integer = 13
GROUP BY anio
,cnt.dpa_provin 
,cnt.dpa_despro 
,cnt.dpa_canton 
,cnt.dpa_descan
ORDER BY cnt.dpa_canton::integer;


-- NIVEL 3
DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl3_2018;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl3_2018 AS 
SELECT anio::integer AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_despro::TEXT AS s_prv_nme
,cnt.dpa_canton::integer AS i_cnt_cde
,cnt.dpa_descan::TEXT AS s_cnt_nme
,sum(replace(k1, '.0', '')::integer) AS k1
,sum(replace(k6, '.0', '')::integer) AS k6
,sum(replace(k10, '.0', '')::integer) AS k10
,sum(replace(k11, '.0', '')::integer) AS k11
,sum(replace(k16, '.0', '')::integer) AS k16
,sum(replace(k21, '.0', '')::integer) AS k21
,sum(replace(k26, '.0', '')::integer) AS k26
,sum(replace(k31, '.0', '')::integer) AS k31
,sum(replace(k36, '.0', '')::integer) AS k36
,sum(replace(k41, '.0', '')::integer) AS k41
,sum(replace(k46, '.0', '')::integer) AS k46
,sum(replace(k51, '.0', '')::integer) AS k51
,sum(replace(k56, '.0', '')::integer) AS k56
,sum(replace(k61, '.0', '')::integer) AS k61
,sum(replace(k66, '.0', '')::integer) AS k66
,sum(replace(k71, '.0', '')::integer) AS k71
,sum(replace(k76, '.0', '')::integer) AS k76
,sum(replace(k81, '.0', '')::integer) AS k81
,sum(replace(k86, '.0', '')::integer) AS k86
,sum(replace(k91, '.0', '')::integer) AS k91
,sum(replace(k96, '.0', '')::integer) AS k96
,sum(replace(k101, '.0', '')::integer) AS k101
,sum(replace(k106, '.0', '')::integer) AS k106
,sum(replace(k111, '.0', '')::integer) AS k111
,sum(replace(k116, '.0', '')::integer) AS k116
,sum(replace(k121, '.0', '')::integer) AS k121
,sum(replace(k126, '.0', '')::integer) AS k126
,sum(replace(k131, '.0', '')::integer) AS k131
,sum(replace(k136, '.0', '')::integer) AS k136
,sum(replace(k141, '.0', '')::integer) AS k141
,sum(replace(k146, '.0', '')::integer) AS k146
,sum(replace(k151, '.0', '')::integer) AS k151
,sum(replace(k156, '.0', '')::integer) AS k156
,sum(replace(k161, '.0', '')::integer) AS k161
,sum(replace(k166, '.0', '')::integer) AS k166
,sum(replace(k171, '.0', '')::integer) AS k171
,sum(replace(k176, '.0', '')::integer) AS k176
,sum(replace(k181, '.0', '')::integer) AS k181
,sum(replace(k186, '.0', '')::integer) AS k186
,sum(replace(k191, '.0', '')::integer) AS k191
,sum(replace(k201, '.0', '')::integer) AS k201
,sum(replace(k211, '.0', '')::integer) AS k211
,sum(replace(k221, '.0', '')::integer) AS k221
,sum(replace(k226, '.0', '')::integer) AS k226
,sum(replace(k231, '.0', '')::integer) AS k231
,sum(replace(k251, '.0', '')::integer) AS k251
,sum(replace(k311, '.0', '')::integer) AS k311
,(sum(replace(k1, '.0', '')::integer) 
+ sum(replace(k6, '.0', '')::integer) 
+ sum(replace(k10, '.0', '')::integer) 
+ sum(replace(k11, '.0', '')::integer) 
+ sum(replace(k16, '.0', '')::integer) 
+ sum(replace(k21, '.0', '')::integer) 
+ sum(replace(k26, '.0', '')::integer) 
+ sum(replace(k31, '.0', '')::integer) 
+ sum(replace(k36, '.0', '')::integer) 
+ sum(replace(k41, '.0', '')::integer) 
+ sum(replace(k46, '.0', '')::integer) 
+ sum(replace(k51, '.0', '')::integer) 
+ sum(replace(k56, '.0', '')::integer) 
+ sum(replace(k61, '.0', '')::integer) 
+ sum(replace(k66, '.0', '')::integer) 
+ sum(replace(k71, '.0', '')::integer) 
+ sum(replace(k76, '.0', '')::integer) 
+ sum(replace(k81, '.0', '')::integer) 
+ sum(replace(k86, '.0', '')::integer) 
+ sum(replace(k91, '.0', '')::integer) 
+ sum(replace(k96, '.0', '')::integer) 
+ sum(replace(k101, '.0', '')::integer)
+ sum(replace(k106, '.0', '')::integer)
+ sum(replace(k111, '.0', '')::integer)
+ sum(replace(k116, '.0', '')::integer)
+ sum(replace(k121, '.0', '')::integer)
+ sum(replace(k126, '.0', '')::integer)
+ sum(replace(k131, '.0', '')::integer)
+ sum(replace(k136, '.0', '')::integer)
+ sum(replace(k141, '.0', '')::integer)
+ sum(replace(k146, '.0', '')::integer)
+ sum(replace(k151, '.0', '')::integer)
+ sum(replace(k156, '.0', '')::integer)
+ sum(replace(k161, '.0', '')::integer)
+ sum(replace(k166, '.0', '')::integer)
+ sum(replace(k171, '.0', '')::integer)
+ sum(replace(k176, '.0', '')::integer)
+ sum(replace(k181, '.0', '')::integer)
+ sum(replace(k186, '.0', '')::integer)
+ sum(replace(k191, '.0', '')::integer)
+ sum(replace(k201, '.0', '')::integer)
+ sum(replace(k211, '.0', '')::integer)
+ sum(replace(k221, '.0', '')::integer)
+ sum(replace(k226, '.0', '')::integer)
+ sum(replace(k231, '.0', '')::integer)
+ sum(replace(k251, '.0', '')::integer)
+ sum(replace(k311, '.0', '')::integer)) AS i_ttl_lvl3_2018
FROM inec_vct_cnt_2012 cnt
LEFT JOIN ras.inec_tbl_ras_2018 ras ON upper(trim(BOTH cnt.dpa_descan)) = upper(ras.cant_ubi)
WHERE trim(BOTH entidad) IN ('Ministerio de Salud Público')
AND trim(BOTH clase) IN ('Centros Especializados','Hospital de Especialidades','Oncológico','Otros Establecimientos Sin Internación')
AND cnt.dpa_provin::integer = 13
GROUP BY anio
,cnt.dpa_provin 
,cnt.dpa_despro 
,cnt.dpa_canton 
,cnt.dpa_descan
ORDER BY cnt.dpa_canton::integer;

SELECT DISTINCT cant_ubi FROM ras.inec_tbl_ras_2018;
SELECT dpa_descan FROM inec_vct_cnt_2012 WHERE dpa_provin::integer = 13;


-- NIVEL 1

SELECT DISTINCT clase FROM ras.inec_tbl_ras_2019 ORDER BY 1;
SELECT DISTINCT k1 FROM ras.inec_tbl_ras_2019 ORDER BY 1;

DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl1_2019;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl1_2019 AS 
SELECT anio::integer AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_despro::TEXT AS s_prv_nme
,cnt.dpa_canton::integer AS i_cnt_cde
,cnt.dpa_descan::TEXT AS s_cnt_nme
,sum(replace(k1, ',', '.')::integer) AS k1
,sum(round(replace(k6, ',', '.')::numeric,0)) AS k6
,sum(round(replace(k10, ',', '.')::numeric,0)) AS k10
,sum(round(replace(k11, ',', '.')::numeric,0)) AS k11
,sum(round(replace(k16, ',', '.')::numeric,0)) AS k16
,sum(round(replace(k21, ',', '.')::numeric,0)) AS k21
,sum(round(replace(k26, ',', '.')::numeric,0)) AS k26
,sum(round(replace(k31, ',', '.')::numeric,0)) AS k31
,sum(round(replace(k36, ',', '.')::numeric,0)) AS k36
,sum(round(replace(k41, ',', '.')::numeric,0)) AS k41
,sum(round(replace(k46, ',', '.')::numeric,0)) AS k46
,sum(round(replace(k51, ',', '.')::numeric,0)) AS k51
,sum(round(replace(k56, ',', '.')::numeric,0)) AS k56
,sum(round(replace(k61, ',', '.')::numeric,0)) AS k61
,sum(round(replace(k66, ',', '.')::numeric,0)) AS k66
,sum(round(replace(k71, ',', '.')::numeric,0)) AS k71
,sum(round(replace(k76, ',', '.')::numeric,0)) AS k76
,sum(round(replace(k81, ',', '.')::numeric,0)) AS k81
,sum(round(replace(k86, ',', '.')::numeric,0)) AS k86
,sum(round(replace(k91, ',', '.')::numeric,0)) AS k91
,sum(round(replace(k96, ',', '.')::numeric,0)) AS k96
,sum(round(replace(k101, ',', '.')::numeric,0)) AS k101
,sum(round(replace(k106, ',', '.')::numeric,0)) AS k106
,sum(round(replace(k111, ',', '.')::numeric,0)) AS k111
,sum(round(replace(k116, ',', '.')::numeric,0)) AS k116
,sum(round(replace(k121, ',', '.')::numeric,0)) AS k121
,sum(round(replace(k126, ',', '.')::numeric,0)) AS k126
,sum(round(replace(k131, ',', '.')::numeric,0)) AS k131
,sum(round(replace(k136, ',', '.')::numeric,0)) AS k136
,sum(round(replace(k141, ',', '.')::numeric,0)) AS k141
,sum(round(replace(k146, ',', '.')::numeric,0)) AS k146
,sum(round(replace(k151, ',', '.')::numeric,0)) AS k151
,sum(round(replace(k156, ',', '.')::numeric,0)) AS k156
,sum(round(replace(k161, ',', '.')::numeric,0)) AS k161
,sum(round(replace(k166, ',', '.')::numeric,0)) AS k166
,sum(round(replace(k171, ',', '.')::numeric,0)) AS k171
,sum(round(replace(k176, ',', '.')::numeric,0)) AS k176
,sum(round(replace(k181, ',', '.')::numeric,0)) AS k181
,sum(round(replace(k186, ',', '.')::numeric,0)) AS k186
,sum(round(replace(k191, ',', '.')::numeric,0)) AS k191
,sum(round(replace(k201, ',', '.')::numeric,0)) AS k201
,sum(round(replace(k211, ',', '.')::numeric,0)) AS k211
,sum(round(replace(k221, ',', '.')::numeric,0)) AS k221
,sum(round(replace(k226, ',', '.')::numeric,0)) AS k226
,sum(round(replace(k231, ',', '.')::numeric,0)) AS k231
,sum(round(replace(k251, ',', '.')::numeric,0)) AS k251
,sum(round(replace(k311, ',', '.')::numeric,0)) AS k311
,(sum(replace(k1, ',', '.')::integer) 
+ sum(round(replace(k6, ',', '.')::numeric,0))
+ sum(round(replace(k10, ',', '.')::numeric,0)) 
+ sum(round(replace(k11, ',', '.')::numeric,0)) 
+ sum(round(replace(k16, ',', '.')::numeric,0)) 
+ sum(round(replace(k21, ',', '.')::numeric,0)) 
+ sum(round(replace(k26, ',', '.')::numeric,0)) 
+ sum(round(replace(k31, ',', '.')::numeric,0)) 
+ sum(round(replace(k36, ',', '.')::numeric,0)) 
+ sum(round(replace(k41, ',', '.')::numeric,0)) 
+ sum(round(replace(k46, ',', '.')::numeric,0)) 
+ sum(round(replace(k51, ',', '.')::numeric,0)) 
+ sum(round(replace(k56, ',', '.')::numeric,0)) 
+ sum(round(replace(k61, ',', '.')::numeric,0)) 
+ sum(round(replace(k66, ',', '.')::numeric,0)) 
+ sum(round(replace(k71, ',', '.')::numeric,0)) 
+ sum(round(replace(k76, ',', '.')::numeric,0)) 
+ sum(round(replace(k81, ',', '.')::numeric,0)) 
+ sum(round(replace(k86, ',', '.')::numeric,0)) 
+ sum(round(replace(k91, ',', '.')::numeric,0)) 
+ sum(round(replace(k96, ',', '.')::numeric,0)) 
+ sum(round(replace(k101, ',', '.')::numeric,0))
+ sum(round(replace(k106, ',', '.')::numeric,0))
+ sum(round(replace(k111, ',', '.')::numeric,0))
+ sum(round(replace(k116, ',', '.')::numeric,0))
+ sum(round(replace(k121, ',', '.')::numeric,0))
+ sum(round(replace(k126, ',', '.')::numeric,0))
+ sum(round(replace(k131, ',', '.')::numeric,0))
+ sum(round(replace(k136, ',', '.')::numeric,0))
+ sum(round(replace(k141, ',', '.')::numeric,0))
+ sum(round(replace(k146, ',', '.')::numeric,0))
+ sum(round(replace(k151, ',', '.')::numeric,0))
+ sum(round(replace(k156, ',', '.')::numeric,0))
+ sum(round(replace(k161, ',', '.')::numeric,0))
+ sum(round(replace(k166, ',', '.')::numeric,0))
+ sum(round(replace(k171, ',', '.')::numeric,0))
+ sum(round(replace(k176, ',', '.')::numeric,0))
+ sum(round(replace(k181, ',', '.')::numeric,0))
+ sum(round(replace(k186, ',', '.')::numeric,0))
+ sum(round(replace(k191, ',', '.')::numeric,0))
+ sum(round(replace(k201, ',', '.')::numeric,0))
+ sum(round(replace(k211, ',', '.')::numeric,0))
+ sum(round(replace(k221, ',', '.')::numeric,0))
+ sum(round(replace(k226, ',', '.')::numeric,0))
+ sum(round(replace(k231, ',', '.')::numeric,0))
+ sum(round(replace(k251, ',', '.')::numeric,0))
+ sum(round(replace(k311, ',', '.')::numeric,0))) AS i_ttl_lvl1_2019
FROM inec_vct_cnt_2012 cnt
LEFT JOIN ras.inec_tbl_ras_2019 ras ON upper(trim(BOTH cnt.dpa_descan)) = upper(ras.cant_ubi)
WHERE trim(BOTH entidad) IN ('Ministerio de Salud Público')
AND trim(BOTH clase) IN ('Puesto de Salud','Consultorio General','Centro de Salud A','Centro de Salud B','Centro de Salud C','Dispensario Médico (Policlínico)')
AND cnt.dpa_provin::integer = 13
GROUP BY anio
,cnt.dpa_provin 
,cnt.dpa_despro 
,cnt.dpa_canton 
,cnt.dpa_descan
ORDER BY cnt.dpa_canton::integer;


SELECT * FROM ras.inec_qry_ras_13_cnt_ttl_lvl1_2018;

DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl2_2019;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl2_2019 AS 
SELECT anio::integer AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_despro::TEXT AS s_prv_nme
,cnt.dpa_canton::integer AS i_cnt_cde
,cnt.dpa_descan::TEXT AS s_cnt_nme
,sum(replace(k1, ',', '.')::integer) AS k1
,sum(round(replace(k6, ',', '.')::numeric,0)) AS k6
,sum(round(replace(k10, ',', '.')::numeric,0)) AS k10
,sum(round(replace(k11, ',', '.')::numeric,0)) AS k11
,sum(round(replace(k16, ',', '.')::numeric,0)) AS k16
,sum(round(replace(k21, ',', '.')::numeric,0)) AS k21
,sum(round(replace(k26, ',', '.')::numeric,0)) AS k26
,sum(round(replace(k31, ',', '.')::numeric,0)) AS k31
,sum(round(replace(k36, ',', '.')::numeric,0)) AS k36
,sum(round(replace(k41, ',', '.')::numeric,0)) AS k41
,sum(round(replace(k46, ',', '.')::numeric,0)) AS k46
,sum(round(replace(k51, ',', '.')::numeric,0)) AS k51
,sum(round(replace(k56, ',', '.')::numeric,0)) AS k56
,sum(round(replace(k61, ',', '.')::numeric,0)) AS k61
,sum(round(replace(k66, ',', '.')::numeric,0)) AS k66
,sum(round(replace(k71, ',', '.')::numeric,0)) AS k71
,sum(round(replace(k76, ',', '.')::numeric,0)) AS k76
,sum(round(replace(k81, ',', '.')::numeric,0)) AS k81
,sum(round(replace(k86, ',', '.')::numeric,0)) AS k86
,sum(round(replace(k91, ',', '.')::numeric,0)) AS k91
,sum(round(replace(k96, ',', '.')::numeric,0)) AS k96
,sum(round(replace(k101, ',', '.')::numeric,0)) AS k101
,sum(round(replace(k106, ',', '.')::numeric,0)) AS k106
,sum(round(replace(k111, ',', '.')::numeric,0)) AS k111
,sum(round(replace(k116, ',', '.')::numeric,0)) AS k116
,sum(round(replace(k121, ',', '.')::numeric,0)) AS k121
,sum(round(replace(k126, ',', '.')::numeric,0)) AS k126
,sum(round(replace(k131, ',', '.')::numeric,0)) AS k131
,sum(round(replace(k136, ',', '.')::numeric,0)) AS k136
,sum(round(replace(k141, ',', '.')::numeric,0)) AS k141
,sum(round(replace(k146, ',', '.')::numeric,0)) AS k146
,sum(round(replace(k151, ',', '.')::numeric,0)) AS k151
,sum(round(replace(k156, ',', '.')::numeric,0)) AS k156
,sum(round(replace(k161, ',', '.')::numeric,0)) AS k161
,sum(round(replace(k166, ',', '.')::numeric,0)) AS k166
,sum(round(replace(k171, ',', '.')::numeric,0)) AS k171
,sum(round(replace(k176, ',', '.')::numeric,0)) AS k176
,sum(round(replace(k181, ',', '.')::numeric,0)) AS k181
,sum(round(replace(k186, ',', '.')::numeric,0)) AS k186
,sum(round(replace(k191, ',', '.')::numeric,0)) AS k191
,sum(round(replace(k201, ',', '.')::numeric,0)) AS k201
,sum(round(replace(k211, ',', '.')::numeric,0)) AS k211
,sum(round(replace(k221, ',', '.')::numeric,0)) AS k221
,sum(round(replace(k226, ',', '.')::numeric,0)) AS k226
,sum(round(replace(k231, ',', '.')::numeric,0)) AS k231
,sum(round(replace(k251, ',', '.')::numeric,0)) AS k251
,sum(round(replace(k311, ',', '.')::numeric,0)) AS k311
,(sum(replace(k1, ',', '.')::integer) 
+ sum(round(replace(k6, ',', '.')::numeric,0))
+ sum(round(replace(k10, ',', '.')::numeric,0)) 
+ sum(round(replace(k11, ',', '.')::numeric,0)) 
+ sum(round(replace(k16, ',', '.')::numeric,0)) 
+ sum(round(replace(k21, ',', '.')::numeric,0)) 
+ sum(round(replace(k26, ',', '.')::numeric,0)) 
+ sum(round(replace(k31, ',', '.')::numeric,0)) 
+ sum(round(replace(k36, ',', '.')::numeric,0)) 
+ sum(round(replace(k41, ',', '.')::numeric,0)) 
+ sum(round(replace(k46, ',', '.')::numeric,0)) 
+ sum(round(replace(k51, ',', '.')::numeric,0)) 
+ sum(round(replace(k56, ',', '.')::numeric,0)) 
+ sum(round(replace(k61, ',', '.')::numeric,0)) 
+ sum(round(replace(k66, ',', '.')::numeric,0)) 
+ sum(round(replace(k71, ',', '.')::numeric,0)) 
+ sum(round(replace(k76, ',', '.')::numeric,0)) 
+ sum(round(replace(k81, ',', '.')::numeric,0)) 
+ sum(round(replace(k86, ',', '.')::numeric,0)) 
+ sum(round(replace(k91, ',', '.')::numeric,0)) 
+ sum(round(replace(k96, ',', '.')::numeric,0)) 
+ sum(round(replace(k101, ',', '.')::numeric,0))
+ sum(round(replace(k106, ',', '.')::numeric,0))
+ sum(round(replace(k111, ',', '.')::numeric,0))
+ sum(round(replace(k116, ',', '.')::numeric,0))
+ sum(round(replace(k121, ',', '.')::numeric,0))
+ sum(round(replace(k126, ',', '.')::numeric,0))
+ sum(round(replace(k131, ',', '.')::numeric,0))
+ sum(round(replace(k136, ',', '.')::numeric,0))
+ sum(round(replace(k141, ',', '.')::numeric,0))
+ sum(round(replace(k146, ',', '.')::numeric,0))
+ sum(round(replace(k151, ',', '.')::numeric,0))
+ sum(round(replace(k156, ',', '.')::numeric,0))
+ sum(round(replace(k161, ',', '.')::numeric,0))
+ sum(round(replace(k166, ',', '.')::numeric,0))
+ sum(round(replace(k171, ',', '.')::numeric,0))
+ sum(round(replace(k176, ',', '.')::numeric,0))
+ sum(round(replace(k181, ',', '.')::numeric,0))
+ sum(round(replace(k186, ',', '.')::numeric,0))
+ sum(round(replace(k191, ',', '.')::numeric,0))
+ sum(round(replace(k201, ',', '.')::numeric,0))
+ sum(round(replace(k211, ',', '.')::numeric,0))
+ sum(round(replace(k221, ',', '.')::numeric,0))
+ sum(round(replace(k226, ',', '.')::numeric,0))
+ sum(round(replace(k231, ',', '.')::numeric,0))
+ sum(round(replace(k251, ',', '.')::numeric,0))
+ sum(round(replace(k311, ',', '.')::numeric,0))) AS i_ttl_lvl2_2019
FROM inec_vct_cnt_2012 cnt
LEFT JOIN ras.inec_tbl_ras_2019 ras ON upper(trim(BOTH cnt.dpa_descan)) = upper(ras.cant_ubi)
WHERE trim(BOTH entidad) IN ('Ministerio de Salud Público')
AND trim(BOTH clase) IN ('Centro Clínico-Quirúrgico (Hospital del Día)','Centro de Especialidades','Hospital Básico','Hospital General','Clinica General( Sin Especialidad)','Hospitales del Día Con Internación')
AND cnt.dpa_provin::integer = 13
GROUP BY anio
,cnt.dpa_provin 
,cnt.dpa_despro 
,cnt.dpa_canton 
,cnt.dpa_descan
ORDER BY cnt.dpa_canton::integer;

DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl3_2019;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl3_2019 AS 
SELECT anio::integer AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_despro::TEXT AS s_prv_nme
,cnt.dpa_canton::integer AS i_cnt_cde
,cnt.dpa_descan::TEXT AS s_cnt_nme
,sum(replace(k1, ',', '.')::integer) AS k1
,sum(round(replace(k6, ',', '.')::numeric,0)) AS k6
,sum(round(replace(k10, ',', '.')::numeric,0)) AS k10
,sum(round(replace(k11, ',', '.')::numeric,0)) AS k11
,sum(round(replace(k16, ',', '.')::numeric,0)) AS k16
,sum(round(replace(k21, ',', '.')::numeric,0)) AS k21
,sum(round(replace(k26, ',', '.')::numeric,0)) AS k26
,sum(round(replace(k31, ',', '.')::numeric,0)) AS k31
,sum(round(replace(k36, ',', '.')::numeric,0)) AS k36
,sum(round(replace(k41, ',', '.')::numeric,0)) AS k41
,sum(round(replace(k46, ',', '.')::numeric,0)) AS k46
,sum(round(replace(k51, ',', '.')::numeric,0)) AS k51
,sum(round(replace(k56, ',', '.')::numeric,0)) AS k56
,sum(round(replace(k61, ',', '.')::numeric,0)) AS k61
,sum(round(replace(k66, ',', '.')::numeric,0)) AS k66
,sum(round(replace(k71, ',', '.')::numeric,0)) AS k71
,sum(round(replace(k76, ',', '.')::numeric,0)) AS k76
,sum(round(replace(k81, ',', '.')::numeric,0)) AS k81
,sum(round(replace(k86, ',', '.')::numeric,0)) AS k86
,sum(round(replace(k91, ',', '.')::numeric,0)) AS k91
,sum(round(replace(k96, ',', '.')::numeric,0)) AS k96
,sum(round(replace(k101, ',', '.')::numeric,0)) AS k101
,sum(round(replace(k106, ',', '.')::numeric,0)) AS k106
,sum(round(replace(k111, ',', '.')::numeric,0)) AS k111
,sum(round(replace(k116, ',', '.')::numeric,0)) AS k116
,sum(round(replace(k121, ',', '.')::numeric,0)) AS k121
,sum(round(replace(k126, ',', '.')::numeric,0)) AS k126
,sum(round(replace(k131, ',', '.')::numeric,0)) AS k131
,sum(round(replace(k136, ',', '.')::numeric,0)) AS k136
,sum(round(replace(k141, ',', '.')::numeric,0)) AS k141
,sum(round(replace(k146, ',', '.')::numeric,0)) AS k146
,sum(round(replace(k151, ',', '.')::numeric,0)) AS k151
,sum(round(replace(k156, ',', '.')::numeric,0)) AS k156
,sum(round(replace(k161, ',', '.')::numeric,0)) AS k161
,sum(round(replace(k166, ',', '.')::numeric,0)) AS k166
,sum(round(replace(k171, ',', '.')::numeric,0)) AS k171
,sum(round(replace(k176, ',', '.')::numeric,0)) AS k176
,sum(round(replace(k181, ',', '.')::numeric,0)) AS k181
,sum(round(replace(k186, ',', '.')::numeric,0)) AS k186
,sum(round(replace(k191, ',', '.')::numeric,0)) AS k191
,sum(round(replace(k201, ',', '.')::numeric,0)) AS k201
,sum(round(replace(k211, ',', '.')::numeric,0)) AS k211
,sum(round(replace(k221, ',', '.')::numeric,0)) AS k221
,sum(round(replace(k226, ',', '.')::numeric,0)) AS k226
,sum(round(replace(k231, ',', '.')::numeric,0)) AS k231
,sum(round(replace(k251, ',', '.')::numeric,0)) AS k251
,sum(round(replace(k311, ',', '.')::numeric,0)) AS k311
,(sum(replace(k1, ',', '.')::integer) 
+ sum(round(replace(k6, ',', '.')::numeric,0))
+ sum(round(replace(k10, ',', '.')::numeric,0)) 
+ sum(round(replace(k11, ',', '.')::numeric,0)) 
+ sum(round(replace(k16, ',', '.')::numeric,0)) 
+ sum(round(replace(k21, ',', '.')::numeric,0)) 
+ sum(round(replace(k26, ',', '.')::numeric,0)) 
+ sum(round(replace(k31, ',', '.')::numeric,0)) 
+ sum(round(replace(k36, ',', '.')::numeric,0)) 
+ sum(round(replace(k41, ',', '.')::numeric,0)) 
+ sum(round(replace(k46, ',', '.')::numeric,0)) 
+ sum(round(replace(k51, ',', '.')::numeric,0)) 
+ sum(round(replace(k56, ',', '.')::numeric,0)) 
+ sum(round(replace(k61, ',', '.')::numeric,0)) 
+ sum(round(replace(k66, ',', '.')::numeric,0)) 
+ sum(round(replace(k71, ',', '.')::numeric,0)) 
+ sum(round(replace(k76, ',', '.')::numeric,0)) 
+ sum(round(replace(k81, ',', '.')::numeric,0)) 
+ sum(round(replace(k86, ',', '.')::numeric,0)) 
+ sum(round(replace(k91, ',', '.')::numeric,0)) 
+ sum(round(replace(k96, ',', '.')::numeric,0)) 
+ sum(round(replace(k101, ',', '.')::numeric,0))
+ sum(round(replace(k106, ',', '.')::numeric,0))
+ sum(round(replace(k111, ',', '.')::numeric,0))
+ sum(round(replace(k116, ',', '.')::numeric,0))
+ sum(round(replace(k121, ',', '.')::numeric,0))
+ sum(round(replace(k126, ',', '.')::numeric,0))
+ sum(round(replace(k131, ',', '.')::numeric,0))
+ sum(round(replace(k136, ',', '.')::numeric,0))
+ sum(round(replace(k141, ',', '.')::numeric,0))
+ sum(round(replace(k146, ',', '.')::numeric,0))
+ sum(round(replace(k151, ',', '.')::numeric,0))
+ sum(round(replace(k156, ',', '.')::numeric,0))
+ sum(round(replace(k161, ',', '.')::numeric,0))
+ sum(round(replace(k166, ',', '.')::numeric,0))
+ sum(round(replace(k171, ',', '.')::numeric,0))
+ sum(round(replace(k176, ',', '.')::numeric,0))
+ sum(round(replace(k181, ',', '.')::numeric,0))
+ sum(round(replace(k186, ',', '.')::numeric,0))
+ sum(round(replace(k191, ',', '.')::numeric,0))
+ sum(round(replace(k201, ',', '.')::numeric,0))
+ sum(round(replace(k211, ',', '.')::numeric,0))
+ sum(round(replace(k221, ',', '.')::numeric,0))
+ sum(round(replace(k226, ',', '.')::numeric,0))
+ sum(round(replace(k231, ',', '.')::numeric,0))
+ sum(round(replace(k251, ',', '.')::numeric,0))
+ sum(round(replace(k311, ',', '.')::numeric,0))) AS i_ttl_lvl3_2019
FROM inec_vct_cnt_2012 cnt
LEFT JOIN ras.inec_tbl_ras_2019 ras ON upper(trim(BOTH cnt.dpa_descan)) = upper(ras.cant_ubi)
WHERE trim(BOTH entidad) IN ('Ministerio de Salud Público')
AND trim(BOTH clase) IN ('Centros Especializados','Hospital de Especialidades','Oncológico','Otras Clínicas Especializadas','Otros Establecimientos Sin Internación')
AND cnt.dpa_provin::integer = 13
GROUP BY anio
,cnt.dpa_provin 
,cnt.dpa_despro 
,cnt.dpa_canton 
,cnt.dpa_descan
ORDER BY cnt.dpa_canton::integer;

SELECT DISTINCT clase FROM ras.inec_tbl_ras_2020;


DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl1_2020;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl1_2020 AS 
SELECT anio::integer AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_despro::TEXT AS s_prv_nme
,cnt.dpa_canton::integer AS i_cnt_cde
,cnt.dpa_descan::TEXT AS s_cnt_nme
,sum(round(replace(k1, ',', '.')::numeric,0)) AS k1
,sum(round(replace(k6, ',', '.')::numeric,0)) AS k6
,sum(round(replace(k10, ',', '.')::numeric,0)) AS k10
,sum(round(replace(k11, ',', '.')::numeric,0)) AS k11
,sum(round(replace(k16, ',', '.')::numeric,0)) AS k16
,sum(round(replace(k21, ',', '.')::numeric,0)) AS k21
,sum(round(replace(k26, ',', '.')::numeric,0)) AS k26
,sum(round(replace(k31, ',', '.')::numeric,0)) AS k31
,sum(round(replace(k36, ',', '.')::numeric,0)) AS k36
,sum(round(replace(k41, ',', '.')::numeric,0)) AS k41
,sum(round(replace(k46, ',', '.')::numeric,0)) AS k46
,sum(round(replace(k51, ',', '.')::numeric,0)) AS k51
,sum(round(replace(k56, ',', '.')::numeric,0)) AS k56
,sum(round(replace(k61, ',', '.')::numeric,0)) AS k61
,sum(round(replace(k66, ',', '.')::numeric,0)) AS k66
,sum(round(replace(k71, ',', '.')::numeric,0)) AS k71
,sum(round(replace(k76, ',', '.')::numeric,0)) AS k76
,sum(round(replace(k81, ',', '.')::numeric,0)) AS k81
,sum(round(replace(k86, ',', '.')::numeric,0)) AS k86
,sum(round(replace(k91, ',', '.')::numeric,0)) AS k91
,sum(round(replace(k96, ',', '.')::numeric,0)) AS k96
,sum(round(replace(k101, ',', '.')::numeric,0)) AS k101
,sum(round(replace(k106, ',', '.')::numeric,0)) AS k106
,sum(round(replace(k111, ',', '.')::numeric,0)) AS k111
,sum(round(replace(k116, ',', '.')::numeric,0)) AS k116
,sum(round(replace(k121, ',', '.')::numeric,0)) AS k121
,sum(round(replace(k126, ',', '.')::numeric,0)) AS k126
,sum(round(replace(k131, ',', '.')::numeric,0)) AS k131
,sum(round(replace(k136, ',', '.')::numeric,0)) AS k136
,sum(round(replace(k141, ',', '.')::numeric,0)) AS k141
,sum(round(replace(k146, ',', '.')::numeric,0)) AS k146
,sum(round(replace(k151, ',', '.')::numeric,0)) AS k151
,sum(round(replace(k156, ',', '.')::numeric,0)) AS k156
,sum(round(replace(k161, ',', '.')::numeric,0)) AS k161
,sum(round(replace(k166, ',', '.')::numeric,0)) AS k166
,sum(round(replace(k171, ',', '.')::numeric,0)) AS k171
,sum(round(replace(k176, ',', '.')::numeric,0)) AS k176
,sum(round(replace(k181, ',', '.')::numeric,0)) AS k181
,sum(round(replace(k186, ',', '.')::numeric,0)) AS k186
,sum(round(replace(k191, ',', '.')::numeric,0)) AS k191
,sum(round(replace(k201, ',', '.')::numeric,0)) AS k201
,sum(round(replace(k211, ',', '.')::numeric,0)) AS k211
,sum(round(replace(k221, ',', '.')::numeric,0)) AS k221
,sum(round(replace(k226, ',', '.')::numeric,0)) AS k226
,sum(round(replace(k231, ',', '.')::numeric,0)) AS k231
,sum(round(replace(k251, ',', '.')::numeric,0)) AS k251
,sum(round(replace(k311, ',', '.')::numeric,0)) AS k311
,(sum(round(replace(k1, ',', '.')::numeric,0)) 
+ sum(round(replace(k6, ',', '.')::numeric,0))
+ sum(round(replace(k10, ',', '.')::numeric,0)) 
+ sum(round(replace(k11, ',', '.')::numeric,0)) 
+ sum(round(replace(k16, ',', '.')::numeric,0)) 
+ sum(round(replace(k21, ',', '.')::numeric,0)) 
+ sum(round(replace(k26, ',', '.')::numeric,0)) 
+ sum(round(replace(k31, ',', '.')::numeric,0)) 
+ sum(round(replace(k36, ',', '.')::numeric,0)) 
+ sum(round(replace(k41, ',', '.')::numeric,0)) 
+ sum(round(replace(k46, ',', '.')::numeric,0)) 
+ sum(round(replace(k51, ',', '.')::numeric,0)) 
+ sum(round(replace(k56, ',', '.')::numeric,0)) 
+ sum(round(replace(k61, ',', '.')::numeric,0)) 
+ sum(round(replace(k66, ',', '.')::numeric,0)) 
+ sum(round(replace(k71, ',', '.')::numeric,0)) 
+ sum(round(replace(k76, ',', '.')::numeric,0)) 
+ sum(round(replace(k81, ',', '.')::numeric,0)) 
+ sum(round(replace(k86, ',', '.')::numeric,0)) 
+ sum(round(replace(k91, ',', '.')::numeric,0)) 
+ sum(round(replace(k96, ',', '.')::numeric,0)) 
+ sum(round(replace(k101, ',', '.')::numeric,0))
+ sum(round(replace(k106, ',', '.')::numeric,0))
+ sum(round(replace(k111, ',', '.')::numeric,0))
+ sum(round(replace(k116, ',', '.')::numeric,0))
+ sum(round(replace(k121, ',', '.')::numeric,0))
+ sum(round(replace(k126, ',', '.')::numeric,0))
+ sum(round(replace(k131, ',', '.')::numeric,0))
+ sum(round(replace(k136, ',', '.')::numeric,0))
+ sum(round(replace(k141, ',', '.')::numeric,0))
+ sum(round(replace(k146, ',', '.')::numeric,0))
+ sum(round(replace(k151, ',', '.')::numeric,0))
+ sum(round(replace(k156, ',', '.')::numeric,0))
+ sum(round(replace(k161, ',', '.')::numeric,0))
+ sum(round(replace(k166, ',', '.')::numeric,0))
+ sum(round(replace(k171, ',', '.')::numeric,0))
+ sum(round(replace(k176, ',', '.')::numeric,0))
+ sum(round(replace(k181, ',', '.')::numeric,0))
+ sum(round(replace(k186, ',', '.')::numeric,0))
+ sum(round(replace(k191, ',', '.')::numeric,0))
+ sum(round(replace(k201, ',', '.')::numeric,0))
+ sum(round(replace(k211, ',', '.')::numeric,0))
+ sum(round(replace(k221, ',', '.')::numeric,0))
+ sum(round(replace(k226, ',', '.')::numeric,0))
+ sum(round(replace(k231, ',', '.')::numeric,0))
+ sum(round(replace(k251, ',', '.')::numeric,0))
+ sum(round(replace(k311, ',', '.')::numeric,0))) AS i_ttl_lvl1_2020
FROM inec_vct_cnt_2012 cnt
LEFT JOIN ras.inec_tbl_ras_2020 ras ON upper(trim(BOTH cnt.dpa_descan)) = upper(ras.cant_ubi)
WHERE trim(BOTH entidad) IN ('Ministerio de Salud Público')
AND trim(BOTH clase) IN ('Centro de Salud A','Centro de Salud B','Centro de Salud C','Consultorio General','Dispensario Médico (Policlínico)','Puesto de Salud')
AND cnt.dpa_provin::integer = 13
GROUP BY anio
,cnt.dpa_provin 
,cnt.dpa_despro 
,cnt.dpa_canton 
,cnt.dpa_descan
ORDER BY cnt.dpa_canton::integer;


DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl2_2020;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl2_2020 AS 
SELECT anio::integer AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_despro::TEXT AS s_prv_nme
,cnt.dpa_canton::integer AS i_cnt_cde
,cnt.dpa_descan::TEXT AS s_cnt_nme
,sum(round(replace(k1, ',', '.')::numeric,0)) AS k1
,sum(round(replace(k6, ',', '.')::numeric,0)) AS k6
,sum(round(replace(k10, ',', '.')::numeric,0)) AS k10
,sum(round(replace(k11, ',', '.')::numeric,0)) AS k11
,sum(round(replace(k16, ',', '.')::numeric,0)) AS k16
,sum(round(replace(k21, ',', '.')::numeric,0)) AS k21
,sum(round(replace(k26, ',', '.')::numeric,0)) AS k26
,sum(round(replace(k31, ',', '.')::numeric,0)) AS k31
,sum(round(replace(k36, ',', '.')::numeric,0)) AS k36
,sum(round(replace(k41, ',', '.')::numeric,0)) AS k41
,sum(round(replace(k46, ',', '.')::numeric,0)) AS k46
,sum(round(replace(k51, ',', '.')::numeric,0)) AS k51
,sum(round(replace(k56, ',', '.')::numeric,0)) AS k56
,sum(round(replace(k61, ',', '.')::numeric,0)) AS k61
,sum(round(replace(k66, ',', '.')::numeric,0)) AS k66
,sum(round(replace(k71, ',', '.')::numeric,0)) AS k71
,sum(round(replace(k76, ',', '.')::numeric,0)) AS k76
,sum(round(replace(k81, ',', '.')::numeric,0)) AS k81
,sum(round(replace(k86, ',', '.')::numeric,0)) AS k86
,sum(round(replace(k91, ',', '.')::numeric,0)) AS k91
,sum(round(replace(k96, ',', '.')::numeric,0)) AS k96
,sum(round(replace(k101, ',', '.')::numeric,0)) AS k101
,sum(round(replace(k106, ',', '.')::numeric,0)) AS k106
,sum(round(replace(k111, ',', '.')::numeric,0)) AS k111
,sum(round(replace(k116, ',', '.')::numeric,0)) AS k116
,sum(round(replace(k121, ',', '.')::numeric,0)) AS k121
,sum(round(replace(k126, ',', '.')::numeric,0)) AS k126
,sum(round(replace(k131, ',', '.')::numeric,0)) AS k131
,sum(round(replace(k136, ',', '.')::numeric,0)) AS k136
,sum(round(replace(k141, ',', '.')::numeric,0)) AS k141
,sum(round(replace(k146, ',', '.')::numeric,0)) AS k146
,sum(round(replace(k151, ',', '.')::numeric,0)) AS k151
,sum(round(replace(k156, ',', '.')::numeric,0)) AS k156
,sum(round(replace(k161, ',', '.')::numeric,0)) AS k161
,sum(round(replace(k166, ',', '.')::numeric,0)) AS k166
,sum(round(replace(k171, ',', '.')::numeric,0)) AS k171
,sum(round(replace(k176, ',', '.')::numeric,0)) AS k176
,sum(round(replace(k181, ',', '.')::numeric,0)) AS k181
,sum(round(replace(k186, ',', '.')::numeric,0)) AS k186
,sum(round(replace(k191, ',', '.')::numeric,0)) AS k191
,sum(round(replace(k201, ',', '.')::numeric,0)) AS k201
,sum(round(replace(k211, ',', '.')::numeric,0)) AS k211
,sum(round(replace(k221, ',', '.')::numeric,0)) AS k221
,sum(round(replace(k226, ',', '.')::numeric,0)) AS k226
,sum(round(replace(k231, ',', '.')::numeric,0)) AS k231
,sum(round(replace(k251, ',', '.')::numeric,0)) AS k251
,sum(round(replace(k311, ',', '.')::numeric,0)) AS k311
,(sum(round(replace(k1, ',', '.')::numeric,0)) 
+ sum(round(replace(k6, ',', '.')::numeric,0))
+ sum(round(replace(k10, ',', '.')::numeric,0)) 
+ sum(round(replace(k11, ',', '.')::numeric,0)) 
+ sum(round(replace(k16, ',', '.')::numeric,0)) 
+ sum(round(replace(k21, ',', '.')::numeric,0)) 
+ sum(round(replace(k26, ',', '.')::numeric,0)) 
+ sum(round(replace(k31, ',', '.')::numeric,0)) 
+ sum(round(replace(k36, ',', '.')::numeric,0)) 
+ sum(round(replace(k41, ',', '.')::numeric,0)) 
+ sum(round(replace(k46, ',', '.')::numeric,0)) 
+ sum(round(replace(k51, ',', '.')::numeric,0)) 
+ sum(round(replace(k56, ',', '.')::numeric,0)) 
+ sum(round(replace(k61, ',', '.')::numeric,0)) 
+ sum(round(replace(k66, ',', '.')::numeric,0)) 
+ sum(round(replace(k71, ',', '.')::numeric,0)) 
+ sum(round(replace(k76, ',', '.')::numeric,0)) 
+ sum(round(replace(k81, ',', '.')::numeric,0)) 
+ sum(round(replace(k86, ',', '.')::numeric,0)) 
+ sum(round(replace(k91, ',', '.')::numeric,0)) 
+ sum(round(replace(k96, ',', '.')::numeric,0)) 
+ sum(round(replace(k101, ',', '.')::numeric,0))
+ sum(round(replace(k106, ',', '.')::numeric,0))
+ sum(round(replace(k111, ',', '.')::numeric,0))
+ sum(round(replace(k116, ',', '.')::numeric,0))
+ sum(round(replace(k121, ',', '.')::numeric,0))
+ sum(round(replace(k126, ',', '.')::numeric,0))
+ sum(round(replace(k131, ',', '.')::numeric,0))
+ sum(round(replace(k136, ',', '.')::numeric,0))
+ sum(round(replace(k141, ',', '.')::numeric,0))
+ sum(round(replace(k146, ',', '.')::numeric,0))
+ sum(round(replace(k151, ',', '.')::numeric,0))
+ sum(round(replace(k156, ',', '.')::numeric,0))
+ sum(round(replace(k161, ',', '.')::numeric,0))
+ sum(round(replace(k166, ',', '.')::numeric,0))
+ sum(round(replace(k171, ',', '.')::numeric,0))
+ sum(round(replace(k176, ',', '.')::numeric,0))
+ sum(round(replace(k181, ',', '.')::numeric,0))
+ sum(round(replace(k186, ',', '.')::numeric,0))
+ sum(round(replace(k191, ',', '.')::numeric,0))
+ sum(round(replace(k201, ',', '.')::numeric,0))
+ sum(round(replace(k211, ',', '.')::numeric,0))
+ sum(round(replace(k221, ',', '.')::numeric,0))
+ sum(round(replace(k226, ',', '.')::numeric,0))
+ sum(round(replace(k231, ',', '.')::numeric,0))
+ sum(round(replace(k251, ',', '.')::numeric,0))
+ sum(round(replace(k311, ',', '.')::numeric,0))) AS i_ttl_lvl2_2020
FROM inec_vct_cnt_2012 cnt
LEFT JOIN ras.inec_tbl_ras_2020 ras ON upper(trim(BOTH cnt.dpa_descan)) = upper(ras.cant_ubi)
WHERE trim(BOTH entidad) IN ('Ministerio de Salud Público')
AND trim(BOTH clase) IN ('Centro Clínico-Quirúrgico (Hospital del Día)','Centro de Especialidades','Clinica General( Sin Especialidad)','Consultorio de Especialidad','Hospital Básico','Hospital General','Hospitales del Día Con Internación')
AND cnt.dpa_provin::integer = 13
GROUP BY anio
,cnt.dpa_provin 
,cnt.dpa_despro 
,cnt.dpa_canton 
,cnt.dpa_descan
ORDER BY cnt.dpa_canton::integer;


DROP VIEW IF EXISTS ras.inec_qry_ras_13_cnt_ttl_lvl3_2020;
CREATE OR REPLACE VIEW ras.inec_qry_ras_13_cnt_ttl_lvl3_2020 AS 
SELECT anio::integer AS i_yr
,cnt.dpa_provin::integer AS i_prv_cde
,cnt.dpa_despro::TEXT AS s_prv_nme
,cnt.dpa_canton::integer AS i_cnt_cde
,cnt.dpa_descan::TEXT AS s_cnt_nme
,sum(round(replace(k1, ',', '.')::numeric,0)) AS k1
,sum(round(replace(k6, ',', '.')::numeric,0)) AS k6
,sum(round(replace(k10, ',', '.')::numeric,0)) AS k10
,sum(round(replace(k11, ',', '.')::numeric,0)) AS k11
,sum(round(replace(k16, ',', '.')::numeric,0)) AS k16
,sum(round(replace(k21, ',', '.')::numeric,0)) AS k21
,sum(round(replace(k26, ',', '.')::numeric,0)) AS k26
,sum(round(replace(k31, ',', '.')::numeric,0)) AS k31
,sum(round(replace(k36, ',', '.')::numeric,0)) AS k36
,sum(round(replace(k41, ',', '.')::numeric,0)) AS k41
,sum(round(replace(k46, ',', '.')::numeric,0)) AS k46
,sum(round(replace(k51, ',', '.')::numeric,0)) AS k51
,sum(round(replace(k56, ',', '.')::numeric,0)) AS k56
,sum(round(replace(k61, ',', '.')::numeric,0)) AS k61
,sum(round(replace(k66, ',', '.')::numeric,0)) AS k66
,sum(round(replace(k71, ',', '.')::numeric,0)) AS k71
,sum(round(replace(k76, ',', '.')::numeric,0)) AS k76
,sum(round(replace(k81, ',', '.')::numeric,0)) AS k81
,sum(round(replace(k86, ',', '.')::numeric,0)) AS k86
,sum(round(replace(k91, ',', '.')::numeric,0)) AS k91
,sum(round(replace(k96, ',', '.')::numeric,0)) AS k96
,sum(round(replace(k101, ',', '.')::numeric,0)) AS k101
,sum(round(replace(k106, ',', '.')::numeric,0)) AS k106
,sum(round(replace(k111, ',', '.')::numeric,0)) AS k111
,sum(round(replace(k116, ',', '.')::numeric,0)) AS k116
,sum(round(replace(k121, ',', '.')::numeric,0)) AS k121
,sum(round(replace(k126, ',', '.')::numeric,0)) AS k126
,sum(round(replace(k131, ',', '.')::numeric,0)) AS k131
,sum(round(replace(k136, ',', '.')::numeric,0)) AS k136
,sum(round(replace(k141, ',', '.')::numeric,0)) AS k141
,sum(round(replace(k146, ',', '.')::numeric,0)) AS k146
,sum(round(replace(k151, ',', '.')::numeric,0)) AS k151
,sum(round(replace(k156, ',', '.')::numeric,0)) AS k156
,sum(round(replace(k161, ',', '.')::numeric,0)) AS k161
,sum(round(replace(k166, ',', '.')::numeric,0)) AS k166
,sum(round(replace(k171, ',', '.')::numeric,0)) AS k171
,sum(round(replace(k176, ',', '.')::numeric,0)) AS k176
,sum(round(replace(k181, ',', '.')::numeric,0)) AS k181
,sum(round(replace(k186, ',', '.')::numeric,0)) AS k186
,sum(round(replace(k191, ',', '.')::numeric,0)) AS k191
,sum(round(replace(k201, ',', '.')::numeric,0)) AS k201
,sum(round(replace(k211, ',', '.')::numeric,0)) AS k211
,sum(round(replace(k221, ',', '.')::numeric,0)) AS k221
,sum(round(replace(k226, ',', '.')::numeric,0)) AS k226
,sum(round(replace(k231, ',', '.')::numeric,0)) AS k231
,sum(round(replace(k251, ',', '.')::numeric,0)) AS k251
,sum(round(replace(k311, ',', '.')::numeric,0)) AS k311
,(sum(round(replace(k1, ',', '.')::numeric,0)) 
+ sum(round(replace(k6, ',', '.')::numeric,0))
+ sum(round(replace(k10, ',', '.')::numeric,0)) 
+ sum(round(replace(k11, ',', '.')::numeric,0)) 
+ sum(round(replace(k16, ',', '.')::numeric,0)) 
+ sum(round(replace(k21, ',', '.')::numeric,0)) 
+ sum(round(replace(k26, ',', '.')::numeric,0)) 
+ sum(round(replace(k31, ',', '.')::numeric,0)) 
+ sum(round(replace(k36, ',', '.')::numeric,0)) 
+ sum(round(replace(k41, ',', '.')::numeric,0)) 
+ sum(round(replace(k46, ',', '.')::numeric,0)) 
+ sum(round(replace(k51, ',', '.')::numeric,0)) 
+ sum(round(replace(k56, ',', '.')::numeric,0)) 
+ sum(round(replace(k61, ',', '.')::numeric,0)) 
+ sum(round(replace(k66, ',', '.')::numeric,0)) 
+ sum(round(replace(k71, ',', '.')::numeric,0)) 
+ sum(round(replace(k76, ',', '.')::numeric,0)) 
+ sum(round(replace(k81, ',', '.')::numeric,0)) 
+ sum(round(replace(k86, ',', '.')::numeric,0)) 
+ sum(round(replace(k91, ',', '.')::numeric,0)) 
+ sum(round(replace(k96, ',', '.')::numeric,0)) 
+ sum(round(replace(k101, ',', '.')::numeric,0))
+ sum(round(replace(k106, ',', '.')::numeric,0))
+ sum(round(replace(k111, ',', '.')::numeric,0))
+ sum(round(replace(k116, ',', '.')::numeric,0))
+ sum(round(replace(k121, ',', '.')::numeric,0))
+ sum(round(replace(k126, ',', '.')::numeric,0))
+ sum(round(replace(k131, ',', '.')::numeric,0))
+ sum(round(replace(k136, ',', '.')::numeric,0))
+ sum(round(replace(k141, ',', '.')::numeric,0))
+ sum(round(replace(k146, ',', '.')::numeric,0))
+ sum(round(replace(k151, ',', '.')::numeric,0))
+ sum(round(replace(k156, ',', '.')::numeric,0))
+ sum(round(replace(k161, ',', '.')::numeric,0))
+ sum(round(replace(k166, ',', '.')::numeric,0))
+ sum(round(replace(k171, ',', '.')::numeric,0))
+ sum(round(replace(k176, ',', '.')::numeric,0))
+ sum(round(replace(k181, ',', '.')::numeric,0))
+ sum(round(replace(k186, ',', '.')::numeric,0))
+ sum(round(replace(k191, ',', '.')::numeric,0))
+ sum(round(replace(k201, ',', '.')::numeric,0))
+ sum(round(replace(k211, ',', '.')::numeric,0))
+ sum(round(replace(k221, ',', '.')::numeric,0))
+ sum(round(replace(k226, ',', '.')::numeric,0))
+ sum(round(replace(k231, ',', '.')::numeric,0))
+ sum(round(replace(k251, ',', '.')::numeric,0))
+ sum(round(replace(k311, ',', '.')::numeric,0))) AS i_ttl_lvl3_2020
FROM inec_vct_cnt_2012 cnt
LEFT JOIN ras.inec_tbl_ras_2020 ras ON upper(trim(BOTH cnt.dpa_descan)) = upper(ras.cant_ubi)
WHERE trim(BOTH entidad) IN ('Ministerio de Salud Público')
AND trim(BOTH clase) IN ('Centros Especializados','Hospital de Especialidades','Oncológico','Otras Clínicas Especializadas','Otros Establecimientos Sin Internación')
AND cnt.dpa_provin::integer = 13
GROUP BY anio
,cnt.dpa_provin 
,cnt.dpa_despro 
,cnt.dpa_canton 
,cnt.dpa_descan
ORDER BY cnt.dpa_canton::integer;


