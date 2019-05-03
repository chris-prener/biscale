## Release summary
This is the first re-submission of our initial CRAN submission based on feedback from Matthias Sterrer. We've made the following changes:

1. Changed the first word of the description to "Provides..." as suggested.
2. Edited the 3rd sentance for clarity as suggested.
3. Added quotes around package names as requested.

## Test environments
* local OS X install, R 3.5.2
* ubuntu 14.04 (on Travis CI), R-release, R-oldrel, R-devel
* macOS (on Travis CI), R-release, R-oldrel
* windows i386 (on Appveyor), R-release, R-oldrel, R-devel
* windows x64 (on Appveyor), R-release, R-oldrel, R-devel
* winbuilder, R-release, R-oldrel, R-devel

* r-hub not used because it lacks dependencies needed to build `sf` on Debian

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs with local checks or on Appveyor.

On TRAVIS, we are currently failing on R-oldrel macOS due to a switch in the TeX set-up. This does not appear to having anything to do with our package specifically.

On winbuilder checks, we get one NOTE:

* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Christopher Prener <chris.prener@slu.edu>'

New submission

## Reverse dependencies
Not applicable.
