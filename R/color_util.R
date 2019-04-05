## color_util.R  |  unikn
## ng | uni.kn | 2019 03 28
## ---------------------------

## Utility functions to access and plot color palettes. 

## 1. General functions: -------
## isHexCol: Helper function to detect hex-colors: -------- 

isHexCol <- function(color) {
  return(grepl(pattern = "#[0-9A-F]+", color))
}

## isCol: Helper function to detect any color:
isCol <- function(color) {
  return(isHexCol(color) | color %in% colors())
}

## Helper lookup_pal: A list of all unikn palette names  ------
# which is not changed by user input and generated on load:
# lookup_pal <- utils::apropos("pal_")  # get all unikn palettes.
# TODO: Where to put this?


## 2. Color getting functions: ------

# tst1 <- function(input) {
#   
#   print("parent:")
#   print(deparse(substitute(expr = input, env = parent.frame())))
# }
# 
# tst1(input = "a")
# tst1(input = c(a, 1, "b"))
# 
# tst2 <- function(input) {
#   
#   print(deparse(input))
#   input <- deparse(substitute(expr = input, env = parent.frame()))
#   tst1(input = input)
#   
#   
# }
# 
# a <- 1
# 
# tst2(input = a)
# 
# tst3 <- function(input) {
#   
#   z <- input
#   print(tst2(input = z))
# }
# 
# tst3(c(a, 1, "b"))

## parse_pal(): Parse a palette input -----------

parse_pal <- function(pal) {
  
  parenv <- parent.frame()  # get the calling environment. 
  
  # print("START...")
  
  ## Check if pal is legible (already a color palette): 
  vector_input <- tryCatch(
      {
      # message("VECTOR")
      all(sapply(pal, isCol))
      # print(colCheck)
      # all(colCheck)  # are all elements colors?
      },
    
    error = function(e) {
      
      return(FALSE)  # return FALSE if not all are colors. 
      
    },
    silent = TRUE
  )
  
  # print("PAL PARSE:")
  # print(pal)
  
  # print("VECTOR")
  # print(vector_input)
  
  if ( vector_input ) {  # if the input is a color vector (or list).
    
    # print("Regular color vector!")
    out <- pal
    
  } else {  # otherwise:
    
    # print("No vector input")
    
    ## Deparse the argument: 
    if ( identical(parenv , globalenv()) ) {  # if the calling environment is the global env:
      
      # print("From global")
      tmp <- noquote(deparse(substitute(pal)))
      
    } else {  # if the calling environment is another function:
      
      # print("From function")
      # print(parent.frame(n = 2))
      
      # print("GETTING IN PARSE:")
      # print(pal)
      # print(noquote(deparse(substitute(pal))))
        
      tmp <- noquote(deparse(substitute(expr = pal, env = parent.frame())))
      
      # print(tmp)
      
      tmp <- noquote(tmp)
      
      # print(tmp)
      
      }
      
      # tmp <- get("pal", parent.frame())
      # tmp <- noquote(deparse(substitute(expr = pal, env = parent.frame())))
      
      
      # TODO: If pal is an undefined object (e.g., bordeaux) the function crashes. 

    
    ## Printouts for testing: 
    # print("parse_pal:")
    # print(tmp)
    
    
    ## Split the input string; getting everything within the parentheses:
    if ( grepl("\\(", tmp) ) {  # only if any parenthesis exists.
      
      # tmp <- regmatches(tmp, gregexpr("(?<=\\().*?(?=\\))", tmp, perl = TRUE))[[1]]
      tmp <- sub(".*?\\(+(.*)\\).*", "\\1", tmp, perl=TRUE)
      # print("TMP:")
      # print(tmp)
      
      # .\*?   matches anything but stops at the first match of what follows
      # \\s+   matches one or more blank spaces
      # (.\*)  matches any number of characters, because it is in parentheses
      # it becomes a capture group and is stored in the variable \1
      # \\s    waits for another blank, this time, the last one
      # .*     matches anything after the last blank
      
    } 
    
    elem <- gsub(" |\"", "", unlist(strsplit(tmp, split = ",")))  
    # Split get elements of the input at ',' and remove whitespace and quotes.
    # print("ELEM:")
    # print(elem)
    
    ## Check, whether any element is warpped in one or more functions: 
    parens <- grepl("\\(", elem)   # are there any parentheses left?
    funs <- rep(NA, length(elem))  # initialize vector. 
    funs[parens] <- gsub(" *\\(.*", "", elem[parens])  # get any functions.
    ## TODO: Do so recursively? 
    # cat("FUNS: ", funs, "\n")
    
    ## Now remove the funs: 
    elem <- sub(".*?\\(+(.*)\\).*", "\\1", elem, perl = TRUE)
    # print("ELEM:")
    # print(elem)
    
    # Existence checks: ------------
    ## Now ask for every element, whether it exists:
    elemex <- sapply(elem, exists)
    
    if ( any(!elemex) ) {  # only if not all inputs have been resolved
      
      ## Those which are still unknown: are those colors? 
      elemex[!elemex] <- sapply(elem[!elemex], isCol)
      # print(elemex)
      
    }
    
    ## Prefix those which do not exist with "pal_
    
    if ( any(!elemex) ) {  # only if not all inputs have been resolved
      
      # print(paste0("pal_", noquote(elem[!elemex])))
      elem[!elemex] <- paste0("pal_", elem[!elemex])
      elemex[!elemex] <- sapply(elem[!elemex], exists)
      
    }
    
    # Handle undefined palettes: 
    if (!all(elemex)) {
      
      nex <- gsub("pal_", "", elem[!elemex])
      
      if ( length(nex) > 1) {
        
        errmsg <- paste0("Inputs ", paste0("\"", nex, "\"", collapse = ", "), " do not exist")
        
      } else {
        
        errmsg <- paste0("Input \"", nex, "\" does not exist")
        
      }
      
      stop(errmsg)
      
    }
    
    ## Get all palettes:
    out <- lapply(elem, function(x) if( isCol(x) ) x else get(x) )
    # print(out)
    
    ## Apply any previously detected functions: 
    # funs <- c("rev", "rev", NA)
    # funs <- rep(NA, 3)
    # out <- list(pal_bordeaux, pal_karpfenblau, "yellow")
    
    # If any function needs to be applied:
    if ( any(!is.na(funs)) ) {
      
      out[!is.na(funs)] <- apply(rbind(out, funs), MARGIN = 2, FUN = function(x) {
        if(!is.na(x$funs)) eval(call(x$funs, x$out)) # apply function to all non-NA elements. 
      })[!is.na(funs)] 
      
    }
    
    # print(out)
    
    ## Create the output: 
    out <- unname(out)  # finish the palette by removing upper level (palette) names.
    
  }
  
  ## TODO: Add missing names here?
  
  out <- unlist(out)

  # Provide missing names, by using the color:
  ix_nameless <- is.null(names(out)) | names(out) == ""
  names(out)[ix_nameless] <- out[ix_nameless]
  
  ## Return the elements:
  return(out)
  
}

# b <- parse_pal(pal = c("karpfenblau", bordeaux, "green"))
# b
# 
# parse_pal(pal = c("#BC7A8F", "lü"))
# parse_pal(c("la", "lü"))
# 
# parse_pal(c("bordeaux", "karpfenblau"))
# 
# parse_pal(c(rev(bordeaux), rev(pal_karpfenblau), "yellow"))  # TODO: Incorporate any functions.
# 
# parse_pal(rev(bordeaux))  # note: getting all parentheses includes this case!  (capture via, length 1?)
# ## Therefore: get outer function (is it c()? if ntot, execute / retain)
# 
# parse_pal(pal_bordeaux)
# 
# parse_pal(bordeaux)
# 
# c <- eval(call("rev", pal_bordeaux))
# c


## TODO: Add function compcol to compare color palettes with seepal? 


## getpal_key(): Get a palette or list of palettes by keyword: -------

getpal_key <- function(pal = "all", n = "all") {
  ## 1. Process the 'pal' argument: ------------------------
  
  ## 1.1 Getting by keyword: -----
  
  # print(deparse(substitute(pal)))
  
  keys <- c("all", "unikn_all", "all_unikn",  # all palettes
            "basic", "unikn_basic", "basic_unikn",  # the basic palettes. 
            "pair", "all_pair", "pair_all",  # all paired palettes. 
            "pref", "pref_all", "all_pref",  # the preferred palettes and gradients. 
            "grad", "grad_all", "all_grad"  # the gradients.
            )
  
  if ( !pal %in% keys ) {
    stop('Invalid keyword specified. Allowed keywords are 
                            c("all", "unikn_all", "all_unikn", "pref_all", "all_pref", "grad_all", "all_grad")')
  } else {
    
    if ( pal %in% keys[1:3] ) key <- "all"
    if ( pal %in% keys [4:6] ) key <- "basic"
    if ( pal %in% keys[7:9] ) key <- "pair"
    if ( pal %in% keys[10:12] ) key <- "pref"
    if ( pal %in% keys[13:15] ) key <- "grad"
    
  }

  
  # Get all color palettes with the prefix "pal_" from the environment.
    # all_pal <- utils::apropos("pal_")  # all palettes in the environment.
    # all_pals1 <-
    #   lapply(unikn:::all_pal_names1, get)  # all predefined palettes. 
    # ix_unikn <-
    #   grepl("pal_unikn", all_pal)  # index for all unikn palettes.
    # 
    # ## The three cases: -----
    pal_names <- switch(
      key,
      all = unikn:::all_palkn,
      basic = unikn:::all_palkn_basic,
      pair = unikn:::all_palkn_pair,
      pref = unikn:::all_palkn_pref,
      grad = unikn:::all_palkn_grad
    )

    # Get all palettes specified by keyword:
    lst_pal <- sapply(pal_names, get)
    
    # print(pal)
    
    # Indicator, whether these are color palettes:
    is_pal <- lapply(
      lst_pal,
      FUN = function(x) {
        if ( !typeof(x) %in% c("vector", "list") ) {
          is_color <- FALSE
        } else {
          is_color <- isHexCol(color = x)
        }
        return(all(is_color))  # are all entries colors?
        
      }
    )
    
    # Get the palettes:
    tmp <- lst_pal[unlist(is_pal)]
    
    # Check if palette is non-empty:
    if (length(tmp) == 0) {
      stop("No color palettes defined in the current environment.")
    }
    
    ## Order palettes:
    # if (pal == "all") {
    #   ix <-
    #     c(grep("pal_unikn", names(tmp)), grep("pal_signal", names(tmp)))
    #   
    #   tmp <- c(tmp[ix], tmp[-ix])
    # }
    
    ## If only color subsets should be displayed:
    if (n != "all" ) {

      # Get the subset of each palette , as defined in usecol():
      # print("TMP:")
      # print(tmp)
      out <- lapply(tmp, FUN = usecol, n = n)
      
    } else {
      
      out <- tmp  # if n n is specified return list as si.
      
    }
    
    pal_nm <- names(out)  # get palette names from listnames.
    
  
  return(out)
  
}

# getcol("bordeaux")
# getcol(c(rev("bordeaux"), rev(pal_karpfenblau), "yellow"))


## 3. Plotting functions: ------
## plot_shape: Plot a shape in a certain color: ------

plot_shape <- function(pos_x, pos_y,  # midpoint of the rectangle. 
                       col_fill,  # color for filling. 
                       col_brd = NA,
                       xlen = 1, ylen = 1,  # height of the axis lengths. 
                       shape = "rect",  # shape parameter. 
                       ...
) {
  
  ## Robustify inputs: -----
  
  ## TODO!
  
  ## Prepare inpust for vectorized solution? -----
  len_max <- max(c(length(pos_y), length(pos_x)))  # get length of longer position vector. 
  
  # Recycle all vectors to length of longest vector:
  pos_x <- rep(pos_x, length.out = len_max)
  pos_y <- rep(pos_y, length.out = len_max)
  xlen <- rep(xlen, length.out = len_max)
  ylen <- rep(ylen, length.out = len_max)
  
  
  ## For rectangular shape: -----
  if (shape == "rect") {
    
    # rect(xleft  = (box_x - xlen/2), ybottom = (box_y - ylen/2),
    #      xright = (box_x + xlen/2), ytop    = (box_y + ylen/2),
    #      col = unlist(col_fill),
    #      border = col_brd
    #      # lwd = box.lwd,
    #      # ...  # TODO: ... does not work?!
    # )
    
    symbols(x = pos_x, y = pos_y, rectangles = cbind(xlen, ylen),
            add = TRUE,
            inches = FALSE,  # use unit on x axis.
            fg = col_brd,  # line color.
            bg = col_fill  # filling.
    )
    
  }
  
  ## For circles:  -----
  if (shape == "circle") {
    
    symbols(x = pos_x, y = pos_y, circles = xlen/2,  # only uses xlen! 
            add = TRUE, 
            inches = FALSE,  # use unit on x axis. 
            fg = col_brd,  # line color. 
            bg = col_fill  # filling.
    )
  } 
  
}

## TODO: Even use function below?  It may be computationally more 
## efficient to only use the function above in a higher level function.

## plot_col: Plot a vector of colors as circles or rectangles: -------

plot_col <- function(x,  # a *vector* of colors to be plotted. 
                     ypos = 1,  # position on y axis. 
                     shape = "rect",
                     xlen = 1, ylen = 1, 
                     distance = 0,  # distance of shapes (to be taken from size). 
                     plot.new = TRUE,  # TODO: Set to false once done! 
                     ...
) {
  
  
  ## 1. Control inputs: -------------------------------------
  
  ## Robustify parameters:
  # TODO!
  
  ## Get key parameters:
  len_x <- length(x)
  
  ## Should a new plot be created? 
  if (plot.new) {
    
    if (distance > 0) {
      xlim <- c(0 - distance * len_x, len_x * (1 + distance))
    } else {
      xlim <- c(0, len_x)
    }
    
    
    plot(x = 0, type = "n", xlim = xlim, ylim = c(0, 2))  # create empty plot.
  } else {
    
    ## Check, whether a graphic device is available: 
    if (dev.cur() == 1) {
      stop("No graphic device to be plotted on.  Please open a plot or set plot.new to 'TRUE'.")
    }
  }
  
  ## 2. Calculate position parameters: ------------------------
  
  # Define positions of shape centers:
  pos_x <- 1:len_x - 0.5
  
  # change the distances:
  mid <- mean(pos_x)  # get midpoint. 
  add <- cumsum(rep(distance, sum(pos_x < mid)))  # values to be added to the first half. 
  sub <- add * (-1)  # values to be subtracted from the second half. 
  pos_x <- pos_x + if(len_x %% 2 == 0) c(rev(sub), add) else  # for even numbers no center position needed.
    c(rev(sub), 0, add)  # include the middle for uneven numbers. 
  
  ## 3. Plot all shapes: --------------------------------------
  # col_pos <- cbind(color = unlist(x), pos_x = pos_x)  # data to be plotted. 
  
  #apply(col_pos, MARGIN = 1, function(colors) {
  
  ypos <- rep(ypos, length.out = len_x)  # length out ypos to the length of x. 
  xlen <- rep(xlen, length.out = len_x)
  ylen <- rep(ylen, length.out = len_x)
  
  ## Plotting:
  plot_shape(pos_x = pos_x,  # x positions of the shapes. 
             pos_y = ypos,  # position in y dimension (given). 
             xlen = xlen, ylen = ylen,  # length of the axes. 
             col_fill = unlist(x),  # filling color. 
             shape = shape,  # shape parameter. 
             ...
  )
  #}
  # )
  # TODO: Is there a quicker (vectorized) way?
  ## Vectorize in previous function? (i.e., sapply over vectors of input values?)
  
} # plot_col end. 

## ToDo: ------

# - Add function compcol to compare color palettes with seepal? 
# - Various TODO items in code above. 

## eof. ----------