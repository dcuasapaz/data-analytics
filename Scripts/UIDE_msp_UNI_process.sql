
CREATE OR REPLACE VIEW dpa_qry_mnb_cnt_unicodigo_2017 AS 
SELECT b.*
FROM inec_vct_cnt_2012 a
INNER JOIN msp_vct_sld_est_201705 b ON b.can_codigo::integer = a.dpa_canton::integer 
WHERE a.dpa_provin::integer = 13;

DROP VIEW dpa_qry_mnb_cnt_2012;
CREATE OR REPLACE VIEW dpa_qry_mnb_cnt_2012 AS 
SELECT a.*, dpa_canton::integer AS i_cnt_cde
FROM inec_vct_cnt_2012 a
WHERE a.dpa_provin::integer = 13;

SELECT can_codigo::integer AS i_cnt_cde
,can_descri::TEXT AS s_cnt_nme
,count(*)
FROM msp_vct_sld_est_201705
WHERE prv_codigo::integer = 13
GROUP BY can_codigo,can_descri
ORDER BY 1;


