\name{RARECOVER}
\alias{RARECOVER}
\title{RARECOVER Algorithm}
\description{
  RARECOVER is an algorithm proposed by Bhatia et al (2010) that determines the set of variants in a manner of forward variable selection: starting from a null model without any genetic variants, genetic variants are selected one by one based on their statistical significance and then added into the model 
}
\usage{
  RARECOVER(y, X, maf = 0.05, dif = 0.5, perm = 100)
}
\arguments{
  \item{y}{ numeric vector with phenotype status: 0=controls, 1=cases. No missing data allowed}
  \item{X}{ numeric matrix or data frame with genotype data coded as 0, 1, 2. Missing data is allowed}
  \item{maf}{ numeric value indicating the minor allele frequency threshold for rare variants (\code{maf=0.05} by default)}
  \item{dif}{ numeric value between 0 and 1 as a threshold for the decision criterion in the RARECOVER algorithm (default \code{dif=0.5})}
  \item{perm}{ positive integer indicating the number of permutations (100 by default)}
}
\details{
  The applied association test statistic (denoted as \code{XCORR} in Bhatia et al, 2010) is based on the Pearsons chi-square statistic \cr

  The argument \code{maf} is used to specify the threshold of the minor allele frequency for rare variants. By default, only variants below \code{maf=0.05} are taken into account in the analysis. However, if all variants in \code{X} are considered as rare variants, setting \code{maf=1} will consider them all for the analysis \cr 

  There is no imputation for the missing data. Missing values are simply ignored in the computations.
}
\value{An object of class \code{"assoctest"}, basically a list with the following elements:
  \item{rc.stat}{ rarecover statistic}
  \item{perm.pval}{ permuted p-value}
  \item{set}{ set of selected variants}
  \item{args}{ descriptive information with number of controls, cases, variants, rare variants, maf, number of selected variants, and permutations}
  \item{name}{ name of the statistic}
}
\references{
  Bhatia G, Bansal V, Harismendy O, Schork NJ, Topol EJ, Frazer K, Bafna V (2010) A Covering Method for Detecting Genetic Associations between Rare Variants and Common Phenotypes. \emph{PLoS Computational Biology}, \bold{6(10)}: e1000954
}
\author{
 Gaston Sanchez
}
\seealso{
  \code{\link{WSS}}
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

  # apply RARECOVER with dif=0.05 and 500 permutations
  myrc = RARECOVER(phenotype, genotype, maf=0.05, perm=500)
  myrc
  }
}


