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
  ),
  GrPink = list(
    d2 = c(
      "1-1" = "#e8e8e8", # low x, low y
      "2-1" = "#c85a5a", # high x, low y
      "1-2" = "#64acbe", # low x, high y
      "2-2" = "#574249" # high x, high y
    ),
    d3 = c(
      "1-1" = "#e8e8e8", # low x, low y
      "2-1" = "#e4acac",
      "3-1" = "#c85a5a", # high x, low y
      "1-2" = "#b0d5df",
      "2-2" = "#ad9ea5", # medium x, medium y
      "3-2" = "#985356",
      "1-3" = "#64acbe", # low x, high y
      "2-3" = "#627f8c",
      "3-3" = "#574249" # high x, high y
    )
  ),
  GrPink2 = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#b65252", # high x, low y
      "1-2" = "#5b9cad", # low x, high y
      "2-2" = "#4e3d43" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#c59595",
      "3-1" = "#b65252", # high x, low y
      "1-2" = "#98b8c0",
      "2-2" = "#8e8288", # medium x, medium y
      "3-2" = "#83474a",
      "1-3" = "#5b9cad", # low x, high y
      "2-3" = "#556f7a",
      "3-3" = "#4e3d43" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#caaaaa",
      "3-1" = "#c07f7f",
      "4-1" = "#b65252", # high x, low y
      "1-2" = "#acc1c6",
      "2-2" = "#a59ba0",
      "3-2" = "#9c7478",
      "4-2" = "#944b4d",
      "1-3" = "#84afba",
      "2-3" = "#7e8d96",
      "3-3" = "#786970",
      "4-3" = "#724448",
      "1-4" = "#5b9cad", # low x, high y
      "2-4" = "#577e8b",
      "3-4" = "#535e68",
      "4-4" = "#4e3d43" # high x, high y
    )
  ),
  DkBlue = list(
    d2 = c(
      "1-1" = "#e8e8e8", # low x, low y
      "2-1" = "#5ac8c8", # high x, low y
      "1-2" = "#be64ac", # low x, high y
      "2-2" = "#3b4994" # high x, high y
    ),
    d3 = c(
      "1-1" = "#e8e8e8", # low x, low y
      "2-1" = "#ace4e4",
      "3-1" = "#5ac8c8", # high x, low y
      "1-2" = "#dfb0d6",
      "2-2" = "#a5add3", # medium x, medium y
      "3-2" = "#5698b9",
      "1-3" = "#be64ac", # low x, high y
      "2-3" = "#8c62aa",
      "3-3" = "#3b4994" # high x, high y
    )
  )
)

save(pals, file = "R/sysdata.rda")

