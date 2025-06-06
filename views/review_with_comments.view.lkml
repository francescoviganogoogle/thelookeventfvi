view: review_with_comments {

  # # You can specify the table name if it's different from the view name:
  sql_table_name: lookerprivateipfvi.bqml.reviews_with_comments ;;

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }
  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
  }
  dimension: products_item_name {
    type: string
    sql: ${TABLE}.products_item_name ;;
  }
  dimension: reviews_sql_rating {
    label: "Rate"
    type: number
    sql: ${TABLE}.reviews_sql_rating ;;
  }
  dimension: is_good {
    type: yesno
    sql: ${reviews_sql_rating} >3  ;;
  }
  measure: average_rating {
    type: average
    sql: ${reviews_sql_rating} ;;
  }

  measure: count {
    type: count
    drill_fields: [products_item_name]
  }

}
