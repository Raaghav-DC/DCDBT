{{ config(
    materialized="view"
) }}


with OrderDetails as (

    SELECT * FROM `datachannel-237710.dc_dc_frontendtest_004.asc_betterbeing_ordersbyorderdatereport_ist`

),

Inventory as (

    SELECT * FROM `datachannel-237710.dc_dc_frontendtest_004.asc_betterbeing__get_ledger_summary_view_data`

),

SellerReturns as (

    SELECT * FROM `datachannel-237710.dc_dc_frontendtest_004.asc_betterbeing_fbareturnsreport_ist`

),


finalTable as (

    select
        OrderDetails.amazon_order_id,  OrderDetails.purchase_date, OrderDetails.order_status, OrderDetails.product_name, OrderDetails.item_price, OrderDetails.ship_state,
        Inventory.starting_warehouse_balance, Inventory.ending_warehouse_balance,
        SellerReturns.order_id, SellerReturns.product_name as product_name_seller, SellerReturns.quantity

    from OrderDetails 

    full outer join Inventory
    on OrderDetails.marketplace_id = Inventory.marketplace_id

    full outer join SellerReturns
    on OrderDetails.marketplace_id = SellerReturns.marketplace_id
)

select * from finalTable