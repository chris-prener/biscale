# biscale 0.2.0

* Add `sf` as a *required* instead of a *suggested* dependency. This resolves issues that appeared with newer releases of the `tibble` packages.
* Drop support for R 3.3 because CI tests now fail on this release. Minimum release of R is now 3.4.
* Add `bi_scale_color()` as a compliment to existing functionality. This adds the ability to create bivariate point and line maps as well.
* Add `bi_pal_custom()` to support custom palettes.
* Additional confirmatory CI testing for R 3.4 added to Linux (now the `xenial` distribution), macOS, and Windows. 

# biscale 0.1.2

* Add non-standard evaluation to `bi_legend()`
* Fix typos in `README.Rmd`, `index.Rmd`, and in `bi_class.R`
* Remove examples of 2x2 palettes in the `bi_pal()` help file to address NOTE on CRAN checks (only appeared for Solaris)
* Test `biscale` with new release of `ggplot2` and the `cowplot` release candidate - no problems detected

# biscale 0.1.1

* CRAN release version
* Add installation instructions and Zenodo badge to README and pkgdown site
* Add hex logo to README and pkgdown site
* Add `cran-comments.md`

# biscale 0.1.0

* Added a `NEWS.md` file to track changes to the package.
* Develop bivariate mapping functionality (`bi_` functions)
* Add example data set (`stl_race_income` data)
* Implement unit testing with both Travis and Appveyor as well as Code Coverage tracking
* Add `.github` community files
* Add `LICENSE`
* Add vignette for getting started (`biscale`)
* Add pkgdown site functionality
