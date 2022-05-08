# Construct Palettes

pals <- list(
  DkViolet = list(
    d2 = c(
      "1-1" = "#cabed0", # low x, low y
      "2-1" = "#ae3a4e", # high x, low y
      "1-2" = "#4885c1", # low x, high y
      "2-2" = "#3f2949" # high x, high y
    ),
    d3 = c(
      "1-1" = "#cabed0", # low x, low y
      "2-1" = "#bc7c8f",
      "3-1" = "#ae3a4e", # high x, low y
      "1-2" = "#89a1c8",
      "2-2" = "#806a8a", # medium x, medium y
      "3-2" = "#77324c",
      "1-3" = "#4885c1", # low x, high y
      "2-3" = "#435786",
      "3-3" = "#3f2949" # high x, high y
    )
  ),
  DkViolet2 = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#9e3547", # high x, low y
      "1-2" = "#4279b0", # low x, high y
      "2-2" = "#311e3b" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#ba8890",
      "3-1" = "#9e3547", # high x, low y
      "1-2" = "#8aa6c2",
      "2-2" = "#7a6b84", # medium x, medium y
      "3-2" = "#682a41",
      "1-3" = "#4279b0", # low x, high y
      "2-3" = "#3a4e78",
      "3-3" = "#311e3b" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#c2a0a6",
      "3-1" = "#b16d79",
      "4-1" = "#9e3547", # high x, low y
      "1-2" = "#a3b5c7",
      "2-2" = "#96899d",
      "3-2" = "#895e72",
      "4-2" = "#7a2d43",
      "1-3" = "#7397bb",
      "2-3" = "#697394",
      "3-3" = "#604e6b",
      "4-3" = "#56263f",
      "1-4" = "#4279b0", # low x, high y
      "2-4" = "#3c5c8b",
      "3-4" = "#373f65",
      "4-4" = "#311e3b" # high x, high y
    )
  )
)

save(pals, file = "R/sysdata.rda")

