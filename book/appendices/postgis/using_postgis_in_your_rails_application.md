### Using PostGIS in Your Rails Application

First, make sure you have PostgreSQL 9.1 or higher installed. Then install
PostGIS 2.0:

#### OS X
The PostGIS website recommends using Postgres.app to install PostGIS.
Alternatively, you can use homebrew:

```sh
$ brew install postgis
```

#### Arch Linux

```sh
$ sudo pacman -S postgis
```

You can find more resources for installing PostGIS on the [PostGIS
website][postgis-install].

After installing PostGIS on your laptop, follow the steps below to
configure your Rails application.

#### Create PostGIS extension

If you haven't created your local database yet, you can simply install the
[ActiveRecord PostGIS Adapter][activerecord-postgis-adapter] gem and add
`postgis_extension: true` to your `database.yml` [per the instructions
below](#add-activerecord-postgis-adapter-to-gemfile). ActiveRecord PostGIS
Adapter will create the extension when `rake db:create` is run.

If you've already created your database, run the following commands to install
the PostGIS extension:

```sh
$ cd my_application
$ rails dbconsole
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
=# \quit
```

#### Add ActiveRecord PostGIS Adapter to Gemfile

``` ruby
# Gemfile
gem 'activerecord-postgis-adapter'
```

#### Configure your local databases

Configure your test and development databases for use with the ActiveRecord
PostGIS adapter. Be sure to set the `adapter` to `postgis` and
`postgis_extension` to `true`. Setting `postgis_extension` to `true` will ensure
that the PostGIS extension is created when the database is created.

Also note that the test database `schema_search_path` should be set to `public`.
This ensures that the PostGIS table `spatial_ref_sys` will be loaded when
you prepare your test database. If `schema_search_path` is set to `public,
postgis`, PostGIS tables [will not be made
available][activerecord-postgis-adapter-issue-48]:

```yaml
# config/database.yml
development:
  <<: *common
  adapter: postgis
  encoding: unicode
  postgis_extension: true
  schema_search_path: public, postgis
  pool: 5
  database: <database_name>

test: &test
  <<: *common
  adapter: postgis
  postgis_extension: true
  schema_search_path: public
  encoding: unicode
  database: <database_name>
```

#### Update your DatabaseCleaner strategy
Ensure that your DatabaseCleaner strategy does not remove the PostGIS
`spatial_ref_sys` table before or between tests:

```ruby
# spec/support/database_cleaner.rb
RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation, { except: %w[spatial_ref_sys] }
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation, { except: %w[spatial_ref_sys] }
  end
end
```
