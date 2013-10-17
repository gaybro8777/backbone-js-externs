# Backbone.js externs

Externs files for Backbone.js for use with Google Closure Compiler for
the following versions:

- 0.9.2
- 0.9.10 (RC for 1.0)
- 1.0.0
- 1.1.0

This is a work in progress, though should be stable enough for use as
part of your javascript minification process.

The starting point was this gist, https://gist.github.com/1847810,
which was auto-generated by DotNetWise's externs extractor tool,
http://www.dotnetwise.com/Code/Externs/index.html.

## Testing the externs

The quick and dirty approach that is currently taken to "testing" the
externs (i.e. ensuring that all necessary Backbone methods are
defined, that they specify the right parameters and return types, etc.)
is to just grab the qunit test code from the Backbone library, specify
some additional externs for qunit, underscore, jquery, and json, and run
the tests through Closure Compiler with advanced optimizations on.

You can do this for yourself thus.

- install closure compiler
- make sure ruby is installed
- `export CC_PATH={path/to/compiler.jar}`
- `cd` to the directory for the externs version in question
- `ruby test_externs.rb`

This will spit out some errors, all of which *should* be false
positives, related to some deliberately funky ways that the Backbone
tests call Backbone and Underscore methods.

Licensed under the MIT licence.
