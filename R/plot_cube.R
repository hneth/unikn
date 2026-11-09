## plot_cube.R | unikn
## spds | uni.kn | 2026 11 09
## --------------------------

## Plot R colors as points in a 3D RGB color cube.

## Goal: Visualize one or more colors as points in a 3D-cube 
##       whose axes correspond to the R, G, and B values 
##       of the RGB color model (ranging from 0 to 255).

## Uses base graphics (persp + trans3d), so that no additional
## package dependencies are required (as in riskyr::plot_plane).

# plot_cube: Documentation ------

#' Plot colors as points in a 3D RGB color cube
#'
#' \code{plot_cube} plots one or more colors \code{x}
#' as points in a 3-dimensional cube whose axes correspond
#' to the red, green, and blue values of the RGB color model
#' (ranging from 0 to 255).
#'
#' Each color is converted into its RGB coordinates
#' (via \code{\link{col2rgb}}) and shown as a point
#' at the corresponding location in the color cube.
#' Points are filled with the color they represent, so that
#' the location of a point in the cube illustrates the
#' additive composition of its color from the three
#' primary colors (Red, Green, and Blue).
#'
#' \code{plot_cube} uses base graphics
#' (i.e., \code{\link{persp}} and \code{\link{trans3d}})
#' and requires no additional package dependencies.
#'
#' @param x A (character) vector of colors to be plotted,
#' specified as R color names (e.g., \code{"deepskyblue"}),
#' HEX values (e.g., \code{"#59C7EBFF"}), or any mixture thereof.
#' Color palettes (e.g., \code{pal_unikn}) are also accepted.
#'
#' @param type Type of geometric element to draw from the colors \code{x}:
#'   \itemize{
#'   \item \code{"p"}: Plot colors as \strong{points} (default);
#'   \item \code{"l"}: Connect colors by \strong{lines} (a path through RGB space);
#'   \item \code{"b"}: Draw \strong{both} points and lines;
#'   \item \code{"plane"}: Span a \strong{plane} (filled polygon) through the colors
#'   (requires 3 or more colors; 3 colors yield a triangle).
#'   }
#' By default, connecting lines and plane fills are shown as color \emph{gradients}
#' (i.e., each location is shown in the color of the corresponding RGB mixture),
#' to illustrate the additive mixing of colors in RGB space.
#' In all cases, only the colors \code{x} \emph{provided} (i.e., the points that
#' define the line or plane) are labeled by default (see \code{labels}).
#' Default: \code{type = "p"}.
#'
#' @param col_points Color(s) used for the plotted points.
#' Default: \code{col_points = NA} uses each point's own color
#' (i.e., every color in \code{x} is plotted in that color).
#' Providing a color (or color vector) overrides this,
#' so that all points are shown in the specified color(s).
#'
#' @param cex_points Scaling factor for the size of points.
#' Default: \code{cex_points = 2}.
#'
#' @param pch Plotting symbol for points (see \code{\link{points}}).
#' Default: \code{pch = 21} (a fillable circle).
#'
#' @param col_brd Border color of points
#' (only used for fillable symbols, i.e., \code{pch} in \code{21:25}).
#' Default: \code{col_brd = grey(.20, 1)} (dark grey).
#'
#' @param ref_lines Boolean: Draw a vertical reference line
#' from each point down to the base (R-by-G) plane of the cube
#' (to ease judging a point's height on the B/blue axis)?
#' Default: \code{ref_lines = TRUE}.
#'
#' @param col_line Color of connecting lines (for \code{type = "l"} or \code{"b"})
#' and of the plane outline (for \code{type = "plane"}).
#' Default: \code{col_line = NA} (i.e., show lines as a color gradient
#' of the mixtures between consecutive colors).
#'
#' @param lwd_line Line width of connecting lines
#' (for \code{type = "l"} or \code{"b"}) and of plane outlines
#' (for \code{type = "plane"}). Raise this value for thicker, more visible lines.
#' Default: \code{lwd_line = 3}.
#'
#' @param line_connect How to connect 3 or more colors by lines
#' (for \code{type = "l"} or \code{"b"}):
#'   \itemize{
#'   \item \code{"all"}: Connect \emph{all pairs} of colors
#'   (i.e., \code{n * (n - 1) / 2} lines, a complete graph);
#'   \item \code{"pairs"}: Connect only \emph{disjoint consecutive pairs}
#'   of colors, i.e., (1st, 2nd), (3rd, 4th), etc.
#'   (yielding \code{floor(n / 2)} lines; if \code{n} is odd, the final
#'   color remains unpaired, but is still shown as a point);
#'   \item \code{"path"}: Connect only \emph{consecutive} colors
#'   (i.e., \code{n - 1} lines, tracing the palette in its given order).
#'   }
#' For 2 colors, all 3 options yield the same single line.
#' (The value \code{"pairwise"} is accepted as an alias for \code{"all"}.)
#' Default: \code{line_connect = "all"}.
#'
#' @param col_fill Fill color for the plane (for \code{type = "plane"}).
#' Default: \code{col_fill = NA} (i.e., fill the plane with a color gradient
#' showing the gamut of all mixtures of the defining colors).
#'
#' @param fill_alpha Opacity of the plane fill (in range \code{[0, 1]}).
#' Default: \code{fill_alpha = .80}.
#'
#' @param fill_res Resolution of color gradients
#' (i.e., the number of line segments per connection, and the
#' granularity of the plane tessellation).
#' Higher values yield smoother gradients (but slower plotting).
#' Default: \code{fill_res = 20}.
#'
#' @param shadows Project each point onto one or more faces of the cube
#' (as "shadow" points, to aid judging its 3D location). Options
#' (one or more of which may be combined) are:
#'   \itemize{
#'   \item \code{"floor"}: project onto the R-by-G plane (i.e., set B = 0);
#'   \item \code{"back"}: project onto the R-by-B plane (i.e., set G = 0);
#'   \item \code{"side"}: project onto the G-by-B plane (i.e., set R = 0);
#'   \item \code{"all"}: project onto all 3 faces;
#'   \item \code{"none"}: show no shadows.
#'   }
#' Each shadow is a smaller marker on the corresponding face, linked to
#' its point by a dotted connector. As a projection drops one color channel,
#' a shadow also shows the color with that primary removed.
#' Default: \code{shadows = "none"}.
#'
#' @param col_shadow Color of the shadow markers.
#' Default: \code{col_shadow = grey(.70, .9)} (a neutral grey).
#'
#' Setting \code{col_shadow = NA} shows each shadow in its own
#' \emph{projected} color. Projecting a point onto a face sets the
#' one color channel perpendicular to that face (i.e., the RGB axis
#' \emph{not} spanned by the face's plane) to zero:
#' a \code{"floor"} shadow sets \code{B = 0},
#' a \code{"back"} shadow sets \code{G = 0}, and
#' a \code{"side"} shadow sets \code{R = 0} (see \code{shadows}).
#' As one channel is dropped, a projected shadow color thus
#' \emph{systematically differs} from its source color:
#' e.g., \code{"violet"} (238, 130, 238) casts an
#' orange (238, 130, 0) floor shadow, a
#' magenta (238, 0, 238) back shadow, and a
#' blue (0, 130, 238) side shadow.
#'
#' @param show_cube Boolean: Mark the 8 corners of the cube
#' by points in their corresponding colors
#' (i.e., black, white, and the 6 primary/secondary colors)?
#' Default: \code{show_cube = TRUE}.
#'
#' @param axis_labels Titles for the 3 cube axes (R, G, and B). Options are:
#'   \itemize{
#'   \item a character vector of length\ 3: use these as axis titles;
#'   \item \code{"short"} (or \code{"rgb"}): use \code{c("R", "G", "B")} (default);
#'   \item \code{"long"}: use \code{c("Red", "Green", "Blue")};
#'   \item \code{NA} (or \code{"no"}): show no axis titles.
#'   }
#' Default: \code{axis_labels = c("R", "G", "B")}.
#'
#' @param axis_ticks Draw tick marks and numeric value labels (in range 0 to 255)
#' along the 3 cube axes? Either a Boolean value, or a numeric vector
#' specifying custom tick positions (in \code{0:255}).
#' Default: \code{axis_ticks = TRUE}.
#'
#' @param n_ticks Number of (equally spaced) ticks per axis
#' (only used when \code{axis_ticks = TRUE}).
#' Default: \code{n_ticks = 6} (i.e., ticks at 0, 51, 102, 153, 204, 255).
#'
#' @param cex_axis Scaling factor for axis titles and tick values.
#' Default: \code{cex_axis = NA} (i.e., use \code{cex_lbl}).
#'
#' @param labels Type(s) of labels for the points.
#' One or more of the following label types may be specified
#' (and are shown on separate lines when combined):
#'   \itemize{
#'   \item \code{"names"}: show the names of \code{x}
#'   (or the color values, if no names are available);
#'   \item \code{"rgb"}: show each point's RGB triplet (as \code{(R, G, B)});
#'   \item \code{"hex"}: show each point's HEX value (e.g., \code{"#59C7EB"}).
#'   }
#' Thus, \code{labels = c("names", "rgb", "hex")} shows all 3 representations
#' of each color in the same cube.
#' Setting \code{labels = NA} (or \code{"no"}) shows no labels, and passing
#' a character vector (of custom labels) shows these labels instead.
#' Default: \code{labels = "names"}.
#'
#' @param theta Horizontal rotation angle (azimuth, used by \code{\link{persp}}).
#' Default: \code{theta = -30}.
#'
#' @param phi Vertical rotation angle (colatitude, used by \code{\link{persp}}).
#' Default: \code{phi = 15}.
#'
#' @param main Main plot title.
#' Default: \code{main = "Colors in 3D RGB space"}.
#'
#' @param cex_lbl Scaling factor for text labels (axes, titles, point labels).
#' Default: \code{cex_lbl = .85}.
#'
#' @param col_cube Color for the edges and axes of the cube.
#' Default: \code{col_cube = grey(.50, 1)}.
#'
#' @param ... Other (graphical) parameters passed to \code{\link{persp}}
#' (e.g., \code{d}, \code{expand}, \code{shade}).
#'
#' @return A projection matrix (of class returned by \code{\link{persp}})
#' that maps 3D coordinates to the 2D plotting plane (returned invisibly).
#'
#' @examples
#' # A. Basics: ------ 
#' plot_cube("tomato")                        # a single color
#' plot_cube(c("red", "green", "blue"))       # the 3 primary RGB colors
#' plot_cube(c("black", "grey50", "white"))   # the grey diagonal
#'
#' # Using unikn colors:
#' plot_cube(pal_unikn)       # a bi-polar color palette
#' plot_cube(pal_unikn_pref)  # a categorical color palette
#'
#' # Plotting all points in one color (rather than their own):
#' plot_cube(pal_unikn, col_points = "black")
#'
#' # Labeling points (by names, RGB or HEX values, or combinations):
#' col_4 <- c("red3", "green4", "gold", "violet")
#' plot_cube(col_4)                                     # names (default)
#' plot_cube(col_4, labels = "hex")                     # HEX values
#' plot_cube(col_4, labels = "rgb")                     # RGB values
#' plot_cube(col_4, labels = c("names", "hex", "rgb"))  # all 3 types
#' plot_cube(col_4, labels = "no")                      # no labels
#'
#' # Connecting points by lines (type = "l" or "b"):
#' plot_cube(c("grey", "white"), type = "l")          # line (grey diagonal)
#' plot_cube(c("red", "blue"), type = "b")            # line with points (red-blue gradient)
#'
#' # Changing the viewing angle:
#' plot_cube(pal_unikn, theta = 30, phi = 25)
#'
#' # With >2 colors: all pairs (default), disjoint pairs, or a connecting path:
#' col_3 <- c("grey10", "orange", "steelblue")
#' plot_cube(col_3, type = "l")                             # all pairs
#' plot_cube(col_3, type = "b", lwd_line = 5)               # all pairs + points
#' plot_cube(pal_unikn, type = "b", line_connect = "path")  # path (palette order)
#'
#' # Using line_connect = "pairs" to link disjoint color pairs, e.g., to show
#' # the 3 complementary RGB/CMY pairs (each line crosses the grey cube center):
#' plot_cube(c("red", "cyan", "green", "magenta", "blue", "yellow"), type = "b", 
#'           line_connect = "pairs", lwd_line = 4, main = "Complementary RGB/CMY pairs")
#'
#' # Spanning a plane through 3 colors (type = "plane"):
#' plot_cube(c("red", "green", "blue"), type = "plane")  # gamut of 3 primary RGB colors
#' plot_cube(c("cyan", "yellow", "magenta"),             # gamut of 3 opposite RGB colors
#'              type = "plane", labels = c("names", "rgb"))          
#'
#' # Shadow points (projections onto cube faces):
#' plot_cube(c("tomato", "deepskyblue"), shadows = "floor")  # on the floor (B = 0)
#' plot_cube(pal_seeblau, shadows = "all")                   # on all 3 faces
#' plot_cube(c("grey20", "grey50", "grey80"),                # show shadows in projected colors
#'           shadows = "all", col_shadow = NA) 
#'           
#' # Axis options (titles and value ticks):
#' plot_cube(pal_unikn, axis_labels = "long")           # long axis titles
#' plot_cube(pal_unikn, n_ticks = 11)                   # finer axis scale (0, 25.5, ...)
#' plot_cube(pal_unikn, axis_ticks = c(0, 128, 255))    # custom tick positions
#' plot_cube(pal_unikn, axis_ticks = FALSE)             # no ticks (titles only)
#' plot_cube(pal_unikn, axis_labels = "no", axis_ticks = FALSE)  # bare cube
#'
#'
#' # B. Basic demonstrations of the RGB/CYK color cube: ------
#'
#' # 1. The 8 color corners of the RGB cube (b/w + RGB + CMY):
#' col_8 <- c("black", "white", "red", "cyan", "blue", "yellow", "green", "magenta")
#' plot_cube(col_8, theta = -30, phi = 30, labels = c("names", "rgb", "hex"),
#'           main = "The 6 corners of the RGB cube")
#'
#' # 2. The main black-grey-white diagonal of the cube (with all shades of grey):
#' plot_cube(c("black", "white"), type = "l", lwd_line = 5, 
#'           main = "Main b/w-diagonal (with all shades of grey)")
#' greys <- paste("grey", seq(0, 100, length.out = 5))  # 5 shades of grey (white to black)
#' plot_cube(greys, type = "b", line_connect = "path", 
#'           lwd_line = 5, labels = c("names", "hex", "rgb"),
#'           theta = -30, phi = 30, 
#'           main = "5 shades of grey (on b/w diagonal)")
#'
#' # 3. Complementarity of the RGB and CMY color systems:
#' #    Each CMY secondary (cyan, magenta, yellow) is the complement of an RGB
#' #    primary (red, green, blue): it occupies the opposite corner of the cube,
#' #    and a color and its complement mix to grey (at the cube's center).
#' 
#' # Show 6 color corners (RGB vs. CMY):
#' col_6 <- c("red", "cyan", "blue", "yellow", "green", "magenta")
#' plot_cube(col_6, labels = c("names", "rgb"),
#'           main = "RGB vs CMY: 6 complementary corners of the cube")
#'           
#' # Show all 4 cube diagonals:
#' plot_cube(col_8, type = "b", line_connect = "pairs", lwd_line = 4,
#'           main = "The 4 main diagonals")
#'             
#' # Show 2 triangular planes:
#' plot_cube(c("red", "blue", "green"), type = "plane", main = "The RGB plane")
#' plot_cube(c("cyan", "yellow", "magenta"), type = "plane", main = "The CYK plane")
#'
#'
#' # C. Illustrating colors and color palettes (unikn): ------
#'
#' # 0. Collect main unikn colors (as a vector):
#' col_8 <- c(Seeblau, Pinky, Seegruen, Peach, Karpfenblau, Bordeaux, Petrol, Grau)
#' col_4 <- c(Seeblau, Pinky, Seegruen, Bordeaux)
#' 
#' # 1. Main unikn colors as (labeled) points:
#' plot_cube(col_8, labels = "names", main = "The main unikn colors in RGB space")
#'
#' # 2. The default unikn palette (black - Seeblau shades - white) as a path:
#' plot_cube(pal_unikn, type = "b", line_connect = "path", lwd_line = 3,
#'           main = "A bi-polar palette (pal_unikn)")
#' plot_cube(pal_unikn_pref, type = "b", line_connect = "path", lwd_line = 3,
#'           main = "A categorical color palette (pal_unikn_pref)")
#'           
#' # 2. A color palette's shade ramp as a connecting path:
#' plot_cube(pal_pinky, type = "b", line_connect = "path", lwd_line = 5,
#'           theta = 40, phi = 20, main = "The path of pal_pinky")
#'
#' # 4. Pairwise relations among main colors:
#' plot_cube(col_4, type = "b", lwd_line = 2, theta = -40, phi = 20, 
#'           main = "Pairwise relations of 4 key colors")
#'
#' # 5. The gamut (plane) of mixtures spanned by 3 main colors:
#' plot_cube(c(Seeblau, Pinky, Seegruen), type = "plane",
#'           labels = "names", theta = -10, phi = 20,
#'           main = "Gamut of 3 key colors")
#'
#' # 6. Key colors with shadows (projected on 3 cube faces):
#' plot_cube(col_4, shadows = "all", main = "Key unikn colors with shadows")
#'
#'
#'
#' @family color functions
#'
#' @seealso
#' \code{\link{seecol}} for viewing and comparing color palettes;
#' \code{\link{usecol}} for using color palettes;
#' \code{\link{newpal}} for defining new color palettes;
#' \code{\link{col2rgb}} for converting colors to RGB values.
#'
#' @importFrom graphics persp points lines polygon text title
#' @importFrom grDevices col2rgb rgb grey trans3d adjustcolor
#'
#' @export

# plot_cube: Definition ------

plot_cube <- function(x,                      # vector of colors to plot
                      # What to draw:
                      type = "p",             # "p" (points), "l" (lines), "b" (both), or "plane"
                      # Point options:
                      col_points = NA,        # NA: use each point's own color
                      cex_points = 2,         # point size
                      pch = 21,               # point symbol (fillable)
                      col_brd = grey(.20, 1), # point border color
                      ref_lines = TRUE,       # drop vertical lines to base plane?
                      # Line options (type "l"/"b"):
                      col_line = NA,          # NA: gradient (color line by local mix); else a fixed color
                      lwd_line = 3,           # line thickness (lines + plane outline); raise for more visible lines
                      line_connect = "all",   # for >2 points: "all" (all pairs), "pairs" (disjoint consecutive pairs), or "path" (consecutive)
                      # Plane options (type "plane"):
                      col_fill = NA,          # NA: gradient fill (gamut of mixtures); else a fixed fill color
                      fill_alpha = .80,       # opacity of the plane fill (in [0, 1])
                      fill_res = 20,          # resolution of gradient (line segments / plane tessellation)
                      # Shadow (projection) options:
                      shadows = "none",       # project points onto cube faces: "floor", "back", "side", "all", or "none"
                      col_shadow = grey(.70, .9), # shadow marker color (NA: use each point's projected color)
                      # Cube options:
                      show_cube = TRUE,       # mark the 8 cube corners?
                      col_cube = grey(.50, 1),# color of cube edges/axes
                      # Axis options:
                      axis_labels = c("R", "G", "B"),  # axis titles ("long"/"no"/custom 3-vector)
                      axis_ticks = TRUE,      # draw tick marks + numeric values along axes?
                      n_ticks = 6,            # number of ticks per axis (when axis_ticks = TRUE)
                      cex_axis = NA,          # scaling of axis titles + tick values (NA: derive from cex_lbl)
                      # Labels:
                      labels = "names",       # "names"/"rgb"/"hex" (or combinations), NA/"no", or a vector
                      # Viewing angles and titles:
                      theta = -30, phi = 15,  # persp rotation angles
                      main = "Colors in 3D RGB space",
                      cex_lbl = .85,          # scaling of text labels
                      ...                     # other persp() parameters
) {
  
  ## (0) Handle and verify inputs: ------
  
  # Flatten and drop any NA colors:
  cols <- unlist(x, use.names = TRUE)
  cols <- cols[!is.na(cols)]
  
  if (length(cols) < 1) {
    stop("plot_cube: 'x' must contain at least 1 (non-NA) color.")
  }
  
  # Verify that all inputs are valid colors:
  is_col <- function(z) {  # local helper: is z a valid color?
    vapply(z, function(zi) {
      tryCatch({grDevices::col2rgb(zi); TRUE}, error = function(e) FALSE)
    }, logical(1))
  }
  
  ok <- is_col(cols)
  if (any(!ok)) {
    stop(paste0("plot_cube: Invalid color(s): ",
                paste(cols[!ok], collapse = ", "), "."))
  }
  
  # Convert colors to RGB coordinates (each in 0:255):
  rgb_mat <- grDevices::col2rgb(cols)  # 3 x n matrix (rows R, G, B)
  R <- rgb_mat["red",   ]
  G <- rgb_mat["green", ]
  B <- rgb_mat["blue",  ]
  n <- length(cols)
  
  # Convert colors to HEX values (include alpha only when not fully opaque):
  rgba <- grDevices::col2rgb(cols, alpha = TRUE)  # 4 x n matrix (rows R, G, B, alpha)
  
  pt_hex <- toupper(mapply(function(r, g, b, a) {
    if (a >= 255) { grDevices::rgb(r, g, b,    maxColorValue = 255) }  # #RRGGBB
    else          { grDevices::rgb(r, g, b, a, maxColorValue = 255) }  # #RRGGBBAA
  }, rgba[1, ], rgba[2, ], rgba[3, ], rgba[4, ], USE.NAMES = FALSE))
  
  
  ## (1) Resolve point colors and labels: ------
  
  # Point colors:
  if (all(is.na(col_points))) {
    pt_cols <- cols                              # use each point's own color
  } else {
    pt_cols <- rep(col_points, length.out = n)   # use provided color(s)
  }
  
  # Labels: Resolve 'labels' into a per-point label vector (pt_lbls):
  pt_lbls <- NULL  # default: no labels
  
  # Recognized label-TYPE keywords (names, RGB, or HEX values):
  known_types <- c("name", "names", "rgb", "hex")
  
  # Treat NA / "no" / "none" / "off" as: show no labels:
  no_labels <- (length(labels) == 1) &&
    (is.na(labels) || tolower(labels) %in% c("no", "none", "off"))
  
  if (!no_labels) {
    
    lab <- tolower(labels)
    
    if (all(lab %in% known_types)) {  # one or more label TYPES (names/rgb/hex):
      
      # Keep requested types in the order given (and normalize "name" to "names"):
      types <- unique(lab)
      types[types == "name"] <- "names"
      types <- unique(types)
      
      # Helper: build 1 label component (as a per-point vector):
      make_part <- function(type) {
        switch(type,
               "names" = { nm <- names(cols)              # use names of x (if available)
               if (is.null(nm) || any(nm == "")) { cols } else { nm } },
               "rgb"   = paste0("(", R, ", ", G, ", ", B, ")"),  # RGB triplet
               "hex"   = pt_hex                                  # HEX value
        )
      }
      
      # Build and stack the requested components on separate lines (per point):
      parts   <- lapply(types, make_part)
      pt_lbls <- do.call(paste, c(parts, sep = "\n"))
      
    } else {  # custom label vector (recycled to n):
      pt_lbls <- rep(labels, length.out = n)
    }
    
  } # if (!no_labels)
  
  
  ## (2) Set up plotting area: ------
  
  opar <- graphics::par(no.readonly = TRUE)  # store graphics settings
  on.exit(graphics::par(opar))               # restore on exit
  graphics::par(mar = c(2.5, 2, 3, 2) + 0.1) # margins (room for title + axis labels)
  graphics::par(xpd = TRUE)                   # allow axis labels to extend beyond the box
  
  lim <- c(0, 255)  # range of each RGB axis
  
  
  ## (3) Draw the empty RGB cube (and capture projection matrix): ------
  
  # Dummy (invisible) surface spanning the base plane (z = 0):
  dummy_x <- lim
  dummy_y <- lim
  dummy_z <- matrix(0, nrow = 2, ncol = 2)
  
  pmat <- graphics::persp(x = dummy_x, y = dummy_y, z = dummy_z,
                          xlim = lim, ylim = lim, zlim = lim,
                          theta = theta, phi = phi,
                          col = NA, border = NA,   # invisible surface
                          box = FALSE,             # we draw the cube ourselves
                          scale = TRUE, expand = 1,
                          xlab = "R", ylab = "G", zlab = "B",
                          ...)
  
  # Local helper: project 3D point(s) to the 2D plane:
  tr <- function(x, y, z) grDevices::trans3d(x, y, z, pmat)
  
  # Local helper: relative depth of 3D point(s) (larger = farther from viewer):
  depth <- function(x, y, z) {
    m <- cbind(x, y, z, 1) %*% pmat
    m[, 3] / m[, 4]
  }
  
  # Define the 8 corners of the cube:
  corners <- expand.grid(R = lim, G = lim, B = lim)
  
  # The 12 edges connect corners that differ on exactly 1 dimension:
  for (i in 1:(nrow(corners) - 1)) {
    for (j in (i + 1):nrow(corners)) {
      if (sum(corners[i, ] != corners[j, ]) == 1) {  # differ on 1 axis => edge
        seg <- tr(c(corners$R[i], corners$R[j]),
                  c(corners$G[i], corners$G[j]),
                  c(corners$B[i], corners$B[j]))
        graphics::lines(seg, col = col_cube, lwd = 1)
      }
    }
  }
  
  ## Axis titles, tick marks, and numeric value labels: ------
  ## (along the 3 cube edges emanating from the black (0,0,0) corner)
  
  # (a) Resolve axis titles (a 3-vector, a keyword, or NA/"no" to hide):
  if (length(axis_labels) == 1 &&
      (is.na(axis_labels) || tolower(axis_labels) %in% c("no", "none", "off"))) {
    ax_titles <- NA                             # hide axis titles
  } else if (length(axis_labels) == 1 && tolower(axis_labels) == "long") {
    ax_titles <- c("Red", "Green", "Blue")      # long axis titles
  } else if (length(axis_labels) == 1 && tolower(axis_labels) %in% c("short", "rgb")) {
    ax_titles <- c("R", "G", "B")               # short axis titles
  } else {
    ax_titles <- rep(axis_labels, length.out = 3)  # custom axis titles
  }
  
  # (b) Resolve tick positions (TRUE/FALSE, or a numeric vector of positions in 0:255):
  if (is.logical(axis_ticks)) {
    tick_pos <- if (isTRUE(axis_ticks)) round(seq(0, 255, length.out = n_ticks)) else numeric(0)
  } else {
    tick_pos <- round(axis_ticks)               # custom tick positions
  }
  
  # (c) Axis geometry: direction of each axis + outward normal (away from cube center):
  s <- sqrt(0.5)  # unit-vector component (for 45-degree outward directions)
  axis_vec <- list(R = c(1, 0, 0), G = c(0, 1, 0), B = c(0, 0, 1))  # axis directions
  out_dir  <- list(R = c(0, -s, -s),   # R axis: push labels toward front-bottom
                   G = c(-s, 0, -s),   # G axis: push labels toward left-bottom
                   B = c(-s, -s,  0))  # B axis: push labels toward left-front
  
  cex_ax    <- if (is.na(cex_axis)) cex_lbl else cex_axis  # size of axis titles
  tick_len  <-  8   # length of tick marks   (in RGB units)
  tick_gap  <- 24   # offset of tick values  (from axis, in RGB units)
  title_gap <- 56   # offset of axis titles  (from axis, in RGB units)
  
  for (ax in c("R", "G", "B")) {
    
    av <- axis_vec[[ax]]  # axis direction
    od <- out_dir[[ax]]   # outward direction
    
    # Tick marks + numeric value labels:
    if (length(tick_pos) > 0) {
      
      for (p in tick_pos) {
        base <- p * av               # tick position on the axis
        end  <- base + od * tick_len # outer end of tick mark
        seg  <- tr(c(base[1], end[1]), c(base[2], end[2]), c(base[3], end[3]))
        
        graphics::lines(seg, col = col_cube, lwd = 1)
        
        lp <- base + od * tick_gap   # position of value label
        
        graphics::text(tr(lp[1], lp[2], lp[3]), labels = p,
                       col = col_cube, cex = cex_ax * .75)
      }
      
    }
    
    # Axis title (at mid-axis, pushed further outward):
    if (!all(is.na(ax_titles))) {
      
      mid <- 128 * av
      tp  <- mid + od * title_gap
      
      graphics::text(tr(tp[1], tp[2], tp[3]),
                     labels = ax_titles[match(ax, c("R", "G", "B"))],
                     col = col_cube, cex = cex_ax, font = 2)
    }
    
  } # for (ax ...)
  
  
  ## (4) Optionally mark the 8 cube corners (in their own colors): ------
  
  if (show_cube) {
    
    corner_cols <- grDevices::rgb(corners$R, corners$G, corners$B, maxColorValue = 255)
    cnr <- tr(corners$R, corners$G, corners$B)
    graphics::points(cnr, pch = 22, bg = corner_cols, col = col_cube,
                     cex = cex_points * .70, lwd = .80)
  }
  
  
  ## (5) Connect points by lines or a plane (optional): ------
  
  # Normalize 'type' (accepting several synonyms):
  type <- tolower(type)
  if (type %in% c("line", "lines", "path"))                    { type <- "l" }
  if (type %in% c("both"))                                     { type <- "b" }
  if (type %in% c("poly", "polygon", "plane", "fill", "tri", "triangle")) { type <- "plane" }
  if (type %in% c("point", "points"))                          { type <- "p" }
  if (!type %in% c("p", "l", "b", "plane")) {
    message("plot_cube: Invalid 'type'; using type = \"p\" (points).")
    type <- "p"
  }
  
  P <- cbind(R, G, B)  # n x 3 matrix of point coordinates (in RGB space)
  
  # Helper: RGB coordinate -> color string (clamped to [0, 255]; optional alpha in [0, 1]):
  coord_col <- function(r, g, b, alpha = NA) {
    
    r <- min(max(r, 0), 255); g <- min(max(g, 0), 255); b <- min(max(b, 0), 255)
    
    if (is.na(alpha)) { grDevices::rgb(r, g, b, maxColorValue = 255) }
    else              { grDevices::rgb(r, g, b, alpha * 255, maxColorValue = 255) }
  }
  
  # Helper: draw 1 (gradient or solid) line between 2 points p1 and p2:
  # (uses round line ends (lend = 1) so that thick gradient lines join smoothly)
  draw_line <- function(p1, p2) {
    
    if (is.na(col_line[1])) {  # gradient: subdivide + color each sub-segment by its local mix
      tt <- seq(0, 1, length.out = max(2, round(fill_res)) + 1)
      
      for (s in 1:(length(tt) - 1)) {
        
        a0  <- (1 - tt[s])     * p1 + tt[s]     * p2
        a1  <- (1 - tt[s + 1]) * p1 + tt[s + 1] * p2
        mid <- (a0 + a1) / 2
        
        graphics::lines(tr(c(a0[1], a1[1]), c(a0[2], a1[2]), c(a0[3], a1[3])),
                        col = coord_col(mid[1], mid[2], mid[3]), lwd = lwd_line, lend = 1)
      }
      
    } else {  # solid line color:
      
      graphics::lines(tr(c(p1[1], p2[1]), c(p1[2], p2[2]), c(p1[3], p2[3])),
                      col = col_line[1], lwd = lwd_line, lend = 1)
    }
  }
  
  ## (5a) Lines (connect points: all pairs, disjoint pairs, or along a path): ------
  
  # Normalize 'line_connect' (accepting several synonyms):
  line_connect <- tolower(line_connect)
  
  if (line_connect %in% c("all", "complete", "pairwise")) { line_connect <- "all" }   # "pairwise" kept as alias
  if (line_connect %in% c("pairs", "pair", "disjoint")) { line_connect <- "pairs" }
  if (line_connect %in% c("path", "seq", "sequential", "chain", "consecutive")) { line_connect <- "path" }
  
  if (!line_connect %in% c("all", "pairs", "path")) {
    message("plot_cube: Invalid 'line_connect'; using \"all\".")
    line_connect <- "all"
  }
  
  if (type %in% c("l", "b") && n >= 2) {
    
    # Enumerate the point-index pairs to connect:
    if (line_connect == "path") {        # consecutive points (a path): n - 1 lines
      pairs <- lapply(1:(n - 1), function(k) c(k, k + 1))
      
    } else if (line_connect == "pairs") { # disjoint consecutive pairs: (1,2),(3,4),...: floor(n/2) lines
      n_pairs <- n %/% 2                   # (if n is odd, the last color remains unpaired)
      pairs <- if (n_pairs >= 1) lapply(1:n_pairs, function(k) c(2 * k - 1, 2 * k)) else list()
      
    } else {                             # "all" pairs (complete graph): n * (n - 1) / 2 lines
      pairs <- list()
      for (i in 1:(n - 1)) {
        for (j in (i + 1):n) { pairs[[length(pairs) + 1]] <- c(i, j) }
      }
    }
    
    # Order lines back-to-front (by mid-point depth) for cleaner overplotting:
    if (length(pairs) > 1) {
      mid_depth <- vapply(pairs, function(pr) {
        mp <- (P[pr[1], ] + P[pr[2], ]) / 2
        depth(mp[1], mp[2], mp[3])
      }, numeric(1))
      pairs <- pairs[order(mid_depth, decreasing = TRUE)]
    }
    
    for (pr in pairs) { draw_line(P[pr[1], ], P[pr[2], ]) }
    
  } # if (type ...)
  
  ## (5b) Plane / polygon (span the points): ------
  
  if (type == "plane") {
    
    if (n < 3) {  # a plane needs >= 3 points:
      
      message("plot_cube: type = \"plane\" needs >= 3 colors; drawing a line instead.")
      if (n == 2) { draw_line(P[1, ], P[2, ]) }
      
    } else {
      
      # Triangulate: a single triangle for 3 points, else a fan from point 1:
      tris <- if (n == 3) list(c(1, 2, 3)) else lapply(2:(n - 1), function(i) c(1, i, i + 1))
      if (n > 3) {
        message("plot_cube: >3 colors connected as a filled polygon (may be non-planar).")
      }
      
      # Barycentric position (and color) of weights (wb, wc) in a triangle A-B-C:
      bary <- function(A, B, C, i, j, m) {
        wb <- i / m; wc <- j / m; wa <- 1 - wb - wc
        wa * A + wb * B + wc * C
      }
      
      # Fill 1 sub-triangle with the color at its centroid:
      fill_tri <- function(v1, v2, v3) {
        cen <- (v1 + v2 + v3) / 3
        graphics::polygon(tr(c(v1[1], v2[1], v3[1]), c(v1[2], v2[2], v3[2]), c(v1[3], v2[3], v3[3])),
                          col = coord_col(cen[1], cen[2], cen[3], alpha = fill_alpha), border = NA)
      }
      
      m <- max(1, round(fill_res))  # tessellation resolution
      
      for (tri in tris) {
        # Triangle corners (named pa/pb/pc to avoid clobbering the R/G/B channels):
        pa <- P[tri[1], ]; pb <- P[tri[2], ]; pc <- P[tri[3], ]
        
        if (is.na(col_fill[1])) {  # gradient fill (via barycentric tessellation):
          for (i in 0:(m - 1)) {
            for (j in 0:(m - 1 - i)) {
              fill_tri(bary(pa, pb, pc, i, j, m), bary(pa, pb, pc, i + 1, j, m), bary(pa, pb, pc, i, j + 1, m))
              if (i + j < m - 1) {  # inverted sub-triangle:
                fill_tri(bary(pa, pb, pc, i + 1, j, m), bary(pa, pb, pc, i, j + 1, m), bary(pa, pb, pc, i + 1, j + 1, m))
              }
            }
          }
        } else {  # solid fill color:
          graphics::polygon(tr(c(pa[1], pb[1], pc[1]), c(pa[2], pb[2], pc[2]), c(pa[3], pb[3], pc[3])),
                            col = grDevices::adjustcolor(col_fill[1], alpha.f = fill_alpha), border = NA)
        }
      }
      
      # Draw the plane outline (edges between the defining points):
      ocol <- if (is.na(col_line[1])) grey(.30, 1) else col_line[1]
      for (tri in tris) {
        graphics::polygon(tr(P[tri, 1], P[tri, 2], P[tri, 3]), col = NA, border = ocol, lwd = lwd_line)
      }
      
    } # if (n ...)
  } # if (type == "plane")
  
  
  ## (5c) Shadow points (project points onto cube faces): ------
  
  # Normalize 'shadows' (a vector of faces, or "all"/"none"):
  sh <- tolower(shadows)
  if (any(sh == "all")) { sh <- c("floor", "back", "side") }
  sh <- intersect(unique(sh), c("floor", "back", "side"))  # drop "none" and invalid entries
  
  if (length(sh) > 0) {
    
    # Projection of a point onto each face (by zeroing 1 coordinate):
    proj <- list(floor = function(p) c(p[1], p[2],    0),  # onto R-by-G plane (B = 0)
                 back  = function(p) c(p[1],    0, p[3]),  # onto R-by-B plane (G = 0)
                 side  = function(p) c(   0, p[2], p[3]))  # onto G-by-B plane (R = 0)
    
    for (face in sh) {
      f <- proj[[face]]
      for (i in 1:n) {
        p  <- P[i, ]
        sp <- f(p)  # projected (shadow) coordinate
        
        # Connector line from point to its shadow:
        graphics::lines(tr(c(p[1], sp[1]), c(p[2], sp[2]), c(p[3], sp[3])),
                        col = grey(.80, .70), lwd = 1, lty = 3)
        
        # Shadow marker (grey by default, or the projected color if col_shadow = NA):
        sh_col <- if (is.na(col_shadow)) coord_col(sp[1], sp[2], sp[3]) else col_shadow
        s2 <- tr(sp[1], sp[2], sp[3])
        graphics::points(s2$x, s2$y, pch = 21, bg = sh_col, col = grey(.50, .80),
                         cex = cex_points * .60, lwd = .80)
      }
    }
  } # if (length(sh) ...)
  
  
  ## (6) Add colors as points (sorted back-to-front for correct overplotting): ------
  
  draw_pts <- (type != "l")  # draw points for "p", "b", and "plane" (not for lines-only)
  ord <- order(depth(R, G, B), decreasing = TRUE)  # far points first
  
  # Optional reference lines (from each point down to the base plane z = 0):
  if (ref_lines && draw_pts) {
    for (i in ord) {
      seg <- tr(c(R[i], R[i]), c(G[i], G[i]), c(B[i], 0))
      graphics::lines(seg, col = grey(.70, .80), lwd = 1, lty = 3)
    }
  }
  
  # The points themselves:
  pts <- tr(R, G, B)
  
  if (draw_pts) {
    if (pch %in% 21:25) {  # fillable symbols: use bg for fill, col for border
      graphics::points(pts$x[ord], pts$y[ord], pch = pch,
                       bg = pt_cols[ord], col = col_brd,
                       cex = cex_points, lwd = 1)
    } else {               # non-fillable symbols: use col for the color
      graphics::points(pts$x[ord], pts$y[ord], pch = pch,
                       col = pt_cols[ord], cex = cex_points, lwd = 2)
    }
  }
  
  # Optional point labels (slightly above each point):
  if (!is.null(pt_lbls)) {
    graphics::text(pts$x, pts$y, labels = pt_lbls,
                   pos = 3, offset = .70, cex = cex_lbl, col = grey(.10, 1))
  }
  
  
  ## (7) Add title: ------
  
  if (!is.null(main) && !is.na(main) && nchar(main) > 0) {
    graphics::title(main = main, adj = 0, line = 1, font.main = 1, cex.main = 1.2)
  }
  
  
  ## (8) Return projection matrix (invisibly): ------
  
  invisible(pmat)
  
} # plot_cube().


## Check: ------

# # Basics:
# plot_cube("deepskyblue")
# plot_cube(c("red", "green", "blue"))
# plot_cube(c("black", "white", "grey"))
#
# # unikn colors:
# plot_cube(pal_unikn)
# plot_cube(pal_seeblau, main = "Seeblau in RGB space")
#
# # Labels (names / rgb / hex, or combinations):
# plot_cube(c("red", "gold", "forestgreen"))                        # names (default)
# plot_cube(c("red", "gold", "forestgreen"), labels = "rgb")
# plot_cube(c("red", "gold", "forestgreen"), labels = "hex")
# plot_cube(c("red", "gold", "forestgreen"), labels = c("names", "rgb", "hex"))
# plot_cube(pal_seeblau, labels = "no")                             # no labels
#
# # Lines (all pairs / disjoint pairs / path) and planes:
# plot_cube(c("red", "gold", "forestgreen"), type = "b", lwd_line = 4)           # all pairs (default)
# plot_cube(c("black","red","gold","deepskyblue"), type = "b", lwd_line = 4)     # all pairs (6 lines)
# plot_cube(c("red","cyan","green","magenta"), type = "b", line_connect = "pairs")  # 2 disjoint pairs
# plot_cube(pal_unikn, type = "b", line_connect = "path")                        # connecting path
# plot_cube(c("red", "green", "blue"), type = "plane")                           # gamut plane


## (*) Done: ------

# - Points: plot colors as points in the RGB cube (type = "p").
# - Labels: by names / RGB / HEX values (or combinations); only provided points labeled.
# - Axes: customizable titles + numeric value ticks (0 to 255).
# - Lines: connect colors by (gradient) lines (type = "l" / "b"), with adjustable
#          thickness (lwd_line) and "all" (all pairs) / "pairs" (disjoint pairs) / "path" connections.
# - Planes: span a (gradient-filled) plane through >= 3 colors (type = "plane").
# - Shadows: project points onto cube faces (shadows = "floor"/"back"/"side"/"all").


## ToDo next: ------

# - Provide an option to the seecol() function that passes current colors on to plot_cube() with selected labels.

## ToDo in future: ------

# - Allow other color models (e.g., HSV) as alternative axes.
# - Gradient-fill planes using a finer (adaptive) tessellation near edges.


## eof. ------------------------------------------
