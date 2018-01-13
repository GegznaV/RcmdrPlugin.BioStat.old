# [tags] Rename, Correct contents

# Function 1.A --------------------------------------------------------------

correct_contents4 <- function(FILE){
    # Read
    x0 <- readLines(con = FILE)
    x <- x0

    x <- gsub("RcmdrPlugin.KMggplot2",      "RcmdrPlugin.BioStat", x, fixed = TRUE)

    x <- gsub("kmg2",      "Bio__",x, fixed = TRUE,ignore.case = FALSE)
    x <- gsub("Kmg2",      "_Bio",x, fixed = TRUE,ignore.case = FALSE)
    x <- gsub("Bio__",      "Bio_",x, fixed = TRUE,ignore.case = FALSE)

    # Writte
    if (any(x0 != x))    { cat(FILE,sep = "\n"); writeLines(x, con = FILE) }
}

# function 1.B ------------------------------------------------------------

rename4 <- function(FILE){
    x <- FILE

    # Correct filenames
    # x <- gsub("^PAP_2014-",  "", x, perl = TRUE)
    # x <- gsub("knitr_container",      "knitrContainer",x, fixed = TRUE)
    # x <- gsub("add_obj",      "attach_obj",x, fixed = TRUE)
    # x <- gsub("extract_and_print",      "print_container",x, fixed = TRUE)



    NEW_FILE <- x
    # Rename files if needed
    if (FILE != NEW_FILE)    {
        cat(sprintf("Files renamed: %30s   >>>   %-30s", FILE, NEW_FILE), sep = "\n")
        file.rename(from = FILE, to = NEW_FILE)
    }
}

# Function 2 --------------------------------------------------------------

apply_content_corrections <- function(x){
    Start <-  Sys.time()
    current_wd <- getwd()
    # Reset wd on exit
    on.exit(setwd(current_wd))

    # Change wd
    setwd(x)
    AllFiles <- dir()
    # FILES <- as.list(AllFiles[grepl("(.*\\.R$)|(.*\\.Rmd$)|(.*\\.html$)",AllFiles)])
    FILES <- as.list(AllFiles[
        grepl("(.*\\.R$)|(.*\\.Rmd$)|(.*\\.html$)|(.*\\.txt$)", AllFiles)
        ])

    # lapply(FILES, correct_contents)
    lapply(FILES, correct_contents4)
    # lapply(FILES, rename4)

    # open_wd()
    printDuration(Start,returnString = TRUE)


}

# Function 3 --------------------------------------------------------------

require(spHelper)

# List all directories of interest

directories  <- as.list(
    c(paste0('D:/Dokumentai/R/RcmdrPlugin.BioStat/',
             c(
               "data"                    ,
               "inst"                    ,
               "inst/etc"                ,
               "inst/po"                 ,
               "inst/po/ja"              ,
               "inst/po/ja/LC_MESSAGES"  ,
               "inst/po/sl"              ,
               "inst/po/sl/LC_MESSAGES"  ,
               "man"                     ,
               "po"                      ,
               "R"                       ,
               "vignettes"
               ),"/")

      )
)

# directories  <- as.list("D:\\Dokumentai\\R\\Spektroskopija\\PAP_RK_2014\\")


# Apply corrections
stop("This script can be harmful!!!")
lapply(directories, apply_content_corrections)

