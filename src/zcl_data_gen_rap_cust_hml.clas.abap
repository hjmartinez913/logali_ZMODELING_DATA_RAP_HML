CLASS zcl_data_gen_rap_cust_hml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_data_gen_rap_cust_hml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    delete from zcustomers_hml.
    insert zcustomers_hml from (
            select from /dmo/travel
                fields uuid(  ) as customer_uuid,
                       customer_id,
                       description,
                       createdby as local_created_by,
                       createdat as local_created_at,
                       lastchangedby as local_last_changed_by,
                       lastchangedat as local_last_changed_at
                       ).
    if sy-subrc EQ 0.
        out->write( |Proyectos........{ sy-dbcnt } rows inserted| ).

    endif.

  ENDMETHOD.

ENDCLASS.
