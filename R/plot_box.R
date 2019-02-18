## plot_box.R | unikn
## hn  |  uni.kn |  2019 02 18
## ---------------------------

## Plot blue box etc.

## plot_cbox: ---------- 

plot_cbox <- function(x,  y,   # coordinates of box CENTER (x and y)
                      lx, ly,   # lengths of box (width and height)
                      
                      # Text labels:
                      lbl     = NA,       # main label (in middle)
                      lbl_top = NA,       # title (at top)
                      lbl_bot = NA,       # caption (at bottom)
                      
                      # Color options:
                      col_fill = "steelblue3",  # default fill color
                      col_brd = "black",       # default border color
                      col_txt = "white",       # default label color
                      
                      ## Shading options:
                      # density = NULL,  # density of shading lines (per in)
                      # angle = 45,      # angle of shading lines
                      ## Inputs: freq, text and color:
                      # cur_freq = freq,   # current freq
                      # lbl_txt = txt,     # current txt
                      # col_pal = pal,     # current color palette
                      
                      ## Other graphical parameters:
                      # lty = 1,
                      # lwd = 1,
                      # cex = 1,
                      # font = 1
                      ... 
) {
  
  ## (0) Parameters (currently fixed):
  
  # Compute box coordinates:
  x_left <- (x - lx/2)
  x_right <- x_left + lx
  y_bot <- (y - ly/2)
  y_top <- y_bot + ly
  
  # Text position:  
  y_prop <- (2/3) #  - cex/100)  # proportion of text start (on y-axis)
  y_left_dist <- .05  # distance of text from left box border
  
  ## (1) Plot rectangle:
  
  rect(xleft = x_left, ybottom = y_bot, xright = x_right, ytop = y_top,
       col = col_fill,
       border = col_brd,
       # density = density,
       # angle = angle,
       # lty = lty,
       # lwd = lwd
       ...  # etc. 
  )
  
  ## (2) Plot X (in top right corner):
  p1 <- .85
  p2 <- .95
  
  segments(x0 = c(p1, p1), y0 = c(p1, p2), 
           x1 = c(p2, p2), y1 = c(p2, p1),
           col = "white", lty = 1, lwd = 1)
  
  ## (3) Print optional text labels:
  
  if (!is.na(lbl)) {
    
    text(x = y_left_dist, 
         y = y_prop * (y_top - y_bot),
         labels = paste0(lbl),
         pos = 4,    # NULL: center (default), 1: below, 3: above
         # xpd = TRUE,  # NA: plotting clipped to device region; T: figure region; F: plot region
         col = col_txt,
         # cex = cex,
         # font = font
         ... # etc.
    )
    
  }
  
  # if (!is.na(lbl_top)) {
  #   
  #   text(x = x, y = y_top,
  #        labels = paste0(lbl_top),
  #        pos = 3,       # NULL: center (default), 1: below, 3: above
  #        # xpd = TRUE,  # NA: plotting clipped to device region; T: figure region; F: plot region
  #        col = col_txt,
  #        # cex = cex,
  #        # font = font
  #        ... # etc.
  #        )
  #   
  # }
  # 
  # if (!is.na(lbl_bot)) {
  #   
  #   text(x = x, y = y_bot,
  #        labels = paste0(lbl_bot),
  #        pos = 1,       # NULL: center (default), 1: below, 3: above
  #        # xpd = TRUE,  # NA: plotting clipped to device region; T: figure region; F: plot region
  #        col = col_txt,
  #        # cex = cex,
  #        # font = font
  #        ... # etc.
  #        )
  # }
  
}

# ## Check:
# # plot(NULL, xlim = c(0,1), ylim = c(0,1), ylab = "", xlab = "")
# 
# ## Record graphical parameters (par):
# opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
# on.exit(par(opar))
# 
# # Plot area:
# par(mar = c(0, 0, 0, 0) + 0.1)  # margins; default: par("mar") = 5.1 4.1 4.1 2.1.
# par(oma = c(0, 0, 0, 0) + 0.1)  # outer margins; default: par("oma") = 0 0 0 0.
# 
# ## Plot empty canvas:
# plot(0, 0, type = "n", xlim = c(0,1), ylim = c(0,1), 
#      bty = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "")
# 
# # plot.new()
# 
# plot_cbox(.5, .5, 1, 1, # box coordinates and dimension
#          lty = 0,  # no border line
#          lbl = "The first line of text.\nA second and longer line of text.\nThird line of text.", 
#          family = "sans", font = 2, adj = 0, cex = 1.5)
# 
# # Exit:
# par(opar)

## Older code (exploring options): ---- 
# plot_cbox(.5, .5, 1, 1, lwd = 0)  # default color, no text labels
# plot_cbox(.5, .5, 1, 1, col_fill = "blue", density = 15)  # with diagonal lines
# plot_cbox(.5, .5, 1, 1, lbl = "Label", lbl_top = "Title:", lbl_bot = "Caption.")  # add text labels
# 
# plot_cbox(.5, .5, 1, 1, lbl = "Label", lbl_top = "Title:", lbl_bot = "Caption.",
#           cex = .75, font = 2,                                # text options
#           col_fill = "gold", col_brd = "steelblue", lwd = 4)  # color options
# 
# plot_cbox(.5, .5, 1, 1, lbl = "Label", lbl_top = "Title:", lbl_bot = "Caption.",
#           cex = .75, font = 2, col_txt = "forestgreen",   # text options
#           col_fill = "firebrick", col_brd = "firebrick",  # color options
#           lwd = 2, density = 15)                          # line options


## Called by a new function:

## plot_box: ---------- 

plot_box <- function(lbl = "", cex = 2, fill = seeblau) {
  
  ## Record graphical parameters (par):
  opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
  on.exit(par(opar))
  
  # Plot area:
  par(mar = c(0, 0, 0, 0) + 0.1)  # margins; default: par("mar") = 5.1 4.1 4.1 2.1.
  par(oma = c(0, 0, 0, 0) + 0.1)  # outer margins; default: par("oma") = 0 0 0 0.
  
  ## Plot empty canvas:
  plot(0, 0, type = "n", xlim = c(0,1), ylim = c(0,1), 
       bty = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "")
  
  # plot.new()
  
  plot_cbox(.5, .5, 1, 1, # box coordinates and dimension
            lty = 0,  # no border line
            col_fill = as.character(fill), 
            lbl = lbl, 
            family = "sans", font = 2, adj = 0, 
            cex = cex)
  
  # Exit:
  par(opar)
  
}

## Check:
# plot_box(lbl = "This is only a test.")
# plot_box(lbl = "The darkest shade of seeblau.", fill = pal_seeblau[5], cex = 1.6)
# plot_box(lbl = "The first line of text.\nA second and longer line of text.\nThe third line of text.", cex = 1.5)

# plot_box(lbl = "R", cex = 15)  # ToDo: Move text downward (by cex/100)

## +++ here now +++

# plot_box(lbl = "R\nunikn::", cex = 5, fill = pal_seeblau[4]) 


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