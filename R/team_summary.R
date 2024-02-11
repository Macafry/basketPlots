#' Create a quick scatter plot in ggplot.
#'
#' This will summarize a given team's performance from a data set containing game data.
#'
#' @param df This is the data frame containing all information.
#' @param team_name This is the name of the team we want a summary of.
#'
#' @return This function returns a single tibble row for the team with
#' name, number of wins, losses, and win percentage for columns.
#'
#' @examples
#' ## Summary data for SUU.
#' data <- basketPlots::games2023
#' team_summary(data, "Southern Utah")
#'
#' @import
#'   tidyverse
#'   magrittr
#'   dplyr
#'   tidyr
#'
#' @export

team_summary = function(df, team_name) {(
  team_games(df, team_name)
  %>% mutate(
    Result = case_when(
      xor(HomeTeam == team_name, Difference > 0) ~ "Won",
      .default = "Lost"
    ))
  %>% group_by(Result)
  %>% summarize( Count = n() )
  %>% pivot_longer(cols= -1)
  %>% pivot_wider(names_from = "Result", values_from = "value")
  %>% transmute(
    Team = team_name,
    Won = ifelse("Won" %in% names(.), Won, 0),
    Lost = ifelse("Lost" %in% names(.), Lost, 0),
    WinningPercentage = Won / (Won + Lost))
)}
