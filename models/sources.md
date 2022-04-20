# Source definitions

## Describe AirBnB Database

{% docs desc_db_airbnb %}

Main database where all the raw data will be loaded.

This database will have the following schemas:

1. RAW

This RAW schema will have the following tables:

1. Listings
2. Hosts
3. Reviews

{% enddocs %}

## Describe Listings Table

{% docs desc_table_raw_listings %}

The listings table has all the raw incoming data from the source platform. The table will have the following columns:

| Columns        | Data Type |
| -------------- | --------- |
| ID             | NUMBER    |
| LISTING_URL    | VARCHAR   |
| NAME           | VARCHAR   |
| ROOM_TYPE      | VARCHAR   |
| MINIMUM_NIGHTS | NUMBER    |
| HOST_ID        | NUMBER    |
| PRICE          | VARCHAR   |
| CREATED_AT     | TIMESTAMP |
| UPDATED_AT     | TIMESTAMP |

{% enddocs %}

## Describe Reviews Table

{% docs desc_table_raw_reviews %}

The reviews table has all the incoming raw reviews data from the source platform.
There are couple of `data freshness alerts` that we have for this table in place:

1. If the review data contains timestamps prior to 12 hours, a warning will be generated.
2. If the review data contains timestamps prior to 24 hours, an error will be generated.

{% enddocs %}
