view: reviews_with_comments {

  # # You can specify the table name if it's different from the view name:
  sql_table_name: lookerprivateipfvi.bqml.reviews_with_comments ;;

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }
  dimension: order_item_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.order_item_id ;;
  }
  dimension: products_item_name {
    type: string
    sql: ${TABLE}.products_item_name ;;
  }
  dimension: reviews_sql_rating {
    label: "Rate"
    type: string
    sql: cast(${TABLE}.reviews_sql_rating as string) ;;
  }

  dimension: reviews_sql_rating_number {
    hidden: yes
    label: "Rate"
    type: number
    sql: ${TABLE}.reviews_sql_rating  ;;
  }


  dimension: is_good {
    type: yesno
    sql: ${reviews_sql_rating_number} >3  ;;
  }
  measure: average_rating {
    label: "Average Rating"
    type: average
    sql: ${reviews_sql_rating_number} ;;
  }

  measure: count {
    label: "Count Comments"
    type: count
    drill_fields: [products_item_name]
  }

}
