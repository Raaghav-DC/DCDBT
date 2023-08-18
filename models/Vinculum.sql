with SkuDetails as (

    select * from dc_dc_frontendtest_003.vin_sku_details_kr_2

),

Inventory as (

    select * from dc_dc_frontendtest_003.vin_inventory_status_kr

),

ReturnToVendor as (

    select * from dc_dc_frontendtest_003.vin_return_to_vendor_details_kr_2_items 

),


finalTable as (

    select
        SkuDetails.skucode,  SkuDetails.skuname, SkuDetails.classification, SkuDetails.mrp, SkuDetails.saleprice, SkuDetails.basecost,
        Inventory.location, Inventory.qty,
        ReturnToVendor.reason, ReturnToVendor.size

    from SkuDetails 

    full outer join Inventory
    on SkuDetails.skucode = Inventory.skucode

    full outer join ReturnToVendor
    on SkuDetails.skucode = ReturnToVendor.skucode
)

select * from finalTable