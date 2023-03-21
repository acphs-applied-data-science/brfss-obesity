# README

Takes a public domain data set from Kaggle and creates a series of data sets I
can use in my Intro To Data class.

Source: https://www.kaggle.com/datasets/spittman1248/cdc-data-nutrition-physical-activity-obesity

As downloaded, the data came in a zip file called "archive.zip".

Data sets produced:

brfss.csv

# FAQ

- *Why bother to do this?* Well, I like that the data is public health related
  but as distributed, it is too complicated to use in an introductory course.
  This simplifies the data.



# Using this script

Compiling the document is pretty easy and can be done either from RStudio or the CLI.

```bash
Rscript -e "rmarkdown::render('import-brfss.Rmd')"
```

## Dependencies

The only "hard" dependency is pacman. The setup script imports janitor, knitr,
rio, tidyr, and tidyverse. But all you really need is pacman. It will take care
of any missing dependencies. From within R:

```r
install.packages("pacman")
```