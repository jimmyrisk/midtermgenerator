library(shiny)
shinyApp(
  ui = fluidPage(
    numericInput(inputId = "broncoID",
                 label = "Enter your BroncoID",
                 value = 1),
    downloadButton("report", "Generate report")
  ),
  server = function(input, output) {
    output$report <- downloadHandler(
      
      filename = "midterm.pdf",
      content = function(file) {
        # Copy the report file to a temporary directory before processing it, in
        # case we don't have write permissions to the current working dir (which
        # can happen when deployed).
        tempMidterm <- file.path(tempdir(), "midterm.rmd")
        tempPreamble <- file.path(tempdir(), "preamble-latex.tex")
        file.copy("midterm.rmd", tempMidterm, overwrite = TRUE)
        file.copy("preamble-latex.tex", tempPreamble, overwrite = TRUE)
        
        # Set up parameters to pass to Rmd document
        params <- list(broncoID = input$broncoID)
        
        # Knit the document, passing in the `params` list, and eval it in a
        # child of the global environment (this isolates the code in the document
        # from the code in this app).
        rmarkdown::render(tempMidterm, output_file = file,
                          params = params,
                          envir = new.env(parent = globalenv())
        )
      }
    )
  }
)
f