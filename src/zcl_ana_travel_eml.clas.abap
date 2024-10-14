CLASS zcl_ana_travel_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ana_travel_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
** Operation 1 - Read sin field
*  READ ENTITIES OF zdd_travel_ana
*  ENTITY travel
*  FROM VALUE #( ( TravelUuid = '6C2172425242011419005A0E6B4910BB' ) )
*  RESULT DATA(lt_result).
** Operation 2 - Read con field, asociación
*    READ ENTITIES OF zdd_travel_ana
**     ENTITY travel
*     ENTITY travel by \_Booking
**    FIELDS ( TravelID Agencyid CustomerID )
*     ALL FIELDS
*     with VALUE #( ( TravelUuid = '111111111111111111111111111' ) )
*     RESULT DATA(lt_result)
*     FAILED data(lt_failed)
*     reported data(lt_reported).
*
*    out->write( lt_result ).
*    out->write( lt_failed ).
*    out->write( lt_reported ).

** Operation modify
*    MODIFY ENTITIES OF zdd_travel_ana
*     ENTITY travel
*     UPDATE   SET FIELDS WITH VALUE
*              #( ( TravelUUID  = '652172425242011419005A0E6B4910BB'
*                   Description = 'I like RAP@openSAP' ) )
*
*       FAILED DATA(failed)
*       REPORTED DATA(reported).
*
*       COMMIT ENTITIES
*       RESPONSE OF Zdd_Travel_ana
*       FAILED     DATA(failed_commit)
*       REPORTED   DATA(reported_commit).

*  out->write( 'Update done' )
** Operation Creation
*      MODIFY ENTITIES OF zdd_travel_ana
*      ENTITY travel
*      create
*       SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'Create Operation' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*     out->write( mapped-travel ).
*
*     COMMIT ENTITIES
*      RESPONSE OF zdd_travel_ana
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).
** Operation Delete
     MODIFY ENTITIES OF zdd_travel_ana
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '2A03EFC87A831EEF9D883819A33860B0' ) )
     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF Zdd_travel_ana
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Delete done' ).

  ENDMETHOD.

ENDCLASS.
