#' @title Check package version etiquette.
#' @export
#' @description Check the etiquette of versions of packages in R-multiverse.
#' @details It is good practice to increment the version number of a
#'   package on every new release. [check_versions()]
#'   list the packages that have chosen to decrement the version number
#'   or keep it the same over the course of the release cycle.
#'   To fix the version number of an R-multiverse package that you
#'   maintain, create a new GitHub/GitLab release whose version number
#'   in the `DESCRIPTION` file is higher than the one
#'   in the `version_highest` column in the output of [check_versions()].
#' @return A `tibble` with one row per package and the following columns:
#'   * `package`: name of the package.
#'   * `version_current`: version number of the latest package release.
#'   * `version_highest`: highest version number across all the releases
#'     created since the package was registered with R-multiverse.
#'   * `hash_current`: the `RemoteSha` of the release corresponding to
#'     `version_current`.
#'   * `hash_highest`: the `RemoteSha` of the release corresponding to
#'     `version_highest`.
#' @examples
#'   if (identical(Sys.getenv("MULTITOOLS_EXAMPLES"), "true")) {
#'     check_versions()
#'   }
check_versions <- function() {
  manifest <- file.path(
    "https://raw.githubusercontent.com",
    "r-multiverse",
    "checks",
    "main",
    "versions.json"
  )
  out <- jsonlite::read_json(
    path = manifest,
    simplifyVector = TRUE,
    simplifyDataFrame = TRUE
  )
  if (nrow(out) < 1L) {
    return(
      tibble::tibble(
        package = character(0L),
        version_current = character(0L),
        version_highest = character(0L),
        hash_current = character(0L),
        hash_highest = character(0L)
      )
    )
  }
  out <- out[out[["version_current"]] != out[["version_highest"]] |
               out[["hash_current"]] != out[["hash_highest"]], ]
  out <- tibble::as_tibble(out)
  order <- c(
    "package",
    "version_current",
    "version_highest",
    "hash_current",
    "hash_highest"
  )
  out[, order]
}
