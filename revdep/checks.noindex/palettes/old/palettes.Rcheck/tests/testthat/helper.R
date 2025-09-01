# Call in tests to locally set options for maximal reproducibility.
local_palettes_options <- function(
  print_symbol = "circle_small",
  print_hex = TRUE,
  print_alpha = FALSE,
  print_sep = "",
  print_width = 1,
  print_index = FALSE,
  .local_envir = parent.frame()
) {
  withr::local_options(
    palettes.print_symbol = print_symbol,
    palettes.print_hex = print_hex,
    palettes.print_alpha = print_alpha,
    palettes.print_sep = print_sep,
    palettes.print_width = print_width,
    palettes.print_index = print_index,
    .local_envir = .local_envir
  )
}
