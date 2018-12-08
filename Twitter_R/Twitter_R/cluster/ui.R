shinyUI(fluidPage(
  titlePanel("My Shiny App"),
    mainPanel(
      
      
      selectInput("Select Movie", "Variable:",
                  c("batman" = "bat",
                    "numbers_RT_omdb_cleaned$Movie[2]" = "am")),
      submitButton("Submit"),
      
      
      verbatimTextOutput("text")
      
    )
  )
)