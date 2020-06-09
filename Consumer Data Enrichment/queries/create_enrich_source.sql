CREATE TABLE if not exists ${enrich.source_database}.${enrich.source_table} (
   ${enrich.key_column} varchar,
   full_name varchar,
   first_name varchar,
   middle_name varchar,
   last_name varchar,
   suffix varchar,
   address1 varchar,
   address2 varchar,
   city varchar,
   st varchar,
   zip varchar,
   zip4 varchar,
   last_line varchar,
   time bigint
);

insert into ${enrich.source_database}.${enrich.source_table}
(${enrich.key_column}, full_name, first_name, middle_name, last_name, suffix
, address1, address2, city, st, zip, zip4, last_line, time)
select 'enrich_sample_1'
, 'Mary Simpson'
, 'Mary'
, cast(NULL as varchar)
, 'Simpson'
, cast(NULL as varchar)
, '1112 Short Street'
, cast(NULL as varchar)
, 'Lisle'
, 'IL'
, '60532'
, cast(NULL as varchar)
, 'Lisle, IL 60532'
, cast(TO_UNIXTIME(current_timestamp) as BIGINT)
where not exists (select 1
                    from ${enrich.source_database}.${enrich.source_table})
;
