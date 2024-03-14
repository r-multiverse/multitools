test_that("check_versions()", {
  skip_if_offline()
  out <- check_versions()
  expect_true(tibble::is_tibble(out))
  columns <- c(
    "package",
    "version_current",
    "version_highest",
    "hash_current",
    "hash_highest"
  )
  expect_equal(colnames(out), columns)
})
