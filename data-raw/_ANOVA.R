
# ----------------------------------------------------------------------------
...ANOVA... <- function() {



    model_anova <- aov(weight ~ group, data = PlantGrowth)

    model_anova_summary <- summary(model_anova)

    pander::pander(model_anova_summary)
    print(model_anova_summary)


    # 1. Homogeneity of variances
    plot(model_anova, 1)

    # 2. Normality
    plot(model_anova, 2)

    library(ggplot2)
    library(ggfortify)

    old_parameters <- par(mfrow = c(1, 2))
    plot(model_anova, which = 1:2)
    par(old_parameters)

    autoplot(model_anova, which = 1:2)

    autoplot(model_anova, which = 1:2, alpha = 0.6,
             data = PlantGrowth, colour = "group")
}

.activeDataSet
# # 1. Homogeneity of variances
#
# The residuals versus fits plot can be used to check the homogeneity of variances.
#
# In the plot below, there is no evident relationships between residuals and fitted values (the mean of each groups), which is good. So, we can assume the homogeneity of variances.

# ----------------------------------------------------------------------------
...Welch_ANOVA... <- function() {

    # model_wanova <- oneway.test(weight ~ group, data = PlantGrowth)
    # pander::pander(model_wanova)
    # print(model_wanova)

}
# ----------------------------------------------------------------------------
...Kruskal_Wallis_test... <- function() {

    # model_kw_test <- kruskal.test(weight ~ group, data = PlantGrowth)
    #
    # pander::pander(model_kw_test)
    # print(model_kw_test)

}

# ============================================================================

# ----------------------------------------------------------------------------
...ANOVA_post_hoc__tukey... <- function() {
    model_tukey <- posthoc_anova_tukey(weight ~ group, data = PlantGrowth)

    model_tukey

    cld_result <- make_cld(model_tukey)
    cld_result
    pander::pander(cld_result)


    library(tidyverse)

    # cld_max <- with(PlantGrowth, tapply(weight, group, function(x) 1.05 * max(x)))
    cld_y <- max(-PlantGrowth$weight * 0.95)
    cld_y <- min(-PlantGrowth$weight * 1.05)

    cld_y <- min(PlantGrowth$weight * 0.95)
    cld_y <- max(PlantGrowth$weight * 1.05)


    DATA <- mutate(PlantGrowth, group = fct_reorder(group, weight, fun = mean))

    ggplot(DATA, aes(x = group, y = weight, fill = group)) +
        geom_boxplot(width = .2) +
        geom_jitter(
            aes(x = as.numeric(group) + .3),
            alpha = 0.3,
            width = .1,
            shape = 21
        ) +
        geom_text(data = cld_result,
                  aes(x = Group, label = cld, y = cld_y),
                  fontface = "bold",
                  inherit.aes = FALSE) +
        ggtitle("Pair-wise comparisons")

    # +
    # ylim(56, 74)  # don't cut off the text I just added


}
# ----------------------------------------------------------------------------
...ANOVA_post_hoc__tukey_2... <- function() {

    library(multcomp)

    model_anova <- aov(weight ~ group, data = PlantGrowth)
    summary(model_anova)
    model_post_hoc <- glht(model_anova, linfct = mcp(group = "Tukey"))
    summary(model_post_hoc)
    cld(model_post_hoc) # kompaktiškas raidinis žymėjimas letter display

    summary(model_post_hoc) # poriniai testai
    confint(post_hoc_modelis) # skirtumų pasikliauties intervalai

}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...ANOVA_post_hoc__gh... <- function() {
    model_gh <- posthoc_anova_games_howell(weight ~ group, data = PlantGrowth)

    model_gh

    make_cld(model_gh)
}
# ----------------------------------------------------------------------------
...KW_post_hoc__Conover_Iman... <- function() {
    library(PMCMR)
    model_conover_iman <- posthoc.kruskal.conover.test(weight ~ group, data = PlantGrowth)

    model_conover_iman

    make_cld(model_conover_iman)
}
# ----------------------------------------------------------------------------
...fun... <- function(variables) {
    library("ggpubr")
    ggboxplot(PlantGrowth,
              x = "group",
              y = "weight",
              color = "group",
              palette = c("#00AFBB", "#E7B800", "#FC4E07"),
              order = c("ctrl", "trt1", "trt2"),
              ylab = "Weight",
              xlab = "Treatment")
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...Mood_median_test... <- function(variables) {
    library(RVAideMemoire)

    model_mood <- mood.medtest(weight ~ group, data = PlantGrowth)
    model_mood

    pander::pander(model_mood)
    class(model_mood)
}

...Mood_median_test__post_hoc... <- function(variables) {

    library(rcompanion)

    model_pw_mood = pairwiseMedianTest(weight ~ group, data = PlantGrowth,
                                       method = "fdr")

    pander::pander(model_pw_mood)
    BioStat::make_cld(p.adjust ~ Comparison, model_pw_mood)


}

# RVAideMemoire::bootstrap()
# rcompanion::plotNormalHistogram()