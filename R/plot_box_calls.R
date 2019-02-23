## plot_box_calls.R | unikn
## hn  |  uni.kn |  2019 02 23
## ---------------------------

## More functions to plot boxes (e.g., xbox, slides, etc.).

## (B) Simple functions that call plot_box() (with fewer options, but sensible defaults): -------- 

## xbox: Plot a colored box with "x" (a simple version of plot_box): ------ 

# - Documentation: ---- 

#' Plot a box (with x). 
#' 
#' \code{xbox} plots a box with a cross (x) in its top-right corner. 
#' 
#' @param col The color to fill the box with (i.e., its background color).  
#' Default: \code{col = unlist(seeblau)}. 
#' 
#' @param dim The x- and y-dimensions of the box. 
#' Default: \code{dim = c(1, 1)} (i.e., a unit square). 
#' 
#' @family plot functions
#' 
#' @seealso
#' \code{\link{frame}} to plot a frame. 
#' 
#' @examples
#' xbox()  # default box
#'
#' @import graphics 
#'                          
#' @export 

# - Definition: ---- 

xbox <- function(col = unlist(seeblau),
                 dim = c(1, 1)  # dimension: Default: dim = c(1, 1) (i.e., unit square).
                 # ...  # etc. 
) {
  
  # Dimensions:
  if (length(dim) == 1){  # only 1 value provided: 
    dim <- c(dim[1], dim[1])  # use as square
  }
  
  # Call expert function (with sensible defaults):
  plot_box(col = col,
           box_dim = c(0, 0, dim[1], dim[2]),
           mar_all = 0,
           oma_all = 0
           # ...  # etc.
  )
  
} # xbox end. 

## Check:
# xbox()  # default xbox

## Simple variants:
# xbox(col = unlist(seegruen))
# xbox(col = unlist(Bordeaux))
# xbox(dim = c(2, 1)) # 2:1 dimension (twice as wide than high)

## slide: Plot a colored slide frame without "x": (a simple version of plot_box): ------ 

# - Documentation: ---- 

#' Plot a slide (or frame). 
#' 
#' \code{slide} plots an empty slide (or frame) 
#' as a colored rectangle.   
#' 
#' @param col The color to fill the slide with (i.e., its background color).  
#' Default: \code{col = NA} (i.e., system default for transparency). 
#' 
#' @param dim The x- and y-dimensions of the slide. 
#' Default: \code{dim = c(4/3, 1)} (i.e., unit height, 4/3 wider than high). 
#' 
#' @param border The color of the slide's border. 
#' Default: \code{border = grey(.33, 1)}.
#' 
#' @param lwd The line width of the slide's border. 
#' Default: \code{lwd = 1.5}.
#' 
#' @family plot functions
#' 
#' @seealso
#' \code{\link{xbox}} to plot a box. 
#' 
#' @examples
#' slide()  # default slide (or frame)
#'
#' @import graphics 
#'                          
#' @export 

# - Definition: ---- 

slide <- function(col = NA,
                  dim = c(4/3, 1),  # dimension: Default: dim = c(4/3, 1) (i.e., unit height, 4/3 wider than high).
                  border = grey(.33, 1),
                  lwd = 1.5){
  
  # Dimensions:
  if (length(dim) == 1){  # only 1 value provided: 
    dim <- c(dim[1], dim[1])  # use as square
  }
  
  # Call expert function (with sensible defaults):
  plot_box(col = col,
           border = border,
           lty = 1,
           lwd = lwd,
           cross = FALSE,
           mar_all = 0,
           oma_all = 0
           # ...  # etc.
  )
  
} # slide end.

## Check:
# slide()  # default slide

## Simple variants:
# slide(col = unlist(pal_seeblau[[1]]), lwd = 0)  
# slide(dim = c(18:9)) # larger and 2:1 wider than high


# +++ here now +++

## ToDo: 

# Adopt a more modular approach: 
# 1 - Plot a colored box without text (as full expert vs. naive user function).
# 2 - Plot text into an existing box with a dedicated plot_text function.
# 3 - Do NOT combine labels into 1, to allow using a different fonts (and colors) for different character strings:
#     Instead: Use coordinates for 1st line and place subsequent lines based on text heights (of each string).

# plot_box_x_text(lbls = c("Plakativ und sachlich", "Hier steht etwas, das ich mir merken muss."), font = c(2, 1))  # fails to work (as labels are combined into 1)
# plot_box_x_text(lbls = c("Plakativ und sachlich", "Hier steht etwas, das ich mir merken muss."), cex = c(1, 2)) # fails to work (as cex are not applied)

## plot_txt: Plot lines of text (into an existing plot): -------- 




## Test: Testbed for code above: ------ 

# # Aspect ratio of current plot:
# plot_xy <- par("pin")                # use par("pin") OR dev.size("in")
# plot_ratio <- plot_xy[1]/plot_xy[2]  # current aspect ratio
# scale_x <- 1/plot_ratio              # multiplicative correction factor (for x-widths)
# scale_x


## ToDo: ------

## Separate into multiple functions:
## - plot box (plots colored box with top "x")
## - plot txt (plots lines of text)
## - plot_both combines both
## - mark as a reduced version of plot_both

# (1) Functions: 
#   - improve function to show colors (and options for full color info: nr, name, HEX, RGB, hsv)
#   - improve function pal_n to get n (good) colors (and consider integrating it into palettes)
#   - provide color gradient function(s) (to return an arbitrary number of colors)

# (+) Additional elements:
#   - add a function to get a boX in seeblau (or another fill color)
#   - ggplot_addon: provide complete ggplot theme(s)
#   - text elements: heading and underline (with seeblau color defaults)
#   - fonts?
#   - logo: Merken-boX or hexagon in seeblau with letter "R"

## eof. ----------