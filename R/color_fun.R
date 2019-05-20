## color_fun.R  |  unikn
## spds | uni.kn |  2019 05 20
## ---------------------------

## Define color-related functions 
## (e.g., for choosing from, plotting, and creating color palettes). 


## usecol: Use a color palette (as is): ---------  

# - Documentation: ---- 

#' Use a color palette.
#'
#' \code{usecol} allows using a color palette \code{pal} (e.g., for plotting).
#'
#' @param pal A color palette (as a vector of colors or color palettes).
#' Default: \code{pal = \link{pal_unikn}}.
#' 
#' @param n An integer value specifying the desired number of colors from the palette.
#' For all palettes defined within unikn by default it uses a pre-defined selection of 
#' colors if the desired number of colors is smaller than the available number.  
#' For all other palettes and \code{n} larger than \code{length(pal)} it exteds the palette using
#' \code{\link{colorRampPalette}}.
#' 
#' @param use_names A logical value indicating, whether colors should be returned as a named vector.
#' (defaults to \code{FALSE} for compatibility with ggplot)
#' 
#' @param use_col_ramp A logical value specifying, whether the default of using pre-selected colors
#' should be overridden and \code{\link{colorRampPalette}} should always be used to process \code{n}.
#'
#' @family color functions
#'
#' @seealso
#' \code{\link{seecol}} to plot color palettes; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette. 
#'
#' @export

# - Definition: ---- 

usecol <- function(pal = pal_unikn,
                   n = "all",
                   use_names = FALSE,  # should colors be returned as a named vector?
                   use_col_ramp = FALSE) {
  ## Parse the input:
  # Test, whether a pal defined in this environment is parsed properly: 
  # pal <- "pal_bordeaux"  # here it is used correctly; include the same snippet as in parse_pal?
  
  # print(deparse(substitute(expr = pal, env = parent.frame())))  # here this works. 
  
  parenv <- parent.frame()
  
  pal_inp <- tryCatch(
    
    {
      # print("USECOL PARSE:")
      # print(pal)
      # print(noquote(deparse(substitute(expr = pal))))
      suppressWarnings(parse_pal(pal = pal))
      # This is not totally nice, but it does the job...
    },
    
    error = function(e) {
      
      # seecol always triggers this part
      pal <- deparse(substitute(expr = pal, env = parenv))
      # print(pal)
      
      ## Remove slashes and quotes:
      pal <- gsub("\\\\", "", pal)
      pal <- gsub("\"", "", pal)
      
      ## Reparse with new input: 
      parse_pal(pal = pal)
      
    }
    # TODO: Catching this warning here crashes functionality...
    # , warning = function(w) {
    # 
    #   # print("WARNING")
    #   # message(w)
    #   # TODO: Here, the interrupted promise evaluation warning appears to occur!
    # 
    # }
  )
  
  
  ## Set n to length pal_inp, if n == "all": -----
  if (n == "all") { n <- length(pal_inp) }
  
  pal_def <- FALSE  # assume default, that an undefined palette is used.
  # Check this in the next step (this variable serves to control flow).
  
  ## Is the input one of the defined palettes?
  if ( !use_col_ramp ) {
    # execute, if not always the colorRamp should be used.
    
    ## Test whether equal to any palette:
    # print(all_pal_names1)
    all_pals1 <- lapply(all_palkn, get)  # get all palettes from the first part.
    # Three dots are neccessary if object is not exported!
    
    # print(pal_inp)
    
    
    pal_ix <-
      sapply(all_pals1, function(x) { return(isTRUE(all.equal(pal_inp, unlist(x)))) }
      )  # Test, whether specified palette is there.
    
    ## If none fits, test for reversed palettes:
    rev_pal <- FALSE  # should the palette be reversed?
    if (!any(pal_ix)) {
      pal_ix <-
        sapply(all_pals1, function(x)
          isTRUE(all.equal(rev(pal_inp), x)))
      if (any(pal_ix))
        rev_pal <- TRUE  # if palette is reversed, set pal_rev to TRUE.
      
    }
    
    
    # print("n:")
    # print(n)
    # print(pal_inp)
    
    
    ## If input fits with any palette:
    if ( any(pal_ix) & length(pal_inp) >= n) {
      
      pal_name <- all_palkn[pal_ix]  # get name of the palette.
      
      # print("DEFINED!")
      # print(pal_name)
      pal <- pal_inp  # redefine. 
      
      # Define sets of palettes:
      set1 <- pal_name %in% c("pal_peach",
                              "pal_peach",
                              "pal_petrol",
                              "pal_pinky",
                              "pal_karpfenblau",
                              "pal_bordeaux",
                              "pal_seegruen")
      set2 <- pal_name %in% c("pal_grau", "pal_seeblau")
      set3 <- pal_name %in% c("pal_unikn_web", "pal_unikn_ppt") 
      set4 <- pal_name %in% "pal_unikn"
      set5 <- pal_name %in% "pal_unikn_pair"
      set6 <- pal_name %in% c("pal_unikn_dark", "pal_unikn_light", "pal_unikn_pref") 
      set7 <- pal_name %in% "pal_signal"
      
      pal_set <- which(c(set1, set2, set3, set4, set5, set6, set7))  # define a set number.
      
      ## Determine the color output:
      out_col <- switch(pal_set,
                        ## Get the indices for pal_set:
                        # TODO: WHY reverse?
                        # Set1: -----
                        switch(n,
                               pal[4],
                               pal[c(4, 2)],
                               pal[c(5, 3, 1)],
                               pal[c(5, 4, 2, 1)],
                               pal),
                        # Set2: -----
                        switch(n,
                               pal[3],
                               pal[c(4, 2)],
                               pal[c(5, 3, 1)],
                               pal[c(5, 4, 2, 1)],
                               pal),
                        # Set3: -----
                        switch(n,
                               pal[2],  # 1
                               pal[c(1, 3)],  # 2
                               pal[c(1, 3, 5)],  # 3
                               pal[c(1, 3, 5, 10)],  # 4
                               pal[c(1, 3, 5, 8, 10)],  # 5
                               pal[c(1, 2, 4, 5, 8, 10)],  # 6
                               pal[c(1, 2, 4, 5, 7, 9, 10)],  # 7
                               pal[c(1, 2, 3, 4, 5, 7, 9, 10)],  # 8
                               pal[c(1, 2, 3, 4, 5, 7, 8, 9, 10)],  # 9
                               pal),
                        # Set4: -----
                        switch(
                          n,
                          pal[c("seeblau3")],
                          # 1 preferred color
                          pal[c("seeblau4", "seeblau2")],
                          # 2
                          pal[c("seeblau4", "seeblau2", "white")],
                          # 3
                          pal[c("seeblau4", "seeblau2", "white", "black")],
                          # 4
                          pal[c("seeblau4", "seeblau2", "white", "seegrau3", "black")],
                          # 5
                          pal[c("seeblau4",
                                "seeblau3",
                                "seeblau1",
                                "white",
                                "seegrau3",
                                "black")],
                          # 6
                          pal[c("seeblau4",
                                "seeblau3",
                                "seeblau1",
                                "white",
                                "seegrau2",
                                "seegrau4",
                                "black")],
                          # 7
                          pal[c(
                            "seeblau4",
                            "seeblau3",
                            "seeblau2",
                            "seeblau1",
                            "white",
                            "seegrau2",
                            "seegrau4",
                            "black"
                          )],
                          # 8
                          pal[c(
                            "seeblau4",
                            "seeblau3",
                            "seeblau2",
                            "seeblau1",
                            "white",
                            "seegrau1",
                            "seegrau2",
                            "seegrau3",
                            "black"
                          )],
                          # 9
                          pal[c(
                            "seeblau5",
                            "seeblau4",
                            "seeblau3",
                            "seeblau2",
                            "seeblau1",
                            "white",
                            "seegrau1",
                            "seegrau2",
                            "seegrau3",
                            "black"
                          )],
                          # 10
                          pal  # all 11 colors of pal_unikn (previously known as pal_unikn_plus) 
                        ),
                        # Set 5: -----
                        pal[c("seeblau5", "seeblau3", "pinky4", "pinky2", "petrol4", 
                                         "petrol2", "bordeaux4", "bordeaux2", "seegruen4", "seegruen2",
                                         "peach4", "peach2", "karpfenblau4", "karpfenblau2", "grau2", "grau1")[1:n]],
                        # Set 6: -----
                        pal[1:n],
                        # Set 7: -----
                        pal[c("signal1", "signal3", "signal2")[1:n]]
                        # Set 8: -----
                        )
      
      # print("OUT_COL")
      # print(out_col)
      
      ## Currently not implemented:
      # pal_unikn_dark, pal_unikn_light, pal_unikn_pair, pal_unikn_pref.
      
      if (rev_pal) {
        out_col <-
          rev(out_col)
      }  # if palette was reversed, reverse result as well.
      
      pal_def <- TRUE  # set flag that palette is defined.
      
    }
    
  }
  
  # TODO: n of other palettes: 
  # pal_unikn_pair:
  # seeblau5, seeblau3; pinky4, pinky2; petrol4, petrol2; bordeaux4, bordeaux2; seegruen4, seegruen2; peach4, peach2; karpfenblau4, karpfenblau2; grau2, grau1. 
  
  # pal_unikn_light:
  # take first n
  
  # pal_signal:
  # red (1), green (3), signal (2) 
  
  # 
  
  
  ## If no defined palette is used or the number exceeds the number of colors simply use colorRamp:
  if ( !pal_def ) {
    # print(pal_inp)
    
    ## Decide, whether to use colorRamp or not:
    if (n == length(pal_inp)) {
      out_col <- pal_inp
      
    } else {
      out_col <-
        colorRampPalette(pal_inp)(n)  # use the colorRamp (this swallows all names).
      
    }
    
  }
  
  ## Give the palette a name (as comment attribute):
  # print(pal_def)
  # print(out_col)
  comment(out_col) <- ifelse(pal_def, pal_name, "custom")
  
  # print("NAMES")
  # print(out_col)
  # print(names(out_col))
  # print(comment(out_col))
  
  ## Do a quick name search if no names are given:
  if ( all(is.null(names(out_col))) ) {
    
    tst <- out_col  # c(rev(pal_bordeaux), "yellow")
    
    # Names from defined kn palettes:
    kn_names <-  names(unlist(all_pals1))[match(tst, unlist(all_pals1))]
    # TODO: Not necessarily in the correct order.
    
    col_names <- colors()[match(
      rgb(t(col2rgb(tst)), maxColorValue = 255), 
      c(rgb(t(col2rgb(colors())), maxColorValue = 255))
    )]
    
    kn_names[is.na(kn_names)] <- ""
    col_names[is.na(col_names)] <- ""
    
    names(out_col) <- paste0(kn_names, col_names)
    
    
  }

  # Remove names if required (default):
  if ( !use_names ) { out_col <- unname(out_col) }
  
  return(out_col)
  
}  # usecol end.

## Check:
# usecol(pal_bordeaux, n = 2)  # defined palette. 
# usecol(pal_unikn, n = 4)  # defined palette. 
# usecol(pal_unikn_pair)  # defined palette with all colors used. 
# usecol(pal_unikn, n = 11)  # defined palette, but n > length. 
# usecol(rev(pal_bordeaux))  # using a reversed palette. 
# usecol(rev("bordeaux"))  # using reversed, misspecified palette (reversal does not work properly). 
# usecol(c(bordeaux, pal_grau))  # use mixed palette.
# usecol(c("yellow", pal_karpfenblau))  # use palette with own color. 
# usecol(c(bordeaux, pal_grau), n = 3)  # use abbreviated mixed palette.


## seecol: Plot the colors of a palette or multiple palettes: ---------- 

# - Documentation: ---- 

#' Plot color palettes (to see their colors).
#'
#' \code{seecol} provides an interface to plotting (or "seeing") 
#' the colors of a palette or comparing multiple color palettes. 
#' 
#' \code{seecol} has 2 main modes, based on the contents of its \code{pal} argument:
#' 
#' \enumerate{
#'
#'   \item if \code{pal = "unikn_all"} (or a list of multiple color palettes): 
#'
#'   Plot visual vectors of all current color palettes for comparing them. 
#'
#'   \item if \code{pal} is set to a specific color palette (or a vector of multiple colors or color palettes):
#'
#'   Plot the current color palette and optional details on its colors.
#'
#' }
#' 
#' @param pal A color palette (as a vector of colors), 
#' a character string recognized as keyword by seecol or
#' multiple palettes specified as list. 
#' Default: \code{pal = "unikn_all"}. 
#' 
#' Recognized keywords are: 
#' 
#' \enumerate{
#'
#'   \item \code{"unikn_all"}: All color palettes defined in \code{unikn}
#'
#'   \item \code{"unikn_basic"}: All basic palettes. 
#'   
#'   \item \code{"pair_all"}: All palettes with pairwise colors. 
#'   
#'   \item \code{"pref_all"}: All preferred colors and their gradients. 
#'   
#'   \item \code{"grad_all"}: 
#'
#' }
#' 
#' \code{seecol} does also recognize reverse keywords (e.g., \code{"all_unikn"}) or 
#' keywords without \code{"unikn"} (e.g., \code{"basic"}).
#' 
#' @param n Number of colors to show or use. 
#' If \code{n} is lower or higher than the length of the current 
#' color palette \code{pal}, the color palette is reduced or extrapolated 
#' (using \code{grDevices::colorRampPalette}). 
#' Default: \code{n = "all"}. 
#' 
#' @param hex Should HEX color values be shown?
#' Default: \code{hex = NULL} (i.e., show HEX color values 
#' when there is sufficient space to print them). 
#' 
#' @param rgb Should RGB color values be shown?
#' Default: \code{rgb = NULL} (i.e., show RGB color values 
#' when there is sufficient space to print them). 
#' 
#' @param col_brd Color of box borders (if shown). 
#' Default: \code{col_brd = NULL}. 
#' 
#' @param grid Show grid in the color plot?  
#' Default: \code{grid = TRUE}. 
#' 
#' @param ... Other graphical parameters 
#' (passed to \code{plot_col}). 
#' 
#' @examples
#' # See all color palettes: 
#' seecol()  # same as seecol(pal = "all") 
#' 
#' # See details of a color palette: 
#' seecol(pal_unikn)  # see a specific color palette
#' 
#' # Combining colors or color palettes: 
#' seecol(c(rev(pal_seeblau), pal_seegruen))        # combine color palettes
#' seecol(c(rev(pal_seeblau), "white", pal_pinky))  # combine color palettes and color names
#' seecol(c("black", "firebrick", "gold"))          # combine color names
#' 
#' # Using n to reduce or extend color palettes:
#' seecol(n =  3)  # viewing reduced ranges of all palettes
#' seecol(n = 12)  # viewing extended ranges of all palettes
#' 
#' seecol(pal_unikn, n = 5)     # reducing/selecting from pal_unikn
#' seecol(pal_seeblau, n = 10)  # extending pal_seeblau
#' 
#' # Combining and extending color palettes: 
#' seecol(c(rev(pal_seeblau), "white", pal_bordeaux), n = 17)
#' 
#' ## Viewing color palettes from other packages: 
#' # library(RColorBrewer)
#' # seecol(brewer.pal(name = "RdBu", n = 11))  # viewing "RdBu" palette from RColorBrewer
#' 
#' ## Extending color palettes:
#' # seecol(brewer.pal(name = "RdBu", n = 11), n = 15)  # extending palette from 11 to 15 colors
#' 
#' @family color functions
#' 
#' @aliases seepal 
#'
#' @seealso 
#' \code{\link{usecol}} to use a color palette; 
#' \code{\link{pal_unikn}} for the default uni.kn color palette.
#'
#' @import graphics 
#' @import grDevices 
#' @import utils
#' 
#' @export

# - Definition: ------- 

seecol <- function(pal = "unikn_all",     # which palette to output?
                   n = "all",
                   hex = NULL,      # determine by crowdedness, whether hex values should be shown in detail view.
                   rgb = NULL,      # determine, whether rgb values should be shown in detail view (defaults to TRUE)
                   col_brd = NULL,  # border color of the boxes. 
                   grid = TRUE,     # show grid? 
                   ...              # additional arguments to plot.default().
) {
  
  ## 0. Preparations: ----- 
  
  op <- par(no.readonly = TRUE)  # save original plotting settings.
  keys <- c("all", "unikn_all", "all_unikn",  # all palettes
            "basic", "unikn_basic", "basic_unikn",  # the basic palettes. 
            "pair", "all_pair", "pair_all",  # all paired palettes. 
            "pref", "pref_all", "all_pref",  # the preferred palettes and gradients. 
            "grad", "grad_all", "all_grad"  # the gradients.
  )
  
  # Robustify inputs:
  
  ## Plotting parameters: ----
  if ( !(is.null(hex) | is.logical(hex)) ) stop("Please specify a valid value for 'hex'.")
  if ( !(is.null(rgb) | is.logical(rgb)) ) stop("Please specify a valid value for 'rgb'.")
  
  ## Check, whether keyword is used:
  by_key <- tryCatch(
    { 
      all(pal %in% keys)
    },
    error = function(e) {
      FALSE
    },
    silent = TRUE
  )
  
  
  ## Check, whether input is a list: 
  compare <- tryCatch(
    {
      is.list(pal) & any(lapply(pal, length) > 1)   # get length of each component. 
    },
    error = function(e) {
      FALSE
    },
    silent = TRUE
  )
  
  
  ## Getting a list of palettes by keyword: 
  if ( by_key ) {
    
    ## Define title given keyword:
    if ( pal %in% c("all", "unikn_all", "all_unikn") ) title <- "See all unikn color palettes"
    if ( pal %in% c("basic", "unikn_basic", "basic_unikn")) title <- "See all basic unikn color palettes"
    if ( pal %in% c("pair", "all_pair", "pair_all")) title <- "See all pairwise unikn color palettes"
    if ( pal %in% c("pref", "pref_all", "all_pref")) title <- "See all preferred unikn colors and gradients"
    if ( pal %in% c("grad", "grad_all", "all_grad")) title <- "See all unikn color gradients"
    
    pal_tmp <- getpal_key(pal = pal, n = n)  # get the color by key.
    
  } else if ( compare ){
    
    pal_tmp <- lapply(X = pal, usecol, n = n, use_names = TRUE)  # get all palettes seperately. 
    
    title <- "Compare a custom set of color palettes"
    
    names(pal_tmp) <- lapply(pal_tmp, comment)  # assign names from comment attribute. 
    
    ## Check for names: 
    if ( is.null(names(pal_tmp)) ) {
      
      names(pal_tmp) <- paste0("pal", 1:length(pal_tmp))
      
    } else if ( any(names(pal_tmp) == "custom") ) {
      
      names(pal_tmp)[names(pal_tmp) == "custom"] <- paste0("pal", which(names(pal_tmp) == "custom"))
      
    }
    
  } else {  # if no keyword or list for comparison was given:
    
    ## Get palette:
    pal_tmp <- usecol(pal = pal, n = n, use_names = TRUE)  # create a list of length 1.
    # print("PAL:")
    # print(pal_tmp)
    # print(comment(pal_tmp))
    
    nm <- ifelse(length(unlist(pal_tmp)) == 1 | comment(pal_tmp) == "custom", 
                 "", paste0(" ", comment(pal_tmp)))   
    
    pl <- ifelse(length(unlist(pal_tmp)) == 1, names(pal_tmp), "palette")  # classify as palette or not.
    
    cst <- ifelse(comment(pal_tmp) == "custom" & length(unlist(pal_tmp)) != 1, "custom ", "")
    
    title <- paste0("See ", cst, "color ", pl, nm)  # assemble title. 
    
    pal_tmp <- list(pal_tmp)  # now list the palette and leave the comment attribute.
    
  }
  
  if (n != "all") {
    title <- paste0(title, " (n = ", n, ")")
  }
  
  ## 2. Plotting parameters: ------ 
  
  ## Plotting preparations: 
  distance <- 0   # set distance of boxes?
  xlen <- 1       # set x length of color boxes.
  # TODO: Allow user to set these inputs? 
  
  # Get maximum number of colors:
  max_ncol <- max(unlist(lapply(pal_tmp, FUN = length)))
  
  # Determine xlim based on distance, maximum number of colors, and box length:
  xlim <- c(0 - distance, (1 + distance) * xlen) * max_ncol * xlen
  # print(paste0("xlim = ", xlim))
  
  # Determine ylim as number of colors in the palette:
  ylim <- c(0, length(pal_tmp) + 0.2)   
  # print(paste0("ylim = ", ylim))
  
  # Bind palette(s) to their color index:
  pal_mat <- cbind(pal_tmp, length(pal_tmp):1)  # TODO: Note, that a single palette needs to be a list of length 1!
  
  
  ## 3. Plotting: ------ 
  
  ## 3.1 Plot an overview for a list of palettes: 
  ## TODO: How to handle inputs of multiple palettes?  Merge them or display them for comparison.
  ## Possible solution: (a) 1 list entry --> details; (b) more than 1 list entry --> comparison:
  if ( length(pal_tmp) > 1 ) {
    
    # Set margins:
    par(mar = c(3, 6, 3, 1))
    
    # Create empty plot:
    plot(x = 0, type = "n", xlim = xlim, ylim = ylim,
         xaxt = "n", yaxt = "n",  # hide axes.
         xlab = "", ylab = "", 
         main = title,
         bty = "n")  
    
    # Grid:
    # grid <- TRUE  # 4debugging
    
    if (grid) {

      x_vals <- 0:max(ylim)
      
      dims <- max(ylim) * max_ncol
      grfac <- c(3, 4, 5)[c(dims < 100, dims > 100 & dims < 150, dims > 150)]
        #  min(max(ylim) / 5, 5)  # ensure an appropriate number of vertical lines using gridfactor. 
      y_vals <- 1:max_ncol
      y_vals <- y_vals[(y_vals %% grfac) == 0]  # steps of 5
      y_vals <- y_vals - xlen/2
      
      abline(h = x_vals,
             v = y_vals,
             col = grey(.50, .50),
             lwd = .5)
      
    } # if (grid) etc. 
    
    ## Dynamic updating of ylen on number of palettes: 
    ylen <- 0.8  # (0.8 / length(unikn:::all_palkn)) * length(pal_tmp)
    
    # Add the color vectors:
    apply(pal_mat, MARGIN = 1, FUN = function(row) {
      # print(row[[2]])
      plot_col(x = row[[1]], ypos = row[2], plot.new = FALSE, ylen = ylen, col_brd = col_brd, lwd = 0)
    })
    # TODO: Can I allow to plot the matrix in a vectorized way (unlisting somewhere)?
    
    # Add color names and indices:
    cex_lbl <- .90
    
    pal_nm <- names(pal_tmp)  # get palette names.
    # print(paste0("pal_nm = ", pal_nm))  # 4debugging
    
    text(x = 0, y = 1:length(pal_tmp), labels = rev(pal_nm), 
         cex = cex_lbl, pos = 2, xpd = TRUE,
         offset = 1  # 1 character.
    )
    
    txt_ind <- paste0("[", 1:max_ncol, "]")
    cex_ind <- par("cex")
    wdth_ind <- sum(strwidth(txt_ind, cex = cex_ind))
    pos_ind <- seq(0.5, (max_ncol - 0.5), by = 1)
    while (wdth_ind > xlim[2]) {
      
      txt_ind <- txt_ind[seq(1, length(txt_ind), by = 2)]  # only show every second index.
      pos_ind <- pos_ind[seq(1, length(pos_ind), by = 2)]
      wdth_ind <- sum(strwidth(txt_ind, cex = cex_ind))  # is the width small enough?
      
    }
    
    # Color indices:
    cex_ixs <- .80
    yix <- -0.02 * length(pal_tmp)  # dnamic positioning of indices. 
    
    text(x = pos_ind, y = yix, labels = txt_ind, pos = 1, xpd = TRUE,
         cex = cex_ixs, col = grey(0, 2/3))
    # text(x = seq(0.5, (max_ncol - 0.5), by = 1), y = -1, 
    #      labels = paste0("[", 1:max_ncol, "]"), pos = 3, xpd = TRUE,
    #      cex = (cex_lbl - .10))
    
  } else {  # if length(pal_tmp) list is NOT > 1:
    
    
    # 3.2 Detailed view of 1 palette: ------ 
    
    names(pal_tmp) <- NULL  # remove first order names! 
    
    pal_tmp <- unlist(pal_tmp)  # HERE!
    # TODO: This essentially changes the length of the color vector.  Find better solution!
    
    # Set margins:
    par(mar = c(3, 2, 3, 1))
    
    # Create empty plot:
    plot(x = 0, type = "n", xlim = xlim, ylim = c(-1, 2),
         xaxt = "n", yaxt = "n",  # hide axes.
         xlab = "", ylab = "", 
         main = title,
         bty = "n")
    
    # Text elements:
    txt_pos <- seq(0.5, length(pal_tmp) - 0.5)
    
    # y positions: 
    y_names <- 1.5
    y_circ  <- 1.2 
    y_rect  <- 0.6
    y_rgb   <- c(-0.50, -0.65, -0.80)
    
    # Grid:
    if (grid) {
      
      abline(# h = c(c(0.6, 1.2, 1.6, -0.1), c(y_rgb, -0.95) + 0.07),
        # h = c(-.88, -.43, -.10, y_rect, y_circ),
        h = c(-1, -.05, y_rect, y_circ),
        # v = txt_pos,
        col = grey(.5, .5),
        lwd = .3)
      
      xpos <- txt_pos
      # print(xpos)
      if ( length(xpos) > 10 ) xpos <- xpos[xpos %% 5 == 0.5]  # steps of five.
      
      segments(
        x0 = xpos,
        y0 = 2, y1 = -0.2,
        col = grey(.5, .5),
        lwd = .3
      )
      
    } # if (grid) etc. 
    
    # Find cex so that it is as large as possible:
    cex_lim <- 0.7  # lower limit for cex. 
    
    # Determine whether to display hex values:
    cex_hex <- 0.9  # was par("cex")
    wdth_hex <- strwidth(" #XXXXXX", cex = cex_hex) * max_ncol + strwidth("Hex: ")  # is the width small enough?
    
    while (wdth_hex > xlim[2]) {
      
      cex_hex <- cex_hex - 0.1
      wdth_hex <- strwidth(" #XXXXXX", cex = cex_hex) * max_ncol + strwidth("Hex: ")  # is the width small enough?
      
    }
    
    # print(cex_hex)  # 4debugging
    
    # If hex is NULL, determine based on width and max cex.
    # Otherwise use the provided value: 
    if ( is.null(hex) ) {
      
      hex <- ifelse(wdth_hex > xlim[2] | cex_hex < cex_lim, FALSE, TRUE)  # test, whether hex can be displayed.
      
    } 
    
    # Determine, whether to display rgb values:
    cex_rgb <- 0.9
    wdth_rgb <- strwidth(" 999 ", cex = cex_rgb) * max_ncol
    while (wdth_rgb > xlim[2]) {
      
      cex_rgb <- cex_rgb - 0.1
      wdth_rgb <- strwidth(" 999 ", cex = cex_rgb) * max_ncol  # is the width small enough?
      
    }
    
    # If rgb is NULL, determine based on width and max cex.
    # Otherwise use the provided value: 
    if ( is.null(rgb) ) {
      rgb <- ifelse(wdth_rgb > xlim[2] | cex_rgb < cex_lim, FALSE, TRUE)
    }
    
    # Plot rectangles:
    plot_col(x = pal_tmp, ypos = y_rect, plot.new = FALSE, ylen = 0.5, col_brd = col_brd, lwd = 1,
             ...
    )
    
    # Plot circles:
    circle_len <- ifelse(((xlim[2] / 10) < 0.7), (xlim[2] / 10), .70)

    plot_col(x = pal_tmp, ypos = y_circ, plot.new = FALSE, xlen = circle_len, shape = "circle",
             ...
    )
    
    # Color names:
    col_names <- names(pal_tmp)
    # print(paste0("col_names = ", col_names))  # 4debugging
    # col_names[is.null(col_names)] <- as.character(col_names[is.null(col_names)]) 
    # print(paste0("col_names = ", col_names))  # 4debugging
    
    y_names <- y_circ + (circle_len * 4 / max_ncol)  # determine y_names based on circle position and size.
    
    text(x = txt_pos, y = y_names, labels = col_names, # pos = 3, 
         srt = 45, xpd = TRUE, offset = 1, cex = 0.8, 
         adj = c(0, 0))
    
    # TODO: Spacing of indices:
    txt_ind <- paste0("[", 1:length(pal_tmp), "]")
    cex_ind <- par("cex")
    wdth_ind <- sum(strwidth(txt_ind, cex = cex_ind))
    pos_ind <- txt_pos
    
    while (wdth_ind > xlim[2]) {
      
      txt_ind <- txt_ind[seq(1, length(txt_ind), by = 2)]  # only show every second index.
      pos_ind <- pos_ind[seq(1, length(pos_ind), by = 2)]
      wdth_ind <- sum(strwidth(txt_ind, cex = cex_ind))  # is the width small enough?
      
    }
    
    # Color indices:
    cex_ixs <- .80
    text(x = pos_ind, y = 0, labels = txt_ind, pos = 3, xpd = TRUE,
         cex = cex_ixs, col = grey(0, 2/3))
    
    # Hex values:
    if (hex) {
      
      ## Convert to hex if not already given in this format: 
      if (!all(isHexCol(pal_tmp))) { 
        pal_tmp <- rgb(t(col2rgb(pal_tmp)), maxColorValue = 255)
      }
      
      yhex <- -0.25
      
      # Plot the values: 
      text(x = 0, y = yhex, labels = "Hex:", font = 2, pos = 2, offset = 0, xpd = TRUE, 
           cex = cex_hex)
      
      text(x = txt_pos, y = yhex, labels = pal_tmp, pos = NULL, xpd = TRUE,
           cex = cex_hex, srt = 0)
      
    } # if (hex) etc.
    
    # RGB values:
    if (rgb) {
      
      text(x = rep(0, 3),
           y = y_rgb,
           labels = c("R:", "G:", "B:"), font = 2, 
           pos = 2, offset = 0, xpd = TRUE,
           cex = cex_rgb)
      
      text(x = matrix(rep(txt_pos, 3), nrow = 3, byrow = TRUE),
           y = matrix(rep(y_rgb, length(txt_pos) + 1), nrow = 3),
           labels = col2rgb(pal_tmp),
           pos = 2, offset = -.67, xpd = TRUE,
           cex = cex_rgb)
      
    } # if (rgb) etc.
    
  }  # if (length(pal_tmp) > 1) etc. 
  
  # Reset plotting parameters: 
  par(op)
  
  # Invisibly return pal_tmp palette(s):
  invisible(pal_tmp)
  
} # seecol end. 


# - Check: ------- 

## (a) Multiple palettes: 

# seecol("all")
# seecol("all", col_brd = grey(0, .25), lwd = .1)
# seecol("unikn_all")  # all basic palettes. 
# seecol("grad_all")  # all gradients. 

## Return a subset or extended set of colors:
# seecol(pal = "all", n = 2)  
# seecol(pal_bordeaux, n = 2)
# seecol(rev(pal_bordeaux), n = 10)
# seecol(pal = "unikn_all", n = 20)  # all basic palettes extended to 20 colors.

## Critical calls: 
# seecol("all", n =  4)  
# seecol("all", n = 12) 

## 2 palettes: 
# seecol(c(rev(pal_unikn_light), pal_unikn_dark), hex = TRUE)

# ToDo: 
# - group in 2 sets: "unikn" vs. "others"
# - allow grep for name components (e.g., "see", or "unikn")? 
# - allow grep for palette properties (e.g., > 5 colors)? 
# - default/random palette?

## (b) 1 palette: 

# seecol(pal_unikn)  # allow both, palette objects and 
# seecol("pal_unikn")  # palette names;
# seecol(unikn_pair)  # allow also abbreviated palette objects w/o pal_ prefix. 
# seecol(pal_unikn_plus, hex = TRUE)
# seecol(c("blue", "green"))  # allow any color vector. 

# seecol(pal = "seblau")  # raise error.

## Return a subset of colors:
# seecol(pal = pal_petrol, n = 3)
# seecol(pal = pal_unikn_light, n = 3)

## Critical calls:
# seecol(pal_unikn, n =  4)  # works (4 selected)
# seecol(pal_unikn, n = 20)  # fails (max n = 11 of pal_unikn_plus selected)

# seecol(pal_bordeaux, n =  3)  # works (3 selected)
# seecol(pal_bordeaux, n = 10)  # fails (max n = 5 returned)

# seecol(pal_unikn_light, n = 3)   # mostly works (first 3 chosen)
# seecol(pal_unikn_light, n = 10)  # mostly fails (max n = 10 returned)


## (c) Creating new palettes: 

# see colorRampPalette() to extend/stretch color palettes
# ?: What happens when only subsets are selected
#    (a) averages between min and max color?
#    (b) choose existing colors for as long as possible

## Color gradients: 
# gradient <- usecol(c(rev(pal_seeblau), "white", pal_peach))
# seecol(gradient, n = 25)

## ToDo: 2 main cases: 
# - n < available colors in palettes: Select some from available colors (rather than generating new ones)
# - n > available colors in palettes: Extend/stretch color palettes (rather than individual colors)

## Currently to be commented out for building (probably no palettes loaded before the function is executed):
# a <- seecol(pal = "all")  # return all palettes.
# a

# b <- seecol(pal = pal_unikn_pair)  # return one long palette (hex not displayed by default.)
# seecol(pal = pal_unikn_pair, hex = TRUE)  # display hex independent of fontsize.
# seecol(pal = pal_unikn_pair)  

# c <- seecol(pal = pal_bordeaux, hex = TRUE)


# rmp <- colorRampPalette(c(pal_seeblau, "white", pal_grau, pal_peach))

# seecol(rmp(.5))
# seecol(c("black", "yellow", "green"))

## (d) Viewing palettes from other packages:
# library(RColorBrewer)
# seecol(brewer.pal(name = "RdBu", n = 11))  # viewing "RdBu" palette from RColorBrewer

## Extending color palettes:
# seecol(brewer.pal(name = "RdBu", n = 11), n = 15)


# ToDo: Provide additional info on a color palette: ------ 

# ## (1) Values:
# RColorBrewer::brewer.pal(n = 5, name = "Greens")
# as.character(RColorBrewer::brewer.pal(n = 5, name = "Greens")) 
# # ???: How to print values in labels of graphs?
# 
# ## (2) Color names:
# names(RColorBrewer::brewer.pal(n = 5, name = "Greens"))  # => no names!
# 
# ## (3) RGB values:
# col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens"))
# 
# col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens"))[, 5]  # RGB of 5th color
# 
# col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens"))[1, ]  # R values
# col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens"))[2, ]  # G values
# col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens"))[3, ]  # B values
# 
# ## (4) HSV values: 
# col_rgb <- col2rgb(RColorBrewer::brewer.pal(n = 5, name = "Greens")[5])
# col_rgb
# 
# rgb2hsv(r = col_rgb[1], g = col_rgb[2], b = col_rgb[3]) 


## ToDo: ------

# Create 1 bottleneck function "seecol" that provides a user-interface to all color palettes:
# - plot a palette (by name, nr, or random)
# - plot n palettes to compare palettes (...)
# - choose 1 (preferred, random) color from a palette
# - choose n good colors from a palette
# - extend (stretch and mix) palettes to define new palettes
# - modify color values and palettes (by transparency etc.)

# (1) Functions: 
#   - improve function to show colors (and options for full color info: nr, name, HEX, RGB, hsv)
#   - improve function use_pal_n to get n (good) colors (and consider integrating it into palettes)
#   - provide color gradient function(s) (to return an arbitrary number of colors)

# (+) Additional elements:
#   - add a function to get a boX in seeblau (or another fill color)
#   - ggplot_addon: provide complete ggplot theme(s)
#   - text elements: heading and underline (with seeblau color defaults)
#   - fonts?
#   - logo: Merken-boX or hexagon in seeblau with letter "R"


## eof. ----------