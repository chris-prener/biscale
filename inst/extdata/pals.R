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
  ),
  DkBlue2 = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#52b6b6", # high x, low y
      "1-2" = "#ad5b9c", # low x, high y
      "2-2" = "#434e87" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#97c5c5",
      "3-1" = "#52b6b6", # high x, low y
      "1-2" = "#c098b9",
      "2-2" = "#898ead", # medium x, medium y
      "3-2" = "#4a839f",
      "1-3" = "#ad5b9c", # low x, high y
      "2-3" = "#7c5592",
      "3-3" = "#434e87" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#accaca",
      "3-1" = "#81c1c1",
      "4-1" = "#52b6b6", # high x, low y
      "1-2" = "#c6acc1",
      "2-2" = "#a2a5b9",
      "3-2" = "#799db0",
      "4-2" = "#4d94a6",
      "1-3" = "#ba85b0",
      "2-3" = "#977fa8",
      "3-3" = "#7279a0",
      "4-3" = "#487397",
      "1-4" = "#ad5b9c", # low x, high y
      "2-4" = "#8d5796",
      "3-4" = "#6a538f",
      "4-4" = "#434e87" # high x, high y
    )
  ),
  DkCyan = list(
    d2 = c(
      "1-1" = "#e8e8e8", # low x, low y
      "2-1" = "#6c83b5", # high x, low y
      "1-2" = "#73ae80", # low x, high y
      "2-2" = "#2a5a5b" # high x, high y
    ),
    d3 = c(
      "1-1" = "#e8e8e8", # low x, low y
      "2-1" = "#b5c0da",
      "3-1" = "#6c83b5", # high x, low y
      "1-2" = "#b8d6be",
      "2-2" = "#90b2b3", # medium x, medium y
      "3-2" = "#567994",
      "1-3" = "#73ae80", # low x, high y
      "2-3" = "#5a9178",
      "3-3" = "#2a5a5b" # high x, high y
    )
  ),
  DkCyan2 = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#6277a5", # high x, low y
      "1-2" = "#699e74", # low x, high y
      "2-2" = "#31595b" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#9aa5bb",
      "3-1" = "#6277a5", # high x, low y
      "1-2" = "#9eb9a4",
      "2-2" = "#739091", # medium x, medium y
      "3-2" = "#4a6880",
      "1-3" = "#699e74", # low x, high y
      "2-3" = "#4c7c67",
      "3-3" = "#31595b" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#adb4c4",
      "3-1" = "#8795b4",
      "4-1" = "#6277a5", # high x, low y
      "1-2" = "#b0c2b3",
      "2-2" = "#90a5a6",
      "3-2" = "#708999",
      "4-2" = "#526d8c",
      "1-3" = "#8cb094",
      "2-3" = "#739689",
      "3-3" = "#597c7f",
      "4-3" = "#416374",
      "1-4" = "#699e74", # low x, high y
      "2-4" = "#56876c",
      "3-4" = "#437063",
      "4-4" = "#31595b" # high x, high y
    )
  ),
  Brown = list(
    d2 = c(
      "1-1" = "#e8e8e8", # low x, low y
      "2-1" = "#c8b35a", # high x, low y
      "1-2" = "#9972af", # low x, high y
      "2-2" = "#804d36" # high x, high y
    ),
    d3 = c(
      "1-1" = "#e8e8e8", # low x, low y
      "2-1" = "#e4d9ac",
      "3-1" = "#c8b35a", # high x, low y
      "1-2" = "#cbb8d7",
      "2-2" = "#c8ada0", # medium x, medium y
      "3-2" = "#af8e53",
      "1-3" = "#9972af", # low x, high y
      "2-3" = "#976b82",
      "3-3" = "#804d36" # high x, high y
    )
  ),
  Brown2 = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#b6a352", # high x, low y
      "1-2" = "#8b689f", # low x, high y
      "2-2" = "#78503e" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#c5bb93",
      "3-1" = "#b6a352", # high x, low y
      "1-2" = "#af9cb9",
      "2-2" = "#a38b81", # medium x, medium y
      "3-2" = "#977948",
      "1-3" = "#8b689f", # low x, high y
      "2-3" = "#825c6f",
      "3-3" = "#78503e" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#cac4a8",
      "3-1" = "#c0b37e",
      "4-1" = "#b6a352", # high x, low y
      "1-2" = "#bbafc2",
      "2-2" = "#b2a29b",
      "3-2" = "#aa9473",
      "4-2" = "#a1874b",
      "1-3" = "#a38bb1",
      "2-3" = "#9c818d",
      "3-3" = "#947669",
      "4-3" = "#8c6b44",
      "1-4" = "#8b689f", # low x, high y
      "2-4" = "#85607f",
      "3-4" = "#7f585f",
      "4-4" = "#78503e" # high x, high y
    )
  ),
  Bluegill = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#74a7a3", # high x, low y
      "1-2" = "#976020", # low x, high y
      "2-2" = "#534c19" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#a4bdbb",
      "3-1" = "#74a7a3", # high x, low y
      "1-2" = "#b59a7a",
      "2-2" = "#8c8a6c", # medium x, medium y
      "3-2" = "#647a5e",
      "1-3" = "#976020", # low x, high y
      "2-3" = "#75561c",
      "3-3" = "#534c19" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#b4c5c3",
      "3-1" = "#94b6b3",
      "4-1" = "#74a7a3", # high x, low y
      "1-2" = "#bfad97",
      "2-2" = "#a3a18b",
      "3-2" = "#869580",
      "4-2" = "#698975",
      "1-3" = "#ab875c",
      "2-3" = "#927d55",
      "3-3" = "#78744e",
      "4-3" = "#5e6b47",
      "1-4" = "#976020", # low x, high y
      "2-4" = "#81591d",
      "3-4" = "#6a521b",
      "4-4" = "#534c19" # high x, high y
    )
  ),
  BluGold = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#488fb0", # high x, low y
      "1-2" = "#dea301", # low x, high y
      "2-2" = "#4c6e01" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#8fb1c2",
      "3-1" = "#488fb0", # high x, low y
      "1-2" = "#d8bd75",
      "2-2" = "#929f6c", # medium x, medium y
      "3-2" = "#498062",
      "1-3" = "#dea301", # low x, high y
      "2-3" = "#968901",
      "3-3" = "#4c6e01" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#a6bcc7",
      "3-1" = "#77a6bb",
      "4-1" = "#488fb0", # high x, low y
      "1-2" = "#d6c597",
      "2-2" = "#a8b08f",
      "3-2" = "#799c86",
      "4-2" = "#49867e",
      "1-3" = "#d9b653",
      "2-3" = "#aba24e",
      "3-3" = "#7b904a",
      "4-3" = "#4a7b45",
      "1-4" = "#dea301", # low x, high y
      "2-4" = "#ae9101",
      "3-4" = "#7d8001",
      "4-4" = "#4c6e01" # high x, high y
    )
  )
)

save(pals, file = "R/sysdata.rda")
