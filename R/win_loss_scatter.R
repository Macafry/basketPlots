#' Create a scatter plot of the teams wins vs losses.
#'
#' This will graph the performance of all teams by creating an interactive ggplot style
#' scatter plot of the teams wins vs losses through plotly. The data comes from the winData data set.
#'
#'
#' @return This function returns an interactive ggplot scatter plot object.
#'
#' @examples
#' ## Create a scatter plot of the teams wins vs losses.
#' win_loss_scatter()
#'
#' @import
#'   ggplot2
#'   plotly
#'
#' @export
win_loss_scatter = function() {
  p <- ggplot(winData) +
    geom_point(aes(x=Won, y = Lost, text=Team), alpha = 0.05)

  ggplotly(p)
}
