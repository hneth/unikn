## plot_themes.R | unikn
## spds | uni.kn |  2024 12 12
## ---------------------------

## Defining default themes for plotting. 

## (A) Themes for base R plotting: ------- 

## ToDo.


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



# theme_unikn: Default theme for ggplot2: ------ 

# - Documentation: ---- 

#' Basic unikn theme (for ggplot2) 
#' 
#' \code{theme_unikn} provides a basic \bold{unikn} theme 
#' to use in \bold{ggplot2} commands. 
#' 
#' The theme is lightweight and no-nonsense, but somewhat 
#' opinionated (e.g., in using mostly grey scales to 
#' allow emphasizing data points with color accents). 
#' 
#' @param col_title Color of title (text) elements (optional, numeric).  
#' Default: \code{col_title = pal_seeblau[[4]]}. 
#' Consider using \code{col_title = "black"} when data uses 
#' \code{Seeblau} colors. 
#' 
#' @param base_size Base font size (optional, numeric). 
#' Default: \code{base_size = 11}. 
#' 
#' @param base_family Base font family (optional, character). 
#' Default: \code{base_family = ""}. 
#' Options include \code{"mono"}, \code{"sans"} (default), and "serif". 
#' 
#' @param base_line_size Base line size (optional, numeric). 
#' Default: \code{base_line_size = base_size/22}. 
#' 
#' @param base_rect_size Base rectangle size (optional, numeric). 
#' Default: \code{base_rect_size = base_size/22}. 
#' 
#' @examples
#' 
#' \donttest{
#'   # Plotting iris dataset (using ggplot2, theme_unikn, and unikn colors):
#'   
#'   library('ggplot2')  # theme_unikn requires ggplot2 
#'   
#'   ggplot(datasets::iris) +
#'     geom_jitter(aes(x = Petal.Length, y = Petal.Width, color = Species), size = 3, alpha = 2/3) +
#'     scale_color_manual(values = usecol(pal = c(Pinky, Seeblau, Seegruen))) +
#'     labs(tag = "A", title = "Iris petals",
#'          caption = "Data from datasets::iris") + 
#'     theme_unikn()
#' }
#' 
#' @family plot functions
#' 
#' @seealso 
#' \code{\link{theme_grau}} for a grey theme; 
#' \code{\link{theme_licht}} for a light theme.  
#' 
#' @import ggplot2 
#'                          
#' @export 

# - Definition: ---- 

theme_unikn <- function(col_title = pal_seeblau[[4]], # "black"  
                        base_size = 11, 
                        base_family = "", 
                        base_line_size = base_size/22, 
                        base_rect_size = base_size/22
) {ggplot2::theme_bw(base_size = base_size, 
                     base_family = base_family, 
                     base_line_size = base_line_size, 
                     base_rect_size = base_rect_size) %+replace% 
    ggplot2::theme(#
      # titles: 
      title = ggplot2::element_text(color = col_title, face = "bold", 
                                    margin = ggplot2::margin(t = 10, r = 4, b = 4, l = 4, unit = "pt")), 
      plot.subtitle = ggplot2::element_text(color = grey(.10, 1), face = "plain", hjust = 0,
                                            margin = ggplot2::margin(t = 2, r = 4, b = 8, l = 4, unit = "pt")),  
      plot.caption = ggplot2::element_text(color =  grey(.20, 1), face = "plain", size = ggplot2::rel(.80), hjust = 1), 
      # axes:
      axis.line =  ggplot2::element_line(color = "black", size = ggplot2::rel(1)), 
      axis.ticks = ggplot2::element_line(color = "black", size = ggplot2::rel(.90)), 
      axis.title = ggplot2::element_text(color = grey(.10, 1)), 
      axis.text =  ggplot2::element_text(color = grey(.20, 1), size = ggplot2::rel(.90)), 
      # legend: 
      legend.title = ggplot2::element_text(color = grey(.10, 1)), 
      legend.text = ggplot2::element_text(color = grey(.20, 1), size = ggplot2::rel(.90)), 
      legend.background = ggplot2::element_blank(), 
      legend.key = ggplot2::element_blank(), 
      # strip: 
      # strip.background = ggplot2::element_rect(fill = pal_seeblau[[1]], color = pal_seeblau[[5]], size = ggplot2::rel(5/3)), 
      strip.background = ggplot2::element_rect(fill = grey(.95, 1), color = grey(.05, 1),  # light grey strip background 
                                               size = ggplot2::rel(.90)), 
      strip.text = ggplot2::element_text(color = grey(0, 1), size = ggplot2::rel(1.0), 
                                         margin = ggplot2::margin(t = 4, r = 4, b = 4, l = 4, unit = "pt")), 
      # panel: 
      # panel.border = ggplot2::element_blank(), 
      panel.border = ggplot2::element_rect(fill = "transparent", color = grey(.05, 1), 
                                           linetype = "solid", size = ggplot2::rel(.80)), 
      # panel.grid = ggplot2::element_blank(), 
      panel.grid.major = ggplot2::element_line(color = grey(.75, 1), linetype = "solid", size = ggplot2::rel(.50)), 
      # panel.grid.minor = ggplot2::element_line(color = grey(.75, 1), linetype = "solid", size = ggplot2::rel(.40)), # "dotted"  
      panel.grid.minor = ggplot2::element_blank(), 
      panel.background = ggplot2::element_rect(fill = grey(1, 1), color = NA), # "white" panel background 
      # background:  
      plot.background = ggplot2::element_rect(fill = "transparent", color = NA), 
      complete = TRUE)
  
} # theme_unikn().



# theme_grau: Alternative theme for ggplot2: ------ 

# - Documentation: ---- 

#' A grey theme (for ggplot2)
#' 
#' \code{theme_grau} provides an alternative \bold{unikn} theme 
#' to use in \bold{ggplot2} commands. 
#' 
#' \code{theme_grau} is no-nonsense, but fills  
#' panel backgrounds in "grau" (specifically, pal_seeggrau[[1]]). 
#' 
#' This theme works well for dark colors and bright color accents, 
#' but is of limited use with transparent colors. 
#' 
#' @param col_title Color of title (text) elements (optional, numeric).  
#' Default: \code{col_title = grey(0, 1)} (i.e., "black").  
#' Consider using \code{col_title = unikn::pal_seeblau[[4]]}.  
#' 
#' @param base_size Base font size (optional, numeric). 
#' Default: \code{base_size = 11}. 
#' 
#' @param base_family Base font family (optional, character). 
#' Default: \code{base_family = ""}. 
#' Options include \code{"mono"}, \code{"sans"} (default), and "serif". 
#' 
#' @param base_line_size Base line size (optional, numeric). 
#' Default: \code{base_line_size = base_size/22}. 
#' 
#' @param base_rect_size Base rectangle size (optional, numeric). 
#' Default: \code{base_rect_size = base_size/22}. 
#' 
#' @examples
#' 
#' \donttest{
#' # Plotting iris dataset (using ggplot2, theme_grau, and unikn colors):
#'   
#' library('ggplot2')  # theme_unikn requires ggplot2 
#'    
#' ggplot(datasets::iris) +
#'   geom_jitter(aes(x = Sepal.Length, y = Sepal.Width, color = Species), size = 3, alpha = 2/3) +
#'   facet_wrap(~Species) +
#'   scale_color_manual(values = usecol(pal = c(Pinky, Seeblau, Seegruen))) +
#'   labs(tag = "B",
#'        title = "Iris sepals",
#'        caption = "Data from datasets::iris") + 
#'   coord_fixed(ratio = 3/2) + 
#'   theme_grau()
#' 
#' }
#' 
#' @family plot functions
#' 
#' @seealso 
#' \code{\link{theme_unikn}} for default theme; 
#' \code{\link{theme_licht}} for a light theme. 
#' 
#' @import ggplot2 
#'                          
#' @export 

# - Definition: ---- 

theme_grau <- function(col_title = grey(0, 1), # OR: "black" 
                       base_size = 11, 
                       base_family = "", 
                       base_line_size = base_size/22, 
                       base_rect_size = base_size/22
) {ggplot2::theme_bw(base_size = base_size, 
                     base_family = base_family, 
                     base_line_size = base_line_size, 
                     base_rect_size = base_rect_size) %+replace% 
    ggplot2::theme(#
      # titles: 
      title = ggplot2::element_text(color = col_title, face = "bold",
                                    margin = ggplot2::margin(t = 10, r = 4, b = 4, l = 4, unit = "pt")), 
      plot.subtitle = ggplot2::element_text(color = grey(.10, 1), face = "plain", hjust = 0,
                                            margin = ggplot2::margin(t = 2, r = 4, b = 8, l = 4, unit = "pt")), 
      plot.caption = ggplot2::element_text(color =  grey(.20, 1), face = "plain", size = ggplot2::rel(.80), hjust = 1), 
      # axes:
      axis.line =  ggplot2::element_line(color = "black", size = ggplot2::rel(1)), 
      axis.ticks = ggplot2::element_line(color = "black", size = ggplot2::rel(.90)), 
      axis.title = ggplot2::element_text(color = grey(.10, 1)), 
      axis.text =  ggplot2::element_text(color = grey(.20, 1), size = ggplot2::rel(.90)), 
      # legend: 
      legend.title = ggplot2::element_text(color = pal_grau[[5]]), 
      legend.text = ggplot2::element_text(color = grey(0, 1), size = ggplot2::rel(.90)), 
      legend.background = ggplot2::element_blank(), 
      legend.key = ggplot2::element_blank(), 
      # strip: 
      # strip.background = ggplot2::element_blank(),
      # strip.background = ggplot2::element_rect(fill = pal_seeblau[[1]], color = pal_seeblau[[5]], size = ggplot2::rel(5/3)), 
      # strip.background = ggplot2::element_rect(fill = grey(.90, 1), color = grey(.90, 1), size = ggplot2::rel(6/3)), 
      strip.background = ggplot2::element_rect(fill = "transparent", color = NA, size = ggplot2::rel(1.0)),  # transparent strip 
      strip.text = ggplot2::element_text(color = grey(0, 1), size = ggplot2::rel(1.0), 
                                         margin = ggplot2::margin(t = 5, r = 5, b = 5, l = 5, unit = "pt")), # larger than in theme_unikn() 
      # panel: 
      panel.border = ggplot2::element_blank(), 
      # panel.border = ggplot2::element_rect(fill = "transparent", color = grey(.10, 1), linetype = "solid", size = ggplot2::rel(2/3)), 
      # panel.background = ggplot2::element_blank(), 
      panel.background = ggplot2::element_rect(fill = pal_grau[[1]], color = pal_grau[[1]]), # light "grau" panel background
      # panel.grid = ggplot2::element_blank(), 
      panel.grid.major = ggplot2::element_line(color = grey(1, 1), linetype = "solid", size = ggplot2::rel(.90)), # "white" lines
      panel.grid.minor = ggplot2::element_blank(), 
      # panel.grid.minor = ggplot2::element_line(color = grey(.95, 1), linetype = "solid", size = ggplot2::rel(2/3)), 
      # background:  
      plot.background = ggplot2::element_rect(fill = "transparent", color = NA), 
      complete = TRUE)
  
} # theme_grau().




# theme_licht: A light, but functional theme for ggplot2: ------ 

# - Based on theme_minimal()
# - See <https://www.r-causal.org/#theming> for a similar theme and color options. 

# - Documentation: ---- 

#' A light theme (for ggplot2)
#' 
#' \code{theme_licht} provides an alternative \bold{unikn} theme 
#' to use in \bold{ggplot2} commands. 
#' 
#' \code{theme_licht} is light and no-nonsense, 
#' and based on \code{theme_minimal}. 
#' 
#' This theme works well for dark colors and bright color accents, 
#' but is of limited use with transparent colors. 
#' 
#' @param col_title Color of title (text) elements (optional, numeric).  
#' Default: \code{col_title = grey(.10, 1)} (i.e., dark grey).  
#' Consider using \code{col_title = unikn::pal_seeblau[[4]]}.  
#' 
#' @param base_size Base font size (optional, numeric). 
#' Default: \code{base_size = 12}. 
#' 
#' @param base_family Base font family (optional, character). 
#' Default: \code{base_family = "sans"}. 
#' Options include \code{"mono"}, \code{"sans"} (default), and "serif". 
#' 
#' @param base_line_size Base line size (optional, numeric). 
#' Default: \code{base_line_size = base_size/22}. 
#' 
#' @param base_rect_size Base rectangle size (optional, numeric). 
#' Default: \code{base_rect_size = base_size/22}. 
#' 
#' @examples
#' 
#' \donttest{
#' # Plotting iris dataset (using ggplot2, theme_grau, and unikn colors):
#'   
#' library('ggplot2')  # theme_unikn requires ggplot2 
#'    
#' ggplot(datasets::iris) +
#'   geom_jitter(aes(x = Sepal.Length, y = Sepal.Width, color = Species), size = 3, alpha = 2/3) +
#'   facet_wrap(~Species) +
#'   scale_color_manual(values = usecol(pal = c(Pinky, Seeblau, Seegruen))) +
#'   labs(tag = "C",
#'        title = "Iris sepals",
#'        caption = "Data from datasets::iris") + 
#'   coord_fixed(ratio = 3/2) + 
#'   theme_licht()
#' 
#' }
#' 
#' @family plot functions
#' 
#' @seealso 
#' \code{\link{theme_unikn}} for default theme;  
#' \code{\link{theme_grau}} for a grey theme. 
#' 
#' @import ggplot2 
#'                          
#' @export 

# - Definition: ---- 

theme_licht <- function(col_title = grey(.10, 1), # dark grey, pal_seeblau[[4]] 
                        base_size = 12, 
                        base_family = "sans", 
                        base_line_size = base_size/22, 
                        base_rect_size = base_size/22
) {ggplot2::theme_bw(base_size = base_size, 
                     base_family = base_family, 
                     base_line_size = base_line_size, 
                     base_rect_size = base_rect_size) %+replace% 
    ggplot2::theme(#
      # titles: 
      title = ggplot2::element_text(color = col_title, face = "bold",
                                    margin = ggplot2::margin(t = 10, r = 4, b = 4, l = 4, unit = "pt")), 
      plot.subtitle = ggplot2::element_text(color = grey(.15, 1), face = "plain", hjust = 0,
                                            margin = ggplot2::margin(t = 2, r = 4, b = 8, l = 4, unit = "pt")), 
      plot.caption = ggplot2::element_text(color =  grey(.20, 1), face = "plain", size = ggplot2::rel(.80), hjust = 1), 
      ## axes:
      # axis.line =  ggplot2::element_line(color = "black", size = ggplot2::rel(1)), 
      # axis.ticks = ggplot2::element_line(color = "black", size = ggplot2::rel(.90)), 
      # axis.title = ggplot2::element_text(color = grey(.10, 1)), 
      axis.text =  ggplot2::element_text(color = grey(.10, 1), size = ggplot2::rel(.80)), 
      ## legend: 
      # legend.position = "bottom", 
      # legend.title = ggplot2::element_text(color = pal_grau[[5]]), 
      legend.text = ggplot2::element_text(color = grey(.10, 1), size = ggplot2::rel(.90)), 
      # legend.background = ggplot2::element_blank(), 
      # legend.key = ggplot2::element_blank(), 
      ## strip: 
      # strip.background = ggplot2::element_blank(),
      # strip.background = ggplot2::element_rect(fill = pal_seeblau[[1]], color = pal_seeblau[[5]], size = ggplot2::rel(5/3)), 
      strip.background = ggplot2::element_rect(color = grey(.05, 1), fill = grey(.95, 1), size = ggplot2::rel(.90)), 
      # strip.background = ggplot2::element_rect(fill = "transparent", color = NA, size = ggplot2::rel(1.0)),  # transparent strip 
      # strip.text = ggplot2::element_text(color = grey(0, 1), size = ggplot2::rel(1.0), 
      #                                    margin = ggplot2::margin(t = 5, r = 5, b = 5, l = 5, unit = "pt")), # larger than in theme_unikn() 
      ## panel: 
      # panel.border = ggplot2::element_blank(), 
      # panel.border = ggplot2::element_rect(fill = "transparent", color = grey(.10, 1), linetype = "solid", size = ggplot2::rel(2/3)), 
      # panel.background = ggplot2::element_blank(), 
      # panel.background = ggplot2::element_rect(fill = pal_grau[[1]], color = pal_grau[[1]]), # light "grau" panel background
      # panel.grid = ggplot2::element_blank(), 
      # panel.grid.major = ggplot2::element_line(color = grey(.85, 1), linetype = "solid", size = ggplot2::rel(.50)), # light grey lines
      panel.grid.minor = ggplot2::element_blank(), 
      # panel.grid.minor = ggplot2::element_line(color = grey(.95, 1), linetype = "solid", size = ggplot2::rel(2/3)), 
      # background:  
      # plot.background = ggplot2::element_rect(fill = "transparent", color = NA), 
      complete = TRUE)
  
} # theme_licht().





## ToDo: ------

# - ...

## eof. ----------