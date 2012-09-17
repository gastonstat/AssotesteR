\name{GDBR}
\alias{GDBR}
\title{GDBR: Genomic Distance-Based Regression}
\description{
  The Genomic Distance-Based Regression has been developed by Wessel et al (2006). This approach captures genotype information across multiple loci through a similarity measure between any two individuals. GDBR is unique in its regression analysis relating variation in the measure of genomic similarity to variation in their trait values. Note that this approach is computationally expensive.
}
\usage{
  GDBR(y, X, distance = "IBS", weights = NULL, perm = NULL)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2.}
  \item{distance}{ character string indicating the type of distance to be used. Possible options are "IBS" or "wIBS" (\code{distance="IBS"} by default)}
  \item{weights}{ optional numeric vector with weights for the genetic variants (\code{NULL} by default)}
  \item{perm}{ positive integer indicating the number of permutations (\code{NULL} by default)}
}
\details{
  The argument \code{distance} is used to specify the similarity distance. \code{"IBS"} indicates Identity-By-Share, \code{"wIBS"} indicates weighted IBS. 
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{gdbr.stat}{ gdbr statistic}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, permutations, and selected distance}
  \item{name}{ name of the statistic}
}
\references{
  Wessel J, Schork NJ (2006) Generalized Genomic Distance-Based Regression Methodology for Multilocus Association Analysis. \emph{The American Journal of Human Genetics}, \bold{79}: 792-806 \cr

  Schaid DJ (2010) Genomic Similarity and Kernel Methods I: Advancements by Building on Mathematical and Statistical Foundations. \emph{The American Journal of Human Heredity}, \bold{70}: 109-131 
}
\author{
  Gaston Sanchez
}
\note{
  This method is computationally expensive
}
\seealso{
  \code{\link{SKAT}}  
}
\examples{
  \dontrun{
   
  # number of cases
  cases = 250

  # number of controls
  controls = 250

  # total (cases + controls)
  total = cases + controls

  # phenotype vector
  phenotype = c(rep(1,cases), rep(0,controls))

  # genotype matrix with 10 variants (random data)
  set.seed(123)
  genotype = matrix(rbinom(total*10, 2, 0.05), nrow=total, ncol=10)

  # apply GDBR with 50 permutations
  # (it takes some time to run the permutations!)
  mygdbr = GDBR(phenotype, genotype, perm=50)
  mygdbr
  }
}




