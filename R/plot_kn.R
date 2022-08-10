## plot_kn.R | unikn
## spds | uni.kn |  2021 12 08
## ---------------------------

## Function to plot unikn logo:

plot_kn <- function(axes = FALSE, 
                    back = TRUE, 
                    city = TRUE, 
                    univ = TRUE){
  
  # Parameters: ------
  
  # Booleans (for parts and use of areas/colors): ---- 
  
  # axes <- FALSE # FALSE/TRUE
  grid <- axes    # FALSE/TRUE
  
  use_colors <- FALSE # TRUE  # use colors (for lines)?
  use_areas  <- FALSE # TRUE  # draw rectangles and polygons (for colored areas)?
  
  # back <- TRUE   # draw background lines?
  
  # city  <- TRUE  # wrapper for road/house/cath
  road  <- TRUE # FALSE
  house <- TRUE # FALSE
  cath  <- TRUE # FALSE
  
  # univ <- TRUE  # draw university?
  
  
  # Canvas: ---- 
  
  opar <- par(no.readonly = TRUE)  # all par settings that can be changed.
  on.exit(par(opar))  # par(opar)  # restore original par() settings
  
  
  if (axes) {
    par(mar = c(0, 0, 0, 0) + 2.1)   # min. margins (with axes)
  } else {
    par(mar = c(0, 0, 0, 0) + 4.1)  # symmetrical margins
  }
  
  par("lwd" = 2)
  par("fg" = "black")
  
  
  # Dimensions: ---- 
  
  # xmin <-  0  # (not needed)
  # ymin <-  0  # (not needed)
  xmax <- 48
  ymax <- 48
  
  
  # Colors: ---- 
  
  # (a) Main colors:
  col_line <- "black"  # default line
  # col_line <- grey(0, .33)  # transparent (to show overlaps)
  col_area <- "white"  # default area
  
  # (b) Plot support: 
  col_axes <- grey(.50, 1)
  col_grid <- grey(.75, 1)
  
  # (c) Specific parts:
  if (use_colors){
    
    # line colors: 
    col_back  <- Grau
    col_road  <- Seeblau  
    col_house <- Karpfenblau
    col_cath  <- Petrol
    col_univ  <- Bordeaux
    
    # area colors (only used if use_areas = TRUE and use_colors = TRUE): 
    col_cath_roof <- pal_pinky[[1]]
    col_roof <- pal_pinky[[2]] 
    col_sail <- pal_signal[[2]] # pal_peach[[2]]
    col_flap <- pal_seegruen[[2]]
    
    col_back_pal <- usecol(pal = pal_unikn, alpha = 1)  # color range (11)
    # col_back_pal <- usecol(c(Seeblau, "white", Bordeaux), n = 11, alpha = 1)  # color gradient (11)
    # seecol(col_back_pal)
    
  } else {
    
    # line colors:
    col_back  <- col_line
    col_road  <- col_line  
    col_house <- col_line
    col_cath  <- col_line
    col_univ  <- col_line
    
    # area colors (only used if use_areas = TRUE and use_colors = TRUE): 
    col_cath_roof <- "white"  # use always (to obscure line)    
    col_roof <- NA            # transparent
    col_sail <- NA
    col_flap <- NA
    
    col_back_pal <- rep(NA, 11)  # transparent
    
    
  } # use_colors end. 
  
  
  # Prepare plot: ----- 
  
  xy_max <- max(xmax, ymax)
  
  plot(0:xy_max, 0:xy_max, type = "n",
       xlab = NA, ylab = NA,
       axes = FALSE #, 
       # xlim = c(0, xmax),  ylim = c(0, ymax)
  )
  
  
  # Axes: ---- 
  
  if (axes){
    
    # x_ax_seq <- seq(0, 100, by = 10)
    y_ax_seq <- seq(0,  50, by =  5)
    x_ax_seq <- y_ax_seq  # square 
    
    axis(1, at = x_ax_seq, col = col_axes)
    axis(2, at = y_ax_seq, col = col_axes)
    axis(3, at = x_ax_seq, col = col_axes)
    axis(4, at = y_ax_seq, col = col_axes)
    
  } # axes end. 
  
  
  # Grid: ---- 
  
  if (grid) {
    
    grid(col = col_grid, lwd = 1) # default grid
    
    # plot_grid()  # enhanced grid
    
  } # grid end. 
  
  
  # Draw segments: ---- 
  
  # (1) Shapes (optional polygons, in background): ------ 
  
  if (use_areas){ 
    
    if (back){
      
      rect(xleft = 00/48 * xmax, ybottom = 00/48 * ymax, xright = 48/48 * xmax, ytop = 48/48 * ymax, border = col_back, col = col_back_pal[[7]])  # main background rectangle 
      
      rect(xleft = 00/48 * xmax, ybottom = 00/48 * ymax, xright = 24/48 * xmax, ytop = 24/48 * ymax, border = col_back, col = col_back_pal[[8]])  # bottom left quarter
      rect(xleft = 24/48 * xmax, ybottom = 00/48 * ymax, xright = 48/48 * xmax, ytop = 24/48 * ymax, border = col_back, col = col_back_pal[[9]])  # bottom right quarter
      rect(xleft = 00/48 * xmax, ybottom = 24/48 * ymax, xright = 24/48 * xmax, ytop = 48/48 * ymax, border = col_back, col = col_back_pal[[5]])  # top left quarter
      rect(xleft = 24/48 * xmax, ybottom = 24/48 * ymax, xright = 48/48 * xmax, ytop = 48/48 * ymax, border = col_back, col = col_back_pal[[5]])  # top right quarter
      
      rect(xleft = 24/48 * xmax, ybottom = 36/48 * ymax, xright = 36/48 * xmax, ytop = 48/48 * ymax, border = col_back, col = col_back_pal[[4]])  # 16th: row_1 col_3
      rect(xleft = 36/48 * xmax, ybottom = 36/48 * ymax, xright = 48/48 * xmax, ytop = 48/48 * ymax, border = col_back, col = col_back_pal[[3]])  # 16th: row_1 col_4
      rect(xleft = 00/48 * xmax, ybottom = 12/48 * ymax, xright = 12/48 * xmax, ytop = 24/48 * ymax, border = col_back, col = col_back_pal[[7]])  # 16th: row_3 col_1
      rect(xleft = 12/48 * xmax, ybottom = 12/48 * ymax, xright = 24/48 * xmax, ytop = 24/48 * ymax, border = col_back, col = col_back_pal[[6]])  # 16th: row_3 col_2
      
    }
    
    if (city & house){
      
      polygon(x = c(12, 15, 18)/48 * xmax, y = c(06, 12, 06)/48 * ymax, border = col_house, col = col_roof)  # roof of low house left
      polygon(x = c(18, 21, 24)/48 * xmax, y = c(06, 12, 06)/48 * ymax, border = col_house, col = col_roof)  # roof of low house right
      polygon(x = c(42, 45, 48)/48 * xmax, y = c(12, 18, 12)/48 * ymax, border = col_house, col = col_roof)  # roof of high house
      
    }
    
    if (univ){
      
      polygon(x = c(06, 06, 15)/48 * xmax, y = c(40, 46, 40)/48 * ymax, border = col_univ, col = col_sail)  # large sail  
      polygon(x = c(18, 18, 24)/48 * xmax, y = c(38, 42, 38)/48 * ymax, border = col_univ, col = col_sail)  # small sail
      
      polygon(x = c(06, 09, 12)/48 * xmax, y = c(36, 34, 36)/48 * ymax, border = col_univ, col = col_flap)  # flap left
      polygon(x = c(18, 21, 24)/48 * xmax, y = c(36, 34, 36)/48 * ymax, border = col_univ, col = col_flap)  # flap middle
      polygon(x = c(36, 39, 42)/48 * xmax, y = c(36, 34, 36)/48 * ymax, border = col_univ, col = col_flap)  # flap right
      
    }
    
  } # use_areas end. 
  
  
  # (2) Lines: ------ 
  
  # Background parts: ----- 
  
  if (back){
    
    # background rectangle:
    rect(xleft = 00/48 * xmax, ybottom = 00/48 * ymax, xright = 48/48 * xmax, ytop = 48/48 * ymax, border = col_back)
    
    # main lines:
    segments(x0 = 0 * xmax, y0 = 24/48 * ymax, x1 = xmax, y1 = 24/48 * ymax, col = col_back)  # horizontal middle
    segments(x0 = 0 * xmax, y0 = 36/48 * ymax, x1 = xmax, y1 = 36/48 * ymax, col = col_back)  # horizontal upper quarter
    segments(x0 = 0 * xmax, y0 = 12/48 * ymax, x1 = xmax, y1 = 12/48 * ymax, col = col_back)  # horizontal lower quarter
    segments(x0 = 0 * xmax, y0 = 03/48 * ymax, x1 = xmax, y1 = 03/48 * ymax, col = col_back)  # horizontal above bridge/waves
    
    segments(x0 = 24/48 * xmax, y0 = 0 * ymax, x1 = 24/48 * xmax, y1 = ymax, col = col_back)  # vertical middle
    segments(x0 = 12/48 * xmax, y0 = 0 * ymax, x1 = 12/48 * xmax, y1 = ymax, col = col_back)  # vertical left quarter
    
    # lower half:
    segments(x0 = 18/48 * xmax, y0 = 0 * ymax, x1 = 18/48 * xmax, y1 = 12/48 * ymax, col = col_back)   # vertical between lower roofs 
    segments(x0 = 42/48 * xmax, y0 = 0 * ymax, x1 = 42/48 * xmax, y1 = 36/48 * ymax, col = col_back)   # vertical between cathedral and right roof
    segments(x0 = 42/48 * xmax, y0 = 18/48 * ymax, x1 = 48/48 * xmax, y1 = 18/48 * ymax, col = col_back) # horizontal above high house roof
    
    # upper half: 
    segments(x0 = 36/48 * xmax, y0 = 36/48 * ymax, x1 = 36/48 * xmax, y1 = 48/48 * ymax, col = col_back) # vertical upper right square
    
  } # back end. 
  
  
  # Lower half: ----- 
  
  if (road & city){
    
    # bridge lines:
    segments(x0 = 00/48 * xmax, y0 = 03/48 * ymax, x1 = 24/48 * xmax, y1 = 03/48 * ymax, col = col_road)  # horizontal bridge (redundant)
    segments(x0 = 00/48 * xmax, y0 = 00/48 * ymax, x1 = 00/48 * xmax, y1 = 03/48 * ymax, col = col_road)   # vertical bridge/wave 1 (redundant)
    segments(x0 = 06/48 * xmax, y0 = 00/48 * ymax, x1 = 06/48 * xmax, y1 = 03/48 * ymax, col = col_road)   # vertical bridge/wave 2
    segments(x0 = 12/48 * xmax, y0 = 00/48 * ymax, x1 = 12/48 * xmax, y1 = 03/48 * ymax, col = col_road)   # vertical bridge/wave 3 (redundant)
    segments(x0 = 18/48 * xmax, y0 = 00/48 * ymax, x1 = 18/48 * xmax, y1 = 03/48 * ymax, col = col_road)   # vertical bridge/wave 4 (redundant)
    segments(x0 = 24/48 * xmax, y0 = 00/48 * ymax, x1 = 24/48 * xmax, y1 = 03/48 * ymax, col = col_road)   # vertical bridge/wave 5 (redundant)
    
    # bridge curves/waves:
    x_1 <- c(0, 1.6, 4.4, 6)/48 * xmax
    y_1 <- c(0, 1.9, 1.9, 0)/48 * ymax
    s_1 <- -1    # shape of xspline()
    o_p <- TRUE  # open of xspline()
    
    xspline(x = x_1 + (00/48 * xmax), y = y_1, shape = s_1, open = o_p, border = col_road)  # bridge/wave 1
    xspline(x = x_1 + (06/48 * xmax), y = y_1, shape = s_1, open = o_p, border = col_road)  # bridge/wave 2
    xspline(x = x_1 + (12/48 * xmax), y = y_1, shape = s_1, open = o_p, border = col_road)  # bridge/wave 3
    xspline(x = x_1 + (18/48 * xmax), y = y_1, shape = s_1, open = o_p, border = col_road)  # bridge/wave 4
    
    # grid.circle(x = (03/48 * xmax), y = (10/48 * ymax), r = (02/48 * xmax), gp = gpar(), draw = TRUE)
    
  } # road end. 
  
  
  if (house & city){
    
    # horizontal:
    segments(x0 = 12/48 * xmax, y0 = 06/48 * ymax, x1 = 18/48 * xmax, y1 = 06/48 * ymax, col = col_house)  # low house left top
    segments(x0 = 12/48 * xmax, y0 = 03/48 * ymax, x1 = 18/48 * xmax, y1 = 03/48 * ymax, col = col_house)  # low house left mid (redundant road)
    # segments(x0 = 12/48 * xmax, y0 = 00/48 * ymax, x1 = 18/48 * xmax, y1 = 00/48 * ymax, col = col_house)  # low house left base (redundant back)
    
    segments(x0 = 18/48 * xmax, y0 = 06/48 * ymax, x1 = 24/48 * xmax, y1 = 06/48 * ymax, col = col_house)  # low house right top
    segments(x0 = 18/48 * xmax, y0 = 03/48 * ymax, x1 = 24/48 * xmax, y1 = 03/48 * ymax, col = col_house)  # low house right mid (redundant road) 
    # segments(x0 = 18/48 * xmax, y0 = 00/48 * ymax, x1 = 24/48 * xmax, y1 = 00/48 * ymax, col = col_house)  # low house right base (redundant back)
    
    segments(x0 = 42/48 * xmax, y0 = 12/48 * ymax, x1 = 48/48 * xmax, y1 = 12/48 * ymax, col = col_house)  # high house top
    segments(x0 = 42/48 * xmax, y0 = 06/48 * ymax, x1 = 48/48 * xmax, y1 = 06/48 * ymax, col = col_house)  # high house middle 
    segments(x0 = 42/48 * xmax, y0 = 00/48 * ymax, x1 = 48/48 * xmax, y1 = 00/48 * ymax, col = col_house)  # high house base (redundant back)
    
    # vertical:
    segments(x0 = 12/48 * xmax, y0 = 03/48 * ymax, x1 = 12/48 * xmax, y1 = 06/48 * ymax, col = col_house)  # low house top left    
    segments(x0 = 18/48 * xmax, y0 = 03/48 * ymax, x1 = 18/48 * xmax, y1 = 06/48 * ymax, col = col_house)  # low house top between
    segments(x0 = 24/48 * xmax, y0 = 03/48 * ymax, x1 = 24/48 * xmax, y1 = 06/48 * ymax, col = col_house)  # low house top right    
    
    segments(x0 = 42/48 * xmax, y0 = 0 * ymax, x1 = 42/48 * xmax, y1 = 12/48 * ymax, col = col_house)  # high house left (redundant)
    segments(x0 = 48/48 * xmax, y0 = 0 * ymax, x1 = 48/48 * xmax, y1 = 12/48 * ymax, col = col_house)  # high house right (redundant)
    
    
    # diagonal (roofs):
    segments(x0 = 12/48 * xmax, y0 = 06/48 * ymax, x1 = 15/48 * xmax, y1 = 12/48 * ymax, col = col_house)  # left lower roof
    segments(x0 = 18/48 * xmax, y0 = 06/48 * ymax, x1 = 15/48 * xmax, y1 = 12/48 * ymax, col = col_house)
    # polygon(x = c(12, 15, 18)/48 * xmax, y = c(06, 12, 06)/48 * xmax, border = col_house, col = col_roof)  # left lower roof
    
    segments(x0 = 18/48 * xmax, y0 = 06/48 * ymax, x1 = 21/48 * xmax, y1 = 12/48 * ymax, col = col_house)  # right lower roof
    segments(x0 = 24/48 * xmax, y0 = 06/48 * ymax, x1 = 21/48 * xmax, y1 = 12/48 * ymax, col = col_house)
    # polygon(x = c(18, 21, 24)/48 * xmax, y = c(06, 12, 06)/48 * xmax, border = col_house, col = col_roof)  # right lower roof
    
    segments(x0 = 42/48 * xmax, y0 = 12/48 * ymax, x1 = 45/48 * xmax, y1 = 18/48 * ymax, col = col_house)  # upper roof 
    segments(x0 = 48/48 * xmax, y0 = 12/48 * ymax, x1 = 45/48 * xmax, y1 = 18/48 * ymax, col = col_house)
    # polygon(x = c(42, 45, 48)/48 * xmax, y = c(12, 18, 12)/48 * xmax, border = col_house, col = col_roof)  # upper roof 
    
  } # house end. 
  
  
  # Upper half: ----- 
  
  if (univ){
    
    # vertical: 
    segments(x0 = 00/48 * xmax, y0 = 30/48 * ymax, x1 = 00/48 * xmax, y1 = 48/48 * ymax, col = col_univ)  # left border (redundant)
    
    segments(x0 = 06/48 * xmax, y0 = 30/48 * ymax, x1 = 06/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # left flap left (redundant)
    segments(x0 = 12/48 * xmax, y0 = 30/48 * ymax, x1 = 12/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # left flap right (redundant)
    
    segments(x0 = 18/48 * xmax, y0 = 30/48 * ymax, x1 = 18/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # middle flap left (redundant)
    segments(x0 = 24/48 * xmax, y0 = 30/48 * ymax, x1 = 24/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # middle flap right (redundant)
    
    segments(x0 = 30/48 * xmax, y0 = 30/48 * ymax, x1 = 30/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # to left of Münster tip  
    
    segments(x0 = 36/48 * xmax, y0 = 30/48 * ymax, x1 = 36/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # right flap left 
    segments(x0 = 42/48 * xmax, y0 = 30/48 * ymax, x1 = 42/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # right flap right (redundant) 
    
    segments(x0 = 48/48 * xmax, y0 = 30/48 * ymax, x1 = 48/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # right border (redundant)
    
    segments(x0 = 06/48 * xmax, y0 = 40/48 * ymax, x1 = 06/48 * xmax, y1 = 46/48 * ymax, col = col_univ)  # mast of upper sail 
    segments(x0 = 06/48 * xmax, y0 = 36/48 * ymax, x1 = 06/48 * xmax, y1 = 40/48 * ymax, col = col_univ)  # below mast of upper sail 1 
    # segments(x0 = 06/48 * xmax, y0 = 30/48 * ymax, x1 = 06/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # below mast of upper sail 2
    
    segments(x0 = 18/48 * xmax, y0 = 38/48 * ymax, x1 = 18/48 * xmax, y1 = 42/48 * ymax, col = col_univ)  # mast of lower sail
    segments(x0 = 18/48 * xmax, y0 = 36/48 * ymax, x1 = 18/48 * xmax, y1 = 38/48 * ymax, col = col_univ)  # below mast of lower sail 1
    # segments(x0 = 18/48 * xmax, y0 = 30/48 * ymax, x1 = 18/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # below mast of lower sail 2
    # segments(x0 = 18/48 * xmax, y0 = 24/48 * ymax, x1 = 18/48 * xmax, y1 = 30/48 * ymax, col = col_univ)  # below mast of lower sail 3
    
    segments(x0 = 03/48 * xmax, y0 = 34/48 * ymax, x1 = 03/48 * xmax, y1 = 48/48 * ymax, col = col_univ)  # 1st column right
    segments(x0 = 12/48 * xmax, y0 = 36/48 * ymax, x1 = 12/48 * xmax, y1 = 40/48 * ymax, col = col_univ)  # 3rd column right (redundant)
    segments(x0 = 15/48 * xmax, y0 = 34/48 * ymax, x1 = 15/48 * xmax, y1 = 46/48 * ymax, col = col_univ)  # 4th column right
    
    segments(x0 = 18/48 * xmax, y0 = 24/48 * ymax, x1 = 18/48 * xmax, y1 = 30/48 * ymax, col = col_univ)  # 5th column right (redundant)  
    segments(x0 = 24/48 * xmax, y0 = 24/48 * ymax, x1 = 24/48 * xmax, y1 = 30/48 * ymax, col = col_univ)  # 6th column right (redundant)
    
    segments(x0 = 42/48 * xmax, y0 = 28/48 * ymax, x1 = 42/48 * xmax, y1 = 30/48 * ymax, col = col_univ)  # 10th column left
    segments(x0 = 48/48 * xmax, y0 = 28/48 * ymax, x1 = 48/48 * xmax, y1 = 30/48 * ymax, col = col_univ)  # 10th column right (redundant)  
    
    # horizontal:
    segments(x0 = 00/48 * xmax, y0 = 36/48 * ymax, x1 = xmax, y1 = 36/48 * ymax, col = col_univ)  # uni top (redundant)
    segments(x0 = 00/48 * xmax, y0 = 30/48 * ymax, x1 = xmax, y1 = 30/48 * ymax, col = col_univ)  # uni base (behind(!) Münster roof)
    
    segments(x0 = 06/48 * xmax, y0 = 40/48 * ymax, x1 = 15/48 * xmax, y1 = 40/48 * ymax, col = col_univ)  # base of upper sail
    segments(x0 = 18/48 * xmax, y0 = 38/48 * ymax, x1 = 24/48 * xmax, y1 = 38/48 * ymax, col = col_univ)  # base of lower sail
    
    segments(x0 = 06/48 * xmax, y0 = 32/48 * ymax, x1 = 48/48 * xmax, y1 = 32/48 * ymax, col = col_univ)  # horizontal (behind Münster tip)
    
    segments(x0 = 00/48 * xmax, y0 = 48/48 * ymax, x1 = 03/48 * xmax, y1 = 48/48 * ymax, col = col_univ)  # 1st column 1 (redundant)  
    segments(x0 = 00/48 * xmax, y0 = 46/48 * ymax, x1 = 03/48 * xmax, y1 = 46/48 * ymax, col = col_univ)  # 1st column 2
    segments(x0 = 00/48 * xmax, y0 = 44/48 * ymax, x1 = 03/48 * xmax, y1 = 44/48 * ymax, col = col_univ)  # 1st column 3
    segments(x0 = 00/48 * xmax, y0 = 42/48 * ymax, x1 = 03/48 * xmax, y1 = 42/48 * ymax, col = col_univ)  # 1st column 4
    segments(x0 = 00/48 * xmax, y0 = 40/48 * ymax, x1 = 03/48 * xmax, y1 = 40/48 * ymax, col = col_univ)  # 1st column 5
    segments(x0 = 00/48 * xmax, y0 = 38/48 * ymax, x1 = 03/48 * xmax, y1 = 38/48 * ymax, col = col_univ)  # 1st column 6
    # segments(x0 = 00/48 * xmax, y0 = 36/48 * ymax, x1 = 03/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # 1st column 7 (redundant)
    segments(x0 = 00/48 * xmax, y0 = 34/48 * ymax, x1 = 03/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # 1st column 8
    
    segments(x0 = 03/48 * xmax, y0 = 44/48 * ymax, x1 = 06/48 * xmax, y1 = 44/48 * ymax, col = col_univ)  # 2nd column 1
    segments(x0 = 03/48 * xmax, y0 = 42/48 * ymax, x1 = 06/48 * xmax, y1 = 42/48 * ymax, col = col_univ)  # 2nd column 2
    segments(x0 = 03/48 * xmax, y0 = 40/48 * ymax, x1 = 06/48 * xmax, y1 = 40/48 * ymax, col = col_univ)  # 2nd column 3
    segments(x0 = 03/48 * xmax, y0 = 38/48 * ymax, x1 = 06/48 * xmax, y1 = 38/48 * ymax, col = col_univ)  # 2nd column 4
    # segments(x0 = 03/48 * xmax, y0 = 36/48 * ymax, x1 = 06/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # 2nd column 5 (redundant)
    segments(x0 = 03/48 * xmax, y0 = 34/48 * ymax, x1 = 06/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # 2nd column 6
    
    segments(x0 = 06/48 * xmax, y0 = 46/48 * ymax, x1 = 12/48 * xmax, y1 = 46/48 * ymax, col = col_univ)  # 3rd column 1
    segments(x0 = 09/48 * xmax, y0 = 44/48 * ymax, x1 = 12/48 * xmax, y1 = 44/48 * ymax, col = col_univ)  # 3rd column 2
    
    segments(x0 = 12/48 * xmax, y0 = 46/48 * ymax, x1 = 15/48 * xmax, y1 = 46/48 * ymax, col = col_univ)  # 4th column 1
    segments(x0 = 12/48 * xmax, y0 = 44/48 * ymax, x1 = 15/48 * xmax, y1 = 44/48 * ymax, col = col_univ)  # 4th column 2
    segments(x0 = 12/48 * xmax, y0 = 42/48 * ymax, x1 = 15/48 * xmax, y1 = 42/48 * ymax, col = col_univ)  # 4th column 3
    # segments(x0 = 12/48 * xmax, y0 = 40/48 * ymax, x1 = 15/48 * xmax, y1 = 40/48 * ymax, col = col_univ)  # 4th column 4
    segments(x0 = 12/48 * xmax, y0 = 38/48 * ymax, x1 = 15/48 * xmax, y1 = 38/48 * ymax, col = col_univ)  # 4th column 5
    # segments(x0 = 12/48 * xmax, y0 = 36/48 * ymax, x1 = 15/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # 4th column 6 (redundant)
    segments(x0 = 12/48 * xmax, y0 = 34/48 * ymax, x1 = 15/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # 4th column 7
    
    segments(x0 = 15/48 * xmax, y0 = 38/48 * ymax, x1 = 18/48 * xmax, y1 = 38/48 * ymax, col = col_univ)  # 5th column 1
    # segments(x0 = 15/48 * xmax, y0 = 36/48 * ymax, x1 = 18/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # 5th column 2 (redudant)
    segments(x0 = 15/48 * xmax, y0 = 34/48 * ymax, x1 = 18/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # 5th column 3
    
    # segments(x0 = 18/48 * xmax, y0 = 32/48 * ymax, x1 = 24/48 * xmax, y1 = 32/48 * ymax, col = col_univ)  # 6th column 1 (redundant)
    # segments(x0 = 18/48 * xmax, y0 = 30/48 * ymax, x1 = 24/48 * xmax, y1 = 30/48 * ymax, col = col_univ)  # 6th column 2 (redundant)
    segments(x0 = 18/48 * xmax, y0 = 28/48 * ymax, x1 = 24/48 * xmax, y1 = 28/48 * ymax, col = col_univ)  # 6th column 3
    segments(x0 = 18/48 * xmax, y0 = 26/48 * ymax, x1 = 24/48 * xmax, y1 = 26/48 * ymax, col = col_univ)  # 6th column 4
    segments(x0 = 18/48 * xmax, y0 = 24/48 * ymax, x1 = 24/48 * xmax, y1 = 24/48 * ymax, col = col_univ)  # 6th column 5 (redundant)
    
    # segments(x0 = 24/48 * xmax, y0 = 36/48 * ymax, x1 = 30/48 * xmax, y1 = 36/48 * ymax, col = col_univ)  # 7th column 1 (redundant)  
    segments(x0 = 24/48 * xmax, y0 = 34/48 * ymax, x1 = 30/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # 7th column 2
    # segments(x0 = 24/48 * xmax, y0 = 32/48 * ymax, x1 = 30/48 * xmax, y1 = 32/48 * ymax, col = col_univ)  # 7th column 3 (redundant)
    # segments(x0 = 24/48 * xmax, y0 = 30/48 * ymax, x1 = 30/48 * xmax, y1 = 30/48 * ymax, col = col_univ)  # 7th column 4 (redundant)
    
    segments(x0 = 30/48 * xmax, y0 = 34/48 * ymax, x1 = 36/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # 8th column 1
    
    segments(x0 = 42/48 * xmax, y0 = 34/48 * ymax, x1 = 48/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # 10th column 1
    # segments(x0 = 42/48 * xmax, y0 = 32/48 * ymax, x1 = 48/48 * xmax, y1 = 32/48 * ymax, col = col_univ)  # 10th column 2
    # segments(x0 = 42/48 * xmax, y0 = 30/48 * ymax, x1 = 48/48 * xmax, y1 = 30/48 * ymax, col = col_univ)  # 10th column 3
    segments(x0 = 42/48 * xmax, y0 = 28/48 * ymax, x1 = 48/48 * xmax, y1 = 28/48 * ymax, col = col_univ)  # 10th column 4
    
    
    # diagonal:
    segments(x0 = 06/48 * xmax, y0 = 46/48 * ymax, x1 = 15/48 * xmax, y1 = 40/48 * ymax, col = col_univ)  # upper sail roof 
    # polygon(x = c(06, 06, 15)/48 * xmax, y = c(40, 46, 40)/48 * xmax, border = col_univ, col = col_sail)  # upper sail area 
    
    segments(x0 = 18/48 * xmax, y0 = 42/48 * ymax, x1 = 24/48 * xmax, y1 = 38/48 * ymax, col = col_univ)  # lower sail roof  
    # polygon(x = c(18, 18, 24)/48 * xmax, y = c(38, 42, 38)/48 * xmax, border = col_univ, col = col_sail)  # lower sail area 
    
    segments(x0 = 06/48 * xmax, y0 = 36/48 * ymax, x1 = 09/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # left flap left
    segments(x0 = 12/48 * xmax, y0 = 36/48 * ymax, x1 = 09/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # left flap right
    # polygon(x = c(06, 09, 12)/48 * xmax, y = c(36, 34, 36)/48 * ymax, border = col_univ, col = col_flap)  # left flap
    
    segments(x0 = 18/48 * xmax, y0 = 36/48 * ymax, x1 = 21/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # left flap left
    segments(x0 = 24/48 * xmax, y0 = 36/48 * ymax, x1 = 21/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # left flap right
    # polygon(x = c(18, 21, 24)/48 * xmax, y = c(36, 34, 36)/48 * ymax, border = col_univ, col = col_flap)  # mid flap
    
    segments(x0 = 36/48 * xmax, y0 = 36/48 * ymax, x1 = 39/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # left flap left
    segments(x0 = 42/48 * xmax, y0 = 36/48 * ymax, x1 = 39/48 * xmax, y1 = 34/48 * ymax, col = col_univ)  # left flap right
    # polygon(x = c(36, 39, 42)/48 * xmax, y = c(36, 34, 36)/48 * ymax, border = col_univ, col = col_flap)  # right flap
    
    
  } # univ end. 
  
  
  # Cathedral (Münster): ---- 
  
  if (cath & city){
    
    # col_cath <- Petrol
    
    polygon(x = c(30, 33, 36)/48 * xmax, y = c(24, 32, 24)/48 * ymax, border = col_cath, col = col_cath_roof)  # cathedral tower roof (to cover horizonal line)
    
    segments(x0 = 33/48 * xmax, y0 = 32/48 * ymax, x1 = 33/48 * xmax, y1 = 34/48 * ymax, col = col_cath)  # roof tip
    segments(x0 = 30/48 * xmax, y0 = 24/48 * ymax, x1 = 33/48 * xmax, y1 = 32/48 * ymax, col = col_cath)  # roof border left (redundant polygon)
    segments(x0 = 32/48 * xmax, y0 = 24/48 * ymax, x1 = 33/48 * xmax, y1 = 32/48 * ymax, col = col_cath)  # roof line left
    segments(x0 = 34/48 * xmax, y0 = 24/48 * ymax, x1 = 33/48 * xmax, y1 = 32/48 * ymax, col = col_cath)  # roof line right
    segments(x0 = 36/48 * xmax, y0 = 24/48 * ymax, x1 = 33/48 * xmax, y1 = 32/48 * ymax, col = col_cath)  # roof border right (redundant polygon)
    
    segments(x0 = 24/48 * xmax, y0 = 00/48 * ymax, x1 = 24/48 * xmax, y1 = 20/48 * ymax, col = col_cath)  # left wing border (redundant back)
    segments(x0 = 26/48 * xmax, y0 = 03/48 * ymax, x1 = 26/48 * xmax, y1 = 20/48 * ymax, col = col_cath)  # left wing left
    segments(x0 = 28/48 * xmax, y0 = 03/48 * ymax, x1 = 28/48 * xmax, y1 = 20/48 * ymax, col = col_cath)  # left wing right
    
    segments(x0 = 30/48 * xmax, y0 = 00/48 * ymax, x1 = 30/48 * xmax, y1 = 26/48 * ymax, col = col_cath)      # tower border left
    segments(x0 = 32/48 * xmax, y0 = 03/48 * ymax, x1 = 32/48 * xmax, y1 = 24/48 * ymax, col = col_cath)  # mid. wing left
    segments(x0 = 34/48 * xmax, y0 = 03/48 * ymax, x1 = 34/48 * xmax, y1 = 24/48 * ymax, col = col_cath)  # mid. wing right
    segments(x0 = 36/48 * xmax, y0 = 00/48 * ymax, x1 = 36/48 * xmax, y1 = 26/48 * ymax, col = col_cath)      # tower border right
    
    segments(x0 = 38/48 * xmax, y0 = 03/48 * ymax, x1 = 38/48 * xmax, y1 = 20/48 * ymax, col = col_cath)  # right wing left 
    segments(x0 = 40/48 * xmax, y0 = 03/48 * ymax, x1 = 40/48 * xmax, y1 = 20/48 * ymax, col = col_cath)  # right wing right
    segments(x0 = 42/48 * xmax, y0 = 00/48 * ymax, x1 = 42/48 * xmax, y1 = 20/48 * ymax, col = col_cath)  # right wing border (redundant back)
    
    segments(x0 = 24/48 * xmax, y0 = 18/48 * ymax, x1 = 42/48 * xmax, y1 = 18/48 * ymax, col = col_cath)  # horizonal 1 top
    segments(x0 = 24/48 * xmax, y0 = 15/48 * ymax, x1 = 42/48 * xmax, y1 = 15/48 * ymax, col = col_cath)  # horizonal 2
    segments(x0 = 24/48 * xmax, y0 = 12/48 * ymax, x1 = 42/48 * xmax, y1 = 12/48 * ymax, col = col_cath)  # horizonal 3 (redundant back)
    segments(x0 = 24/48 * xmax, y0 = 06/48 * ymax, x1 = 42/48 * xmax, y1 = 06/48 * ymax, col = col_cath)  # horizonal 4
    segments(x0 = 24/48 * xmax, y0 = 03/48 * ymax, x1 = 42/48 * xmax, y1 = 03/48 * ymax, col = col_cath)  # horizonal 5 (level of road)
    segments(x0 = 24/48 * xmax, y0 = 00/48 * ymax, x1 = 42/48 * xmax, y1 = 00/48 * ymax, col = col_cath)  # horizonal 6 (redundant back)
    
    segments(x0 = 27/48 * xmax, y0 = 07/48 * ymax, x1 = 27/48 * xmax, y1 = 13/48 * ymax, col = col_cath)  # window left
    segments(x0 = 33/48 * xmax, y0 = 07/48 * ymax, x1 = 33/48 * xmax, y1 = 13/48 * ymax, col = col_cath)  # window mid.
    segments(x0 = 39/48 * xmax, y0 = 07/48 * ymax, x1 = 39/48 * xmax, y1 = 13/48 * ymax, col = col_cath)  # window right
    
  } # cath end. 
  
  # restore original par() settings: ---- 
  # par(opar)
  
  # return what?
  
} # plot_kn().


## Check: ----- 

# plot_kn()  # default
# 
# plot_kn(axes = TRUE)
# 
# plot_kn(back = TRUE,  city = FALSE, univ = FALSE)
# plot_kn(back = FALSE, city = TRUE,  univ = FALSE)
# plot_kn(back = FALSE, city = FALSE, univ = TRUE)


## ToDo: ------

# - fix curves of bridge/waves
# - add option to enforce 1:1 aspect ratio (by scaling to current canvas dimensions)
# - add coordinates to function?

## eof. ----------
