
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shovelApp

<!-- badges: start -->

[![R-CMD-check](https://github.com/asadow/shovelApp/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/asadow/shovelApp/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/asadow/shovelApp/branch/master/graph/badge.svg)](https://app.codecov.io/gh/asadow/shovelApp?branch=master)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)

<!-- badges: end -->

shovelApp is a Shiny application/R package for deploying a checklist
table of whether University of Guelph shovel routes have been completed.
The only user activity is a Regenerate button to update the table given
that the sourced Googlesheet undergoes updates (mainly between 11:30 AM
to 11:50 AM each day).

![shovelApp](./screenshot.png)

## Installation

You can install the development version of shovelApp like so:

``` r
install_github("asadow/shovelApp")
```
