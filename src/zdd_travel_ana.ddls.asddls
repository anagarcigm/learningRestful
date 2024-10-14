@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel view'
define root view entity ZDD_TRAVEL_ANA 
as select from zana_travel_1234 as travel
 composition [0..*] of ZDD_BOOKING_ANA as _Booking 
   
   association [0..1] to /DMO/I_Agency       as _Agency   on $projection.AgencyId = _Agency.AgencyID
   association [0..1] to /DMO/I_Customer     as _Customer on $projection.CustomerId = _Customer.CustomerID
   association [0..1] to I_Currency          as _Currency on $projection.CurrencyCode = _Currency.Currency  
{
    key travel_uuid as TravelUuid,
    travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
   @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as TravelStatus,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
     @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    
/* associations */
       _Booking,
       _Agency,
       _Customer,
       _Currency
       
}
