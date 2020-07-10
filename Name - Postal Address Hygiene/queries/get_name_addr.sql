select key_column, person, address1, address2, lastline
  from (select cast(${hygiene.key_column} as varchar) as key_column
             , url_encode(coalesce(nullif(concat(${hygiene.name_fields_in_order},''),''),' ')) as person
             , url_encode(coalesce(nullif(concat(${hygiene.address1_fields_in_order},''),''),' ')) as address1
             , url_encode(coalesce(nullif(concat(${hygiene.address2_fields_in_order},''),''),' ')) as address2
             , url_encode(coalesce(nullif(concat(${hygiene.city_st_zip_fields_in_order},''),''),' ')) as lastline
          from (select * from ${hygiene.source_database}.${hygiene.source_table} ${hygiene.source_where_clause} ${hygiene.source_order_by_clause} ${hygiene.limit_rows_clause}) x
      ) src