## Release summary
 This is the initial CRAN submission.

## Test environments
* local OS X install, R 3.5.2
* ubuntu 14.04 (on Travis CI), R-release, R-oldrel, R-devel
* macOS (on Travis CI), R-release, R-oldrel
* windows i386 (on Appveyor), R-release, R-oldrel, R-devel
* windows x64 (on Appveyor), R-release, R-oldrel, R-devel
* winbuilder, R-release, R-oldrel, R-devel

* r-hub not used because it lacks dependencies needed to build `sf` and `lwgeom` on Debian

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs with local checks or on Travis CI/Appveyor.

On devtools::release()'s R CMD check and all winbuilder checks, we get one NOTE:

## Reverse dependencies
Not applicable.
