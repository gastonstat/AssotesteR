#include <R.h>
#include <Rmath.h>
#include <math.h>
/*
 *  skatkernels.c
 *
 */

void kernel_IBS(int * Z, int * pn, int * pp, double * Kernel)
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
            Kernel[i*n + j] = Kernel[j*n + i] = temp / 2/ p;
        }
    }
}


void kernel_wIBS(int * Z, int * pn, int * pp, double * weight, double * Kernel)
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
            Kernel[i*n + j] = Kernel[j*n + i] = 1 - temp / 2 / w_total;
        }
    }
}


void kernel_twowayx(int * Z, int * pn, int * pp, double * Kernel)
{
    int i, j, k, n, p, diff;
    double temp, temp1, temp2;

    n = *pn;
    p = *pp;

    for(i=0; i<n; i++){
        for(j=i; j<n; j++){
            temp = 1;

            for(k=0; k<p; k++){
                temp2 = Z[i*p + k] * Z[j*p + k];
                temp += temp2;
                if(k==0){
                    temp1 = temp2;
                    continue ;
                }
                
                temp += temp1* Z[i*p + k] * Z[j*p + k];
                temp1 += temp2;

            }
            Kernel[i*n + j] = Kernel[j*n + i] = temp ;
        }
    }
}

