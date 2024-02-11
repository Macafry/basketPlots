#' Create a quick scatter plot in ggplot.
#'
#' This will filter data set containing game data to the games where a team participates only.
#'
#' @param df This is the data frame containing all information.
#' @param team_name This is the name of the team to filter for.
#'
#' @return This function returns a single tibble that subsets the orginal data set.
#'
#' @examples
#' ## Game data for SUU.
#' data <- basketPlots::games2023
#' team_games(data, "Southern Utah")
#'
#' @import
#'   tidyverse
#'   magrittr
#'
#' @export

team_games = function(df, team_name) {

  if (!(team_name %in%  (df
                         %>% select(HomeTeam, VisitorTeam)
                         %>% unlist
                         %>% unique)) ){

    stop(paste("Could not find the team",
               team_name, "in the dataframe"))
  }

  df %>% filter(HomeTeam == team_name | VisitorTeam == team_name)

}
