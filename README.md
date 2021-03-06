An R package to quantify radial bridge images

Installation
------------
`cranium` depends on `XQuartz`, which is not on CRAN. You can download from https://www.xquartz.org/. After install `XQuartz`, restart your R and continue `cranium` installation.

`cranium` depends on the`hdf5r` package for reading HDF5 files. You could download `hdf5r` from CRAN.

``` r
install.packages("hdf5r")
```

If you have trouble downloading `hdf5r`, the alternative is `rhdf5` package. However, `rhdf5` package is not available on CRAN--it is a bioconductor package. You must install it from Bioconductor. To install the package, you have to run the following code once:

``` r
install.packages("BiocInstaller",
                 repos = "http://bioconductor.org/packages/3.4/bioc")
source("https://bioconductor.org/biocLite.R")
biocLite("rhdf5")
```
If you are having trouble downloading `rhdf5` using the code above, an alternative option would be downloading `rhdf5` from bioconductor using the `pak` package: https://github.com/r-lib/pak. Also, check the most recent version of Bioconductor here: http://bioconductor.org/about/removed-packages/.  

Note that you do not have to download `rhdf5` if you successfuly downloaded `hdf5r`.  

After installing `rhdf5` or `hdf5r`, you can install `cranium` from GitHub using the following commands:

``` r
install.packages("devtools")
devtools::install_github("beanumber/cranium")
```

Library `cranium` package everytime you start your R session.

```r
library(cranium)
```

Download sample data
--------------------

To download sample data, You Too and WildType, you can run:

```{r}
youtoo <- download_youtoo_data("folder") #where folder is the location you want to store the You Too data
wildtype <- download_wildtype_data("folder") #where folder is the location you want to store the Wild Type data
youtoo[[1]] #first you too data sample
```

Once the above is ran, the files are saved in a list and in the folder you set, each data sample can be indivudually picked from list by indexing.


Plot a 3D image of a brain
--------------------------

Now, you can simply point to a raw HDF5 file, and quickly render a 3D image of the data, along with our model of it.

``` r
file <- "~/Data/barresi/AT_1_Probabilities.h5"
library(cranium)
library(tidyverse)
tidy_brain <- file %>%
  read_h5() %>%
  tidy()
plot3d(tidy_brain)
```
Evaluate quadratic model fit
--------------------------
A quadratic model y = x^2+x is used to fit the data. You can evaluate the quadratic model fit on your sample. The default threshold for signal frequency is 0.9.
``` r
file%>%
  read_h5()%>%
  qmodel.brain()
``` 
If you are working with You-Too sample, you can change the data type and the default threshold for You-Too sample is 0.5. You can also adjust the threshold.
``` r
file%>%
  read_h5()%>%
  qmodel.brain(type="youtoo", threshold = 0.8)
``` 




