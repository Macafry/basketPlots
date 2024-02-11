## code to prepare `winData` data set goes here

winData <- read.csv("data-raw/winData.csv")
usethis::use_data(winData, overwrite = TRUE)

