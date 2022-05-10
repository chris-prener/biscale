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
  BlueGold = list(
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
  ),
  BlueOr = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#dd6a29", # high x, low y
      "1-2" = "#169dd0", # low x, high y
      "2-2" = "#174f28" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#d8a386",
      "3-1" = "#dd6a29", # high x, low y
      "1-2" = "#7ebbd2",
      "2-2" = "#819185", # medium x, medium y
      "3-2" = "#845e29",
      "1-3" = "#169dd0", # low x, high y
      "2-3" = "#167984",
      "3-3" = "#174f28" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#d6b3a0",
      "3-1" = "#d9926a",
      "4-1" = "#dd6a29", # high x, low y
      "1-2" = "#9cc4d2",
      "2-2" = "#9ea69f",
      "3-2" = "#a08769",
      "4-2" = "#a36229",
      "1-3" = "#5fb2d1",
      "2-3" = "#60979f",
      "3-3" = "#617b69",
      "4-3" = "#635929",
      "1-4" = "#169dd0", # low x, high y
      "2-4" = "#16869e",
      "3-4" = "#166d68",
      "4-4" = "#174f28" # high x, high y
    )
  ),
  BlueYl = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#d9be00", # high x, low y
      "1-2" = "#0088d9", # low x, high y
      "2-2" = "#007b00" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#d6cb7d",
      "3-1" = "#d9be00", # high x, low y
      "1-2" = "#74b1d6",
      "2-2" = "#76ab7e", # medium x, medium y
      "3-2" = "#78a000",
      "1-3" = "#0088d9", # low x, high y
      "2-3" = "#008380",
      "3-3" = "#007b00" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#d5ce9c",
      "3-1" = "#d7c759",
      "4-1" = "#d9be00", # high x, low y
      "1-2" = "#95bdd5",
      "2-2" = "#96b89e",
      "3-2" = "#98b35a",
      "4-2" = "#9aaa00",
      "1-3" = "#52a6d7",
      "2-3" = "#53a19f",
      "3-3" = "#539c5b",
      "4-3" = "#549500",
      "1-4" = "#0088d9", # low x, high y
      "2-4" = "#0085a1",
      "3-4" = "#00815c",
      "4-4" = "#007b00" # high x, high y
    )
  ),
  PinkGrn = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#459b22", # high x, low y
      "1-2" = "#bc177d", # low x, high y
      "2-2" = "#3e1114" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#90b87e",
      "3-1" = "#459b22", # high x, low y
      "1-2" = "#ca85af",
      "2-2" = "#8a7469", # medium x, medium y
      "3-2" = "#42611c",
      "1-3" = "#bc177d", # low x, high y
      "2-3" = "#80144b",
      "3-3" = "#3e1114" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#a6c19c",
      "3-1" = "#78af61",
      "4-1" = "#459b22", # high x, low y
      "1-2" = "#cd9fbb",
      "2-2" = "#a1918a",
      "3-2" = "#748456",
      "4-2" = "#43751e",
      "1-3" = "#c668a2",
      "2-3" = "#9c5f77",
      "3-3" = "#71564b",
      "4-3" = "#414c1a",
      "1-4" = "#bc177d", # low x, high y
      "2-4" = "#95155c",
      "3-4" = "#6b1339",
      "4-4" = "#3e1114" # high x, high y
    )
  ),
  PurpleGrn = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#027a2e", # high x, low y
      "1-2" = "#6f2d85", # low x, high y
      "2-2" = "#011a1d" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#70a985",
      "3-1" = "#027a2e", # high x, low y
      "1-2" = "#a180ac",
      "2-2" = "#55676c", # medium x, medium y
      "3-2" = "#014a26",
      "1-3" = "#6f2d85", # low x, high y
      "2-3" = "#3b2454",
      "3-3" = "#011a1d" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#92b79f",
      "3-1" = "#4d9a6a",
      "4-1" = "#027a2e", # high x, low y
      "1-2" = "#b19cb9",
      "2-2" = "#7a878b",
      "3-2" = "#41715c",
      "4-2" = "#025a29",
      "1-3" = "#91659f",
      "2-3" = "#645778",
      "3-3" = "#354a50",
      "4-3" = "#013a23",
      "1-4" = "#6f2d85", # low x, high y
      "2-4" = "#4d2764",
      "3-4" = "#292042",
      "4-4" = "#011a1d" # high x, high y
    )
  ),
  PurpleOr = list(
    d2 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#d25601", # high x, low y
      "1-2" = "#563787", # low x, high y
      "2-2" = "#551601" # high x, high y
    ),
    d3 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#d39c75",
      "3-1" = "#d25601", # high x, low y
      "1-2" = "#9283ac",
      "2-2" = "#926160", # medium x, medium y
      "3-2" = "#923601",
      "1-3" = "#563787", # low x, high y
      "2-3" = "#56284b",
      "3-3" = "#551601" # high x, high y
    ),
    d4 = c(
      "1-1" = "#d3d3d3", # low x, low y
      "2-1" = "#d3af95",
      "3-1" = "#d28753",
      "4-1" = "#d25601", # high x, low y
      "1-2" = "#a89db9",
      "2-2" = "#a88283",
      "3-2" = "#a86448",
      "4-2" = "#a84001",
      "1-3" = "#7e6a9f",
      "2-3" = "#7e5771",
      "3-3" = "#7e433e",
      "4-3" = "#7e2b01",
      "1-4" = "#563787", # low x, high y
      "2-4" = "#562d5f",
      "3-4" = "#552335",
      "4-4" = "#551601" # high x, high y
    )
  )
)

save(pals, file = "R/sysdata.rda", version = 2)
