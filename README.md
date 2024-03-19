
# releases: tools for R-releases <img src='man/figures/logo-readme.png' align="right" height="139"/>

<!-- badges: start -->
[![status](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![check](https://github.com/r-releases/releases/actions/workflows/check.yaml/badge.svg)](https://github.com/r-releases/releases/actions?query=workflow%3Acheck)
[![codecov](https://codecov.io/gh/r-releases/releases/branch/main/graph/badge.svg?token=3T5DlLwUVl)](https://app.codecov.io/gh/r-releases/releases)
[![lint](https://github.com/r-releases/releases/actions/workflows/lint.yaml/badge.svg)](https://github.com/r-releases/releases/actions?query=workflow%3Alint)
[![pkgdown](https://github.com/r-releases/releases/actions/workflows/pkgdown.yaml/badge.svg)](https://github.com/r-releases/releases/actions?query=workflow%3Apkgdown)
<!-- badges: end -->

[R-releases](https://github.com/r-releases/help) is a community-curated,
maintainer-driven repository of R package releases based on
[R-universe](https://r-universe.dev). The `releases` package has tools
for maintainers of packages in
[R-releases](https://github.com/r-releases/help).

# Documentation

Please see <https://r-releases.github.io/releases> for documentation,
including a function reference.

# Code of Conduct

Please note that the `releases` project is released with a [Contributor
Code of Conduct](https://r-releases.github.io/conduct.html). By
contributing to this project, you agree to abide by its terms.

# Help

Please post bug reports to <https://github.com/r-releases/help/issues>
and general questions to
<https://github.com/r-releases/help/discussions>.

# Installation

For the development version:

``` r
remotes::install_github("r-releases/releases")
```

For the latest release:

``` r
install.packages(
  "releases",
  repos = c("https://r-releases.r-universe.dev", getOption("repos"))
)
```

# Version etiquette

It is good practice to increment the version number of a package on
every new release. The `check_versions()` list the packages that have
chosen to decrement the version number or keep it the same over the
course of the release cycle. For example:

``` r
check_versions()
#> # A tibble: 2 × 5
#>   package version_current version_highest hash_current                  hash_highest
#>   <chr>   <chr>           <chr>           <chr>                         <chr>       
#> 1 pkg.a   1.0.0           2.0.0           1f9928593251410322823fefea8c… 8e7f9fe32c4…
#> 2 pkg.b   3.0.0           3.0.0           7f608bde8f0e308aa8866d737dde… e59165f73b7…
```

Package `pkg.a` was flagged because the current version is lower than
the highest version ever released. Package `pkg.b` was flagged because
there are two different releases under version 3.0.0.

To fix the version number of an R-releases package that you maintain,
create a new GitHub/GitLab release whose version number in the
`DESCRIPTION` file is higher than the one in the `version_highest`
column in the output of `check_releases()`.

# Citation

``` r
o cite package ‘releases’ in publications use:

  Landau WM, Gao C, Revilla Sancho L (2024). _releases: Tools for Package
  Releases_. R package version 0.0.1,
  https://github.com/r-releases/releases,
  <https://r-releases.github.io/releases/>.

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {releases: Tools for Package Releases},
    author = {William Michael Landau and Charlie Gao and Lluís {Revilla Sancho}},
    note = {R package version 0.0.1, https://github.com/r-releases/releases},
    url = {https://r-releases.github.io/releases/},
  }
```
