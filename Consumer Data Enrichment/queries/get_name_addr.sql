select key_column, person, address1, address2, lastline
  from (select cast(${enrich.key_column} as varchar) as key_column
             , url_encode(coalesce(nullif(concat(${enrich.name_fields_in_order},''),''),' ')) as person
             , url_encode(coalesce(nullif(concat(${enrich.address1_fields_in_order},''),''),' ')) as address1
             , url_encode(coalesce(nullif(concat(${enrich.address2_fields_in_order},''),''),' ')) as address2
             , url_encode(coalesce(nullif(concat(${enrich.city_st_zip_fields_in_order},''),''),' ')) as lastline
          from (select * from ${enrich.source_database}.${enrich.source_table} ${enrich.source_where_clause} ${enrich.source_order_by_clause} ${enrich.limit_rows_clause}) x
      ) src