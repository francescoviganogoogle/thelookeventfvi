# Agent Prompts for Later Use

**Knowledge Catalog:**
Define a plan to create LookML corresponding to the `thelook_ecommerce_semgen` data product in knowledge catalog. Check also the documentation linked in the data product to get more context about key metrics and dimensions. Use metadata (schema, descriptions and relationships) from Knowledge Catalog to generate labels and descriptions, as well as joins. 
My connection is named `looker_demo_data_2`. The model should be named `vibecode`. The project name is `vibecode`.

**Dashboard Generation:**
create a lookml dashboard to analyze the key metrics and dimensions. ensure I can drill along the product hierarchy (department, category, brand).

**Hide IDs:**
Define a plan to hide all columns that represent identifiers. List all dimensions that you plan to edit. Save the plan to an md file for my review.

**Column Changes:**
Using knowledge catalog and data product `thelook_ecommerce_semgen`, determine if any columns have changed relative to the existing modeled columns. Check also data types and descriptions. Create a plan first as an MD file and write it in the workspace.

Determine if any columns have changed relative to the product table. Check also data types. Check descriptions, Create a plan first as an MD file and write it in the workspace.

**Filters and Parallel Periods:**
Define a plan to create a filter field of type date named `date_input`. Define a dimension that determines the length of the user selected period, the beginning (start - length) and end of the parallel period.
Define also measures to analyze current sales vs previous sales in absolute value and percentage with respect to order items created date. Allow me to compare those measures by date, showing the current and parallel period. Finally filter the explore by the extended period when the filter is selected. Save the plan to an md file for my review.

When I select the `date_input` the filter is not applied. Also I do not have a dimension to analyze in parallel current vs parallel measures. Create date shows them on different rows.

**Cache:**
ensure all user queries are not served by the Looker cache but directly from the database.
