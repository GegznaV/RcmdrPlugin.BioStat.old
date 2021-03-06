# Create new window for plots
#' @rdname Menu-winow-functions
#' @export
#' @keywords internal
command_load_packages <- function() {
    Rcmdr::doItAndPrint(paste0(
        "library(tidyverse) \n",
        "library(BioStat.old)   \n",
        "library(magrittr)  \n"))
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname Menu-winow-functions
#' @export
#' @keywords internal
command_getwd <- function() {
    Rcmdr::doItAndPrint(paste(
        '# You are working in folder:',
        'getwd()',
        sep = " \n"))
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname Menu-winow-functions
#' @export
#' @keywords internal
command_get_locale <- function() {
    Rcmdr::doItAndPrint(paste(
        '# Current locale:  \n',
        'locale_info <- Sys.getlocale()',
        'writeLines(gsub(";", "\\n", locale_info))',
        sep = " \n"))
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname Menu-winow-functions
#' @export
#' @keywords internal
command_set_locale_lt <- function() {
    # [!!!] works in Windows only.
    Rcmdr::doItAndPrint(paste(
        '# Set locale to Lithuanian \n',
        'locale_info <- Sys.setlocale(locale = "Lithuanian")',
        'writeLines(gsub(";", "\\n", locale_info))',
        sep = " \n"))
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @rdname Menu-winow-functions
#' @export
#' @keywords internal
command_set_locale_en <- function() {
    # [!!!] works in Windows only.
    Rcmdr::doItAndPrint(paste(
        '# Set locale to English \n',
        'locale_info <- Sys.setlocale(locale = "English")',
        'writeLines(gsub(";", "\\n", locale_info))',
        sep = " \n"))
}



