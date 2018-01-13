# item	Bio_dhMenu	command "Gather/Stack columns to long data frame..."	windowData_gather	"nonFactorsP()"	""


#' Factorize Subclass
#'
#' \code{plot_data_gather} class is a subclass for gather columns .....
#'
#' This class is a subclass which show dialog boxes of a factorizer for graphics editing.
#'
#' @section Fields:
#' \describe{
#' \item{\code{top}: }{\code{tkwin} class object; parent of widget window.}
#' \item{\code{alternateFrame}: }{\code{tkwin} class object; a special frame for some GUI parts.}
#' \item{\code{vbbox1}: }{\code{variableboxes} class object; the frame to select variables.}
#' \item{\code{lbbox1}: }{\code{labelboxes} class object; the frame to set input names.}
#' }
#' @section Contains:
#' NULL
#' @section Methods:
#' \describe{
#' \item{\code{plotWindow()}: }{Create the window that make plots.}
#' \item{\code{savePlot(plot)}: }{Save the plot.}
#' \item{\code{registRmlist(object)}: }{Register deletable temporary objects.}
#' \item{\code{removeRmlist()}: }{Remove registered temporary objects.}
#' \item{\code{setFront()}: }{Set front parts of frames.}
#' \item{\code{setBack()}: }{Set back parts of frames.}
#' \item{\code{getWindowTitle()}: }{Get the title of the window.}
#' \item{\code{getHelp()}: }{Get the title of the help document.}
#' \item{\code{getParms()}: }{Get graphics settings parameters.}
#' \item{\code{checkTheme(index)}: }{Check themes.}
#' \item{\code{checkVariable(var)}: }{Check a variable length.}
#' \item{\code{checkError(parms)}: }{Check errors.}
#' \item{\code{setDataframe(parms)}: }{Set data frames.}
#' \item{\code{getGgplot(parms)}: }{Get \code{ggplot}.}
#' \item{\code{getGeom(parms)}: }{Get \code{geom}.}
#' \item{\code{getScale(parms)}: }{Get \code{scale}.}
#' \item{\code{getCoord(parms)}: }{Get \code{coord}.}
#' \item{\code{getFacet(parms)}: }{Get \code{facet}.}
#' \item{\code{getXlab(parms)}: }{Get \code{xlab}.}
#' \item{\code{getYlab(parms)}: }{Get \code{ylab}.}
#' \item{\code{getZlab(parms)}: }{Get \code{zlab}.}
#' \item{\code{getMain(parms)}: }{Get the main label.}
#' \item{\code{getTheme(parms)}: }{Get \code{theme}.}
#' \item{\code{getOpts(parms)}: }{Get other \code{opts}.}
#' \item{\code{getPlot(parms)}: }{Get the plot object.}
#' \item{\code{getMessage()}: }{Get the plot error message.}
#' \item{\code{commandDoIt(command)}: }{An wrapper function for command execution.}
#' }
#' @family plot
#'
#' @export plot_data_gather
#' @name plot_data_gather-class
#' @aliases plot_data_gather
#' @rdname plot_data_gather
#' @docType class
#' @keywords hplot
plot_data_gather <- setRefClass(

  Class = "plot_data_gather",

  fields = c("vbbox1", "lbbox1"),

  contains = c("plot_base"),

  methods = list(

    #' Plot Windows
    plotWindow = function() {

      # note: The initializeDialog() generates "top"
      initializeDialog(window = topwindow, title = getWindowTitle())
      top            <<- topwindow
      alternateFrame <<- tkframe(top)

      setFront()

      parms <- getParms()
      onOK <- function() {

        # doItAndPrint mode
        mode <<- 1
        parms <- getParms()

        closeDialog()

        errorCode <- checkError(parms)
        if (errorCode == TRUE) {
          removeRmlist()
          return()
        } else if (errorCode == FALSE) {

          setDataframe(parms)

          .plot <- getPlot(parms)
          logger("print(.plot)")
          response <- tryCatch({
            print(.plot)
            ""
          }, error = function(ex) {
            tclvalue(RcmdrTkmessageBox(
              message = getMessage(),
              title   = gettext_Bio("Error"),
              icon    = "error",
              type    = "ok",
              default = "ok"
            ))
          }
          )
          if (response == "ok") {
            removeRmlist()
            return()
          }

        }

        removeRmlist()

        # tkinsert(LogWindow(), "end", codes)

        activateMenus()
        tkfocus(CommanderWindow())

      }

      setBack()

      # note: The OKCancelHelp() generates "buttonsFrame"
      OKCancelHelp(window = top, helpSubject = getHelp())

      tkgrid(buttonsFrame, sticky = "nw")
      dialogSuffix()

      return()

    },

    setFront = function() {

      vbbox1 <<- variableboxes$new()
      vbbox1$front(
        top       = top,
        types     = list(Numeric()),
        titles    = list(
          gettext_Bio("Variables to gather\n(pick two or more)")
        ),
        modes     = list("multiple"),
        initialSelection = list(0)
      )
      # ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~
      lbbox1 <<- textfields$new()
      lbbox1$front(
          top        = top,
          initValues = list("","", ""),
          titles     = list(
              gettext_Bio("Name of stacked dataset"),
              gettext_Bio("Name of factor"),
              gettext_Bio("Name of values")
          )
      )
      # ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~   ~~~

    },

    setBack = function() {

      vbbox1$back()
      lbbox1$back()

    },

    getWindowTitle = function() {

      gettext_Bio("Gather data columns")

    },

    getHelp = function() {

      "gather"

    },

    getParms = function() {

      x      <- getSelection(vbbox1$variable[[1]])
      y      <- character(0)
      z      <- character(0)

      s      <- character(0)
      t      <- character(0)

      name_dataset <- tclvalue(lbbox1$fields[[1]]$value)
      name_factor  <- tclvalue(lbbox1$fields[[2]]$value)
      name_values  <- tclvalue(lbbox1$fields[[3]]$value)

      xlab   <- character(0)
      xauto  <- character(0)
      ylab   <- character(0)
      yauto  <- character(0)
      zlab   <- character(0)
      main   <- character(0)

      size   <- character(0)
      family <- character(0)
      colour <- character(0)
      save   <- character(0)
      theme  <- character(0)


      list(
        x = x, y = y, z = z, s = s, t = t,
        xlab = xlab, xauto = xauto, ylab = ylab, yauto = yauto, zlab = zlab, main = main,
        size = size, family = family, colour = colour, save = save, theme = theme,
        name_dataset = name_dataset,
        name_factor = name_factor,
        name_values = name_values
      )

    },

    checkError = function(parms) {

      if (length(parms$x) == 0) {
        errorCondition(
          recall  = windowScatter,
          message = gettext_Bio("Variables are not selected")
        )
        errorCode <- TRUE
      } else {
        setDataframe(parms)

        errorCode <- 2
      }
      errorCode

    },

    setDataframe = function(parms) {

        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        # This code must be printed to Rcmdr output.
        # Errors mus be checked too.
        # It is missing now.
        parms$name_dataset <- make.names(parms$name_dataset)
        parms$name_factor  <- make.names(parms$name_factor)
        parms$name_values  <- make.names(parms$name_values)
        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        command <- paste0("library(tidyr);\n",
            parms$name_dataset,
            " <- ",
            "gather(", ActiveDataSet(),
                    ", key = ",   parms$name_factor,
                    ", value = ", parms$name_values,", ",
                     paste(parms$x, collapse = ", "), ")"
        )

        doItAndPrint(command)
        activeDataSet(ActiveDataSet())

    }

  )
)



#' Wrapper Function of plot_data_gather Subclass
#'
#' \code{windowplot_data_gather} function is a wrapper function of \code{plot_data_gather} class for the R-commander menu bar.
#'
#' @rdname plot-plot_data_gather-plot_data_gather
#' @keywords hplot
#' @export
windowData_gather <- function() {

    Data_gather <- RcmdrPlugin.BioStat::plot_data_gather$new()
    Data_gather$plotWindow()

}
