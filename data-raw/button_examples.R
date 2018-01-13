library(tcltk)
library(tcltk2)

top <- tktoplevel()

# Create buttons
onEXIT   <- function() {tkdestroy(top)}
onDELETE <- function() {tkdestroy(buttonA)}
onADD    <- function() {tkgrid(buttonC)}

butOK       <- tk2button(top, text = "Exit",    command = onEXIT)
butADD      <- tk2button(top, text = "Add C",   command = onADD)
butDELETE   <- tk2button(top, text = "Del A C", command = onDELETE)
tkgrid(butOK, butDELETE, butADD)

# Create radiobuttons
buttonA <- tkradiobutton(top, text = "A")
buttonB <- tkradiobutton(top, text = "B")
buttonC <- tkradiobutton(top, text = "C")
tkgrid(buttonA)
tkgrid(buttonB)


BioStat::test_normality(HeadWt ~ Date, data = cabbages,
                        test = shapiro.test) %>%
    print(digits_p = 3, legend = FALSE)
