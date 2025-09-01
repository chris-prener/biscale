cli::test_that_cli("unicode and ascii symbols work", {
  expect_snapshot(list_colour_symbols())
})
