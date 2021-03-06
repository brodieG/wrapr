
test_str_stuff <- function() {

  v0 <- split_at_brace_pairs("{x} + y + {z}")
  RUnit::checkEquals(
    v0,
    c("{x}", " + y + ", "{z}"))

  v1 <- strsplit_capture("x is .(x) and x+1 is .(x+1)", "\\.\\([^)]+\\)")

  x <- 7
  v2 <- sinterp(c("x is .(x), x+1 is .(x+1)", ".(x) is odd is .(x%%2 == 1)"))
  RUnit::checkEquals(
    v2,
    c("x is 7, x+1 is 8", "7 is odd is TRUE"))
  v3 <- sinterp(c("x is .(x), x+1 is .(x+1)", ".(x) is odd is .(x%%2 == 1)"),
                envir = list(x = 10))
  RUnit::checkEquals(
    v3,
    c("x is 10, x+1 is 11", "10 is odd is FALSE"))

  invisible(NULL)
}

