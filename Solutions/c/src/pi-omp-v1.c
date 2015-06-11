/*************************************
 * Calculating Pi with using method: *
 *  integral 4.0/(1+x^2) dx = pi     *
 * 	   OpenMP Version 1          *
 ************************************/
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double PI_ref=3.1415926535897932;

static long num_steps=1000000000;
double step;
int main (int argc, char* argv[]){
	double start,stop,diff_time;
	// Capture user defined num_steps from command line
	if (argc>1){
		int indx;
		for (indx=0; indx < argc; indx++){
			if (argv[indx][0] == '-') {
				if (argv[indx][1] == 'n') {
					num_steps = (long) (atoi(argv[indx+1]));
				}			
			}
		}
	}

	int i;
	start= omp_get_wtime();
	double x,
	       sum=0.0,pi=0.0;
	step = 1.0 / (double) num_steps;
	int nthreads=0;
#pragma omp parallel private(x) firstprivate(sum) shared(pi,nthreads)
	{	
		//All threads retrieve their thread id
		int tid= omp_get_thread_num();
//Any one of the threads retrieve the total number of threads in the shared variable nthreads
#pragma omp single 
		{

			nthreads = omp_get_num_threads();

		}
		//Partition the work into block cyclic manner store local sum in a private variable
		for (i=tid; i<num_steps; i+=nthreads){
			x=(i+0.5) * step;
			sum = sum+4.0/(1.0+(x*x));
		}	

#pragma omp critical (summation)
		{
			//Each thread does the following one at a time.
			pi += (step * sum);
		}

	}

	stop= omp_get_wtime();
	diff_time = (double) (stop-start);
	printf ("Estimated value of pi = %2.16lf\n",pi);
	printf ("Error = %2.16lf\n",fabs(PI_ref - pi));
	printf ("Compute time= %2.5lf seconds\n",diff_time);

}