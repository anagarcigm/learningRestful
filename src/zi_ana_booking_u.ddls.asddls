@Metadata.ignorePropagatedAnnotations: true
@EndUserText.label: 'Booking data'

define view entity ZI_ANA_booking_U 
 as select from /dmo/booking as booking
   association to parent ZI_ANA_TRAVEL_U as _travel on $projection.TravelId = _travel.TravelId
   association [1..1] to /DMO/I_Customer     as _Customer on $projection.CustomerId = _Customer.CustomerID
   association [1..1] to /DMO/I_Carrier            as _Carrier    on  $projection.CarrierId    = _Carrier.AirlineID
   association [1..1] to /DMO/I_Connection         as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                                  and $projection.ConnectionId = _Connection.ConnectionID
   association [1..1] to /DMO/I_Flight             as _Flight     on  $projection.CarrierId    = _Flight.AirlineID
                                                                  and $projection.ConnectionId = _Flight.ConnectionID
                                                                  and $projection.FlightDate   = _Flight.FlightDate
   
{  
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    
    _travel,
    _Customer,
    _Connection,
    _Carrier,
    _Flight
}
