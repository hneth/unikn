% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/color_fun.R
\name{seecol}
\alias{seecol}
\alias{seepal}
\title{Plot color palettes (to see their colors).}
\usage{
seecol(
  pal = "unikn_all",
  n = "all",
  alpha = NA,
  hex = NULL,
  rgb = NULL,
  col_bg = NULL,
  col_brd = NULL,
  lwd_brd = NULL,
  grid = TRUE,
  title = NA,
  mar_note = NA,
  pal_names = NA,
  ...
)
}
\arguments{
\item{pal}{A single color palette (as a vector of colors), 
multiple color palettes (as a list), 
or a recognized keyword (as a character string). 
Default: \code{pal = "unikn_all"}. 

Recognized keywords are: 

\enumerate{

  \item \code{"unikn_all"}: All color palettes defined in \code{unikn}

  \item \code{"unikn_basic"}: All basic palettes. 
  
  \item \code{"pair_all"}: All palettes with pairwise colors. 
  
  \item \code{"pref_all"}: All preferred colors and their gradients. 
  
  \item \code{"grad_all"}: 

}

\code{seecol} does also recognize keywords (e.g., \code{"all_unikn"}) or 
keywords without \code{"unikn"} (e.g., \code{"basic"}).}

\item{n}{Number of colors to show or use. 
If \code{n} is lower or higher than the length of the current 
color palette \code{pal}, the color palette is reduced or extrapolated 
(using \code{grDevices::colorRampPalette}). 
Default: \code{n = "all"} (i.e., show all colors in palette).}

\item{alpha}{A factor modifying the opacity alpha 
(as in \code{\link{adjustcolor}}) to a value in \code{[0, 1]}. 
Default: \code{alpha = NA} (i.e., no modification of opacity).}

\item{hex}{Should HEX color values be shown? 
Default: \code{hex = NULL} (i.e., show HEX color values 
when there is sufficient space to print them).}

\item{rgb}{Should RGB color values be shown?
Default: \code{rgb = NULL} (i.e., show RGB color values 
when there is sufficient space to print them).}

\item{col_bg}{Color of plot background. 
Default: \code{col_bg = NULL}.}

\item{col_brd}{Color of shape borders (if shown). 
Default: \code{col_brd = NULL}.}

\item{lwd_brd}{Line width of shape borders (if shown). 
Default: \code{lwd_brd = NULL}.}

\item{grid}{Show grid in the color plot?
Default: \code{grid = TRUE}.}

\item{title}{Plot title (as a character string). 
Default: \code{title = NA} creates a default title.}

\item{mar_note}{Optional margin note (on bottom right). 
Default: \code{mar_note = NA} (i.e., no margin note).}

\item{pal_names}{Names of color palettes or colors 
(as a character vector). 
Default: \code{pal_names = NA} (for default names).}

\item{...}{Other graphical parameters 
(passed to \code{plot}).}
}
\description{
\code{seecol} provides an interface to plotting (or "seeing") 
the colors of a palette or comparing multiple color palettes.
}
\details{
\code{seecol} has two main modes, based on the contents of its \code{pal} argument:

\enumerate{

  \item if \code{pal = "unikn_all"} or a list of multiple color palettes: 

  Plot visual vectors of all current color palettes for comparing them. 

  \item if \code{pal} is set to a specific color palette (or a vector of multiple colors or color palettes):

  Plot the current color palette and optional details on its colors.

}

The \code{title} and \code{pal_names} arguments add control over plotted text labels. 
However, the length of a character vector provided to \code{pal_names} must correspond 
to the number of (custom) color palettes or colors.
}
\examples{
# See multiple color palettes: 
seecol()  # default: seecol(pal = "all") 

# See details of one color palette: 
seecol(pal_unikn)  # see a specific color palette

# Combining colors or color palettes: 
seecol(c(rev(pal_seeblau), pal_seegruen))        # combine color palettes
seecol(c(rev(pal_seeblau), "white", pal_pinky))  # combine color palettes and color names
seecol(c("black", "firebrick", "gold"))          # combine color names

# Using n to reduce or extend color palettes:
seecol(n =  3)  # viewing reduced ranges of all palettes
seecol(n = 12)  # viewing extended ranges of all palettes

seecol(pal_unikn, n = 5, 
       title = "Reduced version of pal_unikn (n = 5)")  # reducing pal_unikn
seecol(pal_seeblau, n = 8, 
       title = "Extended version of pal_seeblau (n = 8)")  # extending pal_seeblau

# Combining and extending color palettes: 
seecol(c(rev(pal_seeblau), "white", pal_bordeaux), n = 17, 
       title = "Diverging custom color palette (with 17 colors)")

# Defining custom color palettes:
pal_mpg <- c("#007367", "white", "#D0D3D4")  # mixing hex values and color names
names(pal_mpg) <- c("mpg green", "mpg white", "mpg grey")  # color names

pal_bdg <- usecol(c(Bordeaux, "gold"), n = 10)  # using usecol

# Viewing extended color palette: 
seecol(pal_mpg, n = 9, title = "Custom color palette of the Max Planck Society")

# Comparing (and labeling) custom color palettes: 
seecol(list(pal_mpg, pal_bdg, pal_unikn), n = 7,
       pal_names = c("Max Planck", "Bordeaux-Gold", "Uni Konstanz"), 
       title = "Comparing and labeling custom color palettes")

## Viewing color palettes from other packages: 
# library(RColorBrewer)
# seecol(brewer.pal(name = "RdBu", n = 11))  # viewing "RdBu" palette from RColorBrewer

## Extending color palettes:
# seecol(brewer.pal(name = "RdBu", n = 11), n = 15)  # extending palette to 15 colors

}
\seealso{
\code{\link{usecol}} for using a color palette; 
\code{\link{defpal}} to define new color palettes; 
\code{\link{grepal}} for finding named colors; 
\code{\link{shades_of}} to define shades of a given color; 
\code{\link{pal_unikn}} for the default uni.kn color palette.

Other color functions: 
\code{\link{grepal}()},
\code{\link{newpal}()},
\code{\link{shades_of}()},
\code{\link{usecol}()}
}
\concept{color functions}
