- dashboard: sales_analysis___antigravity_2_0_designer
  title: "Sales Analysis - Antigravity 2.0 Designer"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Comprehensive 2-Year Sales, User Behavior & Closed Order Marginality Analysis for thelook"

  tabs:
    - name: sales_analysis
      label: "Sales Analysis"
    - name: behavior_analysis
      label: "Behavior Analysis"
    - name: closed_orders_margin
      label: "Closed Orders Marginality"

  filters:
    - name: date_filter
      title: "Date Range"
      type: date_filter
      default_value: "2 years"
      allow_multiple_values: true
      required: false
      ui_config:
        type: relative_timeframes
        display: inline

    - name: category_filter
      title: "Product Category"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook
      explore: order_items
      field: products.category

    - name: country_filter
      title: "User Country"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_group
        display: inline
      model: thelook
      explore: order_items
      field: users.country

    - name: traffic_source_filter
      title: "Traffic Source"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: advanced
        display: popover
      model: thelook
      explore: order_items
      field: users.traffic_source

    - name: gender_filter
      title: "User Gender"
      type: field_filter
      default_value: ""
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_group
        display: inline
      model: thelook
      explore: order_items
      field: users.gender

  elements:
    # ---------------- TAB 1: SALES ANALYSIS ---------------- #
    - name: sales_header
      type: text
      tab_name: sales_analysis
      title_text: "Sales & Financial Performance (Last 2 Years)"
      subtitle_text: "Revenue, order volume, margins, and sales distribution across products and demographics"
      row: 0
      col: 0
      width: 24
      height: 2

    # KPI Cards
    - name: total_revenue_kpi
      title: "Total Revenue"
      tab_name: sales_analysis
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.total_sale_price]
      filters:
        order_items.created_date: "2 years"
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#1A73E8"
      show_single_value_title: true
      value_format: "$#,##0"
      row: 2
      col: 0
      width: 6
      height: 4

    - name: total_order_count_kpi
      title: "Total Orders"
      tab_name: sales_analysis
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.order_count]
      filters:
        order_items.created_date: "2 years"
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#34A853"
      show_single_value_title: true
      value_format: "#,##0"
      row: 2
      col: 6
      width: 6
      height: 4

    - name: total_gross_margin_kpi
      title: "Total Gross Margin"
      tab_name: sales_analysis
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.total_gross_margin]
      filters:
        order_items.created_date: "2 years"
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#FBBC04"
      show_single_value_title: true
      value_format: "$#,##0"
      row: 2
      col: 12
      width: 6
      height: 4

    - name: avg_gross_margin_pct_kpi
      title: "Gross Margin %"
      tab_name: sales_analysis
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.total_gross_margin_percentage]
      filters:
        order_items.created_date: "2 years"
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#EA4335"
      show_single_value_title: true
      value_format: "0.0%"
      row: 2
      col: 18
      width: 6
      height: 4

    # Sales Trends & Product Performance
    - name: revenue_margin_monthly_trend
      title: "Monthly Revenue & Gross Margin Trend"
      tab_name: sales_analysis
      model: thelook
      explore: order_items
      type: looker_line
      fields: [order_items.created_month, order_items.total_sale_price, order_items.total_gross_margin]
      filters:
        order_items.created_date: "2 years"
      sorts: [order_items.created_month asc]
      limit: 500
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_combined: true
      y_axis_value_format: "$#,##0"
      show_x_axis_label: false
      show_x_axis_ticks: true
      interpolation: monotone
      series_colors:
        order_items.total_sale_price: "#1A73E8"
        order_items.total_gross_margin: "#FBBC04"
      series_labels:
        order_items.total_sale_price: "Total Revenue"
        order_items.total_gross_margin: "Gross Margin"
      row: 6
      col: 0
      width: 15
      height: 9

    - name: sales_by_category
      title: "Revenue & Orders by Product Category"
      tab_name: sales_analysis
      model: thelook
      explore: order_items
      type: looker_column
      fields: [products.category, order_items.total_sale_price, order_items.order_count]
      filters:
        order_items.created_date: "2 years"
      sorts: [order_items.total_sale_price desc]
      limit: 10
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_combined: false
      series_types:
        order_items.order_count: line
      series_colors:
        order_items.total_sale_price: "#1EA8DF"
        order_items.order_count: "#EA8A2F"
      series_labels:
        order_items.total_sale_price: "Revenue ($)"
        order_items.order_count: "Order Count"
      row: 6
      col: 15
      width: 9
      height: 9

    # Geographical & Demographic Sales Breakdown
    - name: sales_by_country_and_traffic
      title: "Sales Performance by Country & Traffic Source"
      tab_name: sales_analysis
      model: thelook
      explore: order_items
      type: looker_grid
      fields: [users.country, users.traffic_source, order_items.order_count, order_items.total_sale_price, order_items.total_gross_margin]
      filters:
        order_items.created_date: "2 years"
      sorts: [order_items.total_sale_price desc]
      limit: 20
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      show_view_names: false
      show_row_numbers: true
      truncate_text: true
      size_to_fit: true
      table_theme: white
      enable_conditional_formatting: true
      conditional_formatting:
        - type: along a scale...
          value: null
          background_color: "#1A73E8"
          font_color: null
          fields: [order_items.total_sale_price]
      row: 15
      col: 0
      width: 14
      height: 8

    - name: revenue_by_department_brand
      title: "Revenue by Department & Top Brands"
      tab_name: sales_analysis
      model: thelook
      explore: order_items
      type: looker_bar
      fields: [products.department, products.brand, order_items.total_sale_price]
      pivots: [products.department]
      filters:
        order_items.created_date: "2 years"
        products.brand: "-NULL"
      sorts: [order_items.total_sale_price desc 0]
      limit: 10
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      stacking: normal
      series_colors:
        Men - order_items.total_sale_price: "#1EA8DF"
        Women - order_items.total_sale_price: "#E52592"
      row: 15
      col: 14
      width: 10
      height: 8


    # ---------------- TAB 2: BEHAVIOR ANALYSIS ---------------- #
    - name: behavior_header
      type: text
      tab_name: behavior_analysis
      title_text: "User Behavior & Web Analytics (Last 2 Years)"
      subtitle_text: "Website visits, conversion rates, event engagement, and repeat purchase patterns"
      row: 0
      col: 0
      width: 24
      height: 2

    # KPI Cards
    - name: total_events_kpi
      title: "Total Events"
      tab_name: behavior_analysis
      model: thelook
      explore: events
      type: single_value
      fields: [events.count]
      filters:
        events.event_date: "2 years"
      listen:
        date_filter: events.event_date
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#635189"
      show_single_value_title: true
      value_format: "#,##0"
      row: 2
      col: 0
      width: 6
      height: 4

    - name: unique_visitors_kpi
      title: "Unique Visitors"
      tab_name: behavior_analysis
      model: thelook
      explore: events
      type: single_value
      fields: [events.unique_visitors]
      filters:
        events.event_date: "2 years"
      listen:
        date_filter: events.event_date
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#1EA8DF"
      show_single_value_title: true
      value_format: "#,##0"
      row: 2
      col: 6
      width: 6
      height: 4

    - name: total_sessions_kpi
      title: "Total Sessions"
      tab_name: behavior_analysis
      model: thelook
      explore: events
      type: single_value
      fields: [sessions.count]
      filters:
        events.event_date: "2 years"
      listen:
        date_filter: events.event_date
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#49CEC1"
      show_single_value_title: true
      value_format: "#,##0"
      row: 2
      col: 12
      width: 6
      height: 4

    - name: overall_conversion_rate_kpi
      title: "Overall Conversion Rate"
      tab_name: behavior_analysis
      model: thelook
      explore: events
      type: single_value
      fields: [sessions.overall_conversion]
      filters:
        events.event_date: "2 years"
      listen:
        date_filter: events.event_date
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#EA8A2F"
      show_single_value_title: true
      value_format: "0.00%"
      row: 2
      col: 18
      width: 6
      height: 4

    # Conversion Funnel & Engagement Trends
    - name: conversion_funnel_trend
      title: "Monthly Web Session Conversion & Visit Volume"
      tab_name: behavior_analysis
      model: thelook
      explore: events
      type: looker_column
      fields: [events.event_month, sessions.count, sessions.count_with_cart, sessions.count_with_purchase, sessions.overall_conversion]
      filters:
        events.event_date: "2 years"
      sorts: [events.event_month asc]
      limit: 500
      listen:
        date_filter: events.event_date
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_combined: false
      series_types:
        sessions.overall_conversion: line
      series_colors:
        sessions.count: "#8ED3EF"
        sessions.count_with_cart: "#1EA8DF"
        sessions.count_with_purchase: "#34A853"
        sessions.overall_conversion: "#EA8A2F"
      series_labels:
        sessions.count: "Total Sessions"
        sessions.count_with_cart: "Cart Sessions"
        sessions.count_with_purchase: "Purchases"
        sessions.overall_conversion: "Conversion Rate"
      row: 6
      col: 0
      width: 15
      height: 9

    - name: behavior_by_traffic_source
      title: "Events & Unique Visitors by Traffic Source"
      tab_name: behavior_analysis
      model: thelook
      explore: events
      type: looker_column
      fields: [users.traffic_source, events.count, events.unique_visitors]
      filters:
        events.event_date: "2 years"
        users.traffic_source: "-NULL"
      sorts: [events.count desc]
      limit: 10
      listen:
        date_filter: events.event_date
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_combined: false
      series_colors:
        events.count: "#635189"
        events.unique_visitors: "#B1A8C4"
      series_labels:
        events.count: "Event Count"
        events.unique_visitors: "Unique Visitors"
      row: 6
      col: 15
      width: 9
      height: 9

    # Customer Repeat Purchase & Page Views
    - name: repeat_purchase_by_demographics
      title: "Repeat Purchase Rate & Lifetime Orders by Age Tier & Gender"
      tab_name: behavior_analysis
      model: thelook
      explore: order_items
      type: looker_column
      fields: [users.age_tier, users.gender, order_items.30_day_repeat_purchase_rate, user_order_facts.average_lifetime_orders]
      filters:
        order_items.created_date: "2 years"
        users.age_tier: "-NULL"
      sorts: [users.age_tier asc]
      limit: 20
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_combined: false
      series_types:
        user_order_facts.average_lifetime_orders: line
      series_colors:
        order_items.30_day_repeat_purchase_rate: "#49CEC1"
        user_order_facts.average_lifetime_orders: "#776FDF"
      series_labels:
        order_items.30_day_repeat_purchase_rate: "30-Day Repeat Rate"
        user_order_facts.average_lifetime_orders: "Avg Lifetime Orders"
      row: 15
      col: 0
      width: 12
      height: 8

    - name: most_viewed_brands
      title: "Most Viewed Brands & Cart Conversion"
      tab_name: behavior_analysis
      model: thelook
      explore: sessions
      type: looker_grid
      fields: [product_viewed.brand, product_viewed.department, sessions.count, sessions.cart_to_checkout_conversion]
      filters:
        events.event_date: "2 years"
        product_viewed.brand: "-NULL"
      sorts: [sessions.count desc]
      limit: 15
      listen:
        date_filter: events.event_date
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      show_view_names: false
      show_row_numbers: true
      truncate_text: true
      size_to_fit: true
      table_theme: white
      enable_conditional_formatting: true
      conditional_formatting:
        - type: along a scale...
          value: null
          background_color: "#2196F3"
          font_color: null
          fields: [sessions.cart_to_checkout_conversion]
      row: 15
      col: 12
      width: 12
      height: 8


    # ---------------- TAB 3: CLOSED ORDERS MARGINALITY ---------------- #
    - name: closed_orders_margin_header
      type: text
      tab_name: closed_orders_margin
      title_text: "Closed Orders Marginality & Profitability Analysis (Last 2 Years)"
      subtitle_text: "In-depth gross margin breakdown, profit margins, and category profitability for closed orders (Complete status)"
      row: 0
      col: 0
      width: 24
      height: 2

    # KPI Cards (Row 2)
    - name: closed_orders_revenue_kpi
      title: "Closed Orders Revenue"
      tab_name: closed_orders_margin
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.total_sale_price]
      filters:
        order_items.status: "Complete"
        order_items.created_date: "2 years"
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#0F9D58"
      show_single_value_title: true
      value_format: "$#,##0"
      row: 2
      col: 0
      width: 6
      height: 4

    - name: closed_orders_gross_margin_kpi
      title: "Closed Orders Gross Margin"
      tab_name: closed_orders_margin
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.total_gross_margin]
      filters:
        order_items.status: "Complete"
        order_items.created_date: "2 years"
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#1A73E8"
      show_single_value_title: true
      value_format: "$#,##0"
      row: 2
      col: 6
      width: 6
      height: 4

    - name: closed_orders_margin_pct_kpi
      title: "Closed Orders Margin %"
      tab_name: closed_orders_margin
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.total_gross_margin_percentage]
      filters:
        order_items.status: "Complete"
        order_items.created_date: "2 years"
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#FBBC04"
      show_single_value_title: true
      value_format: "0.0%"
      row: 2
      col: 12
      width: 6
      height: 4

    - name: closed_orders_avg_margin_kpi
      title: "Avg Margin / Item"
      tab_name: closed_orders_margin
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.average_gross_margin]
      filters:
        order_items.status: "Complete"
        order_items.created_date: "2 years"
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      custom_color_enabled: true
      custom_color: "#AB47BC"
      show_single_value_title: true
      value_format: "$#,##0.00"
      row: 2
      col: 18
      width: 6
      height: 4

    # Trend & Category Margin (Row 6)
    - name: closed_orders_monthly_margin_trend
      title: "Monthly Closed Orders Revenue vs. Gross Margin Trend"
      tab_name: closed_orders_margin
      model: thelook
      explore: order_items
      type: looker_line
      fields: [order_items.created_month, order_items.total_sale_price, order_items.total_gross_margin]
      filters:
        order_items.status: "Complete"
        order_items.created_date: "2 years"
      sorts: [order_items.created_month asc]
      limit: 500
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_combined: true
      y_axis_value_format: "$#,##0"
      show_x_axis_label: false
      show_x_axis_ticks: true
      interpolation: monotone
      series_colors:
        order_items.total_sale_price: "#0F9D58"
        order_items.total_gross_margin: "#1A73E8"
      series_labels:
        order_items.total_sale_price: "Closed Revenue"
        order_items.total_gross_margin: "Closed Gross Margin"
      row: 6
      col: 0
      width: 15
      height: 9

    - name: closed_orders_margin_by_category
      title: "Gross Margin & Margin % by Product Category"
      tab_name: closed_orders_margin
      model: thelook
      explore: order_items
      type: looker_column
      fields: [products.category, order_items.total_gross_margin, order_items.total_gross_margin_percentage]
      filters:
        order_items.status: "Complete"
        order_items.created_date: "2 years"
      sorts: [order_items.total_gross_margin desc]
      limit: 10
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_combined: false
      series_types:
        order_items.total_gross_margin_percentage: line
      series_colors:
        order_items.total_gross_margin: "#1A73E8"
        order_items.total_gross_margin_percentage: "#FBBC04"
      series_labels:
        order_items.total_gross_margin: "Gross Margin ($)"
        order_items.total_gross_margin_percentage: "Margin %"
      row: 6
      col: 15
      width: 9
      height: 9

    # Brand & Country Breakdown (Row 15)
    - name: closed_orders_top_profitable_brands
      title: "Most Profitable Brands (Closed Orders)"
      tab_name: closed_orders_margin
      model: thelook
      explore: order_items
      type: looker_grid
      fields: [products.brand, products.category, order_items.order_count, order_items.total_sale_price, order_items.total_gross_margin, order_items.total_gross_margin_percentage]
      filters:
        order_items.status: "Complete"
        order_items.created_date: "2 years"
        products.brand: "-NULL"
      sorts: [order_items.total_gross_margin desc]
      limit: 15
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      show_view_names: false
      show_row_numbers: true
      truncate_text: true
      size_to_fit: true
      table_theme: white
      enable_conditional_formatting: true
      conditional_formatting:
        - type: along a scale...
          value: null
          background_color: "#0F9D58"
          font_color: null
          fields: [order_items.total_gross_margin_percentage]
      row: 15
      col: 0
      width: 14
      height: 8

    - name: closed_orders_margin_by_country_gender
      title: "Closed Orders Margin by Country & Gender"
      tab_name: closed_orders_margin
      model: thelook
      explore: order_items
      type: looker_bar
      fields: [users.country, users.gender, order_items.total_gross_margin]
      pivots: [users.gender]
      filters:
        order_items.status: "Complete"
        order_items.created_date: "2 years"
      sorts: [order_items.total_gross_margin desc 0]
      limit: 10
      listen:
        date_filter: order_items.created_date
        category_filter: products.category
        country_filter: users.country
        traffic_source_filter: users.traffic_source
        gender_filter: users.gender
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      stacking: normal
      series_colors:
        Men - order_items.total_gross_margin: "#1EA8DF"
        Women - order_items.total_gross_margin: "#E52592"
      row: 15
      col: 14
      width: 10
      height: 8
