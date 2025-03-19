library(shiny)
library(DT)
library(lubridate)
library(shinycssloaders)
library(httr)
library(jsonlite)
library(dplyr)

ui <- fluidPage(
  tags$head(
    tags$html(lang = "en"),
    tags$title("WEDC, Loughborough University: Illustrations and Graphics"),
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
  ),
  
  tags$div(
    HTML('<span class="wedc-title">WEDC, Loughborough University: Books and Manuals</span><br><br>')
  ),
    
    # Sidebar layout
    sidebarLayout(
      sidebarPanel(
        style = "margin-bottom: 10px;",
        uiOutput("collectionDropdown"),
        uiOutput("drawingTypeDropdown"),  # New dropdown for Drawing Type
        textInput("search_title", "Search Keyword", ""),  # Search box for titles
        p(),
        p("These figures were prepared by WEDC, School of Architecture, Building and Civil Engineering, Loughborough University.")
      ),
      mainPanel(
        withSpinner(
          uiOutput("articleGrid"), # Table output
          type = 3, 
          color = "#009BC9", 
          color.background = "#FFFFFF"
        )
      )
    ),
      tags$div(class = "footer", 
               fluidRow(
                 column(12, 
                        tags$a(href = 'https://doi.org/10.17028/rd.lboro.28525481', 
                               "Accessibility Statement")
                 )
               )
    )
  )
