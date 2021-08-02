# 3_curated

This directory is for business-related transformation logic.

The objectives of this layer of your project should include:

* unify base models from multiple sources about a common business event into a canonical collection.
* enrich models with join operations
* add boolean columns to clarify the properties of events to simplify aggregate calculations. These columns should follow a naming convention with a verb prefix of ('is_' or 'has_'). For example, 'is_delivered' or 'has_enterprise_agreement'.
