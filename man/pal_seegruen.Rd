% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/color_def_1.R
\docType{data}
\name{pal_seegruen}
\alias{pal_seegruen}
\title{uni.kn color palette seegruen}
\format{
An object of class \code{data.frame} with 1 rows and 5 columns.
}
\usage{
pal_seegruen
}
\description{
\code{pal_seegruen} provides an additional uni.kn color palette  
as a data frame containing 5 colors (shades of 
\code{\link{Seegruen}}).
}
\details{
See \url{https://www.uni-konstanz.de/en/university/news-and-media/create-online-and-print-media/corporate-design/} for details.
}
\examples{
pal_seegruen
dim(pal_seegruen)  # 1 5
pal_seegruen[4]    # preferred (named) color "seegruen4"
pal_seegruen[[4]]  # preferred color "seegruen4" OR "#0A9086"

# Plotting palette:
seecol(pal_seegruen)

}
\seealso{
\code{\link{pal_unikn}} for the unikn default color palette with all 5 colors of \code{\link{pal_seeblau}}; 
\code{\link{pal_petrol}} for an alternative green uni.kn color palette;  
\code{\link{pal_unikn_pref}} for a uni.kn color palette with all preferred colors; 
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
\code{\link{pal_signal}},
\code{\link{pal_unikn}},
\code{\link{pal_unikn_dark}},
\code{\link{pal_unikn_light}},
\code{\link{pal_unikn_pair}},
\code{\link{pal_unikn_ppt}},
\code{\link{pal_unikn_pref}},
\code{\link{pal_unikn_web}}
}
\concept{color palettes}
\keyword{datasets}
