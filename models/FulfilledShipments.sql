
{{ config(
    materialized="view"
) }}

select * from dc_dc_frontendtest_003.asc_bb_fba_amazon_fulfilled_shipments_report_kr_2