gameday
=======

To install this library from this repo, run the following commands in R: 

    library(devtools)
    install_github("giocode/gameday")
    gday("canucks")

The vignette can be viewed [here][vignette].

## Examples 
Here are few examples of using the gday and scores functions.
  ```
  gday()
  ```
  
  ```
  gday(date = "2014-11-23")
  ```
  
  ```
  scores()
  ```
  
  ```
  scores("2014-11-23")
  ```

## Reflections
It is very instructive to follow the process of hands-on tutorials on building R package. I found that unit testing is also useful when thinking about creating libraries of functions for third-party users. 
Devtools library provides lots of utility functions that simplify the creation of R packages.

[vignette]: http://htmlpreview.github.io/?https://github.com/giocode/gameday/blob/master/inst/doc/overview.html