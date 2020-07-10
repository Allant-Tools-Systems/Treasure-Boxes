CREATE TABLE if not exists ${hygiene.target_database}.${hygiene.target_table} (
   ${hygiene.key_column} varchar,
   full_name varchar,
   prefix_title varchar,
   first_name varchar,
   middle_name varchar,
   last_name varchar,
   suffix varchar,
   gender varchar,
   address1 varchar,
   address2 varchar,
   locality varchar,
   region varchar,
   postal_code1 varchar,
   postal_code2 varchar,
   mailability_score varchar,
   dpv_status varchar,
   address_errorStatus varchar,
   address_record_type varchar,
   address_latitude varchar,
   address_longitude varchar,
   country varchar,
   person_2_fullName varchar,
   person_2_prefix varchar,
   person_2_firstName varchar,
   person_2_middleName varchar,
   person_2_lastName varchar,
   person_2_suffix varchar,
   person_2_other varchar,
   person_2_gender varchar,
   address_primaryNumber varchar,
   address_primaryPrefix1 varchar,
   address_primaryName1 varchar,
   address_primaryType1 varchar,
   address_postfix1 varchar,
   address_unitNumber varchar,
   address_unitDescription varchar,
   address_apartment varchar,
   address_ruralRouteNumber varchar,
   address_ruralRouteBox varchar,
   address_postOfficeBox varchar,
   address_foreignFlag varchar,
   address_extraneous varchar,
   address_remainder varchar,
   address_sortCode varchar,
   address_deliveryPoint varchar,
   address_checkDigit varchar,
   address_lot varchar,
   address_lotOrder varchar,
   address_dpvNoStatus varchar,
   address_dpvCmra varchar,
   address_dpvVacant varchar,
   address_dpvFtnote varchar,
   address_fipscode varchar,
   address_geographicBlock varchar,
   address_geographicMatchType varchar,
   address_match5 varchar,
   address_match9 varchar,
   address_matchUn varchar,
   address_rdi varchar,
   address_lacsCode varchar,
   address_lacsReturnValue varchar,
   address_ewsFlag varchar,
   address_stelinkReturnValue varchar,
   address_addressType varchar,
   address_addressQualityCode varchar,
   business_name varchar,
   time bigint
)