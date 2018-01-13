.df <- data.frame(y = zirniai_ling$values, z = zirniai_ling$ind)

.plot <- ggplot(data = .df, aes(x = z, y = y, colour = z)) +
    geom_point(colour = "black",
               position = position_jitter(width = 0.1,height = 0),
               alpha = .5)+
    stat_summary(fun.y = "mean", geom = "point",   ) +
    stat_summary(fun.data = "mean_cl_boot",
                 geom = "errorbar",
                 width = 0.1,
                 fun.args = list(conf.int = 0.95)) +
    scale_colour_brewer(palette = "Set1") +
    xlab("ind") +
    ylab("values") +
    labs(fill = "ind", colour = "ind") +
    theme_bw(base_size = 14, base_family = "serif")

.plot