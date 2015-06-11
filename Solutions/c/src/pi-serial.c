/*************************************
 * Calculating Pi with using method: *
 *  integral 4.0/(1+x^2) dx = p	     *
 * 	   Serial Version	     *
 ************************************/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

// Reference value to estimate error
double PI_ref=3.1415926535897932;

static long num_steps=1000000000;
double step;
int main (int argc, char* argv[]){
  clock_t start,stop;
  double diff_time;
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
  double x,pi,sum=0.0;

  start= clock();   
  step = 1.0 / (double) num_steps;
        
  for (i=0; i<num_steps; i++){
        x=(i+0.5) * step;
        sum = sum + 4.0/(1.0+(x*x));
  }

  pi = step * sum ;
  stop= clock();
  diff_time = (double) (stop-start) / (double) CLOCKS_PER_SEC;
  printf ("Estimated value of pi = %2.16lf\n",pi);
  printf ("Error = %2.16lf\n",fabs(PI_ref - pi));
  printf ("Compute time= %2.5lf seconds\n",diff_time);

}
