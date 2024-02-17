ui <- fluidPage(

  titlePanel("2023 Game Data App"),


  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "team", label = "Team:"),
      actionButton(inputId = "clear", label = "Reset Team List")
    ),

    mainPanel(
      htmlOutput("table"),
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  suppressMessages(library("tidyverse"))

  team <- reactive({
    input$team
  })

  validTeam <- reactive({
    team() %in% winData[["Team"]]
  })

  output$table <- renderText({
    if ( validTeam() ) {(
      games2023
      %>% team_summary(team())
      %>% kableExtra::kbl(caption = paste(team(), "win data"))
      %>% kableExtra::kable_styling(bootstrap_options = c("striped", "hover"))
    )} else {
      paste0("<h4>Unfortunately, \"", team(), "\" is not a valid team name.</h4>",
             "<h6>(Autofilter enabled - Clear team name for full list)</h6>",
             "<h4>Choose team from the following:</h4>",
             winData
             %>% filter(toupper(substring(Team,1, nchar(team()))) == toupper(team())) # string match
             %>% ( function (df) {
                     if ( nrow(df) ==0 ){
                       winData # show all teams if there are no matches
                     } else {
                       df # show filtered teams if there are matches
                     }
                  })
             %>% arrange(Team)
             %>% select(Team)
             %>% knitr::kable(format = "html", col.names = NULL))
    }
  })

  output$plot <- renderPlot({
    if ( validTeam() ){
      team_performance( team() )
    }
  })

  observeEvent(input$clear,
               handlerExpr = {
                 updateTextInput(session, "team", value = "")
               }
  )
}

shinyApp(ui = ui, server = server)
