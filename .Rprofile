r <- getOption("repos")             # hard code the US repo for CRAN
r["CRAN"] <- "http://cran.us.r-project.org"
options(repos = r)
rm(r)

Sys.setenv(R_HISTSIZE='100000')

# Some useful aliases
cd <- setwd
pwd <- getwd
#ht==headtail, i.e., show the first and last 10 items of an object
ht <- function(d) rbind(head(d,10),tail(d,10))

# Show the first 5 rows and first 5 columns of a data frame or matrix
hh <- function(d) d[1:5,1:5]