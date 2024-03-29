% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/color_def_2.R
\docType{data}
\name{pal_unikn_pref}
\alias{pal_unikn_pref}
\title{uni.kn color palette of preferred colors (9 colors)}
\format{
An object of class \code{data.frame} with 1 rows and 9 columns.
}
\usage{
pal_unikn_pref
}
\description{
\code{pal_unikn_pref} provides an additional uni.kn color palette  
that collects the preferred color of each palette 
as a data frame containing 9 (or 8 + 1) colors.
}
\details{
The colors are arranged in a sequence that provides 
high contrasts between adjacent colors. 

Note that the (alert) color \code{\link{Signal}} is 
not a preferred color according to the official color 
definition.

See \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/} for details.
}
\examples{
pal_unikn_pref
dim(pal_unikn_pref)  # 1 9

# Access by position:
pal_unikn_pref[1]    # color Seeblau (as df)
pal_unikn_pref[[1]]  # color value "#59C7EB" 

# Access by name: 
pal_unikn_pref["Seeblau"]   # color "seeblau3" (as df) 
pal_unikn_pref[["Seeblau"]] # color value "#59C7EB" 

# Viewing/using color palette:
seecol(pal_unikn_pref)
demopal(pal_unikn_pref, type = "mosaic", main = "Preferred colors of Konstanz University")

}
\seealso{
\code{\link{pal_unikn}} for the default uni.kn color palette; 
\code{\link{seecol}} for viewing and comparing color palettes;
\code{\link{usecol}} for using color palettes.

Other color palettes: 
\code{\link{pal_bordeaux}},
\code{\link{pal_grau}},
\code{\link{pal_karpfenblau}},
\code{\link{pal_peach}},
\code{\link{pal_petrol}},
\code{\link{pal_pinky}},
\code{\link{pal_seeblau}},
\code{\link{pal_seegruen}},
\code{\link{pal_signal}},
\code{\link{pal_unikn}},
\code{\link{pal_unikn_dark}},
\code{\link{pal_unikn_light}},
\code{\link{pal_unikn_pair}},
\code{\link{pal_unikn_ppt}},
\code{\link{pal_unikn_web}}
}
\concept{color palettes}
\keyword{datasets}
