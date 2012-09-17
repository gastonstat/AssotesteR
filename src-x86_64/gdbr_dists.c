#include <R.h>
#include <Rmath.h>
#include <math.h>
/*
 *  gdbr_dists.c
 *  genomic similarity matrices  
 *
 */

void gdbr_IBS(int * Z, int * pn, int * pp, double * Sim)
{
    int i, j, k, n, p, diff;
    double temp;

    n = *pn;
    p = *pp;
    
    for(i=0; i<n-1; i++){
        for(j=i+1; j<n; j++){
            temp = 0;
            for(k=0; k<p; k++){
                diff = 2 - abs(Z[i*p + k] - Z[j*p + k]);
		        temp += diff ;
            }
            Sim[i*n + j] = Sim[j*n + i] = temp / 2/ p;
        }
    }

}


void gdbr_wIBS(int * Z, int * pn, int * pp, double * weight, double * Sim)
{
    int i, j, k, n, p, diff;
    double temp, w_total;

    n = *pn;
    p = *pp;
 
    w_total = 0;
    for(k=0; k<p; k++){
        w_total += weight[k];
    }

    for(i=0; i<n-1; i++){
        for(j=i+1; j<n; j++){
            temp = 0;
            for(k=0; k<p; k++){
                diff =  abs(Z[i*p + k] - Z[j*p + k]);
		        temp += diff*weight[k] ;
            }
            Sim[i*n + j] = Sim[j*n + i] = 1 - temp / 2 / w_total;
        }
    }
}


