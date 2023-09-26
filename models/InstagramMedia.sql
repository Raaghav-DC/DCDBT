
{{ config(
    materialized="view"
) }}

select * from dc_demo_redshift.ins_media


