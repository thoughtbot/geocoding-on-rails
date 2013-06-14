## External Services

### Choosing a service
* Rate limits
* Security
* Cost
* Response format

STUB

### Google, Bing, and MapQuest
[Google](https://developers.google.com/maps/documentation/geocoding/), [Bing](http://www.microsoft.com/maps/), and [MapQuest](http://www.mapquestapi.com/geocoding/) offer paid and free geocoding services. Consider subscribing to a paid service if the rate limits for the free options are too low for your application:

**Rate limits**
* Google
  * [Geocoding API](https://developers.google.com/maps/documentation/geocoding/#Limits): 2,500 requests/day
  * [Maps API for Business](https://developers.google.com/maps/documentation/business/): 100,000 requests/day

* MapQuest
  * [Community](http://developer.mapquest.com/web/tools/getting-started/terms-overview): 5,000 requests/day
  * [Enterprise](http://developer.mapquest.com/web/tools/getting-started/terms-overview): Unlimited

* Bing
  * [Basic](http://www.microsoft.com/maps/product/terms.html): 50,000 requests/day
  * [Enterprise](http://www.microsoft.com/maps/product/terms.html): [tbd]

### Free services
[Nominatim](http://wiki.openstreetmap.org/wiki/Nominatim), [Yandex](http://api.yandex.com/maps/doc/jsapi/2.x/ref/reference/geocode.xml), and [ESRI](http://resources.arcgis.com/en/help/arcgis-online-geocoding-rest-api/) offer free geocoding services.

**Rate limits**
* [Nominatim](http://wiki.openstreetmap.org/wiki/Nominatim_usage_policy): 1 request/second
* [Yandex](http://legal.yandex.com.tr/maps_api/): 25,000 requests/day
* [ESRI](http://www.esri.com/software/arcgis/arcgisonline/services/geoservices): No limit for geosearch service

### Paid services
* [GeoCoder.ca](http://geocoder.ca/?services=1) - US and Canada only
* [MaxMind](http://www.maxmind.com/en/web_services) - Services for geocoding IP
  addresses
* [Yahoo BOSS](http://developer.yahoo.com/boss/geo/)

### Response formats
JSON is the default response format for all services except GeoCoder.ca. XML is supported by all services except ESRI and MaxMind.
