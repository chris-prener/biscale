
# biscale <img src="man/figures/logo.png" align="right" />

![GitHub Workflow](https://github.com/slu-openGIS/biscale/actions/workflows/R-CMD-check.yaml/badge.svg)
[![Coverage status](https://codecov.io/gh/slu-openGIS/biscale/branch/main/graph/badge.svg)](https://codecov.io/github/slu-openGIS/biscale?branch=main)
[![CRAN_status_badge](http://www.r-pkg.org/badges/version/biscale)](https://cran.r-project.org/package=biscale)
[![cran checks](https://cranchecks.info/badges/worst/biscale)](https://cran.r-project.org/web/checks/check_results_biscale.html)
[![Downloads](http://cranlogs.r-pkg.org/badges/biscale?color=brightgreen)](http://www.r-pkg.org/pkg/biscale)
[![DOI](https://zenodo.org/badge/183024212.svg)](https://zenodo.org/badge/latestdoi/183024212)

`biscale` implements a set of functions for bivariate thematic mapping based on the [tutorial](https://timogrossenbacher.ch/2019/04/bivariate-maps-with-ggplot2-and-sf/) written by Timo Grossenbacher and Angelo Zehr as well as a set of bivariate mapping palettes, including Joshua Stevens' [classic color schemes](http://www.joshuastevens.net/cartography/make-a-bivariate-choropleth-map/). In addition to support for two-by-two, three-by-three, and four-by-four maps, the package also supports a range of methods for calculating breaks for bivariate maps.

## What's New in v1.0.0.9000?
### New Features
  * `bi_class()` now accepts factors for one or both of the `x` and `y` variables, allowing more flexibility for how breaks are calculated. If you want finer grained control over your categories, calculate them ahead of time and then pass the factors on to `bi_class()`.
  * `bi_pal()`, `bi_legend()`, `bi_scale_fill()`, and `bi_scale_color()` functions all support four-by-four bivariate maps when `dim = 4`. Note that the original five palettes do not support four-by-four mapping, but very close approximations (e.g. `DkBlue2` instead of `DkBlue`) are now provided in their place. The legacy palettes are all still included in the package.
  * The number of built-in palettes has been greatly expanded!
  * Palettes can now be flipped and rotated (or both!), so that each built-in palette can be displayed in four different configurations. This includes the built-in palettes and any custom palettes that are four-by-four or smaller. If you want to flip or rotate larger palettes, you should make those decisions while creating the palette itself.
  * The workflow for allowing custom palettes has been overhauled to simply the process - users can provide a named vector for the `pal` arguments in the `bi_pal()`, `bi_legend()`, `bi_scale_fill()`, and `bi_scale_color()` functions. All of these functions will validate your input to ensure that it maps correctly.
  * `bi_class()` can be used to calculate bivariate breaks for maps larger than four-by-four, though it will return a warning reminding you that these maps are hard to read and that `biscale` does not provide palettes for larger maps. Instead, you should provide a custom palette.
  * `bi_class_breaks()` can be used with `bi_legend()` to facilitate optionally adding break values to your legends. Like `bi_class()`, this new function accepts both continuous and pre-made factors.

### Breaking Changes
  * There is no default supplied for `bi_class()`'s `style` argument since `bi_class()` now accepts factors as well. Users that relied on the default behavior of `bi_class()` will now receieve an error asking you to specify a `style` for calculating breaks.
  * Changes to `bi_legend()` to facilitate breaks mean that there are new arguments to be aware of when calling the function.

### Deprecated Functions
  * `bi_pal_manual()` now returns a warning that it has been deprecated and will be removed in a later release of `biscale` (planned for the end of 2022). Please update your workflows to use the new approach to generating custom palettes.
  
### Internal Improvements
  * `sf` is now a suggested package instead of an imported package, and several dependencies have been removed in the process of re-factoring all of the code in `biscale`.

## Installation
The easiest way to get `biscale` is to install it from CRAN:

```r
install.packages("biscale")
```

Alternatively, the development version of `biscale` can be accessed from GitHub with `remotes`:

```r
# install.packages("remotes")
remotes::install_github("slu-openGIS/biscale")
```

`biscale` has the `sf` package as a suggested dependency, which may require additional work install. Additional details, including some tips for installing `sf`, can be found in the [Get started article](articles/biscale.html#getting-started).

## Resources

In addition to instructions for installation, the main [Get started](articles/biscale.html) article has:

  - a quick overview of bivariate mapping,
  - a description of the workflow for creating bivariate maps,
  - a comparison of different approaches to calculating those classes,
  - and a comparison of different color palettes for bivariate mapping.
