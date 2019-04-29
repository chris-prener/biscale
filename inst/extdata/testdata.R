devtools::load_all()

brown2 <- bi_pal(pal = "Brown", dim = 2, preview = FALSE)
brown3 <- bi_pal(pal = "Brown", dim = 3, preview = FALSE)
dkblue2 <- bi_pal(pal = "DkBlue", dim = 2, preview = FALSE)
dkblue3 <- bi_pal(pal = "DkBlue", dim = 3, preview = FALSE)
dkcyan2 <- bi_pal(pal = "DkCyan", dim = 2, preview = FALSE)
dkcyan3 <- bi_pal(pal = "DkCyan", dim = 3, preview = FALSE)
dkviolet2 <- bi_pal(pal = "DkViolet", dim = 2, preview = FALSE)
dkviolet3 <- bi_pal(pal = "DkViolet", dim = 3, preview = FALSE)
grpink2 <- bi_pal(pal = "GrPink", dim = 2, preview = FALSE)
grpink3 <- bi_pal(pal = "GrPink", dim = 3, preview = FALSE)

save(brown2, brown3, dkblue2, dkblue3, dkcyan2, dkcyan3, dkviolet2, dkviolet3, grpink2, grpink3, file = "inst/extdata/testdata.rda")
