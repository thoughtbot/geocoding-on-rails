## Faking the IP Address

Configure Geocoder to stub lookups of IP addresses:

` spec/support/geocoder.rb@37d0005:1

Add stub:

` spec/support/geocoder.rb@37d0005:28,32

Example usage:

` spec/requests/geocode_by_ip_spec.rb@37d0005

