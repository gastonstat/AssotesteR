\name{SKAT}
\alias{SKAT}
\title{SKAT: Sequence Kernel Association Test}
\description{
  SKAT is a regression method to test for association between genetic variants (common and rare) in a region. A score-based variance-component test.
}
\usage{
  SKAT(y, X, kernel = "linear", weights = NULL, a = 1, b = 25, perm = NULL)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2.}
  \item{kernel}{ character string indicating the type of kernel to be used. Possible options are "linear", "wlinear", "quadratic", "IBS", "wIBS", "twowayx" (\code{kernel="linear"} by default)}
  \item{weights}{ optional numeric vector with weights for the genetic variants (\code{NULL} by default)}
  \item{a}{ positive numeric value for the parameter \code{a} in the Beta distribution (\code{a=1} by default)}
  \item{b}{ positive numeric vallue for the parameter \code{b} in the Beta distribution (\code{b=25} by default)}
  \item{perm}{ positive integer indicating the number of permutations (\code{NULL} by default)}
}
\details{
  The argument \code{kernel} is used to specify the kernel function. \code{"linear"} indicates the linear kernel, \code{"wlinear"} indicates a weighted linear kernel, \code{"quadratic"} indicates the quadratic polynomial kernel, \code{"IBS"} indicates Identity-By-Share, \code{"wIBS"} indicates weighted IBS, and \code{"twowayx"} indicates a two-way interaction kernel. \cr

  For the weighted kernels (\code{"wlinear"} and \code{"wIBS"}), there are two options to get the weights. The default option (\code{weights=NULL}) involves the calculation of the weights by taking into account the minor allele frequency of the variants. In this case, the weights are calculated from a Beta distribution with parameters \code{a} and \code{b}. The second option is to specify the weights by providing a vector of weights for the variants; in this case the length of the vector must equal the number of columns in \code{X}. For more information see reference Wu et al (2011) 
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{skat.stat}{ skat statistic}
  \item{asymp.pval}{ asymptotic  p-value of the applied statistic (distributed as chi-square with df=1)}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, permutations, and selected kernel}
  \item{name}{ name of the statistic}
}
\references{
  Wu MC, Kraft P, Epstein MP, Taylor DM, Chanock SJ, Hunter DJ, Lin X (2010) Powerful SNP-Set Analysis for Case-Control Genome-wide Association Studies. \emph{The American Journal of Human Genetics}, \bold{86}: 929-942 \cr

  Wu MC, Lee S, Cai T, Li Y, Boehnke M, Lin X (2011) Rare-Variant Association Testing for Sequencing Data with the Sequence Kernel Association Test. \emph{The American Journal of Human Genetics}, \bold{89}: 82-93 
}
\author{
  Gaston Sanchez
}
\note{
  This method is computationally expensive
}
\seealso{
  \code{\link{WSS}}  
}
\examples{
  \dontrun{
   
  # load data genodata
  data(genodata)

  # phenotype (first column of genodata)
  pheno = genodata[,1]

  # genotype (rest of columns of genodata)
  geno = genodata[,-1]

  # apply SKAT with linear kernel 
  myskat.linear = SKAT(pheno, geno, kernel="linear")
  myskat.linear

  # apply SKAT with weighted linear kernel
  # weights estimated from distribution beta(MAF, a=1, b=25)
  myskat.wlinear = SKAT(pheno, geno, kernel="wlinear", a=1, b=25)
  myskat.wlinear

  # apply SKAT with quadratic kernel
  myskat.quad = SKAT(pheno, geno, kernel="quadratic")
  myskat.quad

  # apply SKAT with IBS kernel
  myskat.ibs = SKAT(pheno, geno, kernel="IBS")
  myskat.ibs
  }
}




