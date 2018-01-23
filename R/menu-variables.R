# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# "Variable" menu related functions ===========================================

# Manage variables -----------------------------------------------------------


#' @rdname Menu-winow-functions
#' @export
#' @keywords internal
command_all_chr_to_fctr <- function() {
    Library("BioStat.old")

    doItAndPrint(glue::glue(
        "{ ActiveDataSet()} <- BioStat.old::all_chr_to_factor({ActiveDataSet()})"))
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
