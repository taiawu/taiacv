#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinipsum
#' @import ggplot2
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  # this module
  # mod_visual_cv_server("visual_cv_1")
  ### without modules
  output$mock_raw_plot <- 
    renderPlot({
      # req(input$plot_hover) # take reactive dependency 
      random_ggplot(type = "line")
      # +
      #   labs(title = input$plot_hover)
    })
  
  ### tooltip for commentary
  output$hover_info <- renderPrint({input$plot_hover
    if(!is.null(input$plot_hover)){
      input$plot_hover}
    
  })
  
  
  my_comment_title <- 
    reactive(
      paste0(random_text(nwords = 10),
             round(input$raw_plot_hover$y, 2))
    )

  my_comment <-
    reactive(
      paste0(random_text(nwords = 10),
             round(input$raw_plot_hover$x, 2)))
  
  output$raw_hover_info <- renderUI({
    
    if(!is.null(input$raw_plot_hover)){
      hover <- input$raw_plot_hover
      
      style <- paste0("position:absolute; z-index:100;", # ensure panel appears in top layer
                      "background-color: rgba(245, 245, 245, 0.2); ", # light grey, alpha 0.2 
                      "left:", hover$range$left + 10, "px;", # left-aligned in plot area
                      "right:", 300, "px;", # margin from right
                      "top:", hover$range$top + 10, "px;") # top-aligned in plot area
      
      # actual tooltip created as wellPanel
      wellPanel(
        style = style,
        p(HTML(paste0("<i>", my_comment_title(),"</i>", "<br/>",
                      hover$x)))
      )
    }
    
  })
  
  
  
  experience_comment <- 
    reactive(
      paste0(random_text(nwords = 10),
             round(input$raw_plot_hover$x, 2)))
  
  experience_comment2 <- 
    reactive(
      paste0(random_text(nwords = 30),
             round(input$raw_plot_hover$x, 2)))
  
  output$experience_panel <- renderUI({
    
    if(!is.null(input$raw_plot_hover)){
      hover <- input$raw_plot_hover
   
    
    style_right_panel <- paste0("position:absolute; z-index:100;", # ensure panel appears in top layer
                    "background-color: rgba(245, 245, 245, 0.2); ") # top-aligned in plot area
    
    # actual tooltip created as wellPanel
    # wellPanel(
    #   style = style_right_panel,
      p(HTML(paste0("<b> Packages used </b>", experience_comment(),"<br/>",
                    "<br/>", # empty line
                    "<b> Things made </b>",  experience_comment2(),"<br/>",
                    "<br/>", # empty line
                    hover$x)))
    # )
    
    }
    
  })
  
  
}
