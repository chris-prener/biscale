# biscale 1.0.0

* New features
    * `bi_class()` now accepts factors for one or both of the `x` and `y` variables, allowing more flexibility for how breaks are calculated. If you want finer grained control over your categories, calculate them ahead of time and then pass the factors on to `bi_class()`.
    * `bi_pal()`, `bi_legend()`, `bi_scale_fill()`, and `bi_scale_color()` functions all support four-by-four bivariate maps when `dim = 4`. Note that the original five palettes do not support four-by-four mapping, but very close approximations (e.g. `DkBlue2` instead of `DkBlue`) are now provided in their place. The legacy palettes are all still included in the package.
    * The number of built-in palettes has been greatly expanded, though there are changes from v0.3.0, which was never released on CRAN.
    * Palettes can now be flipped and rotated (or both!), so that each built-in palette can be displayed in four different configurations. This includes the built-in palettes and any custom palettes that are four-by-four or smaller. If you want to flip or rotate larger palettes, you should make those decisions while creating the palette itself.
    * The workflow for allowing custom palettes has been overhauled to simply the process - users can provide a named vector for the `pal` arguments in the `bi_pal()`, `bi_legend()`, `bi_scale_fill()`, and `bi_scale_color()` functions. All of these functions will validate your input to ensure that it maps correctly.
    * `bi_class()` can be used to calculate bivariate breaks for maps larger than four-by-four, though it will return a warning reminding you that these maps are hard to read and that `biscale` does not provide palettes for larger maps. Instead, you should provide a custom palette.
    * `bi_class_breaks()` can be used with `bi_legend()` to facilitate optionally adding break values to your legends. Like `bi_class()`, this new function accepts both continuous and pre-made factors.
* Breaking changes
  * `R` version 3.4 is no longer supported - please use at least `R` version 3.5
    * There is no default supplied for `bi_class()`'s `style` argument since `bi_class()` now accepts factors as well. Users that relied on the default behavior of `bi_class()` will now receive an error asking you to specify a `style` for calculating breaks.
* Deprecated functions
    * `bi_pal_manual()` now returns a warning that it has been deprecated and will be removed in a later release of `biscale` (planned for the end of 2022). Please update your workflows to use the new approach to generating custom palettes.
* Internal improvements
    * `sf` is no longer a *required* dependency and is now *suggested* - this returns the package to its original release in terms of *suggesting* `sf`
    * `cowplot` is now a suggested dependency
    * All functions have been rewritten to reduce dependencies and duplicative code
* Documentation improvements
    * Documentation updates have been made, including the addition of a number of new examples and vignettes. These include detailed articles on bivariate palettes, working with breaks and legends, and creating bivariate maps with raster data.

# biscale 0.3.0

* Add 10 new palettes for a total of 15 native palettes.
* Add options to flip and/or rotate palettes
* Add option to add padding/border to legend
* Add vignette for palette use: see `palettes`

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
