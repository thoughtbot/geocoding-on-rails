> "The world is a beautiful book, but it's not much use if you don’t know how to
read." -- Carlo Goldoni, *Pamela*

The human desire to acquire knowledge of the natural world has produced
countless systems for aggregating, manipulating, and representing geospatial
information. In recent years -- now that we're all generally agreed on the
shape of the earth -- it has also produced a lot of software.

Working with geocoded data within the context of a web application can be
tricky. While the availability of free and open-source libraries has greatly
simplified the challenges of accurately geocoding data and performing meaningful
analysis, there are still a plethora of decisions to be made before the
first line of code is written: *What tools should we use? Where should the
business logic live? What's the best way to write a test for this?* And after
the feature has been built, *Is it fast enough?*

Geocoding on Rails is a resource for developers seeking an object-oriented,
test-driven approach to working with geocoded data within Rails
applications. It is divided into four sections:

1. **Strategies** for selecting an external geocoding service
1. **Application Development:** How to organize your code as you're developing
   features
1. **Improving Application Performance** with caching and other techniques
1. **Testing** techniques for your server- and client-side code

The code samples in this book come from commits in the [bundled example
application][geocoding-on-rails-example-app-github].  The example application
is a Rails app which lets users search for Starbucks locations nearby. Take a
look at the [README][geocoding-on-rails-example-app-readme] for instructions
on setting it up.
