## Release summary
This release makes numerous improvements and changes to the package. All of the functions have been refactored to reduce the number of dependencies, documentation has been improved, and new functionality has been added to work with breaks and legends.

## Test environments
* local OS X install: R 4.1.2
* Linux ubuntu distribution (via GitHub Actions): R-devel, R-release, past four R-oldrel (4.1.3, 4.0.5, 3.6.3, 3.5.3)
* macOS (via GitHub Actions): R-release
* windows (on Appveyor): R-release
* winbuilder, R-release, R-oldrel, R-devel

* r-hub not used because it lacks dependencies needed to build `sf` on Debian

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs with local or CI checks. There is one NOTE on winbuilder:

```r
* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Christopher Prener <chris.prener@gmail.com>'

New maintainer:
  Christopher Prener <chris.prener@gmail.com>
Old maintainer(s):
  Christopher Prener <chris.prener@slu.edu>
```

I am still the maintainer - I have just changed my contact information due to new employment!

## Reverse dependencies
Not applicable.
