SELECT i_cnt_cde::integer AS i_cnt_cde
,s_cnt_nme 
,i_2015 
,i_2016
,i_2017
,i_2018
,i_2019
,i_2020
FROM dpa_qry_cnt_pbl_2015_2020
INNER JOIN 
WHERE i_prv_cde = 13
ORDER  BY 1;


DROP VIEW inec_qry_mnb_mrb_mrt_2015_2020;
DROP VIEW inec_qry_mnb_cnt_pbl_fll_agrp_2015_2020;
DROP VIEW inec_qry_mnb_cnt_pbl_fll_2015_2020;

DROP VIEW inec_qry_mnb_cnt_pbl_atn_agrp_2015_2020;
DROP VIEW inec_qry_mnb_cnt_pbl_atn_2015_2020;


CREATE OR REPLACE VIEW inec_qry_mnb_cnt_pbl_atn_2015_2020 AS 
SELECT 2015::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_atn,i_2015 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_atn_tsa_cnt_2015
UNION ALL
SELECT 2016::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_atn,i_2016 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_atn_tsa_cnt_2016
UNION ALL
SELECT 2017::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_atn,i_2017 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_atn_tsa_cnt_2017
UNION ALL
SELECT 2018::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_atn,i_2018 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_atn_tsa_cnt_2018
UNION ALL
SELECT 2019::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_atn,i_2019 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_atn_tsa_cnt_2019
UNION ALL
SELECT 2020::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_atn,i_2020 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_atn_tsa_cnt_2020
ORDER BY 1,2,4;

CREATE OR REPLACE VIEW inec_qry_mnb_cnt_pbl_atn_agrp_2015_2020 AS 
SELECT i_yr
,sum(i_tll_atn) AS i_tll_atn
,sum(i_ttl_pbl) AS i_ttl_pbl
,round((sum(i_tll_atn)::NUMERIC/sum(i_ttl_pbl)::NUMERIC)*100,2) AS r_tsa_mrb
FROM inec_qry_mnb_cnt_pbl_atn_2015_2020
GROUP BY i_yr;

CREATE OR REPLACE VIEW inec_qry_mnb_cnt_pbl_fll_2015_2020 AS 
SELECT 2015::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_fll,i_2015 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_fll_tsa_cnt_2015
UNION ALL
SELECT 2016::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_fll,i_2016 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_fll_tsa_cnt_2016
UNION ALL
SELECT 2017::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_fll,i_2017 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_fll_tsa_cnt_2017
UNION ALL
SELECT 2018::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_fll,i_2018 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_fll_tsa_cnt_2018
UNION ALL
SELECT 2019::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_fll,i_2019 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_fll_tsa_cnt_2019
UNION ALL
SELECT 2020::integer AS i_yr,i_prv_cde,s_prv_nme,i_cnt_cde,s_cnt_nme,i_tll_fll,i_2020 AS i_ttl_pbl,r_tsa_mrb FROM inec_qry_mnb_ttl_fll_tsa_cnt_2020
ORDER BY 1,2,4;

CREATE OR REPLACE VIEW inec_qry_mnb_cnt_pbl_fll_agrp_2015_2020 AS 
SELECT i_yr
,sum(i_tll_fll) AS i_tll_fll
,sum(i_ttl_pbl) AS i_ttl_pbl
,round((sum(i_tll_fll)::NUMERIC/sum(i_ttl_pbl)::NUMERIC)*1000,2) AS r_tsa_mrt
FROM inec_qry_mnb_cnt_pbl_fll_2015_2020
GROUP BY i_yr;

CREATE OR REPLACE VIEW inec_qry_mnb_mrb_mrt_2015_2020 AS 
SELECT a.i_yr
,a.i_tll_atn
,b.i_tll_fll
,a.i_ttl_pbl
,a.r_tsa_mrb
,b.r_tsa_mrt
FROM inec_qry_mnb_cnt_pbl_atn_agrp_2015_2020 a
INNER JOIN inec_qry_mnb_cnt_pbl_fll_agrp_2015_2020 b ON a.i_yr=b.i_yr
ORDER BY 1;

DROP VIEW inec_qry_mnb_pbl_2015_2020;
CREATE OR REPLACE VIEW inec_qry_mnb_pbl_2015_2020 AS
WITH 
tmp01 AS (SELECT 2015 AS i_yr,sum(i_2015) AS i_ttl_2015 FROM dpa_qry_cnt_pbl_2015_2020 ),
tmp02 AS (SELECT 2016 AS i_yr,sum(i_2016) AS i_ttl_2016 FROM dpa_qry_cnt_pbl_2015_2020 ),
tmp03 AS (SELECT 2017 AS i_yr,sum(i_2017) AS i_ttl_2017 FROM dpa_qry_cnt_pbl_2015_2020 ),
tmp04 AS (SELECT 2018 AS i_yr,sum(i_2018) AS i_ttl_2018 FROM dpa_qry_cnt_pbl_2015_2020 ),
tmp05 AS (SELECT 2019 AS i_yr,sum(i_2019) AS i_ttl_2019 FROM dpa_qry_cnt_pbl_2015_2020 ),
tmp06 AS (SELECT 2020 AS i_yr,sum(i_2020) AS i_ttl_2020 FROM dpa_qry_cnt_pbl_2015_2020 )
SELECT i_yr, i_ttl_2015 AS i_ttl_pbl_ecd FROM tmp01
UNION ALL
SELECT i_yr, i_ttl_2016 FROM tmp02
UNION ALL
SELECT i_yr, i_ttl_2017 FROM tmp03
UNION ALL
SELECT i_yr, i_ttl_2018 FROM tmp04
UNION ALL
SELECT i_yr, i_ttl_2019 FROM tmp05
UNION ALL
SELECT i_yr, i_ttl_2020 FROM tmp06
ORDER BY 1;

DROP VIEW inec_qry_mnb_pbl_tsa_2015_2020;
CREATE OR REPLACE VIEW inec_qry_mnb_pbl_tsa_2015_2020 AS
SELECT a.i_yr
,a.i_ttl_pbl_ecd
,b.i_ttl_pbl AS i_ttl_pbl_mnb
,b.i_tll_atn
,b.i_tll_fll
,b.r_tsa_mrb
,b.r_tsa_mrt
FROM inec_qry_mnb_pbl_2015_2020 a
INNER JOIN inec_qry_mnb_mrb_mrt_2015_2020 b ON a.i_yr = b.i_yr
ORDER BY 1;

SELECT * FROM inec_qry_mnb_pbl_2015_2020;



