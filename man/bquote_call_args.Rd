% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bquotefn.R
\name{bquote_call_args}
\alias{bquote_call_args}
\title{Treat ... argument as bquoted-values.}
\usage{
bquote_call_args(call, env = parent.frame())
}
\arguments{
\item{call}{result of match.call()}

\item{env}{environment to perform lookups in.}
}
\value{
name list of values
}
\description{
bquote_call_args is a helper to allow the user to write functions with bquote-enabled argument substitution.
Uses convetion that := is considered a alias for =.
}
\details{
Note: eagerly evalutes argument and writes them into the function's
executing environment.
}
\examples{

f <- function(q, ...) {
  env = parent.frame()
  # match.call() best called in function context.
  captured_call <- match.call()
  captured_args <- bquote_call_args(captured_call, env)
  for(nmi in setdiff(ls(),
                     c("captured_call", "captured_args", "env"))) {
    print(paste(nmi, get(nmi)))
  }
  captured_args
}

z <- "x"
y <- 5
qv <- 3

# equivilent to f(3, x = 5)
args <- f(q = .(qv), .(z) := .(y))

print(args)

}
\seealso{
\code{\link{bquote_function}}
}
\keyword{internal}
