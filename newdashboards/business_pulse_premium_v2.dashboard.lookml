- dashboard: business_pulse_premium_v2
  title: Business Pulse (Premium v2)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "An executive-grade, visually optimized and structurally reordered copy of the Business Pulse dashboard."
  query_timezone: user_timezone
  crossfilter_enabled: false
  embed_style:
    background_color: "#f7f7f7"
    show_title: true
    title_color: "#1B4965"
    show_filters_bar: true
    tile_text_color: "#1B4965"
    text_tile_text_color: "#ffffff"
  elements:
  - name: "<span class='fa fa-tachometer'> Top Line Metrics</span>"
    type: text
    width: 24
    height: 4
    row: 0
    col: 0
    body_text: |
      <div style="background: linear-gradient(135deg, #1B4965 0%, #2A6F97 100%); padding: 14px 18px; border-radius: 8px; border-left: 6px solid #E29578; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); margin: 0; box-sizing: border-box;">
        <h1 style="color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0; font-family: 'Outfit', 'Inter', sans-serif;"><i class="fa fa-tachometer" style="margin-right: 10px; color: #E29578;"></i>Top Line Performance Pulse</h1>
        <p style="color: #BEE9E8; font-size: 12px; margin: 0; font-family: 'Inter', sans-serif;">Real-time business performance indicators, sales volume, and customer acquisition metrics.</p>
      </div>

  - title: Number of First Purchasers
    name: Number of First Purchasers
    model: thelook
    explore: order_items
    type: single_value
    fields: [users.count]
    filters:
      users.created_date: 7 days
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: goal, label: Goal, expression: '10000', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: dimension, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: medium
    text_color: black
    single_value_title: New Users Acquired
    custom_color: "#2A6F97"
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Progress against a target of 10,000 new users in the last 7 days.'
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 4
    col: 0
    width: 6
    height: 4

  - title: Average Order Sale Price
    name: Average Order Sale Price
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price]
    filters: {}
    sorts: [orders.average_profit desc, order_items.average_sale_price desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: date, label: date, expression: now(), value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, is_disabled: true}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1B4965"
    show_view_names: true
    font_size: medium
    text_color: black
    value_format: "$#,##0.00"
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    note_state: collapsed
    note_display: hover
    note_text: 'Average sale price of ordered items across all transactions.'
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 4
    col: 6
    width: 6
    height: 4

  - title: 30 Day Repeat Purchase Rate
    name: 30 Day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.30_day_repeat_purchase_rate]
    filters: {}
    sorts: [repeat_purchase_facts.30_day_repeat_purchase_rate desc, order_items.30_day_repeat_purchase_rate
        desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1B4965"
    value_format: "0.0%"
    single_value_title: Repeat Purchase Rate
    conditional_formatting:
      - type: "less than"
        value: 0.10
        background_color: "#FEE2E2"
        font_color: "#DB4437"
      - type: "less than"
        value: 0.15
        background_color: "#FEF3C7"
        font_color: "#D97706"
      - type: "greater than"
        value: 0.15
        background_color: "#D1FAE5"
        font_color: "#0F9D58"
    font_size: medium
    text_color: black
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: What percent of orders are followed by a repeat purchase by the same user within 30 days?
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 4
    col: 12
    width: 6
    height: 4

  - title: Total Order Count
    name: Total Order Count
    model: thelook
    explore: order_items
    type: single_value
    fields: [order_items.count, order_items.created_year]
    fill_fields: [order_items.created_year]
    filters:
      users.state: ''
      users.city: ''
      users.traffic_source: ''
      users.gender: ''
      distribution_centers.location: ''
      users.country: ''
      order_items.created_year: 2 years
    sorts: [order_items.created_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_change
      label: Percent Change
      expression: "${order_items.count}/offset(${order_items.count},1) - 1"
      value_format:
      value_format_name: percent_0
      is_disabled: true
    - args:
      - order_items.count
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: order_items.count
      label: Percent change from previous - Order Items Count
      source_field: order_items.count
      table_calculation: percent_change_from_previous_order_items_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - args:
      - order_items.count
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: order_items.count
      label: Percent change from previous - Order Items Count
      source_field: order_items.count
      table_calculation: percent_change_from_previous_order_items_count_2
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    single_value_title: Orders This Year
    hidden_fields: [order_items.reporting_period, order_items.created_year]
    comparison_label: vs Same Period Last Year
    custom_color: "#2A6F97"
    value_format: "#,##0"
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'YTD order items count compared against the same period of the previous year.'
    hidden_pivots: {}
    defaults_version: 1
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 4
    col: 18
    width: 6
    height: 4

  - title: Total Sales, Year over Year
    name: Total Sales, Year over Year
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.created_month_name, order_items.total_sale_price, order_items.created_year]
    pivots: [order_items.created_year]
    fill_fields: [order_items.created_month_name]
    filters:
      order_items.created_date: before 0 months ago
      order_items.created_year: 4 years
    sorts: [order_items.created_year desc 0, order_items.created_month_name]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: 'Total Revenue ($)', orientation: left, series: [{id: '2018', name: '2018', axisId: order_items.total_sale_price},
          {id: '2017', name: '2017', axisId: order_items.total_sale_price}, {id: '2016',
            name: '2016', axisId: order_items.total_sale_price}, {id: '2015', name: '2015',
            axisId: order_items.total_sale_price}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear, valueFormat: "$#,##0"}]
    y_axis_value_format: "$#,##0"
    x_axis_label: Month of Year
    series_colors:
      '2018': "#1B4965"
      '2017': "#2A6F97"
      '2016': "#62B6CB"
      '2015': "#BEE9E8"
    vis_config:
      type: looker_line
      y_axis_combined: true
      show_null_points: false
      interpolation: monotone
      series_colors:
        '2018': "#1B4965"
        '2017': "#2A6F97"
        '2016': "#62B6CB"
        '2015': "#BEE9E8"
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [calculation_1]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Monthly total sales revenue comparisons across the last 4 years.'
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 8
    col: 0
    width: 12
    height: 9

  - title: Orders by Day and Category
    name: Orders by Day and Category
    model: thelook
    explore: order_items
    type: looker_area
    fields: [products.category, order_items.count, order_items.created_date]
    pivots: [products.category]
    fill_fields: [order_items.created_date]
    filters:
      products.category: Blazers & Jackets,Sweaters,Pants,Shorts,Fashion Hoodies &
        Sweatshirts,Accessories
    sorts: [products.category, order_items.created_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Number of Orders, orientation: left, series: [{id: Accessories
              - order_items.count, name: Accessories, axisId: order_items.count},
          {id: Blazers & Jackets - order_items.count, name: Blazers &amp; Jackets,
            axisId: order_items.count}, {id: Fashion Hoodies & Sweatshirts - order_items.count,
            name: Fashion Hoodies &amp; Sweatshirts, axisId: order_items.count}, {
            id: Pants - order_items.count, name: Pants, axisId: order_items.count},
          {id: Shorts - order_items.count, name: Shorts, axisId: order_items.count},
          {id: Sweaters - order_items.count, name: Sweaters, axisId: order_items.count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_labels: ["# Order Items"]
    hide_legend: false
    series_colors:
      Accessories - order_items.count: "#1B4965"
      Blazers & Jackets - order_items.count: "#2A6F97"
      Fashion Hoodies & Sweatshirts - order_items.count: "#62B6CB"
      Pants - order_items.count: "#BEE9E8"
      Shorts - order_items.count: "#E29578"
      Sweaters - order_items.count: "#F4A261"
    vis_config:
      type: looker_area
      stacking: normal
      show_null_points: false
      interpolation: monotone
      series_colors:
        Accessories - order_items.count: "#1B4965"
        Blazers & Jackets - order_items.count: "#2A6F97"
        Fashion Hoodies & Sweatshirts - order_items.count: "#62B6CB"
        Pants - order_items.count: "#BEE9E8"
        Shorts - order_items.count: "#E29578"
        Sweaters - order_items.count: "#F4A261"
    x_axis_datetime_tick_count: 4
    x_axis_datetime: true
    hide_points: true
    hidden_fields: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Stacked area chart showing daily order volume segmented by product department categories.'
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 8
    col: 12
    width: 12
    height: 9

  - name: "<span class='fa fa-users'> </span> Customer Demographics"
    type: text
    width: 24
    height: 4
    row: 17
    col: 0
    body_text: |
      <div style="background: linear-gradient(135deg, #0F172A 0%, #1E293B 100%); padding: 14px 18px; border-radius: 8px; border-left: 6px solid #62B6CB; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); margin: 0; box-sizing: border-box;">
        <h1 style="color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0; font-family: 'Outfit', 'Inter', sans-serif;"><i class="fa fa-users" style="margin-right: 10px; color: #62B6CB;"></i>Customer Demographics & Segmentation</h1>
        <p style="color: #E2E8F0; font-size: 12px; margin: 0; font-family: 'Inter', sans-serif;">Detailed breakdown of our global user base, spatial distribution, lifetime value, and behavior.</p>
      </div>

  - title: User Basic Demographic Profile
    name: User Basic Demographic Profile
    model: thelook
    explore: order_items
    type: looker_donut_multiples
    fields: [users.gender, users.traffic_source, order_items.count]
    pivots: [users.traffic_source]
    filters: {}
    sorts: [user_order_facts.lifetime_orders_tier__sort_, users.traffic_source, order_items.count
        desc 0]
    limit: 500
    column_limit: 15
    query_timezone: America/Los_Angeles
    show_value_labels: true
    font_size: 15
    hide_legend: false
    series_colors:
      Female - order_items.count: "#E29578"
      Male - order_items.count: "#2A6F97"
      Female: "#E29578"
      Male: "#2A6F97"
    vis_config:
      type: looker_donut_multiples
      show_value_labels: true
      series_colors:
        Female - order_items.count: "#E29578"
        Male - order_items.count: "#2A6F97"
        Female: "#E29578"
        Male: "#2A6F97"
    show_view_names: true
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Gender profile split across our main customer acquisition channels.'
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 21
    col: 0
    width: 10
    height: 9

  - title: Highest Spending Users
    name: Highest Spending Users
    model: thelook
    explore: order_items
    type: looker_map
    fields: [users.approx_location, users.gender, order_items.order_count, users.count,
      order_items.total_sale_price, order_items.average_spend_per_user, users.country]
    pivots: [users.gender]
    filters: {}
    sorts: [users.gender 0, order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 37.57941251343841
    map_longitude: -99.31640625000001
    map_zoom: 4
    map_marker_radius_max: 15
    map_marker_color: ["#E29578", "#2A6F97"]
    map_value_colors: ["#BEE9E8", "#1B4965"]
    map_value_scale_clamp_min: 0
    map_value_scale_clamp_max: 200
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    loading: false
    hidden_fields: [orders.count, users.count, order_items.total_sale_price, order_items.order_count]
    map: usa
    map_projection: ''
    quantize_colors: false
    outer_border_color: "#1B4965"
    inner_border_color: ''
    inner_border_width: 0.6
    outer_border_width: 2
    empty_color: ''
    y_axes: []
    defaults_version: 1
    series_colors:
      Female - order_items.average_spend_per_user: "#E29578"
      Male - order_items.average_spend_per_user: "#2A6F97"
    vis_config:
      type: looker_map
      series_colors:
        Female - order_items.average_spend_per_user: "#E29578"
        Male - order_items.average_spend_per_user: "#2A6F97"
    note_state: collapsed
    note_display: hover
    note_text: Bubble size corresponds to average user spend. Red bubbles indicate Female users, Blue indicates Male users.
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 21
    col: 10
    width: 14
    height: 9

  - name: "<span class='fa fa-laptop'> </span> Web Analytics"
    type: text
    width: 24
    height: 4
    row: 30
    col: 0
    body_text: |
      <div style="background: linear-gradient(135deg, #2A6F97 0%, #62B6CB 100%); padding: 14px 18px; border-radius: 8px; border-left: 6px solid #E29578; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); margin: 0; box-sizing: border-box;">
        <h1 style="color: #FFFFFF; font-size: 20px; font-weight: 700; margin: 0 0 4px 0; font-family: 'Outfit', 'Inter', sans-serif;"><i class="fa fa-laptop" style="margin-right: 10px; color: #E29578;"></i>Web Traffic & Acquisition Channels</h1>
        <p style="color: #BEE9E8; font-size: 12px; margin: 0; font-family: 'Inter', sans-serif;"><b>Recommended Action:</b> Dive into high-conversion traffic sources and analyze session-to-checkout funnels to drive digital growth.</p>
      </div>

  - title: Website Visit Volume vs Conversion Rate
    name: Website Visit Volume vs Conversion Rate
    model: thelook
    explore: events
    type: looker_column
    fields: [events.event_day_of_week, events.sessions_count, events.unique_visitors,
      sessions.overall_conversion]
    filters: {}
    sorts: [events.event_day_of_week]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes:
    - label: Visit / Session Volume
      orientation: left
      showLabels: true
      showValues: true
      valueFormat: "#,##0"
      series:
      - id: events.sessions_count
        name: Total Visitors
        axisId: events.sessions_count
      - id: events.unique_visitors
        name: Unique Visitors
        axisId: events.unique_visitors
    - label: Conversion Rate (%)
      orientation: right
      showLabels: true
      showValues: true
      valueFormat: "0.0%"
      series:
      - id: sessions.overall_conversion
        name: Conversion Rate
        axisId: sessions.overall_conversion
    series_types:
      events.sessions_count: column
      events.unique_visitors: column
      sessions.overall_conversion: line
    series_colors:
      events.sessions_count: "#1B4965"
      events.unique_visitors: "#62B6CB"
      sessions.overall_conversion: "#E29578"
    series_labels:
      sessions.overall_conversion: Conversion Rate
      events.sessions_count: Total Visitors
    y_axis_orientation: [left, right]
    show_null_points: false
    interpolation: linear
    hidden_fields: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Web traffic (sessions and visitors) plotted against the conversion rate over the days of the week.'
    vis_config:
      type: looker_column
      y_axis_combined: false
      series_types:
        events.sessions_count: column
        events.unique_visitors: column
        sessions.overall_conversion: line
      series_colors:
        events.sessions_count: "#1B4965"
        events.unique_visitors: "#62B6CB"
        sessions.overall_conversion: "#E29578"
      show_null_points: false
      interpolation: linear
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: events.event_date
      Country: users.country
    row: 34
    col: 0
    width: 10
    height: 8

  - title: Most Viewed Brands Online
    name: Most Viewed Brands Online
    model: thelook
    explore: sessions
    type: looker_grid
    fields: [product_viewed.brand, sessions.count, sessions.cart_to_checkout_conversion,
      product_viewed.department]
    pivots: [product_viewed.department]
    filters:
      product_viewed.brand: "-NULL"
    sorts: [sessions.count desc 0, product_viewed.department]
    limit: 10
    column_limit: 50
    row_total: right
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      sessions.cart_to_checkout_conversion: Cart Conversion
    series_cell_visualizations:
      sessions.count:
        is_active: true
        color: "#2A6F97"
    header_font_color: "#FFF"
    header_background_color: "#1B4965"
    conditional_formatting:
    - type: "along a scale..."
      value: !!null ''
      background_color: "#1B4965"
      font_color: !!null ''
      color_application:
        collection_id: custom_navy
        palette_id: custom_navy_palette
        options:
          steps: 5
          colors: ["#BEE9E8", "#2A6F97", "#1B4965"]
      bold: false
      italic: false
      strikethrough: false
      fields: [sessions.cart_to_checkout_conversion]
    conditional_formatting_ignored_fields: []
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    truncate_column_names: true
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: events.event_date
      Country: users.country
    row: 34
    col: 10
    width: 14
    height: 8

  - title: User Behaviors by Traffic Source
    name: User Behaviors by Traffic Source
    model: thelook
    explore: order_items
    type: looker_column
    fields: [users.traffic_source, order_items.average_sale_price, user_order_facts.average_lifetime_orders]
    filters: {}
    sorts: [user_order_facts.lifetime_orders_tier__sort_, users.traffic_source]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes:
    - label: Average Sale Price ($)
      orientation: left
      showLabels: true
      showValues: true
      valueFormat: "$#,##0.00"
      series:
      - id: order_items.average_sale_price
        name: Average Sale Price
        axisId: order_items.average_sale_price
    - label: Average Lifetime Orders
      orientation: right
      showLabels: true
      showValues: true
      valueFormat: "#,##0.0"
      series:
      - id: user_order_facts.average_lifetime_orders
        name: Average Lifetime Orders
        axisId: user_order_facts.average_lifetime_orders
    y_axis_labels: [Average Sale Price ($)]
    y_axis_value_format: '0'
    hide_legend: false
    series_colors:
      order_items.average_sale_price: "#1B4965"
      user_order_facts.average_lifetime_orders: "#E29578"
    series_types:
      order_items.average_sale_price: column
      user_order_facts.average_lifetime_orders: line
    font_size: '13'
    y_axis_orientation: [left, right]
    hidden_fields: [percent_repeat_customers]
    value_labels: legend
    label_type: labPer
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    vis_config:
      type: looker_column
      y_axis_combined: false
      series_types:
        order_items.average_sale_price: column
        user_order_facts.average_lifetime_orders: line
      series_colors:
        order_items.average_sale_price: "#1B4965"
        user_order_facts.average_lifetime_orders: "#E29578"
      show_null_points: false
      interpolation: linear
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Date: order_items.created_date
      Location: distribution_centers.location
      Country: users.country
    row: 42
    col: 0
    width: 10
    height: 8

  - title: Percent of Cohort Still Active by Traffic Source
    name: Percent of Cohort Still Active by Traffic Source
    model: thelook
    explore: order_items
    type: looker_line
    fields: [order_items.months_since_signup, users.count, users.traffic_source]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0, 12]"
      users.created_month: 12 months
    sorts: [order_items.months_since_signup, users.age_tier__sort_, users.traffic_source]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: pct_cohort_still_active
      label: Pct Cohort Still Active
      expression: "${users.count} / max(${users.count})"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: Percent of Cohort still Active, orientation: left, series: [
          {axisId: pct_cohort_still_active, id: Display - pct_cohort_still_active,
            name: Display}, {axisId: pct_cohort_still_active, id: Email - pct_cohort_still_active,
            name: Email}, {axisId: pct_cohort_still_active, id: Facebook - pct_cohort_still_active,
            name: Facebook}, {axisId: pct_cohort_still_active, id: Organic - pct_cohort_still_active,
            name: Organic}, {axisId: pct_cohort_still_active, id: Search - pct_cohort_still_active,
            name: Search}], showLabels: true, showValues: true, maxValue: !!null '',
        valueFormat: "0.0%", unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_max: ['50']
    y_axis_labels: [Percent of Cohort still Active]
    y_axis_value_format: "#\\%"
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    series_colors:
      Display - pct_cohort_still_active: "#BEE9E8"
      Email - pct_cohort_still_active: "#62B6CB"
      Facebook - pct_cohort_still_active: "#E29578"
      Organic - pct_cohort_still_active: "#2A6F97"
      Search - pct_cohort_still_active: "#1B4965"
    vis_config:
      type: looker_line
      show_null_points: false
      interpolation: monotone
      series_colors:
        Display - pct_cohort_still_active: "#BEE9E8"
        Email - pct_cohort_still_active: "#62B6CB"
        Facebook - pct_cohort_still_active: "#E29578"
        Organic - pct_cohort_still_active: "#2A6F97"
        Search - pct_cohort_still_active: "#1B4965"
    swap_axes: false
    discontinuous_nulls: false
    hidden_fields: [cumulative_lifetime_spend, order_items.total_sale_price, users.count]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Cohort analysis showing user retention and cohort longevity by traffic acquisition source.'
    listen:
      State: users.state
      City: users.city
      Traffic Source: users.traffic_source
      User Gender: users.gender
      Location: distribution_centers.location
      Country: users.country
    row: 42
    col: 10
    width: 14
    height: 8

  filters:
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: [Country]
    field: users.state
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: [State, Country]
    field: users.city
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.traffic_source
  - name: User Gender
    title: User Gender
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.gender
  - name: Date
    title: Date
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: distribution_centers.location
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: thelook
    explore: order_items
    listens_to_filters: []
    field: users.country
