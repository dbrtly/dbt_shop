# 2_bases

This directory is for source-related business logic.
The objectives of this layer of your project should have:

* enforce naming convention of the project rather than the source systems
* model source records as business events
* explicit timezones for columns of datatype date or timestamp

Write select queries here that:

* renaming and recasting columns
* unioning, joining or deduplicating source data to ensure your model has the correct grain

Rename and recast columns once

Raw data is generally stored in a source-conformed structure, that is, following the schema and naming conventions that the source defines. Not only will this structure differ between different sources, it is also likely to differ from the naming conventions you wish to use for analytics.

The first layer of transformations in a dbt project should:

Select from only one source
Rename fields and tables to fit the conventions you wish to use within your project, for example, ensuring all timestamps are named <event_at>. These conventions should be declared in your project coding conventions (see above).

Recast fields into the correct data type, for example, changing dates into UTC and prices into dollar amounts.
All subsequent data models should be built on top of these models, reducing the amount of duplicated code.
