shinyUI(fluidPage(  
  
  theme = shinytheme("cosmo"),
  
  titlePanel("Finnish Breeding Bird Atlas"),
  
  sidebarLayout(
    sidebarPanel(
      br(),
      selectInput(inputId = "lan", 
                  label = "Language:",
                  choices = c("Finnish" = "suomi",
                              "Swedish" = "ruotsi",
                              "English" = "englanti",
                              "Latin" = "latina",
                              "Acronym" = "lyhenne"),
                  selected = "englanti"
      ),
      br(),
      selectizeInput(
        inputId = "birds", 
        label = "Select species",
        multiple  = F,
        choices = c("", unique(data[["englanti"]]))
      ),
      br(),
      p("First, select language (or acronym) and then species"),
      br(),
      p("The darker blue the circle, the bigger the certainty that the species was breeding in that grid"),
      br(),
      HTML("Results of the 1st and 2nd Finnish bird atlas. Finnish Museum of Natural History, University of Helsinki. Used with Creative Commons Attribution 3.0 -license")
    ),
    
    
    mainPanel(
      tabsetPanel(
        tabPanel("Map", 
                 leafletOutput("leaflet"),
                 br(),
                 htmlOutput("species"))
      )
    )
  )
))