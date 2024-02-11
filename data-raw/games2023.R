## code to prepare `games2023` data set goes here

games2023 <- read.csv("data-raw/games2023.csv")
usethis::use_data(games2023, overwrite = TRUE)



