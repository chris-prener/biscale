## Release summary
This is a minor update to the package that (1) adds some new functionaliy to the `bi_legend()` function, (2) fixes various typos in the documentation, and (3) reduces the number of examples in `bi_pal()` in an effort to shrink the installed size of the package (which is generating 1 NOTE on CRAN's Solaris check of the current release). 

## Test environments
* local OS X install, R 3.6.0
* ubuntu 14.04 (on Travis CI), R-release, R-oldrel, R-devel
* macOS (on Travis CI), R-release, R-oldrel
* windows i386 (on Appveyor), R-release, R-oldrel, R-devel
* windows x64 (on Appveyor), R-release, R-oldrel, R-devel
* winbuilder, R-release, R-oldrel, R-devel

* r-hub not used because it lacks dependencies needed to build `sf` on Debian

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs with local or CI checks.

## Reverse dependencies
Not applicable.
