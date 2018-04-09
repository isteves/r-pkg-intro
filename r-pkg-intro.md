How to Create an R Package
========================================================
author: Irene Steves, Mitchell Maier
date: 
autosize: true

Why write a package?
========================================================

- organize code
- reuse code more easily
- share code with others

> “Seriously, it doesn’t have to be about sharing your code (although that is an added benefit!). It is about saving yourself time.” --Hilary Parker

Package structure
========================================================

- R code (`/R`)
- Documentation (`/man`)
- Tests (`/test`)
- Package metadata (`DESCRIPTION`)
- Namespace (`NAMESPACE`)

Resources
========================================================

- [Writing an R package from scratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/) blogpost by Hilary Parker
- [R packages](http://r-pkgs.had.co.nz/) book by Hadley Wickham
- Official [writing R extensions](https://cran.r-project.org/doc/manuals/R-exts.html#Creating-R-packages) guide

Packages you need
========================================================


```r
#install.packages(c("devtools", "roxygen2", "testthat"))

library(devtools)
library(roxygen2)
library(testthat)
```

Create a package in RStudio
========================================================

## Option 1
File --> New Project --> New Directory --> R Package

## Option 2

```r
devtools::create("path/pkgname")
```

Write a function
========================================================
Print an Aloha message in green:

```r
aloha <- function(name) {
  cat(crayon("Aloha,", name))
}
```

Write your documentation
========================================================
Use Tools --> Roxygen Quick Reference as a template

Common sections:
- title
- description
- `@param` - parameters/arguments
- `@examples` - examples of how to use your function
- `@export` - make this functiona available to package users (helper functions do not need this)
- `@import`/`@importFrom` - import packages/functions from other packages; used to generate the `NAMESPACE`

========================================================

```
#' My aloha function
#'
#' A description
#'
#' @param name (character) A name to say aloha to
#'
#' @export
#' 
#' @importFrom crayon green
```

Check and document your package
========================================================

Auto-generates your help (`/man`) and `NAMESPACE` files:


```r
# delete any *.Rd or NAMESPACE files before running for the first time

devtools::document()
```

Check your package for completeness:


```r
devtools::check()
```

The DESCRIPTION file
========================================================
The `devtools::check()` error messages should advise you to edit these fields:

- License:
- Imports:

Unit tests
========================================================

- fewer bugs
- better code structure
- easier restarts
- robust code


```r
devtools::use_testthat()
```

Write a unit test
========================================================
New R script: `test_FUNCTION_NAME.R`


```r
context("My aloha function")

test_that("takes one input",{
  expect_error(aloha(Jesse, Jeanette))
})
```

Connect to GitHub
========================================================
1. Create a GitHub repo with the same name

2. In the Terminal (Tools --> Shell), set up your user name and email if you haven't already:
```
git config user.name GITHUB_USERNAME
git config user.email GITHUB_USER_EMAIL
```

3. Link to GitHub and push your local files to your online GitHub repository
```
git remote add origin https://github.com/USERNAME/PACKAGE_NAME.git
git push -u origin master
```

Advanced topics
========================================================

- [vignettes](http://r-pkgs.had.co.nz/vignettes.html)
- [pkgdown](https://github.com/r-lib/pkgdown)
- continuous integration with [Travis](https://travis-ci.org/)