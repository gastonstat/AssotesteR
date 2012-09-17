\name{WST}
\alias{WST}
\title{WST: Weighted Score Test}
\description{
  The WST method has been proposed by Wang and Elston (2007) and it can be seen as a fixed effects method with transformed predictors based on Fourier Transformations. WST is based on Fourier Transform (FT) coefficients to globally test a set of correlated genetic variants (e.g. SNPs). The sequence of genetic variants values is transformed into a sequence of numbers by discrete FT, but only the real parts of the FT coefficients are taken into account. A weighted score statistic of the FT components is calculated, which follows a standard normal distribution under the null hypothesis 
}
\usage{
  WST(y, X, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. NO missing data is allowed}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  This function does not allow missing genotypes
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{wst.stat}{ wst statistic}
  \item{asym.pval}{ asymptotic p-value}
  \item{perm.pval}{ permuted p-value}
  \item{args}{ descriptive information with number of controls, cases, variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Wang T, Elston C (2007) Improved Power by Use of a Weighted Score Test for Linkage Disequilibrium Mapping. \emph{The American Journal of Human Genetics}, \bold{80}: 353-360
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{SCORE}}, \code{\link{SUM}}
}
\examples{
  \dontrun{
  
  # number of cases
  cases = 500

  # number of controls
  controls = 500

  # total (cases + controls)
  total = cases + controls

  # phenotype vector
  phenotype = c(rep(1, cases), rep(0, controls))

  # genotype matrix with 10 variants (random data)
  set.seed(123)
  genotype = matrix(rbinom(total*10, 2, 0.05), nrow=total, ncol=10)

  # apply WST with 500 permutations
  mywst = WST(phenotype, genotype, perm=500)
  mywst
  }
}

