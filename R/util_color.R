## util_color.R  |  unikn
## spds | uni.kn | 2022 11 16
## ---------------------------

# Color-related utility functions: 
# Converting and evaluating colors and accessing and plotting color palettes. 


## 1. Color conversion and evaluation functions: -------

# col2rgb: (in grDevices) ------ 

## Check: 
# col2rgb("black", alpha = FALSE)  # Note: alpha is Boolean argument.
# col2rgb("black", alpha = TRUE)
# col2rgb("black")

# col2rgb("white", alpha = FALSE)
# col2rgb("white", alpha = TRUE)
# col2rgb("#FFFFFF")



# get_alpha: Get color transparency / alpha values ------

get_alpha <- function(pal){
  
  grDevices::col2rgb(pal, alpha = TRUE)["alpha", ] 
  
} # get_alpha().

## Check:
# get_alpha("red")
# get_alpha(shades_of(10, "black"))  # all same alpha
# get_alpha(ac(col = "black", alpha = seq(0, 1, by = 0.10)))  # 11 different alphas



# rgb2hex: Color conversion function ------ 

rgb2hex <- function(R, G, B) {
  
  rgb(R, G, B, maxColorValue = 255)
  
} # rgb2hex().

## Check:
# rgb2hex(255, 255, 255)
# rgb2hex(0, 0, 0)



# col2hex: Color conversion function ------ 

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



# is_hex_col: Checking for HEX-colors ------ 

is_hex_col <- function(color) {
  
  return(grepl(pattern = "^#[0-9A-Fa-f]{6,}", color))
  
} # is_hex_col().

## Check:
# is_hex_col("black")
# is_hex_col(col2hex("black"))
# is_hex_col(rgb2hex(0, 0, 0))



# is_col: Checking for any color (in an individual character string) ------ 

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


# col_asif_alpha: Color corresponding to the hue of a transparent color ------ 

# Which non-transparent color values match the hue of a transparent color?
# Task: Get the non-transparent color corresponding to the hue of a transparent color (with 0 < alpha < 1)
# Source: https://stackoverflow.com/questions/12228548/finding-equivalent-color-with-opacity

col_asif_alpha <- function(col, alpha = NA, col_bg = "white"){
  
  # Assume: 
  # 1. col is a color
  # 2. 0 < alpha < 1
  # 3. col_bg is a color
  
  # Prepare: ----
  
  # Handle alpha value:
  
  # 1. Get alpha from col or alpha argument:
  
  # (ad b) from col:
  col_rgb <- grDevices::col2rgb(col, alpha = TRUE)
  col_rgb_alpha <- col_rgb["alpha", ]
  
  if (is.na(alpha) == FALSE){ # (a) from alpha argument:
    
    # print(paste0("User set alpha = ", alpha))  # 4debugging
    
    if (col_rgb_alpha < 255){
      print(paste0("Ignoring col_rgb_alpha = ", col_rgb_alpha))  # 4debugging 
    }
    
  } else if (col_rgb_alpha < 255){ # (b) from col:
    
    alpha <- round(col_rgb_alpha/255, 3)
    
    # print(paste0("Transparent RGB col alpha = ", alpha))  # 4debugging    
    
  } else { # (c) not yet set: use default 
    
    alpha <- 1  # default
    
    # print(paste0("Using default alpha = ", alpha))  # 4debugging    
    
  }
  
  # print(paste0("Uncorrected alpha = ", alpha))  # 4debugging
  
  # 2. Correct alpha value:
  correct_alpha <- TRUE  # Boolean: Correct alpha value? 
  
  if (correct_alpha){
    
    # Reduce alpha, to get a brighter/lighter result:
    
    if (alpha > .01 & alpha <= .05){
      
      alpha <- alpha - .01
      
    } else if (alpha > .05 & alpha <= .10){
      
      alpha <- alpha - .02
      
    } else if (alpha > .10 & alpha <= .15){
      
      alpha <- alpha - .03
      
    } else if (alpha > .15 & alpha <= .25){
      
      alpha <- alpha - .04
      
    } else if (alpha > .25 & alpha <= .35){
      
      alpha <- alpha - .05
      
    } else if (alpha > .35 & alpha <= .85){
      
      alpha <- alpha - .07
      
    } else if (alpha > .85 & alpha <= .95){
      
      alpha <- alpha - .03
      
    } 
    
    # print(paste0("Corrected alpha = ", alpha))  # 4debugging
    
  }
  
  # Main: ----
  
  if (alpha < 1){ # find color corresponding to alpha:
    
    col_rgb_rgb <- col_rgb[1:3, ]
    col_bg_rgb <- grDevices::col2rgb(col_bg, alpha = FALSE)[1:3, ]
    
    # (1) Know: RGBA1 (transparent front) over RGB2 (back) 
    #     Want: RBG3 (effective visual result)
    r1 <- col_rgb_rgb 
    a1 <- alpha
    r2 <- col_bg_rgb
    
    r3 = r2 + (r1 - r2) * a1
    
    col_out <- r3
    
    # # (2) Know: RGB3 (the final desired color), RGB2 (the background color), and A1 (how much opacity you want), 
    # #     Want: RGB1
    # r3 <- col_rgb_rgb 
    # a1 <- alpha
    # r2 <- col_bg_rgb
    # 
    # r1 = (r3 - r2 + r2 * a1) / a1
    # 
    # col_out <- r1
    
  } else {
    
    col_out <- col_rgb[1:3, ]
    
  }
  
  # Correct extreme values:
  col_out[col_out < 0]   <- 0
  col_out[col_out > 255] <- 255
  
  # print(t(col_out))  # 4debugging
  
  # Output: ---- 
  
  rgb(t(col_out), maxColorValue = 255)
  
} # col_asif_alpha(). 

# Check:

# # 1. baseline:
# col_asif_alpha("black")
# col_asif_alpha("white")
# seecol(c("steelblue", col_asif_alpha("steelblue")))

# # 2. non-transparent color input and explicit alpha value:
# col <- "blue4"
# af <- 0.35
# seecol(c(adjustcolor(col, alpha.f = af), col_asif_alpha(col, alpha = af)))

# # 3. transparent color input:
# cols_t <- ac("darkblue", alpha = seq(1, 0, by = -.10))
# col_1 <- cols_t[9]
# col_2 <- col_asif_alpha(col_1, alpha = NA)
# seecol(c(col_1, col_2))

# # +++ here now +++


# v_col_asif_alpha: Vectorized version of col_asif_alpha(): ----

v_col_asif_alpha <- Vectorize(col_asif_alpha, vectorize.args = c("col", "alpha"))

# # Check: 
# # (a) individual colors:
# seecol(v_col_asif_alpha(col = "black", alpha = c(.25, .75), col_bg = "white"))       # works
# seecol(v_col_asif_alpha(col = "black", alpha = c(.25, .50, .75), col_bg = "white"))  # fails!
# 
# # (b) Color palettes:
# alf <- .25
# c_1 <- usecol(uni_freiburg_info, alpha = alf)  # transparent
# c_2 <- v_col_asif_alpha(uni_freiburg_info, alpha = c(alf))  # non-transparent
# 
# c_1 <- usecol(pal_unikn_pref, alpha = alf, use_names = TRUE)  # transparent
# c_2 <- v_col_asif_alpha(pal_unikn_pref, alpha = c(alf))  # non-transparent
# 
# my_pal <- rep(NA, 2 * length(c_1))
# 
# for (i in 1:length(c_1)){ # re-sort pairs:
#   my_pal[i * 2 - 1] <- c_1[i]
#   my_pal[i * 2 + 0] <- c_2[i]  
# }
# 
# # Compare:
# seecol(my_pal)


# col_distance: Color distance (in RGB space) ------

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



# col_distinct: A unique() function for color values (using HEX codes) ------

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




## 2. Color and color palette retrieval functions: ------

# parse_pal: Parse color palette input ------ 

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
    
  } else { # otherwise:
    
    # Deparse argument: 
    if ( identical(parenv , globalenv()) ) {  # if the calling environment is the global env:
      
      tmp <- noquote(deparse(substitute(pal)))  # get the palette. 
      
    } else {  # if the calling environment is another function:
      
      tmp <- noquote(deparse(substitute(expr = pal, 
                                        env = parent.frame())))  # get input from function.
      
      tmp <- noquote(tmp)  # unquote input. 
      
    }
    
    # Split input string; getting everything within the parentheses:
    
    if ( grepl("\\(", tmp) ) {  # if a parenthesis exists: 
      
      tmp <- sub(".*?\\(+(.*)\\).*", "\\1", tmp, perl = TRUE)
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
    
    ## Check existence of every element:
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



# get_pal_key: Get a color palette or list of palettes by keyword -------

get_pal_key <- function(pal = "all", n = "all", alpha = NA) {
  
  # Process the 'pal' argument: ----- 
  
  # Getting palettes by keyword: ----- 
  keys <- c(#
    # (a) all palettes (of the unikn package):
    "all",                            # 1. all palettes (of the unikn package)
    # (b) local/uni.kn palettes:
    "unikn_all", "all_unikn",         # 2:3. all local/uni.kn palettes
    "basic", "unikn_basic", "basic_unikn", # 4:6. basic palettes 
    "pair", "pair_all", "all_pair",   # 7:9. paired palettes 
    "pref", "pref_all", "all_pref",   # 10:12. preferred palettes and gradients 
    "grad", "grad_all", "all_grad",   # 13:15. gradients
    # (c) added/contributed palettes: 
    "add", "uni"                      # 16:17. additional/contributed palettes
  )
  
  # Throw an error, if no valid keyword is specified:
  if ( !pal %in% keys ) {
    stop('Invalid keyword specified. Allowed keywords are 
         c("all", "unikn_all", "all_unikn", "pref_all", "all_pref", "grad_all", "all_grad", "add")')
  } else {
    
    # (a) all palettes (of the unikn package):
    if ( pal %in% keys[1] )     key <- "all"
    # (b) local/uni.kn palettes:
    if ( pal %in% keys[2:3] )   key <- "all_kn"    
    if ( pal %in% keys[4:6] )   key <- "basic"
    if ( pal %in% keys[7:9] )   key <- "pair"
    if ( pal %in% keys[10:12] ) key <- "pref"
    if ( pal %in% keys[13:15] ) key <- "grad"
    # (c) added/contributed palettes: 
    if ( pal %in% keys[16:17] ) key <- "add" 
    
  }
  
  # Get all color palettes with the prefix "pal_" from the environment: ----- 
  
  # Distinguish 7 cases:
  pal_names <- switch(
    key,
    # (a) all palettes (of the unikn package):
    all = all_pals,
    # (b) local/uni.kn palettes:
    all_kn = all_palkn,
    basic = all_palkn_basic,
    pair = all_palkn_pair,
    pref = all_palkn_pref,
    grad = all_palkn_grad,
    # (c) added/contributed palettes:
    add = add_pals
  )
  
  # Get list of palettes specified by keyword:
  lst_pal <- sapply(pal_names, get)
  
  # Check if lst_pal elements are actually color palettes:
  is_pal <- lapply(X = lst_pal,
                   FUN = function(x) {
                     
                     # if ( !typeof(x) %in% c("vector", "list") ) {  # BUG: uni-pals are of type "character"!
                     if ( !is.vector(x) & !is.list(x) ) { # palettes are vectors or lists:
                       
                       is_color_ix <- FALSE
                       
                     } else { # check all elements:
                       
                       # is_color_ix <- is_hex_col(color = x)  # Why only check for HEX colors?
                       is_color_ix <- is_col(color = x)
                       
                     }
                     
                     return(all(is_color_ix))  # TRUE iff ALL elements are colors
                     
                   }
  )
  
  # print(is_pal)  # 4debugging
  
  # Remove non-colors:
  col_pals <- lst_pal[unlist(is_pal)]
  
  # Check if palette is non-empty:
  if (length(col_pals) == 0) {
    stop("No color palettes found in the current environment.")
  }
  
  # If only color subsets should be displayed:
  if (n != "all" ) {
    
    # Get the subset of each palette , as defined in usecol():
    out <- lapply(col_pals, FUN = usecol, n = n, alpha = alpha, use_names = TRUE)
    
  } else {
    
    if ( !is.na(alpha) ) {
      
      out <- lapply(col_pals, FUN = adjustcolor, alpha.f = alpha)  # adjust alpha
      
    } else { # if n is un-specified: 
      
      out <- col_pals  # return list as is
      
    }
    
  }
  
  pal_nm <- names(out)  # get palette names from listnames # ToDo: Used/needed anywhere???
  
  return(out)
  
} # get_pal_key(). 


# get_col_names: Get custom and default color names ------

get_col_names <- function(col, custom_pals = all_pals){
  
  # 1. Customized names from custom color palettes:
  cus_pals  <- lapply(X = custom_pals, FUN = get)
  cus_names <- names(unlist(cus_pals))[match(col, unlist(cus_pals))]
  
  # 2. Default names: Predefined color names (in grDevices):
  def_names <- grDevices::colors()[match(
    grDevices::rgb(t(grDevices::col2rgb(col)), maxColorValue = 255), 
    c(grDevices::rgb(t(grDevices::col2rgb(grDevices::colors())), maxColorValue = 255))
  )]
  
  # Replace NA values by "": 
  def_names[is.na(def_names)] <- ""
  cus_names[is.na(cus_names)] <- ""
  
  # Combine both name vectors (to avoid duplicates): 
  def_names[def_names == cus_names] <- ""  # remove duplicates 
  def_names[!def_names == "" & !cus_names == ""] <- 
    paste0("/", def_names[!def_names == "" & !cus_names == ""]) # distinguish different names for the same color
  
  col_names <- paste0(cus_names, def_names)
  
  return(col_names)
  
} # get_col_names(). 

# ## Check:
# get_col_names(c("black", "white"))  # colors()
# get_col_names(pal_unikn_pref)  # unikn color palettes
# get_col_names(pal_unikn)  # colors with multiple names (prioritizing custom names)
# get_col_names(c("black", Grau, "white", Seeblau))  # combinations
# get_col_names(usecol(c("black", "white"), n = 5))  # derivations (AFTER evaluating usecol())


## ToDo: ------

# - Consider exporting utility functions `get_alpha()`, `col_distance()` and `col_distinct()`.

# - `col2hex()`: Improve by vectorizing arguments and considering transparency/alpha values (see 2 ToDos above). 
# - `plot_col()`: Add option for scaling multiple color palettes to fixed width rectangles. 
# - Add functions for translating to/from HCL values (see `HCL_color_exploration.Rmd`). 

## eof. ----------