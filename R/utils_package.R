#' releases: Tools for Package Releases
#' @name releases-package
#' @description R-releases is a community-curated,
#'   maintainer-driven repository of R package releases
#'   based on R-universe. The `releases` package
#'   has tools for maintainers of packages in R-releases.
#' @family help
#' @importFrom jsonlite read_json
#' @importFrom tibble as_tibble tibble
#' @importFrom utils browseURL install.packages globalVariables
NULL

utils::globalVariables(
  c(
    "."
  ),
  package = "releases"
)
