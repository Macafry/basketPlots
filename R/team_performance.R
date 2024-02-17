#' Create a quick scatter plot in ggplot.
#'
#' This will graph a given team's performance based on the games2023 data set.
#'
#' @return This function returns a ggplot bar plot object.
#'
#' @examples
#' ## Create a barplot for SUU's wins and losses.
#' team_performance("Southern Utah")
#'
#' @import
#'   ggplot2
#'   magrittr
#'   tidyverse
#'   dplyr
#'
#' @export

team_performance = function(team) {(
  team_games(games2023, team)
  %>% mutate(
    Result = case_when(
      xor(HomeTeam == team, Difference > 0) ~ "Won",
      .default = "Lost"
    ))
  %>% group_by(Result)
  %>% summarise( Count = n() )
  %>% ggplot()
  + geom_bar(aes(x = Result, y = Count,fill =  Result),
             stat = "identity",
             color = "black")
  + labs(title = paste0(team,"'s 2023 Performance"))
)}

