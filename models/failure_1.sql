{{ config(
    materialized = 'view,
    alias = 'failure_1'
) }}

SELECT *
FROM `datachannel-237710.dc_dc_frontendtest_004.asc_betterbeing_ordersbyorderdatereport_ist_7780`
