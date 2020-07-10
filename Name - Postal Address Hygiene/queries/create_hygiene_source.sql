CREATE TABLE if not exists ${hygiene.source_database}.${hygiene.source_table} (
   ${hygiene.key_column} varchar,
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

insert into ${hygiene.source_database}.${hygiene.source_table}
(${hygiene.key_column}, full_name, first_name, middle_name, last_name, suffix
, address1, address2, city, st, zip, zip4, last_line, time)
select ${hygiene.key_column}
, full_name, first_name, middle_name, last_name, suffix
, address1, address2, city, st, zip, zip4, last_line
, cast(TO_UNIXTIME(current_timestamp) as BIGINT)
  from (select 'hygiene_sample_1' as ${hygiene.key_column}
             , 'Mary Simpson' as full_name, 'Mary' as first_name, cast(NULL as varchar) as middle_name
			       , 'Simpson' as last_name, cast(NULL as varchar) as suffix
             , '1112 Short Street' as address1, cast(NULL as varchar) as address2
			       , 'Lisle' as city, 'IL' as st, '60532' as zip, cast(NULL as varchar) as zip4
             , 'Lisle, IL 60532' as last_line
         union all
        select 'hygiene_sample_2' as ${hygiene.key_column}
             , 'John Q Public' as full_name, 'John' as first_name, 'Q' as middle_name
			       , 'Public' as last_name, cast(NULL as varchar) as suffix
             , '1600 Pennsylvania Avenue' as address1, cast(NULL as varchar) as address2
			       , 'Washington' as city, 'DC' as st, cast(NULL as varchar) as zip, cast(NULL as varchar) as zip4
             , 'Washington, DC' as last_line
         union all
        select 'hygiene_sample_3' as ${hygiene.key_column}
             , 'Mr Jonathon Public JR' as full_name, 'John' as first_name, 'Q' as middle_name
			       , 'Public' as last_name, 'JR' as suffix
             , '11 Wall Street New York' as address1, cast(NULL as varchar) as address2
			       , 'New York' as city, 'NY' as st, cast(NULL as varchar) as zip, cast(NULL as varchar) as zip4
             , 'New York, NY' as last_line
         union all
        select 'hygiene_sample_4' as ${hygiene.key_column}
             , 'Mrs Jane M Doe' as full_name, 'Jane' as first_name, 'M' as middle_name
			       , 'Doe' as last_name, cast(NULL as varchar) as suffix
             , '350 Fifth Avenue' as address1, cast(NULL as varchar) as address2
			       , 'New York' as city, 'NY' as st, '10118' as zip, cast(NULL as varchar) as zip4
             , 'New York, NY 10118' as last_line
         union all
        select 'hygiene_sample_5' as ${hygiene.key_column}
             , 'Dr Jane Doe' as full_name, 'Jane' as first_name, cast(NULL as varchar) as middle_name
			       , 'Doe' as last_name, cast(NULL as varchar) as suffix
             , '4059 Mt Lee Dr.' as address1, cast(NULL as varchar) as address2
			       , 'Hollywood' as city, 'CA' as st, '90068' as zip, cast(NULL as varchar) as zip4
             , 'Hollywood, CA 90068' as last_line
         union all
        select 'hygiene_sample_6' as ${hygiene.key_column}
             , 'Susan B Anthony' as full_name, 'Susan' as first_name, 'B' as middle_name
			       , 'Anthony' as last_name, cast(NULL as varchar) as suffix
             , 'Statue of Liberty' as address1, cast(NULL as varchar) as address2
			       , 'Liberty Island' as city, 'NY' as st, '10004' as zip, cast(NULL as varchar) as zip4
             , 'Liberty Island, NY 10004' as last_line
         union all
        select 'hygiene_sample_7' as ${hygiene.key_column}
             , 'Ernie Banks' as full_name, 'Ernie' as first_name, cast(NULL as varchar) as middle_name
			       , 'Banks' as last_name, cast(NULL as varchar) as suffix
             , '1060 W Addison St' as address1, cast(NULL as varchar) as address2
			       , 'Chicago' as city, 'IL' as st, '60613' as zip, cast(NULL as varchar) as zip4
             , 'Chicago, IL 60613' as last_line
         union all
        select 'hygiene_sample_8' as ${hygiene.key_column}
             , 'John Doe' as full_name, 'John' as first_name, cast(NULL as varchar) as middle_name
			       , 'Doe' as last_name, cast(NULL as varchar) as suffix
             , '704 Superior Court' as address1, 'Apt 204' as address2
			       , 'Naperville' as city, 'IL' as st, cast(NULL as varchar) as zip, cast(NULL as varchar) as zip4
             , 'Naperville, IL' as last_line
         union all
        select 'hygiene_sample_9' as ${hygiene.key_column}
             , 'Jane Doe' as full_name, 'Jane' as first_name, cast(NULL as varchar) as middle_name
			       , 'Doe' as last_name, cast(NULL as varchar) as suffix
             , '123 Main St' as address1, 'Apt 1' as address2
			       , 'Manteno' as city, 'IL' as st, '60950' as zip, cast(NULL as varchar) as zip4
             , 'Manteno, IL 60950' as last_line
         union all
        select 'hygiene_sample_10' as ${hygiene.key_column}
             , 'John Q Public' as full_name, 'John' as first_name, 'Q' as middle_name
			       , 'Public' as last_name, cast(NULL as varchar) as suffix
             , '123 Main St' as address1, 'Apt A' as address2
			       , 'Columbia' as city, 'IL' as st, '62236' as zip, cast(NULL as varchar) as zip4
             , 'Columbia, IL 62236' as last_line
        ) src
where not exists (select 1 from ${hygiene.source_table})
;