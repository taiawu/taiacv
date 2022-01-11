#' visual_cv UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_visual_cv_ui <- function(id){
  ns <- NS(id)
  tagList(
 plotOutput("cv_plot")
  )
}
    
#' visual_cv Server Functions
#'
#' @noRd 
mod_visual_cv_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
 output$cv_plot <- renderPlot({
   # req(input$plot_hover) # take reactive dependency 
   random_ggplot(type = "line") 
     # labs(title = input$plot_hover) # how to do this in a module
 })
 
  })
}
    
## To be copied in the UI
# mod_visual_cv_ui("visual_cv_1")
    
## To be copied in the server
# mod_visual_cv_server("visual_cv_1")
