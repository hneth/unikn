## plot_text_calls.R | unikn
## hn  |  uni.kn |  2019 03 02
## ---------------------------

# Specialized functions for plotting formatted text (with decorations):
#
# - mark: highlighting text 
# - line: underlining text 
# - post: post-it type xboxes
# - heading: title sequences

# Allow an option for creating a new plot vs. adding to an existing plot.

# [B]: Simpler functions that call plot_text() (with fewer options and sensible defaults): -------- 


# (1) mark: Highlight text on a plot: ------ 

# - Documentation: ---- 

#' \code{mark} plots 1 or more text strings (provided as a character vector \code{lbls}) 
#' to an (existing or new) plot and places a colored box behind
#' each label to mark or highlight it (i.e., make it stand out from the background).
#' 
#' Text formatting parameters (like \code{col}, \code{col_bg}, \code{cex}, \code{font})         
#' are recycled to match \code{length(lbls)}. 
#' 
#' \code{mark} uses the base graphics system \code{graphics::}.  
#' 
#' @param lbls A character vector specifying the text labels 
#' to be written.
#' 
#' @param x A numeric vector of x-coordinates at which the 
#' text labels in \code{lbls} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled.
#' 
#' @param y A numeric vector of y-coordinates at which the 
#' text labels in \code{lbls} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled. 
#' 
#' @param y_layout A numeric value or vector for the vertical 
#' spacing of labels in \code{lbls}. 
#' 2 special values are \code{"even"} and \code{"flush"} 
#' (i.e., \code{y_layout = 0}). 
#' 
#' @param col The color(s) of the text label(s). 
#' Default: \code{col_lbl = "black"}. 
#' 
#' @param col_bg The color(s) to highlight or fill the rectangle(s) with. 
#' Default: \code{col_bg = Seeblau}.  
#' 
#' @param cex A numeric character expansion factor, 
#' multiplied by \code{par("cex")} to yield the character size. 
#' Default: \code{cex = 2}. 
#' 
#' @param font The font to be used. 
#' Default: \code{font = 2} (i.e., bold). 
#' 
#' @param new_plot Should a new plot be generated? 
#' Set to \code{"blank"} or \code{"slide"} to create a new plot. 
#' Default: \code{new_plot = "none"} (i.e., add to existing plot). 
#' 
#' @examples 
#' mark(lbls = "Test text", new_plot = "blank")
#'                         
#' @family text functions
#' 
#' @seealso
#' \code{\link{slide}} and \code{\link{xbox}} to create simple plots (without text).  
#'      
#' @import graphics 
#'                          
#' @export 

# - Definition: ---- 

mark <- function(lbls,               # labels of text element(s) 
                 x = 0, y = .55,     # coordinates of text lbls 
                 y_layout = "even",  # "even", "flush", or numeric value(s) for distance b/w lbls (y-space between subsequent labels)
                 # Colors and text parameters:
                 col = "black", col_bg = Seeblau,  # default color(s)
                 cex = 2, font = 2,                # default text size and font
                 # Others: 
                 new_plot = "none"                 # type of new plot (if desired)
){
  
  ## Pass on (to older box_text function):
  # box_text(x = x, y = y, lbls = lbls, col_lbl = col_lbl, col_bg = col_bg, cex = cex, font = font)
  
  # Pass on (to newer plot_text function):
  plot_text(lbls = lbls, 
            x = x, y = y, y_layout = y_layout,  
            col = col, col_bg = col_bg,
            cex = cex, font = font,
            new_plot = new_plot, 
            # fixed defaults (not available to user): 
            col_bg_border = NA,
            pos = 4,
            mark = TRUE
  )
  
  # Return? 
}

## Check:

# Basics:
# mark(lbls = "Test text", new_plot = "blank")

# ## Example 1: Simple highlights
# plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
# 
# mark(x = 0, y = .9, lbls = "Please note")  # uses existing plot
# mark(x = 0, y = .9, lbls = "Please note", new_plot = "slide")  # starts a new plot
# 
# mark(x = 0, y = c(.6, .5),
#      lbls = c("Highlighting text is simple", "and effective"),
#      cex = 1.5, col_bg = c(pal_seeblau[[2]], pal_seeblau[[1]]))
# 
# mark(lbls = c("It is also flexible", "but to be handled with care"),
#      x = .4, y = .3, y_layout = 0, cex = 1.2,
#      col = c("white", "black"), col_bg = c(pal_seeblau[[5]], "gold"))

# ## Example 2: Messy plot
# n <- 20
# set.seed(1)
# plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20), 
#      axes = FALSE, xlab = "", ylab = "")
# 
# # Only 1 label:
# mark(x = .05, y = .85, lbls = "What a messy plot")
# 
# # 2 labels at once:
# mark(x = c(.35, .55), y = c(.15, .40),
#      lbls = c("Note something here", "More highlighting here"),
#      col_bg = c(pal_seeblau[[2]], pal_peach[[3]]), cex = 1.2)

# # ## Example 3: Create a new plot vs. mark on existing plot:
# lbl_mark <- c("                                                ",
#               "                                      ",
#               "                                                      ",
#               "                                                ",
#               "                              ")
# 
# lbl_mark <- c("Markieren",
#               "ist ein Bestandteil",
#               "von Studieren.")
# 
# # (a) Create a new plot (of type "slide"):
# mark(lbls = lbl_mark,
#      x = 0, y = .85, y_layout = .03,
#      col_bg = Seeblau,
#      cex = 1.5,
#      new_plot = "slide")
# 
# # (b) Add more text to the same plot:
# mark(lbls = lbl_mark,
#      x = 0, y = .45, y_layout = .03,
#      col_bg = pal_pinky[[2]],
#      cex = 1.5)

# (2) line: Underline text on a plot: ------ 

# - Definition: ---- 

line <- function(lbls,               # labels of text element(s) 
                 x = 0, y = .55,     # coordinates of text lbls 
                 y_layout = "even",  # "even", "flush", or numeric value(s) for distance b/w lbls (y-space between subsequent labels)
                 # Colors and text parameters:
                 col = "black", col_bg = Seeblau,  # default color(s)
                 cex = 1.5, font = 1,              # default text size and font
                 # Others: 
                 new_plot = "none"                 # type of new plot (if desired)
){
  
  # Pass on (to newer plot_text function):
  plot_text(lbls = lbls, 
            x = x, y = y, y_layout = y_layout,  
            col = col, col_bg = col_bg,
            cex = cex, font = font,
            new_plot = new_plot, 
            # fixed defaults (not available to user): 
            col_bg_border = NA,
            pos = 4,
            line = TRUE)
  
  # Return? 
}

## Check: 

# lbl_line <- c("Das ist korrekt, wahr und wahnsinnig wichtig.")
# line(lbls = lbl_line,
#      x = 0, y = .90, cex = 1.5, font = 1,
#      new_plot = "blank")
# line(lbls = "(und wird daher unterstrichen)",
#      x = 0, y = .80, cex = 1.5, font = 1)
# 
# slogan <- c("Geradlinig", "Authentisch", "Beweglich", "Offen", "Paradiesisch")
# line(lbls = slogan,
#      x = 0, y = .88, y_layout = "even",
#      col = "black", col_bg = Seeblau,
#      cex = 1.1, font = 2,
#      new_plot = "blank")

# (3) post: Plot a post-it note with text: ------ 

# - Definition: ---- 

post <- function(lbls,               # labels of text element(s) 
                 x = .03, y = .55,   # coordinates of text lbls 
                 y_layout = "even",  # "even", "flush", or numeric value(s) for distance b/w lbls (y-space between subsequent labels)
                 # Colors and text parameters:
                 col = "white", col_bg = Seeblau,  # default color(s)
                 cex = 1.0, font = 1,              # default text size and font
                 # Others: 
                 new_plot = "xbox"                 # type of new plot (if desired)
){
  
  # Pass on (to newer plot_text function):
  plot_text(lbls = lbls, 
            x = x, y = y, y_layout = y_layout,  
            col = col, col_bg = col_bg,
            cex = cex, font = font,
            new_plot = new_plot, 
            # fixed defaults (not available to user): 
            col_bg_border = NA,
            pos = 4
  )
  
  # Return? 
}

## Check:

# post(lbls = "Calling post() with default settings")
# 
# post(lbls = "This is a test",
#      cex = 1.1, font = 2,
#      col_bg = pal_seeblau[[5]])
# 
# post(lbls = c("More text follows here,",
#               "yet another line here,",
#               "and even more here."),
#      y = .4, y_layout = .04,
#      font = 1, new_plot = "none")
# 
# # ## Box with address/contact details:
# address <- c("Dr. B. F. Skinner", " ",
#              "Department of Psychology",
#              "Office F101",
#              "Tel.: +49 7531 88-0815",
#              "Fax: +49 7531 88-0810",
#              "b.f.skin@uni-konstanz.de")
# 
# post(lbls = "Contact",
#      y = .75,
#      cex = 1.2, font = 2,
#      col_bg = Petrol,
#      new_plot = "xbox")
# 
# post(lbls = address,
#      y = .55, y_layout = .03,
#      new_plot = "none")



# (4) heading: Arrange headings (according to title specifications): ------ 

# +++ here now +++ 

# - Definition: ---- 

heading <- function(lbls,               # labels of text element(s) 
                 x = .0, y = .8,     # coordinates of text lbls 
                 y_layout = "flush", # "even", "flush", or numeric value(s) for distance b/w lbls (y-space between subsequent labels)
                 # Colors and text parameters:
                 col = "black", col_bg = "default",  # default color(s)
                 cex = 2.0, font = 2,                # default text size and font
                 # Others: 
                 new_plot = "slide"                  # type of new plot (if desired)
){
  
  N_lbls <- length(lbls)
  
  # Checks (see CDM p. 25):
  if (N_lbls < 2) {
    message("Headlines should contain at least 2 (and ideally 3 or 4) lines.")
  }
  if (N_lbls > 4) {
    message("Headlines should not exceed 4 lines.")
  }
  
  # Defaults for col_bg:
  if (col_bg == "default"){
    
    switch(N_lbls,
           col_bg <- Seeblau,  # 1:
           col_bg <- c(pal_seeblau[[2]], pal_seeblau[[4]]), # 2:
           col_bg <- c(pal_seeblau[[1]], pal_seeblau[[3]], pal_seeblau[[4]]), # 3:
           col_bg <- c(pal_seeblau[[1]], pal_seeblau[[2]], pal_seeblau[[3]], pal_seeblau[[4]]), # 4: 
           col_bg <- c(pal_seeblau[[1]], pal_seeblau[[2]], pal_seeblau[[3]], pal_seeblau[[4]], pal_seeblau[[5]]) # 5: 
    )
  }
  
  # Pass on (to newer plot_text function):
  plot_text(lbls = lbls, 
            x = x, y = y, y_layout = y_layout,  
            col = col, col_bg = col_bg,
            cex = cex, 
            font = font,
            new_plot = new_plot, 
            # fixed defaults (not available to user): 
            mark = TRUE, 
            col_bg_border = NA,
            pos = 4
  )
  
  # Return? 
}

## Check:

# heading(lbls = "Calling heading() with default settings") 
# heading(lbls = c("Dies ist eine Headline", "mit zwei Zeilen"))

# ## (a) Step-wise arrangements:
# 
# hl_1a <- c("Ich bin", "eine", "Headline.")
# heading(lbls = hl_1a)
# 
# hl_1b <- c("Ich", "bin keine", "gute Headline.")
# heading(lbls = hl_1b)  # issues a warning: Avoid step-wise titles...
# 
# hl_1c <- c("Ich bin", "eine alternative", "Headline.")
# heading(lbls = hl_1c)  # no warning
# 
# # ## (b) Number of lines:
# 
# hl_1 <- c("Eine einzeilige Headline.")
# heading(lbls = hl_1)  # 1 line/color + warning
# 
# hl_2 <- c("Eine Headline", "mit zwei Zeilen.")
# heading(lbls = hl_2)  # 2 lines/colors, no warnings
# 
# hl_3 <- c("Ich bin", "eine Headline", "mit drei Zeilen.")
# heading(lbls = hl_3)  # 3 lines/colors, but warning
# 
# hl_3b <- c("Ich bin", "eine andere Headline", "mit drei Zeilen.")
# heading(lbls = hl_3b)  # 3 lines/colors, no warning
# 
# hl_4 <- c("Ich bin", "eine weitere", "Headline", "mit vier Zeilen.")
# heading(lbls = hl_4)  # 4 colors
# 
# hl_5 <- c("Ich bin", "eine weitere", "Headline", "aber umfasse", "ganze fünf Zeilen.")
# heading(lbls = hl_5)  # 4 colors



## Test: Testbed for code snippets (used above) ------

# 1. Is there an open plot? Does already some plot exist? ----- 

# # See 
# dev.list() # for a list of current devices
# dev.cur() # evaluates to 1 if null device (no plot).
# 
# # A solution: 
# if (dev.cur() == 1) {
#   "NO plot exists"  # no graphics device open (null device)
# } else {
#   "A plot exists"
# }  


# 2. Are cex and strwidth functions vectorized? -----  
# plot.new()
# # cex vectors:
# text(x = 0, y = c(.8, .5, .2), labels = c("A", "B", "C"), cex = c(1, 2, 3))
# text(x = 0, y = c(.2, .5, .8), labels = c("A", "B", "C"), cex = c(1, 2, 3))
# 
# # font vectors:
# text(x = .2, y = c(.8, .5, .2), labels = c("A", "B", "C"), font = c(1, 2, 4))
# 
# # cex & font vectors:
# text(x = .4, y = c(.8, .5, .2), labels = c("A", "B", "C"), cex = c(1, 2, 3), font = c(1, 2, 4))
# 
# # strwidth:
# strwidth(s = "x", cex = c(1, 2, 3))  # only returns 1st value
# strwidth(s = "x", cex = c(1))
# strwidth(s = "x", cex = c(2))
# strwidth(s = "x", cex = c(3))
# 
# # To get char width values for multiple cex :
# cex_vals <- c(1, 2, 4)
# key_char <- "l"
# char_width <- strwidth(s = key_char, cex = 1) # get width of "l" for cex = 1 (only)
# char_height <- strheight(s = key_char, cex = 1) # get height of "l" for cex = 1 (only)
# 
# char_widths <- char_width * cex_vals  # multiply (single) width of key_char with (vec of) cex_vals
# char_widths
# 
# char_heights <- char_height * cex_vals  # multiply (single) height of key_char with (vec of) cex_vals
# char_widths





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