- dashboard: user_behaviors_and_insights
  title: "User Behavior & Customer Insights"
  description: "A premium, executive-grade analytical platform detailing user retention, purchase loyalty, demographic segments, and web acquisition funnels."
  preferred_viewer: dashboards-next
  layout: newspaper
  crossfilter_enabled: false
  query_timezone: user_timezone

  embed_style:
    background_color: "#f8f9fa"
    show_title: true
    title_color: "#114B5F"
    show_filters_bar: true
    tile_text_color: "#114B5F"
    text_tile_text_color: "#ffffff"

  filters:
    - name: Country
      title: "Country"
      type: field_filter
      model: thelook
      explore: order_items
      field: users.country
      default_value: "USA"
      allow_multiple_values: true
      ui_config:
        type: tag_list
        display: popover

    - name: State
      title: "State/Province"
      type: field_filter
      model: thelook
      explore: order_items
      field: users.state
      allow_multiple_values: true
      listens_to_filters:
        - Country
      ui_config:
        type: checkbox_group
        display: popover

    - name: Gender
      title: "User Gender"
      type: field_filter
      model: thelook
      explore: order_items
      field: users.gender
      allow_multiple_values: true
      ui_config:
        type: button_group
        display: inline

    - name: Traffic Source
      title: "Acquisition Traffic Source"
      type: field_filter
      model: thelook
      explore: order_items
      field: users.traffic_source
      allow_multiple_values: true
      ui_config:
        type: tag_list
        display: popover

  tabs:
    - name: user_value_loyalty
      label: "Customer Loyalty & Retention"
    - name: user_demographics_segments
      label: "Demographics & Cohorts"
    - name: user_journey_digital
      label: "Web Journey & Experience"

  elements:
    # ==========================================
    # TAB 1: CUSTOMER LOYALTY & RETENTION
    # ==========================================
    - name: banner_loyalty_retention
      tab_name: user_value_loyalty
      type: text
      width: 24
      height: 4
      row: 0
      col: 0
      body_text: |
        <div style="background: linear-gradient(135deg, #114B5F 0%, #028090 100%); padding: 14px 18px; border-radius: 8px; border-left: 6px solid #F3A712; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); margin: 0; box-sizing: border-box;">
          <h1 style="color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0; font-family: 'Outfit', 'Inter', sans-serif;"><i class="fa fa-users" style="margin-right: 10px; color: #F3A712;"></i>Retention & Customer Lifetime Value (LTV)</h1>
          <p style="color: #E0F2F1; font-size: 12px; margin: 0; font-family: 'Inter', sans-serif;">Monitor how effectively we acquire, nurture, and retain high-value, repeat-purchasing customers over their lifecycle.</p>
        </div>

    - title: Total Acquired Customers
      name: kpi_total_users
      tab_name: user_value_loyalty
      model: thelook
      explore: order_items
      type: single_value
      fields: [users.count]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#114B5F"
      font_size: medium
      text_color: black
      single_value_title: "Total Acquired Customers"
      note_state: collapsed
      note_display: hover
      note_text: "Total unique users acquired in the selected period and region."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 0
      width: 6
      height: 4

    - title: Customer Lifetime Value (LTV)
      name: kpi_avg_lifetime_revenue
      tab_name: user_value_loyalty
      model: thelook
      explore: order_items
      type: single_value
      fields: [user_order_facts.average_lifetime_revenue]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#028090"
      font_size: medium
      text_color: black
      value_format: "$#,##0.00"
      single_value_title: "Average Customer LTV"
      note_state: collapsed
      note_display: hover
      note_text: "Average total revenue spent by a customer over their entire purchasing lifespan."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 6
      width: 6
      height: 4

    - title: 30-Day Repeat Purchase Rate
      name: kpi_repeat_purchase_rate
      tab_name: user_value_loyalty
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.30_day_repeat_purchase_rate]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#45B69C"
      font_size: medium
      text_color: black
      value_format: "0.0%"
      single_value_title: "30-Day Retention Rate"
      note_state: collapsed
      note_display: hover
      note_text: "Percentage of customers who place a subsequent order within 30 days of their initial purchase."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 12
      width: 6
      height: 4

    - title: Average Lifetime Orders
      name: kpi_avg_lifetime_orders
      tab_name: user_value_loyalty
      model: thelook
      explore: order_items
      type: single_value
      fields: [user_order_facts.average_lifetime_orders]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#F3A712"
      font_size: medium
      text_color: black
      value_format: "0.00"
      single_value_title: "Average Lifetime Orders"
      note_state: collapsed
      note_display: hover
      note_text: "Average total number of orders placed per customer over their lifespan."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 18
      width: 6
      height: 4

    - title: "User Retention: Distribution of Customers by Lifetime Orders Tier"
      name: loyalty_tier_distribution
      tab_name: user_value_loyalty
      model: thelook
      explore: order_items
      type: looker_bar
      fields: [user_order_facts.lifetime_orders_tier, users.count]
      fill_fields: [user_order_facts.lifetime_orders_tier]
      sorts: [user_order_facts.lifetime_orders_tier asc]
      limit: 10
      column_limit: 50
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      show_x_axis_label: true
      show_x_axis_ticks: true
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_labels: false
      vis_config:
        type: looker_bar
        colors: ["#114B5F"]
        show_value_labels: true
        series_colors:
          "1 - users.count": "#F3A712"
          "2 - users.count": "#028090"
        legend_position: none
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 8
      col: 0
      width: 12
      height: 8

    - title: "Value Cohorts: Distribution of Customers by Lifetime Spend Segment"
      name: revenue_tier_distribution
      tab_name: user_value_loyalty
      model: thelook
      explore: order_items
      type: looker_column
      fields: [user_order_facts.lifetime_revenue_tier, users.count]
      fill_fields: [user_order_facts.lifetime_revenue_tier]
      sorts: [user_order_facts.lifetime_revenue_tier asc]
      limit: 10
      column_limit: 50
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      show_x_axis_label: true
      show_x_axis_ticks: true
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_labels: false
      vis_config:
        type: looker_column
        colors: ["#028090"]
        show_value_labels: true
        legend_position: none
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 8
      col: 12
      width: 12
      height: 8

    - title: "Customer Lifespan: Days Active as Customer"
      name: days_as_customer_tiered
      tab_name: user_value_loyalty
      model: thelook
      explore: order_items
      type: looker_bar
      fields: [user_order_facts.days_as_customer_tiered, users.count]
      fill_fields: [user_order_facts.days_as_customer_tiered]
      sorts: [user_order_facts.days_as_customer_tiered asc]
      limit: 12
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      show_x_axis_label: true
      show_x_axis_ticks: true
      show_value_labels: true
      vis_config:
        type: looker_bar
        colors: ["#45B69C"]
        show_value_labels: true
        legend_position: none
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 16
      col: 0
      width: 12
      height: 8

    - title: "Repeat Purchase Speed: Interval Distribution (Days Until Next Purchase)"
      name: purchase_interval_speed
      tab_name: user_value_loyalty
      model: thelook
      explore: order_items
      type: looker_line
      fields: [order_items.days_until_next_order, order_items.count]
      sorts: [order_items.days_until_next_order asc]
      limit: 60
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      show_x_axis_label: true
      show_x_axis_ticks: true
      show_value_labels: false
      vis_config:
        type: looker_line
        colors: ["#F3A712"]
        interpolation: monotone
        show_null_points: false
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 16
      col: 12
      width: 12
      height: 8

    - title: "Global Customer Loyalty & Satisfaction Matrix"
      name: country_retention_grid
      tab_name: user_value_loyalty
      model: thelook
      explore: order_items
      type: looker_grid
      fields: [users.country, user_order_facts.average_lifetime_revenue, order_items.30_day_repeat_purchase_rate, reviews_with_comments.average_rating, users.count]
      sorts: [users.count desc]
      limit: 20
      column_limit: 50
      show_totals: true
      show_row_numbers: true
      transpose: false
      truncate_text: true
      size_to_fit: true
      table_theme: white
      enable_conditional_formatting: true
      conditional_formatting:
        - type: "along a scale..."
          value: !!null ''
          background_color: "#114B5F"
          font_color: !!null ''
          color_application:
            collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
            palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab
          fields: [order_items.30_day_repeat_purchase_rate]
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 24
      col: 0
      width: 24
      height: 12


    # ==========================================
    # TAB 2: DEMOGRAPHICS & BEHAVIORAL SEGMENTS
    # ==========================================
    - name: banner_demographics_segments
      tab_name: user_demographics_segments
      type: text
      width: 24
      height: 4
      row: 0
      col: 0
      body_text: |
        <div style="background: linear-gradient(135deg, #1A3A3A 0%, #2A6F6F 100%); padding: 14px 18px; border-radius: 8px; border-left: 6px solid #45B69C; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); margin: 0; box-sizing: border-box;">
          <h1 style="color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0; font-family: 'Outfit', 'Inter', sans-serif;"><i class="fa fa-pie-chart" style="margin-right: 10px; color: #45B69C;"></i>Demographic Segments & ML Cohorts</h1>
          <p style="color: #E2F3F3; font-size: 12px; margin: 0; font-family: 'Inter', sans-serif;">Analyze demographic indicators, category gender splits, customer age tiers, and predictive K-Means behavioral segments.</p>
        </div>

    - title: Currently Active Customers
      name: kpi_active_users
      tab_name: user_demographics_segments
      model: thelook
      explore: order_items
      type: single_value
      fields: [user_order_facts.active_user_count]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#1A3A3A"
      font_size: medium
      text_color: black
      single_value_title: "Active Customer Volume"
      note_state: collapsed
      note_display: hover
      note_text: "Total number of users who have active order associations."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 0
      width: 6
      height: 4

    - title: Average Customer Age
      name: kpi_avg_age
      tab_name: user_demographics_segments
      model: thelook
      explore: order_items
      type: single_value
      fields: [users.average_age]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#2A6F6F"
      font_size: medium
      text_color: black
      value_format: "0.0"
      single_value_title: "Average Customer Age"
      note_state: collapsed
      note_display: hover
      note_text: "Mean age of the customer cohort."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 6
      width: 6
      height: 4

    - title: Return Rate
      name: kpi_return_rate
      tab_name: user_demographics_segments
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.return_rate]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#E63946"
      font_size: medium
      text_color: black
      value_format: "0.0%"
      single_value_title: "Product Return Rate"
      note_state: collapsed
      note_display: hover
      note_text: "Percentage of ordered items returned. Higher levels require post-purchase behavioral reviews."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 12
      width: 6
      height: 4

    - title: Customer Satisfaction (CSAT)
      name: kpi_avg_csat
      tab_name: user_demographics_segments
      model: thelook
      explore: order_items
      type: single_value
      fields: [reviews_with_comments.average_rating]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#F3A712"
      font_size: medium
      text_color: black
      value_format: "0.0 / 5"
      single_value_title: "Average Review Rating"
      note_state: collapsed
      note_display: hover
      note_text: "Average rating from customer reviews left with order feedback."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 18
      width: 6
      height: 4

    - title: "Age Cohort Profile: Lifetime Value & Customer Count"
      name: age_tier_value_profile
      tab_name: user_demographics_segments
      model: thelook
      explore: order_items
      type: looker_column
      fields: [users.age_tier, user_order_facts.average_lifetime_revenue, users.count]
      fill_fields: [users.age_tier]
      sorts: [users.age_tier asc]
      limit: 10
      y_axes:
        - label: "Average LTV ($)"
          orientation: left
          series:
            - id: user_order_facts.average_lifetime_revenue
              name: "Avg LTV"
              axisId: user_order_facts.average_lifetime_revenue
        - label: "Customer Count"
          orientation: right
          series:
            - id: users.count
              name: "Customers"
              axisId: users.count
      vis_config:
        type: looker_column
        y_axis_combined: false
        y_axes:
          - label: "Average LTV ($)"
            orientation: left
            show_labels: true
            show_values: true
            value_format: "$#,##0"
            series:
              - id: user_order_facts.average_lifetime_revenue
                name: "Avg LTV"
                axisId: user_order_facts.average_lifetime_revenue
          - label: "Customer Count"
            orientation: right
            show_labels: true
            show_values: true
            value_format: "#,##0"
            series:
              - id: users.count
                name: "Customers"
                axisId: users.count
        series_types:
          user_order_facts.average_lifetime_revenue: line
          users.count: column
        series_colors:
          user_order_facts.average_lifetime_revenue: "#F3A712"
          users.count: "#1A3A3A"
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 8
      col: 0
      width: 12
      height: 8

    - title: "Gender Category Preferences: Order Counts by Product Category"
      name: gender_category_preferences
      tab_name: user_demographics_segments
      model: thelook
      explore: order_items
      type: looker_column
      fields: [products.category, users.gender, order_items.count]
      pivots: [users.gender]
      sorts: [order_items.count desc 0]
      limit: 10
      column_limit: 50
      stacking: percent
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      show_x_axis_label: true
      show_x_axis_ticks: true
      vis_config:
        type: looker_column
        stacking: percent
        series_colors:
          "Female - order_items.count": "#45B69C"
          "Male - order_items.count": "#1A3A3A"
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 8
      col: 12
      width: 12
      height: 8

    - title: "ML K-Means Behavioral Cohort Segment Insights"
      name: kmeans_centroid_insights
      tab_name: user_demographics_segments
      model: thelook
      explore: ecomm_predict
      type: looker_column
      fields: [ecomm_predict.centroid_label, order_items.total_sale_price, users.count]
      sorts: [order_items.total_sale_price desc]
      limit: 10
      y_axes:
        - label: "Cohort Sales ($)"
          orientation: left
          series:
            - id: order_items.total_sale_price
              name: "Total Sales"
              axisId: order_items.total_sale_price
        - label: "Customer Count"
          orientation: right
          series:
            - id: users.count
              name: "Customers"
              axisId: users.count
      vis_config:
        type: looker_column
        y_axis_combined: false
        y_axes:
          - label: "Cohort Sales ($)"
            orientation: left
            show_labels: true
            show_values: true
            value_format: "$#,##0"
            series:
              - id: order_items.total_sale_price
                name: "Total Sales"
                axisId: order_items.total_sale_price
          - label: "Customer Count"
            orientation: right
            show_labels: true
            show_values: true
            value_format: "#,##0"
            series:
              - id: users.count
                name: "Customers"
                axisId: users.count
        series_types:
          order_items.total_sale_price: line
          users.count: column
        series_colors:
          order_items.total_sale_price: "#45B69C"
          users.count: "#2A6F6F"
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 16
      col: 0
      width: 12
      height: 8

    - title: "Customer Reviews: Satisfaction by Product Department & Category"
      name: category_csat_ranking
      tab_name: user_demographics_segments
      model: thelook
      explore: order_items
      type: looker_grid
      fields: [products.department, products.category, reviews_with_comments.average_rating, reviews_with_comments.count]
      sorts: [reviews_with_comments.average_rating asc]
      limit: 15
      show_totals: true
      show_row_numbers: true
      transpose: false
      truncate_text: true
      size_to_fit: true
      table_theme: white
      enable_conditional_formatting: true
      conditional_formatting:
        - type: "less than"
          value: 3.5
          background_color: "#FEE2E2"
          font_color: "#DB4437"
        - type: "greater than"
          value: 4.2
          background_color: "#D1FAE5"
          font_color: "#0F9D58"
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 16
      col: 12
      width: 12
      height: 8


    # ==========================================
    # TAB 3: WEB JOURNEY & EXPERIENCE
    # ==========================================
    - name: banner_journey_digital
      tab_name: user_journey_digital
      type: text
      width: 24
      height: 4
      row: 0
      col: 0
      body_text: |
        <div style="background: linear-gradient(135deg, #2B2D42 0%, #1D3557 100%); padding: 14px 18px; border-radius: 8px; border-left: 6px solid #E63946; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); margin: 0; box-sizing: border-box;">
          <h1 style="color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0; font-family: 'Outfit', 'Inter', sans-serif;"><i class="fa fa-mouse-pointer" style="margin-right: 10px; color: #E63946;"></i>Web Journey & Digital Experience</h1>
          <p style="color: #F1FAEE; font-size: 12px; margin: 0; font-family: 'Inter', sans-serif;">Review landing-to-conversion rates, drop-off tunnels, operating system bounce metrics, and browser bounce indicators.</p>
        </div>

    - title: Digital Web Sessions
      name: kpi_web_sessions
      tab_name: user_journey_digital
      model: thelook
      explore: events
      type: single_value
      fields: [sessions.count]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#1D3557"
      font_size: medium
      text_color: black
      single_value_title: "Total Web Sessions"
      note_state: collapsed
      note_display: hover
      note_text: "Total recorded website sessions."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 0
      width: 6
      height: 4

    - title: Unique Digital Visitors
      name: kpi_unique_visitors
      tab_name: user_journey_digital
      model: thelook
      explore: events
      type: single_value
      fields: [events.unique_visitors]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#2B2D42"
      font_size: medium
      text_color: black
      single_value_title: "Unique Website Visitors"
      note_state: collapsed
      note_display: hover
      note_text: "Number of unique website visitors by IP and login."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 6
      width: 6
      height: 4

    - title: Digital Conversion Rate
      name: kpi_conversion_rate
      tab_name: user_journey_digital
      model: thelook
      explore: events
      type: single_value
      fields: [sessions.overall_conversion]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#E63946"
      font_size: medium
      text_color: black
      value_format: "0.00%"
      single_value_title: "Overall Conversion Rate"
      note_state: collapsed
      note_display: hover
      note_text: "Percentage of web sessions that progress to a completed purchase."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 12
      width: 6
      height: 4

    - title: Average Session Duration
      name: kpi_avg_duration
      tab_name: user_journey_digital
      model: thelook
      explore: events
      type: single_value
      fields: [sessions.average_duration]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#F3A712"
      font_size: medium
      text_color: black
      value_format: "#,##0 sec"
      single_value_title: "Average Session Duration"
      note_state: collapsed
      note_display: hover
      note_text: "Average length of website sessions in seconds."
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 4
      col: 18
      width: 6
      height: 4

    - title: "Web Funnel Analysis: Session Drop-off Tunnel"
      name: digital_funnel_dropoff
      tab_name: user_journey_digital
      model: thelook
      explore: events
      type: looker_column
      fields: [sessions.all_sessions, sessions.count_browse_or_later, sessions.count_product_or_later, sessions.count_cart_or_later, sessions.count_purchase]
      limit: 500
      column_limit: 50
      vis_config:
        type: looker_column
        colors: ["#1D3557", "#2A3439", "#4A5D6E", "#708090", "#E63946"]
        show_value_labels: true
        legend_position: none
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 8
      col: 0
      width: 12
      height: 10

    - title: "Acquisition Performance: Bounce Rate & Sessions by Web Browser"
      name: browser_bounce_performance
      tab_name: user_journey_digital
      model: thelook
      explore: events
      type: looker_column
      fields: [events.browser, sessions.percent_bounce_sessions, sessions.count]
      sorts: [sessions.count desc]
      limit: 10
      y_axes:
        - label: "Sessions"
          orientation: left
          series:
            - id: sessions.count
              name: "Sessions"
              axisId: sessions.count
        - label: "Bounce Rate (%)"
          orientation: right
          series:
            - id: sessions.percent_bounce_sessions
              name: "Bounce Rate"
              axisId: sessions.percent_bounce_sessions
      vis_config:
        type: looker_column
        y_axis_combined: false
        y_axes:
          - label: "Sessions"
            orientation: left
            show_labels: true
            show_values: true
            value_format: "#,##0"
            series:
              - id: sessions.count
                name: "Sessions"
                axisId: sessions.count
          - label: "Bounce Rate (%)"
            orientation: right
            show_labels: true
            show_values: true
            value_format: "0.0%"
            series:
              - id: sessions.percent_bounce_sessions
                name: "Bounce Rate"
                axisId: sessions.percent_bounce_sessions
        series_types:
          sessions.percent_bounce_sessions: line
          sessions.count: column
        series_colors:
          sessions.percent_bounce_sessions: "#E63946"
          sessions.count: "#2B2D42"
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 8
      col: 12
      width: 12
      height: 10

    - title: "User Acquisition Channels (Traffic Sources)"
      name: traffic_source_share
      tab_name: user_journey_digital
      model: thelook
      explore: events
      type: looker_pie
      fields: [users.traffic_source, events.unique_visitors]
      sorts: [events.unique_visitors desc]
      limit: 10
      vis_config:
        type: looker_pie
        value_labels: legend
        inner_radius: 50
        colors: ["#1D3557", "#2B2D42", "#45B69C", "#F3A712", "#E63946"]
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 18
      col: 0
      width: 12
      height: 8

    - title: "Visitor Technology Profile: Operating Systems Engagement"
      name: visitor_os_breakdown
      tab_name: user_journey_digital
      model: thelook
      explore: events
      type: looker_bar
      fields: [events.os, sessions.count]
      sorts: [sessions.count desc]
      limit: 12
      vis_config:
        type: looker_bar
        colors: ["#2B2D42"]
        show_value_labels: true
        legend_position: none
      listen:
        Country: users.country
        State: users.state
        Gender: users.gender
        Traffic Source: users.traffic_source
      row: 18
      col: 12
      width: 12
      height: 8
