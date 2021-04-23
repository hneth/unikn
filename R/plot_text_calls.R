## plot_text_calls.R | unikn
## spds | uni.kn |  2021 04 24
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

#' Plot marked (or highlighted) text elements. 
#' 
#' \code{mark} plots 1 or more text strings (provided as a character vector \code{labels}) 
#' to an (existing or new) plot and places a colored box behind
#' each label to mark it (i.e., highlight or make it stand out from the background).
#' 
#' The positions of the text elements in \code{labels} can be specified by 
#' providing their coordinates (as \code{x} and \code{y} arguments) or 
#' by providing an initial position and an \code{y_layout} (see below). 
#' 
#' Text formatting parameters (like \code{col}, \code{col_bg}, \code{cex}, \code{font})         
#' are recycled to match \code{length(labels)}. 
#' 
#' \code{mark} uses the base graphics system \code{graphics::}.  
#' 
#' @param labels A character vector specifying the text labels 
#' to be plotted. 
#' 
#' @param x A numeric vector of x-coordinates at which the 
#' text labels in \code{labels} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled. 
#' Default: \code{x = 0}. 
#' 
#' @param y A numeric vector of y-coordinates at which the 
#' text labels in \code{labels} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled. 
#' Default: \code{y = .55}. 
#' 
#' @param x_layout An optional character label to control the 
#' horizontal positions of labels in \code{labels}. 
#' 3 options are 
#' \code{"center"} (i.e., center at first label or plot center),
#' \code{"left"} (i.e., left at first label or plot center), 
#' \code{"right"} (i.e., right at first label or plot center). 
#' Default: \code{x_layout = NA}.
#' 
#' @param y_layout A numeric value or vector for the vertical 
#' spacing of labels in \code{labels}. 
#' 2 special values are 
#' \code{"even"} (i.e., even distribution of labels across available y-space) and 
#' \code{"flush"} (i.e., no space between adjacent labels, or \code{y_layout = 0}). 
#' Default: \code{y_layout = "even"}. 
#' 
#' @param col The color(s) of the text label(s). 
#' Default: \code{col_lbl = "black"}. 
#' 
#' @param col_bg The color(s) to highlight or fill the rectangle(s) with. 
#' Default: \code{col_bg = Seeblau}. 
#' 
#' @param cex Numeric character expansion factor(s), 
#' multiplied by \code{par("cex")} to yield the character size(s). 
#' Default: \code{cex = 2}. 
#' 
#' @param font The font type(s) to be used. 
#' Default: \code{font = 2} (i.e., bold). 
#' 
#' @param new_plot Should a new plot be generated?   
#' Set to \code{"blank"} or \code{"slide"} to create a new plot. 
#' Default: \code{new_plot = "none"} (i.e., add to an existing plot). 
#' 
#' @examples 
#' # Basics: 
#' mark(labels = "This is a test.", new_plot = "blank")  # create a new blank plot
#' mark(labels = "More testing here...", y = .45, col_bg = pal_pinky[[2]])  # add to plot
#'
#' # Example: 
#' # (a) Mark text on an existing plot:
#' plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
#' mark(x = 0, y = .8, labels = "Mark (on an existing plot)")  # uses existing plot
#' 
#' # (b) Mark text on a new plot:
#' mark(x = 0, y = .8, labels = "Mark (and create a new plot)", 
#'      new_plot = "slide")  # starts a new plot
#' 
#' # (c) More text and decorations:
#' mark(x = 0, y = c(.60, .50), 
#'      labels = c("Highlighting text is simple", "and effective"),
#'      cex = 1.5, col_bg = c(pal_seeblau[[2]], pal_seeblau[[1]]))
#' 
#' mark(labels = c("It is also flexible", "but to be handled with care"),
#'      x = .4, y = .3, y_layout = "flush", cex = 1.2,
#'      col = c("white", "black"), col_bg = c(pal_seeblau[[5]], "gold"))
#'      
#' # Using x_layout and y_layout:
#' mark(labels = c("Ene,", "mene, miste,", "es rappelt", "in der Kiste."), 
#'      cex = 1.4, font = 2, col = "white", col_bg = Petrol,
#'      x = .3, y = .8, x_layout = "center", y_layout = "even", new_plot = "slide")
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

mark <- function(labels,             # labels of text element(s) to plot
                 x = 0, y = .55,     # coordinates of text labels
                 x_layout = NA,      # 3 options: "left", "center", "right"
                 y_layout = "even",  # "even", "flush", or numeric value(s) for distance b/w labels (y-space between subsequent labels)
                 # Colors and text parameters:
                 col = "black", col_bg = Seeblau,  # default color(s)
                 cex = 2, font = 2,                # default text size and font
                 # Others: 
                 new_plot = "none"                 # type of new plot (if desired)
){
  
  ## Robustify:
  if (new_plot == FALSE || tolower(new_plot) == "false" || substr(tolower(new_plot), 1, 2) == "no") {
    new_plot <- "none"
  } 
  
  
  ## Pass on (to older box_text function):
  # box_text(x = x, y = y, labels = labels, col_lbl = col_lbl, col_bg = col_bg, cex = cex, font = font)
  
  # Pass on (to newer plot_text function):
  plot_text(labels = labels, 
            x = x, y = y, 
            x_layout = x_layout, 
            y_layout = y_layout,  
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

# # Basics:
# mark(labels = "Test text", new_plot = "blank")
# 
# # Example 1:
# # (a) Mark text on an existing plot:
# plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
# mark(x = 0, y = .8, labels = "Mark (on an existing plot)")  # uses existing plot
# 
# # (b) Mark text on a new plot:
# mark(x = 0, y = .8, labels = "Mark (and create a new plot)", 
#      new_plot = "slide")  # starts a new plot
# 
# # (c) Adding more text and decorations:
# mark(x = 0, y = c(.60, .50), 
#      labels = c("Highlighting text is simple", "and effective"),
#      cex = 1.5, col_bg = c(pal_seeblau[[2]], pal_seeblau[[1]]))
# 
# mark(labels = c("It is also flexible", "but to be handled with care"),
#      x = .4, y = .3, y_layout = "flush", cex = 1.2,
#      col = c("white", "black"), col_bg = c(pal_seeblau[[5]], "gold"))


# ## Example 2: Messy plot:  
# # A messy background plot: 
# n <- 20
# set.seed(1)
# plot(x = runif(n), y = runif(n), type = "p", pch = 16, cex = 20, col = grey(0, .20),
#      axes = FALSE, xlab = "", ylab = "")
# 
# # add 1 marked label:
# mark(labels = "Some messy plot", x = .05, y = .85)
# 
# # add 2 marked labels at once:
# mark(labels = c("Note something here", "More highlighting here"), 
#      x = c(.35, .55), y = c(.15, .40),
#      col_bg = c(pal_seeblau[[2]], pal_peach[[3]]), cex = 1.2)


# ## Example 3: Create a new plot vs. mark on existing plot:
# lbl_blank <- c("                                                ",
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
# mark(labels = lbl_mark,
#      x = 0, y = .85, y_layout = .03,
#      col_bg = Seeblau,
#      cex = 1.5,
#      new_plot = "slide")
# 
# # (b) Add more text to the same plot:
# mark(labels = lbl_mark,
#      x = 0, y = .45, y_layout = .03,
#      col_bg = pal_pinky[[2]],
#      cex = 1.5)


# (2) uline: Underline text on a plot: ------ 

# - Documentation: ---- 

#' Plot underlined text elements. 
#' 
#' \code{uline} plots 1 or more text strings (provided as a character vector \code{labels}) 
#' to an (existing or new) plot and places a colored line underneath   
#' each label (to underline it). 
#' 
#' The positions of the text elements in \code{labels} can be specified by 
#' providing their coordinates (as \code{x} and \code{y} arguments) or 
#' by providing an initial position and an \code{y_layout} (see below). 
#' 
#' Text formatting parameters (like \code{col}, \code{col_bg}, \code{cex}, \code{font})         
#' are recycled to match \code{length(labels)}. 
#' 
#' \code{uline} uses the base graphics system \code{graphics::}.  
#' 
#' @param labels A character vector specifying the text labels 
#' to be plotted. 
#' 
#' @param x A numeric vector of x-coordinates at which the 
#' text labels in \code{labels} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled. 
#' Default: \code{x = 0}. 
#' 
#' @param y A numeric vector of y-coordinates at which the 
#' text labels in \code{labels} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled. 
#' Default: \code{y = .55}. 
#' 
#' @param x_layout An optional character label to control the 
#' horizontal positions of labels in \code{labels}. 
#' 3 options are 
#' \code{"center"} (i.e., center at first label or plot center),
#' \code{"left"} (i.e., left at first label or plot center), 
#' \code{"right"} (i.e., right at first label or plot center). 
#' Default: \code{x_layout = NA}. 
#' 
#' @param y_layout A numeric value or vector for the vertical 
#' spacing of labels in \code{labels}. 
#' 2 special values are 
#' \code{"even"} (i.e., even distribution of labels across available y-space) and 
#' \code{"flush"} (i.e., no space between adjacent labels, or \code{y_layout = 0}). 
#' Default: \code{y_layout = "even"}. 
#' 
#' @param col The color(s) of the text label(s). 
#' Default: \code{col_lbl = "black"}. 
#' 
#' @param col_bg The color(s) of the line (under the text labels 
#' of \code{labels}). 
#' Default: \code{col_bg = Seeblau}. 
#' 
#' @param cex Numeric character expansion factor(s), 
#' multiplied by \code{par("cex")} to yield the character size(s). 
#' Default: \code{cex = 1.5}. 
#' 
#' @param font The font type(s) to be used. 
#' Default: \code{font = 1} (i.e., plain text). 
#' 
#' @param new_plot Boolean: Should a new plot be generated?   
#' Set to \code{"blank"} or \code{"slide"} to create a new plot. 
#' Default: \code{new_plot = "none"} (i.e., add to an existing plot). 
#' 
#' @examples
#' uline(labels = "This is a test.", new_plot = "blank")  # create a new blank plot
#' uline(labels = "More testing here...", y = .33, col_bg = pal_pinky[[2]])  # add to plot
#'
#' # 2 basic cases: 
#' # (a) Underline text on an existing plot:
#' plot(x = 0, y = 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), xlab = "", ylab = "")
#' uline(x = 0, y = .8, labels = "Underline text (on an existing plot)")  # add to plot
#' 
#' # (b) Underline text on a new plot:
#' uline(x = .02, y = .80, labels = "Underline text (on a new plot)", 
#'      new_plot = "slide")  # create a new plot
#' 
#' # Example:
#' lbl_line <- c("This is neat, true, and terribly important.")
#' uline(labels = lbl_line, new_plot = "blank")  # create a new plot
#' uline(labels = "(which is why we underline it).", y = .40, cex = 1.2)  # add to plot
#'
#' # Using x_layout and y_layout:
#' uline(labels = c("Ene,", "mene, miste,", "es rappelt", "in der Kiste."), 
#'      cex = 1.4, font = 2, col = Grau, col_bg = Pinky,
#'      x = .1, y = .8, x_layout = "left", y_layout = "even", new_plot = "slide")
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

uline <- function(labels,             # labels of text element(s) to plot
                  x = 0, y = .55,     # coordinates of text labels
                  x_layout = NA,      # 3 options: "left", "center", "right"
                  y_layout = "even",  # "even", "flush", or numeric value(s) for distance b/w labels (y-space between subsequent labels)
                  # Colors and text parameters:
                  col = "black", col_bg = Seeblau,  # default color(s)
                  cex = 1.5, font = 1,              # default text size and font
                  # Others: 
                  new_plot = "none"                 # type of new plot (if desired)
){
  
  # Pass on (to newer plot_text function):
  plot_text(labels = labels, 
            x = x, y = y, 
            x_layout = x_layout, 
            y_layout = y_layout,  
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

# # Example 1: 
# lbl_line <- c("This is neat, true, and terribly important.")
# uline(labels = lbl_line, new_plot = "blank")  # create a new plot
# uline(labels = "(which is why we underline it).", y = .40, cex = 1.2)  # add to plot

# lbl_line <- c("Das ist korrekt, wahr und wahnsinnig wichtig.")
# uline(labels = lbl_line, new_plot = "blank")
# uline(labels = "(und wird daher unterstrichen)", y = .30)

# # Example 2: 
# slogan <- c("Geradlinig", "Authentisch", "Beweglich", "Offen", "Paradiesisch")
# uline(labels = slogan,
#      x = 0, y = .85, y_layout = "even",
#      cex = 1.2, font = 2,
#      new_plot = "blank")


# (3) post: Plot a post-it note with text: ------ 

# - Documentation: ---- 

#' Post text (in an xbox). 
#' 
#' \code{post} plots 1 or more text strings (provided as a character vector \code{labels}) 
#' to an (existing or new) \code{\link{xbox}}.
#' 
#' The positions of the text elements in \code{labels} can be specified by 
#' providing their coordinates (as \code{x} and \code{y} arguments) or 
#' by providing an initial position and an \code{y_layout} (see below). 
#' 
#' Text formatting parameters (like \code{col}, \code{col_bg}, \code{cex}, \code{font})         
#' are recycled to match \code{length(labels)}. 
#' 
#' \code{post} uses the base graphics system \code{graphics::}.  
#' 
#' @param labels A character vector specifying the text labels 
#' to be plotted. 
#' 
#' @param x A numeric vector of x-coordinates at which the 
#' text labels in \code{labels} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled. 
#' Default: \code{x = .03}. 
#' 
#' @param y A numeric vector of y-coordinates at which the 
#' text labels in \code{labels} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled. 
#' Default: \code{y = .55}. 
#' 
#' @param x_layout An optional character label to control the 
#' horizontal positions of labels in \code{labels}. 
#' 3 options are 
#' \code{"center"} (i.e., center at first label or plot center),
#' \code{"left"} (i.e., left at first label or plot center), 
#' \code{"right"} (i.e., right at first label or plot center). 
#' Default: \code{x_layout = NA}. 
#' 
#' @param y_layout A numeric value or vector for the vertical 
#' spacing of labels in \code{labels}. 
#' 2 special values are 
#' \code{"even"} (i.e., even distribution of labels across available y-space) and 
#' \code{"flush"} (i.e., no space between adjacent labels, or \code{y_layout = 0}). 
#' Default: \code{y_layout = "even"}. 
#' 
#' @param col The color(s) of the text label(s). 
#' Default: \code{col_lbl = "white"}. 
#' 
#' @param col_bg The background color(s) of the \code{\link{xbox}}. 
#' Default: \code{col_bg = Seeblau}. 
#' 
#' @param cex Numeric character expansion factor(s), 
#' multiplied by \code{par("cex")} to yield the character size(s). 
#' Default: \code{cex = 1.0}. 
#' 
#' @param font The font type(s) to be used. 
#' Default: \code{font = 1} (i.e., plain text). 
#' 
#' @param new_plot Should a new plot be generated?   
#' Set to \code{"xbox"} to plot to a basic \code{\link{xbox}} 
#' (with square dimensions, i.e., \code{dim = c(1, 1)}).  
#' Default: \code{new_plot = "none"} (i.e., assumes a pre-existing \code{\link{xbox}}). 
#' 
#' @examples 
#' post(labels = "Post this line with default settings.", new_plot = "xbox")
#' 
#' # Create a new xbox: 
#' post(labels = "This is a test.", new_plot = "xbox", 
#'      cex = 1.2, font = 2, col_bg = pal_seeblau[[5]])
#' 
#' # Add text to an existing xbox: 
#' post(labels = c("More text follows here,",
#'               "yet another line here,",
#'               "and even more here."), 
#'               y = .4, y_layout = .04, 
#'               new_plot = "none")
#'               
#' # Using x_layout and y_layout:
#' post(labels = c("Ene,", "mene, miste,", "es rappelt", "in der Kiste."), 
#'      cex = 1.4, font = 2, col = "white", col_bg = Pinky, 
#'      x = .8, x_layout = "right", y_layout = "even", new_plot = "xbox")
#'                         
#' @family text functions
#' 
#' @seealso 
#' \code{\link{xbox}} to create a new xbox (without text).  
#'      
#' @import graphics 
#'                          
#' @export 

# - Definition: ---- 

post <- function(labels,             # labels of text element(s) to plot 
                 x = .03, y = .55,   # coordinates of text labels 
                 x_layout = NA,      # 3 options: "left", "center", "right"
                 y_layout = "even",  # "even", "flush", or numeric value(s) for distance b/w labels (y-space between subsequent labels)
                 # Colors and text parameters:
                 col = "white", col_bg = Seeblau,  # default color(s)
                 cex = 1.0, font = 1,              # default text size and font
                 # Others: 
                 new_plot = "none"                 # type of new plot (if desired). Set to "xbox" to create a square box (with dim = c(1, 1)).
){
  
  # Pass on (to newer plot_text function):
  plot_text(labels = labels, 
            x = x, y = y, 
            x_layout = x_layout, 
            y_layout = y_layout,  
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

# post(labels = "Calling post() with default settings", new_plot = "xbox")
# 
# post(labels = "This is a test", new_plot = "xbox", 
#      cex = 1.1, font = 2,
#      col_bg = pal_seeblau[[5]])
# 
# post(labels = c("More text follows here,",
#               "yet another line here,",
#               "and even more here."),
#      y = .4, y_layout = .04,
#      font = 1, new_plot = "none")
# 

# ## Logos:
# ## R: 
# post(labels = "R", col_bg = pal_seeblau[[5]], new_plot = "xbox", 
#      cex = 10, font = 2, y = .33)  # save in size: 250 x 250 pixel

# ## ToDo: 
# post(labels = "ToDo", col_bg = pal_signal[[1]], new_plot = "xbox", 
#      cex = 3.5, font = 2, y = .35)  # save in size: 250 x 250 pixel

# # SPDS: 
# url_spds <- url_unikn("https://www.spds.uni-konstanz.de/")
# post(labels = c("SPDS Wiki", "Social Psychology and Decision Sciences", url_spds), font = c(2, 1, 4), 
#      new_plot = "xbox", cex = c(2, .98, 1), x = .02, y = c(.28, .15), col_bg = pal_seeblau[[4]])
# 
# # tiny versions (135 x 135): 
# post(labels = c("SPDS Wiki"), font = c(2), 
#      new_plot = "xbox", cex = 1.4, x = .07, y = .49, col_bg = pal_seeblau[[4]])


# ## ABC@See (250 x 250): 
# ABC_2019 <- c("ABC Retreat 2019",
#               "Schloss Marbach, Bodensee",
#               "May 29 to June 2, 2019")
# post(labels = ABC_2019,
#      y = .33,  cex = c(1.3, 1.0, 1.0), font = c(2, 1, 1), 
#      col_bg = pal_seeblau[[5]], new_plot = "xbox")
# 
# # tiny versions (135 x 135): 
# post(labels = c("ABC@See", "May 29 \u2013 Jun 2, 2019"), 
#      x = .03, y = c(.30, .12), 
#      cex = c(1.4, .75), font = c(2, 1), col_bg = pal_seeblau[[5]], new_plot = "xbox")
# 
# post(labels = c("ABC@See"),
#      x = .17, y = c(.50),
#      cex = c(1.2), font = c(2, 1), col_bg = pal_seeblau[[5]], new_plot = "xbox")

# ## ds4psy: 
# # in 150 x 150: centered
# post(labels = c("ds4psy"),
#      x = .22, y = c(.48),
#      cex = c(1.5), font = c(2, 1), col_bg = pal_seeblau[[5]], new_plot = "xbox")
# # in 150 x 150: left
# post(labels = c("ds4psy"),
#      x = .05, y = c(.48),
#      cex = c(1.5), font = c(2, 1), col_bg = pal_seeblau[[5]], new_plot = "xbox")

# ## Contact details: Box with name and address:
# address <- c("Dr. B. F. Skinner", " ",
#              "Department of Psychology",
#              "Office F101",
#              "Tel.: +49 7531 88-0815",
#              "Fax: +49 7531 88-0810",
#              "b.f.skin@uni-konstanz.de",
#              "\u2013 uni-konstanz.de")
# 
# post(labels = "Contact",
#      y = .75,
#      cex = 1.2, font = 2,
#      col_bg = Petrol,
#      new_plot = "xbox")
# 
# post(labels = address,
#      y = .55, y_layout = .03,
#      new_plot = "none")

## URLs:
# my_url <- url_unikn("https://www.uni-konstanz.de/")
# post(labels = my_url, y = .1, font = 4, new_plot = "xbox")


# (4) heading: Arrange headings (according to title specifications): ------ 

# - Documentation: ---- 

#' Plot a heading (as marked text elements). 
#' 
#' \code{heading} plots 1 or more text strings (provided as a character vector \code{labels}) 
#' as a heading to an (existing or new) plot and places a colored box behind
#' each label to mark it (i.e., highlighting the heading).
#' 
#' Text formatting parameters (like \code{col}, \code{col_bg}, \code{cex}, \code{font})         
#' are recycled to match \code{length(labels)}. 
#' 
#' \code{heading} uses the base graphics system \code{graphics::}.  
#' 
#' @param labels A character vector specifying the text labels 
#' to be plotted. 
#' 
#' @param x A numeric vector of x-coordinates at which the 
#' text labels in \code{labels} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled. 
#' Default: \code{x = 0}. 
#' 
#' @param y A numeric vector of y-coordinates at which the 
#' text labels in \code{labels} should be written. 
#' If the lengths of \code{x} and \code{y} differ, 
#' the shorter one is recycled. 
#' Default: \code{y = .8}. 
#' 
#' @param x_layout An optional character label to control the 
#' horizontal positions of labels in \code{labels}. 
#' 3 options are 
#' \code{"center"} (i.e., center at first label or plot center),
#' \code{"left"} (i.e., left at first label or plot center), 
#' \code{"right"} (i.e., right at first label or plot center). 
#' Default: \code{x_layout = NA}. 
#' 
#' @param y_layout A numeric value or vector for the vertical 
#' spacing of labels in \code{labels}. 
#' 2 special values are 
#' \code{"even"} (i.e., even distribution of labels across available y-space) and 
#' \code{"flush"} (i.e., no space between adjacent labels, or \code{y_layout = 0}). 
#' Default: \code{y_layout = "flush"}. 
#' 
#' @param col The color(s) of the text label(s). 
#' Default: \code{col_lbl = "black"}. 
#' 
#' @param col_bg The color(s) to highlight or fill the rectangle(s) with. 
#' Default: \code{col_bg = "default"} (to automatically select different 
#' shades of \code{\link{pal_seeblau}}).  
#' 
#' @param cex Numeric character expansion factor(s), 
#' multiplied by \code{par("cex")} to yield the character size(s). 
#' Default: \code{cex = 2}. 
#' 
#' @param font The font type(s) to be used. 
#' Default: \code{font = 2} (i.e., bold). 
#' 
#' @param new_plot Boolean: Should a new plot be generated?   
#' Set to \code{"blank"} or \code{"slide"} to create a new plot, 
#' and to \code{"none"} to add to an existing plot. 
#' Default: \code{new_plot = "slide"} (i.e., create a new \code{\link{slide}}).  
#' 
#' @examples 
#' heading(labels = c("This is a headline", "containing two lines."))
#' 
#' # Note the warning:
#' heading(labels = c("Headlines", "with 3 or more lines", 
#'                  "should not be arranged", "in such a step-wise fashion.")) 
#' 
#' # Avoiding the warning:
#' heading(labels = c("Headlines with", "3 or more lines should", 
#'                    "not be arranged", "in a step-wise fashion."))
#' 
#' # Using non-default colors:
#' heading(labels = c("Ene,", "mene, miste,", "es rappelt", "in der Kiste."), 
#'         cex = 1.6, col = "white", col_bg = usecol(c(Pinky, Seegruen, Bordeaux, Karpfenblau)))
#' 
#' # Using x_layout and y_layout:
#' heading(labels = c("Ene,", "mene, miste,", "es rappelt", "in der Kiste."), 
#'         cex = 1.6, col = "white", col_bg = usecol(pal_pinky[2:5]), 
#'         x = NA, x_layout = "center", y_layout = "even")
#' 
#' #' @family text functions
#' 
#' @seealso 
#' \code{\link{slide}} and \code{\link{xbox}} to create simple plots (without text).  
#'      
#' @import graphics 
#'                          
#' @export 

# - Definition: ---- 

heading <- function(labels,             # labels of text element(s) to plot 
                    x = 0, y = .8,      # coordinates of text labels
                    x_layout = NA,      # 3 options: "left", "center", "right"
                    y_layout = "flush", # "even", "flush", or numeric value(s) for distance b/w labels (y-space between subsequent labels)
                    # Colors and text parameters: 
                    col = "black", col_bg = "default",  # default color(s) 
                    cex = 2.0, font = 2,                # default text size and font
                    # Others: 
                    new_plot = "slide"                  # type of new plot (if desired)
){
  
  N_labels <- length(labels)
  
  # Checks (see CDM p. 25):
  if (N_labels < 2) {
    message("Headlines should contain at least 2 (and ideally 3 or 4) lines.")
  }
  if (N_labels > 4) {
    message("Headlines should not exceed 4 lines.")
  }
  
  # Set defaults for col_bg:
  if ((length(col_bg) == 1) && (is.na(col_bg) || col_bg == "default")){
    
    # (a) better default:
    col_bg <- pal_seeblau[[2]] 
    
    # (b) 5 standard cases:
    switch(N_labels,
           col_bg <- Seeblau,  # 1:
           col_bg <- c(pal_seeblau[[2]], pal_seeblau[[4]]), # 2:
           col_bg <- c(pal_seeblau[[1]], pal_seeblau[[3]], pal_seeblau[[4]]), # 3:
           col_bg <- c(pal_seeblau[[1]], pal_seeblau[[2]], pal_seeblau[[3]], pal_seeblau[[4]]), # 4: 
           col_bg <- c(pal_seeblau[[1]], pal_seeblau[[2]], pal_seeblau[[3]], pal_seeblau[[4]], pal_seeblau[[5]]) # 5:
    )
    
    # (c) More than 5 lines: 
    if (N_labels > 5) { col_bg <- usecol(pal = pal_seeblau, n = N_labels) }  # default colors for N_labels > 5.
    
  } # (col_bg == "default") etc. 
  
  # print(paste0("col_bg = ", col_bg))  # 4debugging
  
  # Pass on (to newer plot_text function):
  plot_text(labels = labels, 
            x = x, y = y, 
            x_layout = x_layout, 
            y_layout = y_layout,  
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

# heading(labels = "A heading with default settings.") 
# heading(labels = c("This is a headline", "containing two lines."))

# ## (a) Step-wise arrangements:
# 
# hl_1a <- c("Ich bin", "eine", "Headline.")
# heading(labels = hl_1a)
# 
# hl_1b <- c("Ich", "bin keine", "gute Headline.")
# heading(labels = hl_1b)  # issues a warning: Avoid step-wise titles...
# 
# hl_1c <- c("Ich bin", "eine alternative", "Headline.")
# heading(labels = hl_1c)  # no warning
# 
# # ## (b) Number of lines:
# 
# hl_1 <- c("Eine einzeilige Headline.")
# heading(labels = hl_1)  # 1 line/color + warning
# 
# hl_2 <- c("Eine Headline", "mit zwei Zeilen.")
# heading(labels = hl_2)  # 2 lines/colors, no warnings
# 
# hl_3 <- c("Ich bin", "eine Headline", "mit drei Zeilen.")
# heading(labels = hl_3)  # 3 lines/colors, but warning
# 
# hl_3b <- c("Ich bin", "eine alternative Headline", "mit drei Zeilen.")
# heading(labels = hl_3b)  # 3 lines/colors, no warning
# 
# hl_4 <- c("Ich bin", "eine weitere", "Headline", "mit vier Zeilen.")
# heading(labels = hl_4)  # 4 lines/colors
# 
# hl_5 <- c("Ich bin", "eine weitere", "Headline", "aber umfasse", "sogar fünf Zeilen.")
# heading(labels = hl_5)  # 5 lines/colors, and warning

# # Non-default colors:
# heading(labels = c("Ene, mene, miste,", "es rappelt", "in der Kiste."), 
#         col = "white", col_bg = usecol(rev(pal_bordeaux)))


## Text sources: ------ 

# Defining CD elements according to specifications publicly provided at https://www.uni-konstanz.de. 
# Sources for text specifications: 
# https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/the-university-of-konstanzs-corporate-design/ 

## Done: ------

# - Clean up code.  [2019-06-04]

## ToDo: ------

# - Consider adding ... argument to simple functions (to provide expert users with additional options).

# (+) Additional elements:
#   - add more slide elements
#   - official fonts?

## eof. ----------