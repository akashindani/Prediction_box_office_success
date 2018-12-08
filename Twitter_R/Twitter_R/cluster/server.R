shinyServer(function(input, output) {

  output$text <- renderText({
    paste("a",input$`Select Movie`)
  })
})