- dashboard: sales_and_digital_behavior_analytics
  title: "Sales & Digital Experience Analytics"
  description: "A comprehensive executive-grade LookML dashboard unifying corporate sales, profit margins, predictive cohorts, and web experience conversion funnels."
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
    - name: Date
      title: "Date Range"
      type: date_filter
      default_value: "365 days"

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

    - name: Traffic Source
      title: "Traffic Channel"
      type: field_filter
      model: thelook
      explore: order_items
      field: users.traffic_source
      allow_multiple_values: true
      ui_config:
        type: tag_list
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

  tabs:
    - name: executive_hub
      label: "Executive Hub"
    - name: sales_finances
      label: "Sales & Profit Margins"
    - name: customer_cohorts
      label: "Customer Value & Cohorts"
    - name: digital_experience
      label: "Digital Funnels & Web Behavior"

  elements:
    # ==========================================
    # TAB 1: EXECUTIVE HUB
    # ==========================================
    - name: banner_executive_hub
      tab_name: executive_hub
      type: text
      width: 24
      height: 4
      row: 0
      col: 0
      body_text: |
        <div style="background: linear-gradient(135deg, #114B5F 0%, #028090 100%); padding: 14px 18px; border-radius: 8px; border-left: 6px solid #F3A712; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); margin: 0; box-sizing: border-box;">
          <h1 style="color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0; font-family: 'Outfit', 'Inter', sans-serif;"><i class="fa fa-dashboard" style="margin-right: 10px; color: #F3A712;"></i>Executive Business Hub</h1>
          <p style="color: #E0F2F1; font-size: 12px; margin: 0; font-family: 'Inter', sans-serif;">Unified high-level dashboard displaying corporate sales, gross margins, acquired audience metrics, and web conversions.</p>
        </div>

    - title: Corporate Sales
      name: kpi_total_sales
      tab_name: executive_hub
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.total_sale_price]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#114B5F"
      font_size: medium
      text_color: black
      value_format: "$#,##0.00"
      single_value_title: "Total Revenue"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 4
      col: 0
      width: 4
      height: 4

    - title: Gross Profit Margin
      name: kpi_total_margin
      tab_name: executive_hub
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.total_gross_margin]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#028090"
      font_size: medium
      text_color: black
      value_format: "$#,##0.00"
      single_value_title: "Total Gross Margin"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 4
      col: 4
      width: 4
      height: 4

    - title: Margin Percentage
      name: kpi_margin_percentage
      tab_name: executive_hub
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.total_gross_margin_percentage]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#45B69C"
      font_size: medium
      text_color: black
      value_format: "0.0%"
      single_value_title: "Gross Margin Rate"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 4
      col: 8
      width: 4
      height: 4

    - title: Active Customer Volume
      name: kpi_active_customers
      tab_name: executive_hub
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
      single_value_title: "Active Customers"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 4
      col: 12
      width: 4
      height: 4

    - title: Average Order Value
      name: kpi_aov
      tab_name: executive_hub
      model: thelook
      explore: order_items
      type: single_value
      fields: [order_items.average_sale_price]
      limit: 500
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      custom_color: "#F3A712"
      font_size: medium
      text_color: black
      value_format: "$#,##0.00"
      single_value_title: "Average Order Value"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 4
      col: 16
      width: 4
      height: 4

    - title: On-Site Conversion Rate
      name: kpi_web_conversion
      tab_name: executive_hub
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
      value_format: "0.0%"
      single_value_title: "Conversion Rate"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
      row: 4
      col: 20
      width: 4
      height: 4

    - title: "Revenue & Margin Financial Development Trends"
      name: revenue_margin_trends
      tab_name: executive_hub
      model: thelook
      explore: order_items
      type: looker_column
      fields: [order_items.created_month, order_items.total_sale_price, order_items.total_gross_margin]
      sorts: [order_items.created_month desc]
      limit: 12
      y_axes:
        - label: "Total Sales ($)"
          orientation: left
          series:
            - id: order_items.total_sale_price
              name: "Sales"
              axisId: order_items.total_sale_price
        - label: "Total Margin ($)"
          orientation: right
          series:
            - id: order_items.total_gross_margin
              name: "Margin"
              axisId: order_items.total_gross_margin
      vis_config:
        type: looker_column
        y_axis_combined: false
        y_axes:
          - label: "Total Sales ($)"
            orientation: left
            show_labels: true
            show_values: true
            value_format: "$#,##0"
            series:
              - id: order_items.total_sale_price
                name: "Sales"
                axisId: order_items.total_sale_price
          - label: "Total Margin ($)"
            orientation: right
            show_labels: true
            show_values: true
            value_format: "$#,##0"
            series:
              - id: order_items.total_gross_margin
                name: "Margin"
                axisId: order_items.total_gross_margin
        series_types:
          order_items.total_gross_margin: line
          order_items.total_sale_price: column
        series_colors:
          order_items.total_sale_price: "#114B5F"
          order_items.total_gross_margin: "#F3A712"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 8
      col: 0
      width: 12
      height: 10

    - title: "Global Sales Performance Matrix by Country"
      name: global_sales_matrix
      tab_name: executive_hub
      model: thelook
      explore: order_items
      type: looker_grid
      fields: [users.country, order_items.total_sale_price, order_items.total_gross_margin, order_items.total_gross_margin_percentage, order_items.return_rate, order_items.order_count]
      sorts: [order_items.total_sale_price desc]
      limit: 15
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
          fields: [order_items.total_sale_price]
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 8
      col: 12
      width: 12
      height: 10


    # ==========================================
    # TAB 2: SALES & PROFIT MARGINS
    # ==========================================
    - name: banner_sales_finances
      tab_name: sales_finances
      type: text
      width: 24
      height: 4
      row: 0
      col: 0
      body_text: |
        <div style="background: linear-gradient(135deg, #1A3A3A 0%, #2A6F6F 100%); padding: 14px 18px; border-radius: 8px; border-left: 6px solid #45B69C; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); margin: 0; box-sizing: border-box;">
          <h1 style="color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0; font-family: 'Outfit', 'Inter', sans-serif;"><i class="fa fa-money" style="margin-right: 10px; color: #45B69C;"></i>Sales Contribution & Catalog Profitability</h1>
          <p style="color: #E2F3F3; font-size: 12px; margin: 0; font-family: 'Inter', sans-serif;">Deep-dive financial review on margins, brand profitability, returns rates, and product categories performance.</p>
        </div>

    - title: "Catalog Contribution: Sales and Margins by Category"
      name: category_financials_distribution
      tab_name: sales_finances
      model: thelook
      explore: order_items
      type: looker_column
      fields: [products.category, order_items.total_sale_price, order_items.total_gross_margin]
      sorts: [order_items.total_sale_price desc]
      limit: 15
      column_limit: 50
      stacking: ""
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      show_x_axis_label: true
      show_x_axis_ticks: true
      show_value_labels: false
      vis_config:
        type: looker_column
        series_colors:
          "order_items.total_sale_price": "#1A3A3A"
          "order_items.total_gross_margin": "#45B69C"
        legend_position: right
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Departmental Split: Category Share of Gross Margins"
      name: category_margin_share
      tab_name: sales_finances
      model: thelook
      explore: order_items
      type: looker_column
      fields: [products.category, products.department, order_items.total_gross_margin]
      pivots: [products.department]
      sorts: [order_items.total_gross_margin desc 0]
      limit: 10
      column_limit: 50
      stacking: percent
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      vis_config:
        type: looker_column
        stacking: percent
        series_colors:
          "Female - order_items.total_gross_margin": "#45B69C"
          "Male - order_items.total_gross_margin": "#2A6F6F"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "Returns and Margin Leaks by Product Category"
      name: returns_margin_leaks
      tab_name: sales_finances
      model: thelook
      explore: order_items
      type: looker_grid
      fields: [products.department, products.category, order_items.return_rate, order_items.returned_total_sale_price, order_items.total_gross_margin]
      sorts: [order_items.return_rate desc]
      limit: 15
      show_totals: true
      show_row_numbers: true
      transpose: false
      truncate_text: true
      size_to_fit: true
      table_theme: white
      enable_conditional_formatting: true
      conditional_formatting:
        - type: "greater than"
          value: 0.40
          background_color: "#FEE2E2"
          font_color: "#DB4437"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 12
      col: 0
      width: 12
      height: 8

    - title: "Discount Campaign Effectiveness: Discount Averages & Sales Impact"
      name: discount_effectiveness_matrix
      tab_name: sales_finances
      model: thelook
      explore: order_items
      type: looker_column
      fields: [discounts.average_discount, order_items.total_sale_price, products.department]
      pivots: [products.department]
      sorts: [discounts.average_discount desc]
      limit: 12
      y_axes:
        - label: "Total Revenue ($)"
          orientation: left
      vis_config:
        type: looker_column
        series_colors:
          "Female - order_items.total_sale_price": "#2A6F6F"
          "Male - order_items.total_sale_price": "#F3A712"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 12
      col: 12
      width: 12
      height: 8


    # ==========================================
    # TAB 3: CUSTOMER VALUE & COHORTS
    # ==========================================
    - name: banner_customer_cohorts
      tab_name: customer_cohorts
      type: text
      width: 24
      height: 4
      row: 0
      col: 0
      body_text: |
        <div style="background: linear-gradient(135deg, #114B5F 0%, #2A6F97 100%); padding: 14px 18px; border-radius: 8px; border-left: 6px solid #F3A712; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); margin: 0; box-sizing: border-box;">
          <h1 style="color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0; font-family: 'Outfit', 'Inter', sans-serif;"><i class="fa fa-users" style="margin-right: 10px; color: #F3A712;"></i>Cohort Profiles & Machine Learning Segments</h1>
          <p style="color: #E0F2F1; font-size: 12px; margin: 0; font-family: 'Inter', sans-serif;">Review customer life cycles, retention indicators, interval purchase velocities, and predictive K-Means behavioral segments.</p>
        </div>

    - title: "Customer Lifetime Value (LTV) Tier Distribution"
      name: customer_ltv_distribution
      tab_name: customer_cohorts
      model: thelook
      explore: order_items
      type: looker_column
      fields: [user_order_facts.lifetime_revenue_tier, users.count]
      fill_fields: [user_order_facts.lifetime_revenue_tier]
      sorts: [user_order_facts.lifetime_revenue_tier asc]
      limit: 10
      column_limit: 50
      vis_config:
        type: looker_column
        colors: ["#114B5F"]
        show_value_labels: true
        legend_position: none
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Repeat Purchase velocity: Time Intervals Between Orders"
      name: customer_purchase_intervals
      tab_name: customer_cohorts
      model: thelook
      explore: order_items
      type: looker_line
      fields: [order_items.days_until_next_order, order_items.count]
      sorts: [order_items.days_until_next_order asc]
      limit: 60
      vis_config:
        type: looker_line
        colors: ["#F3A712"]
        interpolation: monotone
        show_null_points: false
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 4
      col: 12
      width: 12
      height: 8

    - title: "ML Centennial Model: Predictive K-Means Clusters"
      name: kmeans_predictive_cohorts
      tab_name: customer_cohorts
      model: thelook
      explore: ecomm_predict
      type: looker_column
      fields: [ecomm_predict.centroid_label, order_items.total_sale_price, users.count]
      sorts: [order_items.total_sale_price desc]
      limit: 10
      y_axes:
        - label: "Cluster Revenue ($)"
          orientation: left
          series:
            - id: order_items.total_sale_price
              name: "Total Sales"
              axisId: order_items.total_sale_price
        - label: "Cohort Count"
          orientation: right
          series:
            - id: users.count
              name: "Customers"
              axisId: users.count
      vis_config:
        type: looker_column
        y_axis_combined: false
        y_axes:
          - label: "Cluster Revenue ($)"
            orientation: left
            show_labels: true
            show_values: true
            value_format: "$#,##0"
            series:
              - id: order_items.total_sale_price
                name: "Total Sales"
                axisId: order_items.total_sale_price
          - label: "Cohort Count"
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
          users.count: "#114B5F"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
      row: 12
      col: 0
      width: 12
      height: 8

    - title: "Loyalty Tenure Brackets: Days as Customer Distribution"
      name: customer_loyalty_tenure
      tab_name: customer_cohorts
      model: thelook
      explore: order_items
      type: looker_bar
      fields: [user_order_facts.days_as_customer_tiered, users.count]
      fill_fields: [user_order_facts.days_as_customer_tiered]
      sorts: [user_order_facts.days_as_customer_tiered asc]
      limit: 12
      vis_config:
        type: looker_bar
        colors: ["#2A6F97"]
        show_value_labels: true
        legend_position: none
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
        Date: order_items.created_date
      row: 12
      col: 12
      width: 12
      height: 8


    # ==========================================
    # TAB 4: WEB BEHAVIOR & CONVERSION EXPERIENCE
    # ==========================================
    - name: banner_digital_experience
      tab_name: digital_experience
      type: text
      width: 24
      height: 4
      row: 0
      col: 0
      body_text: |
        <div style="background: linear-gradient(135deg, #2B2D42 0%, #1D3557 100%); padding: 14px 18px; border-radius: 8px; border-left: 6px solid #E63946; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); margin: 0; box-sizing: border-box;">
          <h1 style="color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0; font-family: 'Outfit', 'Inter', sans-serif;"><i class="fa fa-mouse-pointer" style="margin-right: 10px; color: #E63946;"></i>Marketing Acquisition & On-Site Experience Funnels</h1>
          <p style="color: #F1FAEE; font-size: 12px; margin: 0; font-family: 'Inter', sans-serif;">Monitor session durations, landing bounce rates, device profiles, and step-by-step digital drop-off conversion funnels.</p>
        </div>

    - title: "Digital Cohorts: Conversion Journey drop-offs"
      name: digital_journey_dropoff
      tab_name: digital_experience
      model: thelook
      explore: events
      type: looker_column
      fields: [sessions.all_sessions, sessions.count_browse_or_later, sessions.count_product_or_later, sessions.count_cart_or_later, sessions.count_purchase]
      limit: 500
      column_limit: 50
      vis_config:
        type: looker_column
        colors: ["#1D3557", "#2C3539", "#5A6D7E", "#8A9EA7", "#E63946"]
        show_value_labels: true
        legend_position: none
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
      row: 4
      col: 0
      width: 12
      height: 10

    - title: "Browser Tech Analytics: Sessions and Bounce Rates"
      name: browser_tech_analytics
      tab_name: digital_experience
      model: thelook
      explore: events
      type: looker_column
      fields: [events.browser, sessions.count, sessions.percent_bounce_sessions]
      sorts: [sessions.count desc]
      limit: 10
      y_axes:
        - label: "Sessions Count"
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
          - label: "Sessions Count"
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
          sessions.count: "#1D3557"
          sessions.percent_bounce_sessions: "#E63946"
      listen:
        Country: users.country
        State: users.state
        Traffic Source: users.traffic_source
        Gender: users.gender
      row: 4
      col: 12
      width: 12
      height: 10

    - title: "On-Site Audience Operating System Profiler"
      name: audience_os_profiler
      tab_name: digital_experience
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
        Traffic Source: users.traffic_source
        Gender: users.gender
      row: 14
      col: 0
      width: 12
      height: 8

    - title: "Marketing Traffic Acquisition Mix (Visitors Share)"
      name: marketing_traffic_mix
      tab_name: digital_experience
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
        Traffic Source: users.traffic_source
        Gender: users.gender
      row: 14
      col: 12
      width: 12
      height: 8
