@EndUserText.label: 'Travel Projection'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_ANA_TRAVEL 
provider contract transactional_query
as projection on ZDD_TRAVEL_ANA as travel
{
    key TravelUuid,
    @Search.defaultSearchElement: true
    TravelId,
    @Consumption.valueHelpDefinition: [{entity: {name:'/DMO/I_Agency' , element:'AgencyID'} }]  
    @ObjectModel.text.element: [ 'AgencyName' ]
    @Search.defaultSearchElement: true
    AgencyId,
    _Agency.Name as AgencyName,
    @Consumption.valueHelpDefinition: [{entity: {name:'/DMO/I_Customer' , element:'CustomerID' } }]
    @ObjectModel.text.element: [ 'CustomerName' ]
    @Search.defaultSearchElement: true
    CustomerId,
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    @Consumption.valueHelpDefinition:[{ entity: { name: 'I_currency', element: 'Currency'}}]   
    CurrencyCode,
    Description,
    TravelStatus,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child ZC_ANA_BOOKING,
    _Currency,
    _Customer    
}
