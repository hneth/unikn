## plot_themes.R | unikn
## spds | uni.kn |  2019 09 12
## ---------------------------

## Defining default themes for plotting. 

## (A) Themes for base R plotting: ------- 

## ToDo... 

## (B) ggplot2 themes: ------- 

## Check if ggplot2 is available: 

# if (!require(ggplot2)) {
#   
#   install.packages('ggplot2')   # installs ggplot2 
#   library('ggplot2')            # loads ggplot2
#   
# }

## Check if ggplot2 is loaded: 

# if ("ggplot2" %in% (.packages())){
# 
#   message("Package 'ggplot2' is loaded.")
# 
# } # if ("ggplot2" %in% (.packages())) end.


## theme_unikn: Define a new ggplot2 theme: ------ 

# - Documentation: ---- 

#' Basic unikn theme for ggplot2.  
#' 
#' \code{theme_unikn} provides a basic \bold{unikn} theme 
#' to use in \bold{ggplot2} commands. 
#' 
#' The theme is lightweight and no-nonsense, but somewhat 
#' opinionated (e.g., in using mostly grey scales to 
#' allow emphasizing data points with color accents). 
#' 
#' @param col_title Color of title (text) elements (optional, numeric).  
#' Default: \code{col_title = "black"}.  
#' Consider using \code{col_title = unikn::pal_seeblau[[4]]} 
#' in combination with black or grey data points. 
#' 
#' @param base_size Base font size (optional, numeric). 
#' Default: \code{base_size = 11}. 
#' 
#' @param base_family Base font family (optional, character). 
#' Default: \code{base_family = ""}.  
#' 
#' @param base_line_size Base line size (optional, numeric). 
#' Default: \code{base_line_size = base_size/20}.  
#' 
#' @param base_rect_size Base rectangle size (optional, numeric). 
#' Default: \code{base_rect_size = base_size/20}.  
#' 
#' @examples
#' 
#' \donttest{
#'   # Plotting iris dataset (using ggplot2, theme_unikn, and unikn colors):
#'   
#'   library("ggplot2")  # theme_unikn requires loading ggplot2 
#'   
#'   ggplot(datasets::iris) +
#'     geom_jitter(aes(x = Petal.Length, y = Petal.Width, color = Species), size = 3, alpha = 1/2) +
#'     scale_color_manual(values = usecol(pal = c(Seeblau, Peach, Seegruen))) +
#'     labs(title = "Iris species",
#'          caption = "Data from datasets::iris") + 
#'     theme_unikn(col_title = "black", base_size = 11)
#' }
#' 
#' @family plot functions
#' 
#' @import ggplot2 
#'                          
#' @export 

# - Definition: ---- 

theme_unikn <- function(col_title = unikn::pal_seeblau[[4]], # OR: "black" 
                        base_size = 11, 
                        base_family = "", 
                        base_line_size = base_size/20, 
                        base_rect_size = base_size/20
) {ggplot2::theme_bw(base_size = base_size, 
                     base_family = base_family, 
                     base_line_size = base_line_size, 
                     base_rect_size = base_rect_size) %+replace% 
    ggplot2::theme(#
      # titles: 
      title = ggplot2::element_text(color = col_title, face = "bold"), 
      plot.subtitle = ggplot2::element_text(color = grey(.10, 1), face = "plain", hjust = 0),  
      plot.caption = ggplot2::element_text(color =  grey(.20, 1), face = "plain", size = ggplot2::rel(.80), hjust = 1), 
      # axes:
      axis.line =  ggplot2::element_line(color = "black", size = ggplot2::rel(1)), 
      axis.ticks = ggplot2::element_line(color = "black"), 
      axis.title = ggplot2::element_text(color = grey(.10, 1)), 
      axis.text =  ggplot2::element_text(color = grey(.20, 1)), 
      # legend: 
      legend.title = ggplot2::element_text(color = grey(.10, 1)), 
      legend.text = ggplot2::element_text(color = grey(.20, 1)), 
      legend.background = ggplot2::element_blank(), 
      legend.key = ggplot2::element_blank(), 
      # strip: 
      # strip.background = ggplot2::element_rect(fill = pal_seeblau[[1]], color = pal_seeblau[[5]], size = ggplot2::rel(5/3)), 
      strip.background = ggplot2::element_rect(fill = grey(.95, 1), color = grey(.10, 1), size = ggplot2::rel(5/3)), 
      strip.text = ggplot2::element_text(color = grey(.20, 1)), 
      # panel: 
      # panel.border = ggplot2::element_blank(), 
      panel.border = ggplot2::element_rect(fill = "transparent", color = grey(.10, 1), linetype = "solid", size = ggplot2::rel(2/3)), 
      # panel.grid = ggplot2::element_blank(), 
      panel.grid.major = ggplot2::element_line(color = grey(.65, .50), linetype = "solid", size = ggplot2::rel(1/3)), 
      # panel.grid.minor = ggplot2::element_line(color = grey(.70, 1), linetype = "solid", size = ggplot2::rel(1/3)), 
      panel.grid.minor = ggplot2::element_blank(), 
      panel.background = ggplot2::element_blank(), 
      # background:  
      plot.background = ggplot2::element_rect(fill = "transparent", color = NA), 
      complete = TRUE)
  
} # theme_unikn end. 


# ## Check: 

# # (1) ggplot2::diamonds:
# 
# ggplot(diamonds, aes(x = x, y = price, color = cut)) +
#   geom_jitter(alpha = 4/6) +
#   # geom_violin(color = Seeblau, fill = NA) +
#   # facet_wrap(~cut) +
#   scale_color_manual(values = usecol(pal = viridisLite::magma(n = 5))) +
#   labs(tag = "A",
#        title = "Plot title",
#        # subtitle = "Subtitle of this plot",
#        x = "Label of x-axis", y = "Labe of y-axis",
#        color = "Color label:",
#        caption = "Data from ggplot2::diamonds") +
#   theme_unikn(col_title = unikn::pal_seeblau[[5]], base_size = 11)
 
# # (2) ggplot2::mpg:
# 
# ggplot(mpg, aes(x = cty, y = hwy, color = manufacturer)) +
#   geom_jitter(size = 2, alpha = 2/3) +
#   facet_wrap(~cyl) +
#   scale_color_manual(values = usecol(pal = c(rev(pal_seeblau), "white", pal_bordeaux), n = 15)) +
#   labs(tag = "B",
#        title = "Car data plot",
#        # subtitle = "Demo of some faceted plot",
#        caption = "Data from ggplot2::mpg") +
#   theme_unikn(col_title = "black", base_size = 11)

## ToDo: ------

# - ...

## eof. ----------