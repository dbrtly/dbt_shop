This is a dbt demo project.

### Using the demo project in developer mode

Dependencies:

* vscode
* google cloud sdk [https://cloud.google.com/sdk/downloads']
* connect to bigquery using oauth mode

### python virtual environment

dbt is python based. 
The setup script creates your virtual environment and sets environmental variables.
It then connects to bigquery.

``` bash
chmod +x setup.sh
bash ./setup.sh
```

### dbt commands (starter)

Validate dbt can connect to bigquery with your profile configuration and environmental variables

``` bash
dbt debug
```

Run all the dbt macros to generate the sql code ready to run against the database connection.

``` bash
dbt compile
```

Run all the dbt generated sql code against the database connection.

``` bash
dbt run
```

### More dbt commands

Install dbt packages

``` bash
dbt deps
```
