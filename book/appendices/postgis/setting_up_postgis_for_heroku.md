## Setting Up PostGIS for Heroku

Heroku support for PostGIS is currently available [in
beta][heroku-devcenter-postgis] for production-tier
databases.

### Configuring Your Heroku Database

#### Check to make sure your primary database is a production-tier database
Heroku's least expensive production-tier option is the Crane database, [priced at
$50/month][heroku-pricing].

```sh
$ heroku pg:info --app <your-app>

=== HEROKU_POSTGRESQL_CHARTREUSE_URL (DATABASE_URL)
Plan:        Crane
Status:      available
Data Size:   1.00 GB
Tables:      2
PG Version:  9.2.4
Connections: 5
Fork/Follow: Available
Created:     2013-07-01 09:54 UTC
Maintenance: not required
```

If your plan is a starter-tier plan (Dev or Basic), be sure to
[upgrade][heroku-upgrade-plan]
before setting up the PostGIS add-on.

#### Create extension

```sh
$ heroku pg:psql --app <your-app>
=# CREATE EXTENSION postgis;
...
```

#### Confirm that extension was created
```sh
=# SELECT POSTGIS_FULL_VERSION();
    NOTICE:  Function postgis_topology_scripts_installed() not found. Is topology
    support enabled and topology.sql installed?
    postgis_full_version
    ------------------------------------------------------------------------------
    POSTGIS="2.0.3 r11128" GEOS="3.3.8-CAPI-1.7.8" PROJ="Rel. 4.8.0, 6 March 2012"
    GDAL="GDAL 1.9.2, released 2012/10/08" LIBXML="2.7.8" LIBJSON="UNKNOWN" RASTER
    (raster lib from "2.0.2 r10789" need upgrade)
    (1 row)

=#
...
=# \quit
```

### Create an initializer to set the database adapter on Heroku

Set the Heroku database adapter and schema search path using an initializer:

```ruby
# config/initializers/database.rb
Rails.application.config.after_initialize do
  ActiveRecord::Base.connection_pool.disconnect!

  ActiveSupport.on_load(:active_record) do
    config = Rails.application.config.database_configuration[Rails.env]
    config['adapter'] = 'postgis'
    config['schema_search_path'] = 'public, postgis'
    ActiveRecord::Base.establish_connection(config)
  end
end
```

#### Push to Heroku

```sh
$ git push staging master
```
