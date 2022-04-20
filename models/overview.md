# Overview

{% docs __overview__ %}

## Sample Data Pipeline

Welcome to our sample AirBnB data pipeline and transformations documentation!

Here is the schema of our input data:
![input schema](assets/input_schema.png)

### Important Files

Below are the important files to look into for understanding the documentation capabilities of dbt:

1. models/overview.md
2. models/sources.yml
3. models/sources.md
4. models/schema.yml
5. models/schema.md
6. models/dashboards.yml

### How It Works?

The source documentation can be built using the `Markdown` file and source's `yaml` files.

You can document the details of the sources in the `Markdown` file using jinja templates and refer then in your source's `yaml` file using the `doc` function.

{% enddocs %}
