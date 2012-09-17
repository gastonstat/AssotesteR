\name{RWAS}
\alias{RWAS}
\title{RWAS: Rare-Variant Weighted Aggregate Statistic}
\description{
  The RWAS method has been proposed by Sul et al (2011) as a pooling method that groups variants and computes a weighted sum of differences between case and control mutation counts where weights are estimated from data. Under the null hypothesis the RWAS statistic has an asymptotic standard normal distribution, but a permutation procedure can also be applied to assess statistical significance 
}
\usage{
  RWAS(y, X, maf = 0.05, perm = NULL)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{maf}{ numeric value indicating the minor allele frequency threshold for rare variants (\code{ma
f=0.05} by default)}
  \item{perm}{ positive integer indicating the number of permutations (\code{NULL}  by default)}
}
\details{
  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{rwas.stat}{ rwas statistic}
  \item{asym.pval}{ asymptotic p-value}
  \item{perm.pval}{ permuted p-value, only when \code{perm} is used}
  \item{args}{ descriptive information with number of controls, cases, variants, rare variants, maf and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Sul JH, Han B, He D, Eskin E (2011) An Optimal Weighted Aggregated Association Test for Identification of Rare Variants Involved in Common Diseases. \emph{Genetics}, \bold{188}: 181-188
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{CMC}}  
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
  set.seed(1234)  
  genotype = matrix(rbinom(total*10, 2, 0.051), nrow=total, ncol=10)

  # apply RWAS with maf=0.05 and 500 permutations
  myrwas = RWAS(phenotype, genotype, maf=0.05, perm=500)
  myrwas
  }
}

