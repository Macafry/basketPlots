#' Create a quick scatter plot in ggplot.
#'
#' This will graph SUU's performance based on the games2023 data set.
#'
#' @return This function returns a ggplot bar plot object.
#'
#' @examples
#' ## Create a barplot for SUU's wins and losses.
#' SUU_performance()
#'
#' @import
#'   ggplot2
#'   magrittr
#'   tidyverse
#'   dplyr
#'
#' @export

SUU_performance = function() {(
  team_games(games2023, "Southern Utah")
  %>% mutate(
    Result = case_when(
      xor(HomeTeam == "Southern Utah", Difference > 0) ~ "Won",
      .default = "Lost"
    ))
  %>% group_by(Result)
  %>% summarise( Count = n() )
  %>% ggplot()
  + geom_bar(aes(x = Result, y = Count,fill =  Result),
             stat = "identity",
             color = "black")
)}

