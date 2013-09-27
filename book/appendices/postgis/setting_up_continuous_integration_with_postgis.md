### Setting Up Continuous Integration with PostGIS

After [installing PostGIS locally](#using-postgis-in-your-rails-application)
and adding the PostGIS extension to your local databases, you should make sure
your continuous integration service is configured for PostGIS.

#### Configure database loading on Tddium
Create a worker hook in `tddium.yml` to ensure that the Tddium database is
PostGIS-enabled.

```yaml
# config/tddium.yml
:tddium:
  :postgresql:
    :adapter: postgis
    :postgis_extension: true
    :schema_search_path: public
  :hooks:
    :worker:
      createdb $TDDIUM_DB_NAME;
      psql $TDDIUM_DB_NAME -c 'CREATE EXTENSION postgis;';
      bundle exec rake db:migrate
```
