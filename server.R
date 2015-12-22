shinyServer(function(input, output, session) {
  
  # See http://stackoverflow.com/a/28985414/2613636
  
  observe({
    updateSelectizeInput(session, 'birds', choices = c("", unique(data[[input$lan]])))
  })
  
  birds <- reactive({
    if( is.null(input$birds) )
      return()
    data[data[[isolate(input$lan)]] == input$birds, ]
  })
  
  output$leaflet <- renderLeaflet({    
    m <- leaflet(birds())
    m %>% 
      addTiles() %>%
      addCircles(lat = ~lat, lng = ~lon, 
                 color = ~color) 
  })
  
  output$species <- renderText({
    paste(birds()$suomi[1],
          birds()$ruotsi[1],
          birds()$englanti[1],
          birds()$latina[1],
          birds()$lyhenne[1],
          sep = "<br/>")     
  })
  
})