## plot_themes.R | unikn
## spds | uni.kn |  2019 06 15
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
#   # message("ggplot2 is loaded.")
#   
# }  

## theme_unikn: Define a new ggplot2 theme: ------ 

# - Documentation: ---- 

#' Basic unikn theme for ggplot2.  
#' 
#' \code{theme_unikn} provides a basic (lightweight and opinionated) 
#' theme to use in ggplot2 commands. 
#' 
#' @param col_title Color of title (text) elements (optional, numeric). 
#' Default: \code{col_title = unikn::pal_seeblau[[4]]}. 
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
#' @family plot functions
#' 
#' @import ggplot2 
#'                          
#' @export 

# - Definition: ---- 

theme_unikn <- function(col_title = unikn::pal_seeblau[[4]],
                        base_size = 11, 
                        base_family = "", 
                        base_line_size = base_size/20, 
                        base_rect_size = base_size/20
) {
  
  ggplot2::theme_bw(base_size = base_size, 
                    base_family = base_family, 
                    base_line_size = base_line_size, 
                    base_rect_size = base_rect_size) %+replace% 
    ggplot2::theme(#
      # title: 
      title = ggplot2::element_text(color = col_title, face = "bold"), 
      # axis: #
      axis.line =  ggplot2::element_line(color = "black", size = ggplot2::rel(1)), 
      axis.ticks = ggplot2::element_line(color = "black"), 
      axis.title = ggplot2::element_text(color = grey(.45, 1)), 
      axis.text =  ggplot2::element_text(color = grey(.45, 1)), 
      # legend: 
      legend.title = ggplot2::element_text(color = "black"), 
      legend.text = ggplot2::element_text(color = "black"), 
      legend.background = ggplot2::element_blank(), legend.key = ggplot2::element_blank(), 
      strip.background = ggplot2::element_rect(fill = "transparent", color = "black", size = ggplot2::rel(2)), 
      strip.text = ggplot2::element_text(color = "black"), 
      # panel: 
      panel.border = ggplot2::element_blank(), 
      # panel.grid = ggplot2::element_blank(), 
      panel.grid.major = ggplot2::element_line(color = grey(.75, 1), linetype = "dashed", size = ggplot2::rel(1/2)), 
      panel.grid.minor = ggplot2::element_line(color = grey(.85, 1), linetype = "dashed", size = ggplot2::rel(1/3)), 
      panel.background = ggplot2::element_blank(), 
      # background:  
      plot.background = ggplot2::element_rect(fill = "transparent", color = NA), 
      complete = TRUE)
}


# +++ here now +++ 

# # Check: 
# ggplot(diamonds, aes(x = x, y = price)) +
#   geom_jitter(alpha = 1/5) +
#   # geom_violin(color = Seeblau, fill = NA) +
#   labs(title = "My fancy plot",
#        x = "Label of x axis", y = "Price/value",
#        caption = "Add caption here.") +
#   theme_unikn(title_col = unikn::pal_seeblau[[4]], base_size = 11)



## ToDo: ------

# - ...

## eof. ----------