
# install.packages("RcmdrPlugin.KMggplot2")
#
# if (!"devtools" %in% installed.packages())  install.packages("devtools")
#
# devtools::install_github("GegznaV/RcmdrPlugin.EZR@unmodified_Rcmdr_menu")
# devtools::install_github("GegznaV/BioStat.old")
# devtools::install_github("GegznaV/RcmdrPlugin.BioStat.old")

# packages <- c("devtools",
#               "rlang",
#               "tidyverse",
#               "tidyselect",
#               "checkmate",
#               "RcmdrPlugin.KMggplot2",
#               "RcmdrPlugin.EZR",
#               "BioStat.old",
#               "RcmdrPlugin.BioStat.old"
#               )
#
# missing_packages <- packages[!packages %in% utils::installed.packages()]
#
# # Jei bent vieno paketo nėra, tada įdiegiam, ko trūksta
# if (length(missing_packages) > 0) {
#     utils::install.packages(missing_packages,
#                             dependencies = c("Depends", "Imports", "Suggests"))
# }




    # devtools::install_github("GegznaV/RcmdrPlugin.EZR@unmodified_Rcmdr_menu",
    #                          dependencies = c("Depends", "Imports", "Suggests"))
    #
    # devtools::install_github("GegznaV/BioStat.old",
    #                          dependencies = c("Depends", "Imports", "Suggests"))
    #
    # devtools::install_github("GegznaV/RcmdrPlugin.BioStat.old",
    #                          dependencies = c("Depends", "Imports", "Suggests"))



# if (!"RcmdrPlugin.BioStat.old" %in% utils::installed.packages()) {
#     utils::install.packages("BioStat.old")
#     utils::install.packages("RcmdrPlugin.BioStat.old")
# }


rmd_template_filenamename <- paste0(
    dir(.libPaths(), pattern = "RcmdrPlugin.BioStat.old", full.names = TRUE),
    "/etc/BioStat.old-RMarkdown-Template.Rmd"
)

###! Rcmdr Options Begin !###
options(Rcmdr = list(plugins = c("RcmdrPlugin.KMggplot2",
                                 "RcmdrPlugin.EZR.2",
                                 "RcmdrPlugin.BioStat.old",
                                 NULL),
                     console.output = FALSE,
                     use.rgl = FALSE,
                     rmd.template = rmd_template_filenamename)
        )

Sys.setlocale(locale = "Lithuanian")

# library(BioStat.old)

# library(magrittr)
# library(pander)
# library(ggplot2)
# library(spMisc)



# Uncomment the following 4 lines (remove the #s)
#  to start the R Commander automatically when R starts:

# local({
#    old <- getOption('defaultPackages')
#    options(defaultPackages = c(old, 'Rcmdr'))
# })

###! Rcmdr Options End !###


message("--- Papildinys uzkrautas: RcmdrPlugin.BioStat.old ---")
