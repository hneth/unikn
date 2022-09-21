## util_color.R  |  unikn
## spds | uni.kn | 2022 09 21
## ---------------------------

# Color-related utility functions: 
# Converting and evaluating colors and accessing and plotting color palettes. 


## A. Color conversion and evaluation functions: -------

# col2rgb in grDevices: ------ 

## Check: 
# col2rgb("black", alpha = FALSE)  # Note: alpha is Boolean argument.
# col2rgb("black", alpha = TRUE)
# col2rgb("black")

# col2rgb("white", alpha = FALSE)
# col2rgb("white", alpha = TRUE)
# col2rgb("#FFFFFF")



# get_alpha: Get color transparency / alpha values: ------

get_alpha <- function(pal){
  
  grDevices::col2rgb(pal, alpha = TRUE)["alpha", ] 
  
} # get_alpha().

## Check:
# get_alpha("red")
# get_alpha(shades_of(10, "black"))  # all same alpha
# get_alpha(ac(col = "black", alpha = seq(0, 1, by = 0.10)))  # 11 different alphas



# rgb2hex color conversion function: ------ 

rgb2hex <- function(R, G, B) {
  
  rgb(R, G, B, maxColorValue = 255)
  
} # rgb2hex().

## Check:
# rgb2hex(255, 255, 255)
# rgb2hex(0, 0, 0)



# col2hex color conversion function: ------ 

col2hex <- function(col, alpha = NA, use_alpha = FALSE) {
  
  if (use_alpha){
    
    if (is.na(alpha)){ # Only get alpha values of col:
      
      rgb(t(col2rgb(col)), alpha = get_alpha(col), maxColorValue = 255)
      
    } else { # Use the alpha value(s) provided:
      
      # ToDo: verify that alpha is numeric and in [0, 1]
      
      rgb(t(col2rgb(col)), alpha = alpha * 255, maxColorValue = 255)
      
    }
    
  } else { # default: 
    
    rgb(t(col2rgb(col)), maxColorValue = 255)
    
  }
  
} # col2hex().

## Check: 
# hex1 <- col2hex("black", alpha = 1/2, use_alpha = TRUE)
# hex2 <- col2hex("white", alpha = 2/3, use_alpha = TRUE)
# hex3 <- col2hex("gold", alpha = 1/3, use_alpha = TRUE)
# hex4 <- col2hex("steelblue", alpha = 0, use_alpha = FALSE)
# seecol(pal = c(hex1, hex2, hex3, hex4), n = "all")
# 
# # Note 2 limitations: 
# 1. As col2hex assumes a SCALAR alpha value,
#    the following does currently NOT work:
# col2hex("black", alpha = c(1/4, 1/2, 3/4))
# # ToDo: Vectorize col2hex arguments?
#
# # 2. By default, col2hex does not detect/use transparency differences: 
# tblack <- ac("black", alpha = seq(0, 1, by = 0.25))
# # seecol(tblack)
# col2hex(tblack)  # ignores transparency!
# # Use color transparency in col2hex:
# col2hex(tblack, use_alpha = TRUE) # uses alpha values without setting them
# # seecol(col2hex(tblack, use_alpha = TRUE))



# is_hex_col: Helper function to detect HEX-colors: ------ 

is_hex_col <- function(color) {
  
  return(grepl(pattern = "^#[0-9A-Fa-f]{6,}", color))
  
} # is_hex_col().

## Check:
# is_hex_col("black")
# is_hex_col(col2hex("black"))
# is_hex_col(rgb2hex(0, 0, 0))



# is_col: Helper function to detect any color (in an individual character string): ------ 

is_col <- function(color) {
  
  return(is_hex_col(color) | color %in% colors())
  
} # is_col(). 

## Check:
# is_col("white")
# is_col(col2hex("black", alpha = 255/2))
# is_col(NA)
# is_col("bumblebee")

# BUT note: 
# is_col(col2rgb("white"))  # => FALSE FALSE FALSE



# col_distance: Color distance (in RGB space): ------

col_distance <- function(col_1, col_2){
  
  # Vectorize (if needed):
  len_1 <- length(col_1)
  len_2 <- length(col_2)
  
  if (len_1 > len_2){ # extend col_2:
    fct <- ceiling(len_1/len_2)
    col_2 <- rep(col_2, fct)[1:len_1]
  }
  
  if (len_2 > len_1){ # extend col_1:
    fct <- ceiling(len_2/len_1)
    col_1 <- rep(col_1, fct)[1:len_2]
  }
  
  # Convert to RGB:
  rgb_1 <- grDevices::col2rgb(col_1)
  rgb_2 <- grDevices::col2rgb(col_2)
  
  # Output (as matrix): 
  abs(rgb_1 - rgb_2)
  
} # col_distance().

## Check: 
# # (a) individual colors: 
# col_distance("red", "red")
# col_distance("black", "white")
# 
# # (b) Color palette: 
# # col2rgb(palette())
# pal <- palette()
# names(pal) <- palette()
# col_distance("black", pal)  # No names vs.
# col_distance(pal, "black")  # Note names



# col_distinct: A unique() function for color values (using HEX codes): ------

# Goal: Remove visual duplicate colors (using HEX values to judge the identiy of colors, 
#       rather than color names). 
#
# Notes: 
# - The function aims to detect visual duplicates (i.e., colors that look the same, 
#   irrespective of their names/values).
# - Color transparency is only considered when use_alpha = TRUE.
# - grDevices::colors() has a 'distinct = TRUE' argument to remove visual duplicates.
# - By default, visually distinct colors (i.e., with different color values) but same NAME are retained, 
#   but setting use_names = TRUE removes colors with duplicate names (even if their color values differ).

col_distinct <- function(pal, use_hex = TRUE, use_alpha = FALSE, use_names = FALSE){
  
  # Prepare: ------ 
  
  if (any(is_col(pal) == FALSE)){
    stop("pal contains non-colors")
  }
  
  # Initialize:
  hex_dupes <- FALSE   # default: all different HEX values
  alpha_dupes <- TRUE  # default: all same alpha values
  name_dupes <- FALSE  # default: no names/all different names
  
  out_pal <- NA
  
  
  # Main: ------
  
  # 1. Color HEX values: ---- 
  
  if (use_hex){
    
    pal_hex <- col2hex(pal)  # ignores transparency!
    hex_dupes <- duplicated(pal_hex)  # logical ix of duplicated hex values
    
  } 
  
  
  # 2. alpha values: ----
  
  if (use_alpha){
    
    # Get transparency values:
    pal_alpha <- get_alpha(pal)
    
    alpha_dupes <- duplicated(pal_alpha)  # logical ix of duplicate alpha values
    
  } 
  
  # Apply indices 1+2: ----
  # print(hex_dupes)   # 4debugging
  # print(alpha_dupes) # 4debugging
  
  cur_pal <- pal[(hex_dupes & alpha_dupes) == FALSE]
  
  
  # 3. Color names (for cur_pal only): ---- 
  
  if ((is.null(names(cur_pal)) == FALSE) & use_names){
    
    pal_names <- names(cur_pal)
    name_dupes <- duplicated(pal_names)
    
  }
  
  # Apply index 3: ---- 
  # print(name_dupes) # 4debugging
  
  if (use_names){
    out_pal <- cur_pal[name_dupes == FALSE]
  } else {
    out_pal <- cur_pal
  }
  
  
  # Output: ------
  
  return(out_pal)
  
} # col_distinct().


# ## Check:
# (p1 <- c("gray", "grey", "black", "grey0", rgb(0, 0, 0), "red", "red1", rgb(1, 0, 0), "red2", "red3"))
# seecol(p1)
# col_distinct(p1)
# col_distinct(p1, use_hex = FALSE, use_alpha = TRUE, use_names = TRUE)
# 
# # with repeated color values (in custom pals):
# (p2 <- usecol(c("black", pal_unikn, pal_seeblau, pal_grau, "white")))
# col_distinct(p2)
# seecol(col_distinct(p2))
# 
# # use_names:
# (p3 <- newpal(col = c("black", "gray", "grey", "white"), names = c("extreme", "med", "med", "extreme")))
# col_distinct(p3)  # removes duplicate color values, but keeps colors with duplicate names
# col_distinct(p3, use_names = TRUE)  # removes duplicate names (despite distinct colors)
# col_distinct(p3, use_hex = FALSE, use_names = TRUE)
# 
# # use_alpha: By default, color transparency is being ignored:
# tblack <- ac("black", alpha = seq(0, 1, by = 0.25))
# seecol(tblack)        # Shows 5 shades, but
# col_distinct(tblack)  # all share same basic color!
# col_distinct(tblack, use_alpha = TRUE)  # USES color transparency (to keep visual different shades of same color)
# col_distinct(tblack, use_hex = FALSE, use_names = TRUE)
# 
# # Invalid inputs:
# col_distinct(c("black", "NO color", "white"))






## B. Color retrieval functions: ------

# parse_pal(): Parse a palette input ------ 

parse_pal <- function(pal) {
  
  parenv <- parent.frame()  # get the calling environment. 
  
  # Check if pal is legible (already a color palette): 
  vector_input <- tryCatch(
    {
      all(sapply(pal, is_col))
    },
    
    error = function(e) {
      
      return(FALSE)  # return FALSE if not all are colors. 
      
    },
    silent = TRUE
  )
  
  
  if ( vector_input ) {  # if the input is a color vector (or list).
    
    out <- pal
    
  } else {  # otherwise:
    
    # Deparse argument: 
    if ( identical(parenv , globalenv()) ) {  # if the calling environment is the global env:
      
      tmp <- noquote(deparse(substitute(pal)))  # get the palette. 
      
    } else {  # if the calling environment is another function:
      
      tmp <- noquote(deparse(substitute(expr = pal, 
                                        env = parent.frame())))  # get input from function.
      
      tmp <- noquote(tmp)  # unquote input. 
      
    }
    
    # Split input string; getting everything within the parentheses:
    
    if ( grepl("\\(", tmp) ) {  # only if any parenthesis exists.
      
      tmp <- sub(".*?\\(+(.*)\\).*", "\\1", tmp, perl=TRUE)
      # .\*?   matches anything but stops at the first match of what follows
      # \\s+   matches one or more blank spaces
      # (.\*)  matches any number of characters, because it is in parentheses
      # it becomes a capture group and is stored in the variable \1
      # \\s    waits for another blank, this time, the last one
      # .*     matches anything after the last blank
      
    }
    
    elem <- gsub(" |\"", "", unlist(strsplit(tmp, split = ",")))  
    # Split get elements of the input at ',' and remove whitespace and quotes.
    
    # Check if any element is warpped in one or more functions: 
    parens <- grepl("\\(", elem)   # are there any parentheses left?
    funs <- rep(NA, length(elem))  # initialize vector. 
    funs[parens] <- gsub(" *\\(.*", "", elem[parens])  # get any functions.
    
    # Remove functions: 
    elem <- sub(".*?\\(+(.*)\\).*", "\\1", elem, perl = TRUE)
    
    # Existence checks: ----- 
    
    ## Now ask for every element, whether it exists:
    elemex <- sapply(elem, function(x) exists(x) & x != "pal")
    # also ask, whether the element is named pal, to prevent name conflicts!
    # Was: elemex <- sapply(elem, exists)
    
    
    if ( any(!elemex) ) { # only if not all inputs have been resolved
      
      # Those which are still unknown: Are those colors? 
      elemex[!elemex] <- sapply(elem[!elemex], is_col)
      
    }
    
    # Prefix those which do not exist with "pal_": 
    if ( any(!elemex) ) {  # only if not all inputs have been resolved
      
      elem[!elemex] <- paste0("pal_", elem[!elemex])
      elemex[!elemex] <- sapply(elem[!elemex], exists)
      
    }
    
    # Handle undefined palettes: ---- 
    
    if (!all(elemex)) {
      
      nex <- gsub("pal_", "", elem[!elemex])  # remove any "pal_" string parts. 
      
      if ( length(nex) > 1) {
        
        errmsg <- paste0("Inputs ", paste0("\"", nex, "\"", collapse = ", "), " do not exist")
        
      } else {
        
        errmsg <- paste0("Input \"", nex, "\" does not exist")
        
      }
      
      stop(errmsg)
      
    }
    
    
    # Get all palettes: ---- 
    out <- lapply(elem, function(x) if (is_col(x)) {x} else {get(x)} )
    
    
    # Apply any previously detected functions: ----  
    if ( any(!is.na(funs)) ) {
      
      out[!is.na(funs)] <- apply(rbind(out, funs), MARGIN = 2, FUN = function(x) {
        if(!is.na(x$funs)) eval(call(x$funs, x$out)) # apply function to all non-NA elements. 
      })[!is.na(funs)] 
      
    }
    
    # Create the output: ---- 
    out <- unname(out)  # finish the palette by removing upper level (palette) names.
    
  }
  
  # Output: ---- 
  
  out <- unlist(out)
  
  # Provide missing names, by using the color:
  ix_nameless <- is.null(names(out)) | names(out) == ""
  names(out)[ix_nameless] <- out[ix_nameless]
  
  return(out)
  
} # parse_pal().



# getpal_key(): Get a palette or list of palettes by keyword: -------

getpal_key <- function(pal = "all", n = "all", alpha = NA) {
  
  # Process the 'pal' argument: ----- 
  
  # Getting palettes by keyword: ----- 
  keys <- c("all", "unikn_all", "all_unikn",  # all palettes
            "basic", "unikn_basic", "basic_unikn",  # basic palettes 
            "pair", "pair_all", "all_pair",   # paired palettes 
            "pref", "pref_all", "all_pref",   # preferred palettes and gradients 
            "grad", "grad_all", "all_grad"    # gradients
  )
  
  # Throw an error, if no valid keyword is specified:
  if ( !pal %in% keys ) {
    stop('Invalid keyword specified. Allowed keywords are 
                            c("all", "unikn_all", "all_unikn", "pref_all", "all_pref", "grad_all", "all_grad")')
  } else {
    
    if ( pal %in% keys[1:3] )   key <- "all"
    if ( pal %in% keys[4:6] )   key <- "basic"
    if ( pal %in% keys[7:9] )   key <- "pair"
    if ( pal %in% keys[10:12] ) key <- "pref"
    if ( pal %in% keys[13:15] ) key <- "grad"
    
  }
  
  # Get all color palettes with the prefix "pal_" from the environment: ----- 
  
  # Distinguish 5 cases:
  pal_names <- switch(
    key,
    all = all_palkn,
    basic = all_palkn_basic,
    pair = all_palkn_pair,
    pref = all_palkn_pref,
    grad = all_palkn_grad
  )
  
  # Get list of palettes specified by keyword:
  lst_pal <- sapply(pal_names, get)
  
  # Indicator, whether these are actually color palettes:
  is_pal <- lapply(
    lst_pal,
    FUN = function(x) {
      if ( !typeof(x) %in% c("vector", "list") ) {
        is_color <- FALSE
      } else {
        is_color <- is_hex_col(color = x)
      }
      return(all(is_color))  # are all entries colors?
      
    }
  )
  
  # Remove all non-colors:
  tmp <- lst_pal[unlist(is_pal)]
  
  # Check if palette is non-empty:
  if (length(tmp) == 0) {
    stop("No color palettes defined in the current environment.")
  }
  
  # If only color subsets should be displayed:
  if (n != "all" ) {
    
    # Get the subset of each palette , as defined in usecol():
    out <- lapply(tmp, FUN = usecol, n = n, alpha = alpha, use_names = TRUE)
    
  } else {
    
    if ( !is.na(alpha) ) {
      
      out <- lapply(tmp, FUN = adjustcolor, alpha.f = alpha)   # adjust for alpha if specified.
      
    } else {
      
      out <- tmp  # if n n is specified return list as is.
      
    }
    
  }
  
  pal_nm <- names(out)  # get palette names from listnames.
  
  return(out)
  
} # getpal_key(). 





## C. Color-related plotting functions: ------

# plot_shape: Plot a shape in a certain color: ------

plot_shape <- function(pos_x, pos_y,  # midpoint of shape  
                       col_fill,      # fill color  
                       col_brd = NA,
                       xlen = 1, ylen = 1,  # height of axis lengths  
                       shape = "rect",      # shape 
                       ...  # other graphics parameters (e.g., lwd): passed to symbols() 
) {
  
  # Prepare inputs for vectorized solution: -----
  
  len_max <- max(c(length(pos_y), length(pos_x)))  # get length of longer position vector. 
  
  # Recycle all vectors to length of longest vector:
  pos_x <- rep(pos_x, length.out = len_max)
  pos_y <- rep(pos_y, length.out = len_max)
  xlen  <- rep(xlen,  length.out = len_max)
  ylen  <- rep(ylen,  length.out = len_max)
  
  
  # Rectangles: ----- 
  
  if (shape == "rect") {
    
    symbols(x = pos_x, y = pos_y, 
            rectangles = cbind(xlen, ylen),  # as matrix: width and height of rectangles
            add = TRUE,
            inches = FALSE,  # use unit on x axis
            fg = col_brd,    # line color
            bg = col_fill,   # filling
            ...              # other graphics parameters (e.g., lwd)
    )
    
  }
  
  # Circles: ----- 
  
  if (shape == "circle") {
    
    symbols(x = pos_x, y = pos_y, 
            circles = xlen/2,  # as vector (only using xlen): radii of circles
            add = TRUE, 
            inches = FALSE,  # use unit on x axis 
            fg = col_brd,    # line color
            bg = col_fill,   # filling
            ...              # graphics parameters (e.g., lwd)
    )
    
  } 
  
} # plot_shape().



# plot_col: Plot a vector of colors (as circles or rectangles): -------

plot_col <- function(x,         # a *vector* of colors to be plotted. 
                     ypos = 1,  # position on y axis. 
                     shape = "rect",
                     xlen = 1, ylen = 1, 
                     distance = 0,     # distance between shapes (to be subtracted from size). 
                     plot.new = TRUE,  # TODO: Set to FALSE once done! 
                     ...               # other graphics parameters (e.g., lwd)
) {
  
  # 1. Handle inputs: -----
  
  # Key parameters:
  len_x <- length(x)  # length of vector x (i.e., nr. of colors to plot)
  
  # Should a new plot be created? 
  if (plot.new) {
    
    if (distance > 0) {
      xlim <- c(0 - distance * len_x, len_x * (1 + distance))
    } else {
      xlim <- c(0, len_x)
    }
    
    plot(x = 0, type = "n", xlim = xlim, ylim = c(0, 2))  # create an empty plot.
    
  } else {
    
    # Check for graphic device: 
    if (dev.cur() == 1) {
      stop("No graphic device to be plotted on.  Please open a plot or set plot.new to 'TRUE'.")
    }
    
  }
  
  
  # 2. Position parameters: -----
  
  # Shape centers:
  xpos <- (1:len_x) - 0.5  # subtracting 0.5 assumes a shape width of 1.
  
  # ToDo: Allow scaling shape widths to fill a FIXED total width 
  #       (e.g., each shape with a width of 10/len_x).
  
  # Adjust xpos by distance:
  mid <- mean(xpos)  # get midpoint. 
  add <- cumsum(rep(distance, sum(xpos < mid)))  # values to be added to the 1st half 
  sub <- add * (-1)                              # values to be subtracted from the 2nd half 
  xpos <- xpos + if (len_x %% 2 == 0) {c(rev(sub), add)} else  # even numbers: no center position needed
  {c(rev(sub), 0, add)}                                      # odd numbers: include a middle (0)
  
  # Recycle other constants (to len_x):
  ypos <- rep(ypos, length.out = len_x) 
  xlen <- rep(xlen, length.out = len_x)
  ylen <- rep(ylen, length.out = len_x)
  
  
  # 3. Plot shapes: ------ 
  
  plot_shape(pos_x = xpos,  # x positions of the shapes. 
             pos_y = ypos,  # position in y dimension (given). 
             xlen = xlen, ylen = ylen,  # length of the axes. 
             col_fill = unlist(x),  # filling color. 
             shape = shape,  # shape parameter. 
             ...  # graphics parameters (e.g., lwd)
  )
  
} # plot_col().





## ToDo: ------

# - Consider exporting utility functions `get_alpha()`, `col_distance()` and `col_distinct()`.

# - `col2hex()`: Improve by vectorizing arguments and considering transparency/alpha values (see 2 ToDos above). 
# - `plot_col()`: Add option for scaling multiple color palettes to fixed width rectangles. 
# - Add functions for translating to/from HCL values (see `HCL_color_exploration.Rmd`). 

## eof. ----------