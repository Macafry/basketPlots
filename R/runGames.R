#' Team Win Data App
#'
#' This function allows the team win data shiny app to run. The app prompts the
#' user to type in a team name, showing suggestions if they don't input a valid
#' team name. Once the user inputs a valid team name, the app shows that team's
#' win and loss data as well as a summary chart displaying the same information.
#'
#' @import
#'   ggplot2
#'   magrittr
#'   tidyverse
#' @export

runGames <- function() {
  appDir <- system.file("shiny", "team_data_app", package = "basketPlots")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `basketPlots`.",
         call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
