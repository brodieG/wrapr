% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DebugFn.R
\name{DebugPrintFn}
\alias{DebugPrintFn}
\title{Capture arguments of exception throwing function call for later debugging.}
\usage{
DebugPrintFn(saveDest, fn, ...)
}
\arguments{
\item{saveDest}{where to write captured state (determined by type): NULL random temp file, character temp file, name globalenv() variable, and function triggers callback.}

\item{fn}{function to call}

\item{...}{arguments for fn}
}
\value{
fn(...) normally, but if fn(...) throws an exception save to saveDest RDS of list r such that do.call(r$fn,r$args) repeats the call to fn with args.
}
\description{
Run fn and print result, save arguments on failure.  Use on systems like \code{ggplot()}
where some calculation is delayed until \code{print()}.
Please see: \code{vignette("DebugFnW", package="wrapr")}.
}
\examples{

saveDest <- paste0(tempfile('debug'),'.RDS')
f <- function(i) { (1:10)[[i]] }
# correct run
DebugPrintFn(saveDest, f, 5)
# now re-run
# capture error on incorrect run
tryCatch(
   DebugPrintFn(saveDest, f, 12),
   error = function(e) { print(e) })
# examine details
situation <- readRDS(saveDest)
str(situation)
# fix and re-run
situation$args[[1]] <- 6
do.call(situation$fn,situation$args)
# clean up
file.remove(saveDest)

}
\seealso{
\code{\link[utils]{dump.frames}}, \code{\link{DebugFn}}, \code{\link{DebugFnW}},  \code{\link{DebugFnWE}}, \code{\link{DebugPrintFn}}, \code{\link{DebugFnE}}, \code{\link{DebugPrintFnE}}
}
