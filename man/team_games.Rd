% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/team_games.R
\name{team_games}
\alias{team_games}
\title{Create a quick scatter plot in ggplot.}
\usage{
team_games(df, team_name)
}
\arguments{
\item{df}{This is the data frame containing all information.}

\item{team_name}{This is the name of the team to filter for.}
}
\value{
This function returns a single tibble that subsets the orginal data set.
}
\description{
This will filter data set containing game data to the games where a team participates only.
}
\examples{
## Game data for SUU.
data <- basketPlots::games2023
team_games(data, "Southern Utah")

}
