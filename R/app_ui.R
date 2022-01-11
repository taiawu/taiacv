#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    fluidPage(
      h1("taiacv"),
      h4("explore what i might be able to do"),
      # this module
      # mod_visual_cv_ui("visual_cv_1")
      
      fluidRow(column(6,
                      plotOutput("mock_raw_plot",
                                 hover = hoverOpts("raw_plot_hover",
                                                   delay = 200,
                                                   nullOutside = FALSE)),
                      uiOutput("raw_hover_info")
                      
                      # plotOutput("mock_heatmap", hover = hoverOpts("plot_hover", delay = 500, nullOutside = FALSE))
                      
      ),
      column(6,
             h4("just some text here about stuff"),
             uiOutput("experience_panel")
             # ,
             # uiOutput("raw_hover_info")
             
      ) # column
      ) # fluidRow
      
    
    )
    
 
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'taiacv'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

