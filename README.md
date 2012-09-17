R package "AssotesteR"
============================

This package is dedicated to statistical tests used in genetic association studies. It provides a toolbox with the state-of-the-art methods that have been developed to target the problem of testing for association between a binary phenotype and multiple genetic variants within a gene or a region. 

Installation options
-----------------------------
*  AssotesteR (stable version from CRAN)

   install.packages("AssotesteR")

*  AssotesteR (latest version from github)

   install.packages("devtools") 

   library(devtools)
   
   install_github('AssotesteR',  username='gastonstat')


Example Usage
-------------
    > library(AssotesteR)

    > cases = 500
    > controls = 500
    > total = cases + controls
    > phenotype = c(rep(1, cases), rep(0, controls))

    > set.seed(123)
    > genotype = matrix(rbinom(total*10, 2, 0.05), nrow=total, ncol=10)

    > mywss = WSS(phenotype, genotype, perm=500)


Or check out [www.gastonsanchez.com/assotester](http://www.gastonsanchez.com/assotester) for more information.

Links
-----
[AssotesteR package github](http://github.com/gastonstat/AssotesteR)

[The R Project](http://www.r-project.org/)

[gaston sanchez](http://www.gastonsanchez.com)


Author Contact
--------------
Gaston Sanchez (gaston.stat at gmail.com)
