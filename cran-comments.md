## Release summary
This release fixes current ERRORs on CRAN's checks, which are due to a change in `sf` and `tibble`. The `sf` package is now required and imported, which resolves all ERRORs.

In addition, two new functions are added to extend the package's functionality for creating point maps and custom palettes.

## Test environments
* local OS X install: R 4.0.0
* Linux xenial distribution (on Travis CI): R-release, R-oldrel, R-devel, R-3.5.3, and R-3.4.4
* macOS (on Travis CI): R-release, R-oldrel, R-3.5.3, and R-3.4.4
* windows x64 (on Appveyor): R-release, R-patched, R-oldrel, R-3.5.3, and R-3.4.4
* windows i386 (on Appveyor): R-patched
* winbuilder, R-release, R-oldrel, R-devel

* r-hub not used because it lacks dependencies needed to build `sf` on Debian

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs with local or CI checks.

## Reverse dependencies
Not applicable.
