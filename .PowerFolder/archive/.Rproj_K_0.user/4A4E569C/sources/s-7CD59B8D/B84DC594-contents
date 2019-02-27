## plot_box.R | unikn
## hn  |  uni.kn |  2019 02 20
## ---------------------------

## Plot blue box etc.


## plot_box: ---------- 

## - Documentation: ---- 

#' \code{plot_box} generates a box with an "X" in its top-right corner 
#' and places 1 or more text strings (of a character vector \code{lbls}) 
#' in the box.
#' 
#' \code{plot_box} uses the base graphics system \code{graphics::}. 
#' 
#' @param lbls A character vector specifying the text label(s)  
#' to be written. If \code{lbls} contains multiple character strings, 
#' each one is placed on a new line. 
#' Default: \code{lbls = NA}. 
#' 
#' @param col_lbl The color(s) of the text label(s).
#' Default: \code{col_lbl = "white"}. 
#' 
#' @param col_bg The color(s) to fill the box with. 
#' Default: \code{col_bg = seeblau}.
#' 
#' @param cex A numeric character expansion factor, which is  
#' multiplied by \code{par("cex")} to yield the final character size. 
#' Default: \code{cex = 2}.
#' 
#' @param font The font to be used. 
#' Default: \code{font = 2} (bold).
#' 
#' @family text functions
#' 
#' @seealso
#' \code{\link{highlight}} to mark text with a colored box  
#' 
#' @examples
#' plot_box(lbls = "A heading appears here.")
#' plot_box(lbls = c("Some title", "The second line is longer", "A third short line"), cex = 2.4)
#' 
#' plot_box(lbls = "The darkest shade of seeblau.", col_bg = pal_seeblau[[5]], cex = 1.5)
#' 
#' # Note: As a vector of character strings for lbls is converted into separate lines of text,
#' #       the following examples yield identical results:
#' plot_box(lbls = c("The 1st line of text.", "A 2nd and longer line of text.", "The 3rd line of text."))
#' plot_box(lbls = "The 1st line of text.\nA 2nd and longer line of text.\nThe 3rd line of text.")
#' 
#' # Box logos:
#' plot_box(lbls = "R", col_bg = pal_seeblau[[5]], cex = 10)
#' plot_box(lbls = c("unikn::"), col_bg = pal_seeblau[[3]], cex = 2.5)
#' 
#'         
#' @import graphics 
#'                          
#' @export 

## - Definition: ----

plot_box <- function(lbls = NA,  # character vector of labels to place (as lines of text)  
                     col_lbl = "white",              # text color
                     col_bg = as.character(seeblau), # box color
                     cex = 2, 
                     font = 2
) {
  
  ## Preamble: ----- 
  
  ## Record graphical parameters (par):
  opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
  on.exit(par(opar)) # restore original settings
  
  ## Plotting area: ----- 
  
  ## Margins (in lines): 
  mar_all <- 0  # all inner
  oma_all <- 0  # all outer
  oma_l   <- 0  # left
    
  par(mar = c(0, 0, 0, 0) + mar_all)  # margins; default: par("mar") = 5.1 4.1 4.1 2.1.
  par(oma = c(0, oma_l, 0, 0) + oma_all)  # outer margins; default: par("oma") = 0 0 0 0.
  # par(omd = c(0, 0, 1, 1))
  
  ## Plot empty canvas:
  # plot(0, 0, type = "n", xlim = c(0,1), ylim = c(0,1), 
  #      bty = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "")
  plot.new()
  
  
  ## WAS: Calling riskyr helper function plot_cbox: -----
  # 
  # plot_cbox(.5, .5, 1, 1, # box coordinates and dimension
  #           lty = 0,  # no border line
  #           col_fill = col_bg, 
  #           lbl = lbl, 
  #           family = "sans", 
  #           font = font, 
  #           adj = 0, 
  #           cex = cur_cex)
  
  ## Plot box: -----
  
  # Draw rectangle:
  x_left <- 0
  y_bot  <- 0
  x_right <- 1
  y_top   <- 1
  
  rect(xleft = x_left, ybottom = y_bot, xright = x_right, ytop = y_top,
       col = col_bg, 
       lty = 0,  # ensure absence of border line (a)
       lwd = NA  # ensure absence of border line (b)
       # border = col_brd,
       # density = density,
       # angle = angle,
       # lwd = lwd
       # ...  # etc. 
  )
  
  ## Mark X (in top right corner): ----- 
  p1 <- .85
  p2 <- .95
  
  segments(x0 = c(p1, p1), y0 = c(p1, p2), 
           x1 = c(p2, p2), y1 = c(p2, p1),
           col = "white", lty = 1, lwd = 1.41)
  
  ## Text labels: -----
  
  # Interpret inputs:
  cur_font <- graphics::par('font')
  cur_cex <- graphics::par('cex') * cex  # character expansion factor to use
  
  # Measure dimensions of text elements:
  char_width <- graphics::strwidth(s = "n", cex = cur_cex, font = font)     # width of "n" 
  # text_height <- graphics::strheight(s = lbls, cex = cur_cex, font = font)  # text height(s)
  # text_width  <- graphics::strwidth(s = lbls, cex = cur_cex, font = font)   # text width(s)
  
  # Combine all lbls into 1:
  all_lbls <- paste(lbls, sep = "", collapse = "\n") # put each label into a new line
  lbls_height <- round(graphics::strheight(s = all_lbls, units = "figure", cex = cur_cex, font = font), 4) # height of all_lbls
  lbls_width <- round(graphics::strwidth(s = all_lbls, units = "figure", cex = cur_cex, font = font), 4)   # width of all_lbls
  
  # print(paste0("all_lbls = '", all_lbls, "', width = ", lbls_width, ", height = ", lbls_height)) # debugging
  
  # Draw text lbls:
  y_up  <- 0  # constant shift upwards in y direction
  lbl_x <- .02
  lbl_y <- ((.50 * .80) + y_up)  # reserve 20% on top (for "X" area)
  
  graphics::text(x = lbl_x, y = lbl_y, labels = all_lbls, 
                 col = col_lbl, cex = cur_cex, font = font, adj = c(.0, .5))
  
  ## Exit: ----- 
  on.exit(par(opar)) # restore original settings
  invisible() # restores par(opar)
  
}

## Check:
# plot_box(lbls = "A heading appears here.")
# plot_box(lbls = c("Some title", "The second line is longer", "A third short line"), cex = 2.4)
# 
# plot_box(lbls = "The darkest shade of seeblau.", col_bg = pal_seeblau[[5]], cex = 1.5)
# 
# # Note: As a vector of character strings for lbls is converted into separate lines of text,
# #       the following examples yield identical results:
# plot_box(lbls = c("The 1st line of text.", "A 2nd and longer line of text.", "The 3rd line of text."))
# plot_box(lbls = "The 1st line of text.\nA 2nd and longer line of text.\nThe 3rd line of text.")
# 
# # Box logos:
# plot_box(lbls = "R", col_bg = pal_seeblau[[3]], cex = 10)
# plot_box(lbls = c("unikn::"), col_bg = pal_seeblau[[3]], cex = 2.5)
# plot_box(lbls = "ToDo", cex = 4, col_bg = unlist(pal_seeblau[5]))

## ToDo: ------

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