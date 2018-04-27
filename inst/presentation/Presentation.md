How to Create an R Package
========================================================
author: Irene Steves, Mitchell Maier
date:
autosize: true

Why write a package?
========================================================

- organize code and data
- reuse code more easily
- test code
- share code with others

> “Seriously, it doesn’t have to be about sharing your code (although that is an added benefit!). It is about saving yourself time.” --Hilary Parker

Package structure
========================================================

- R code (`/R`)
- Documentation (`/man`)
- Tests (`tests/`)
- Package metadata (`DESCRIPTION`)
- Namespace (`NAMESPACE`)
- Data (`data/`)
- Compiled code (`src/`)
- Installed files (`inst/`)
- Other components

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
aloha_message <- function(name) {
  cat(crayon::green("Aloha,", name))
}
```

*As always remember to write descriptive funciton names that don't overlap with existing functions*

Write your documentation
========================================================
Use Tools --> Roxygen Quick Reference as a template

Common sections:
- title
- `@description`
- `@param` - parameters/arguments
- `@examples` - examples of how to use your function
- `@export` - make this function available to package users (helper functions do not need this)
- `@import`/`@importFrom` - import packages/functions from other packages; used to generate the `NAMESPACE`

*Use import calls instead of `library` or `require` calls*

Document your function:
========================================================

```
#' Say Aloha
#'
#' @description This function will say aloha to any inputted name.
#'
#' @param name (character) A name to say aloha to.
#'
#' @importFrom crayon green
#'
#' @export
aloha_message <- function(name) {
  cat(crayon::green("Aloha,", name))
}
```


Document your package:
========================================================




```r
# delete any *.Rd or NAMESPACE files before running for the first time
devtools::document()
```

Check your package
========================================================

Auto-generates your help files (`/man`) and `NAMESPACE` file:


```r
devtools::check()
```

```
checking package dependencies ... ERROR
Namespace dependency not required: ‘crayon’

See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
manual.
```

Description File
========================================================

```
Package: TEST
Title: What the Package Does (one line, title case)
Version: 0.0.0.9000
Authors@R: person("First", "Last", email = "first.last@example.com", role = c("aut", "cre"))
Description: What the package does (one paragraph).
Depends: R (>= 3.4.3)
License: What license is it under?
Encoding: UTF-8
LazyData: true
RoxygenNote: 6.0.1
```

Edit Description File
========================================================

```
Package: TEST
Title: Say Aloha to a Friend
Version: 0.1
Authors@R: c(
  person("Irene", "Steves", email = "irene.steves@gmail.com", role = c("aut", "cre")),
  person("Mitchell", "Maier", email = "mmaier@ucsb.edu", role = c("aut")))
Description: This package provides a pleasant way to say hello or goodbye to a friend.
Depends: R (>= 3.4.3)
License: CC0
Encoding: UTF-8
LazyData: true
RoxygenNote: 6.0.1
Imports: crayon
Suggests: testthat
```

Check your package again
========================================================


```r
devtools::check()
```

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


```
context("My aloha function")

test_that("function takes one input", {
  expect_error(aloha_message("Irene", "Mitchell"))
})
```

Connect to GitHub
========================================================
1. Create a GitHub repo with the same name

2. In the Terminal (Tools --> Shell), set up your user name and email if you haven't already:
```
git config --global user.name YOUR_NAME
git config --global user.email GITHUB_USER_EMAIL
```

3. Link to GitHub and push your local files to your online GitHub repository
```
git remote add origin https://github.com/USERNAME/PACKAGE_NAME.git
git push -u origin master
```

Travis - continuous integration
========================================================
![](static/Tessa-pride-4.png)

***

Log in to [Travis](https://travis-ci.org/) with GitHub and use it to:

- perform basic checks on R packages
- re-build bookdown books ([example](https://github.com/isteves/two-bookdowns-example))
- run custom scripts ([example](https://github.com/espm-157/popdyn-template))

.travis.yml
========================================================

Full documentation at: https://docs.travis-ci.com/user/languages/r

```
language: r
r:
  - release
  - devel
sudo: false
cache: packages
addons:
   apt:
    packages:
      - librdf0-dev
```

Advanced topics
========================================================

- [vignettes](http://r-pkgs.had.co.nz/vignettes.html)
- [pkgdown](https://github.com/r-lib/pkgdown)

