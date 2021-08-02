# 2_bases

This directory is for source-related business logic.
The objectives of this layer of your project should have:

* enforce naming convention of the project rather than the source systems
* model single source relations as business events at the desired granularity by unioning, denormalising or deduplicating.
* set explicit timezones for columns of datatype date or timestamp

As described at [https://docs.getdbt.com/docs/guides/best-practices#separate-source-centric-and-business-centric-transformations]

### Rename and recast columns once

Raw data is generally stored in a source-conformed structure, that is, following the schema and naming conventions that the source defines. Not only will this structure differ between different sources, it is also likely to differ from the naming conventions you wish to use for analytics.

The first layer of transformations in a dbt project should:

Select from only one source
Rename fields and tables to fit the conventions you wish to use within your project, for example, ensuring all timestamps are named <event_at>. These conventions should be declared in your project coding conventions (see above).

Recast fields into the correct data type, for example, changing dates into UTC and prices into dollar amounts.
All subsequent data models should be built on top of these models, reducing the amount of duplicated code.
```
