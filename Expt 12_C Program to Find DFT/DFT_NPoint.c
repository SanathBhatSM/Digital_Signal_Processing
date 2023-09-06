//C Program to Compute the N point DFT of the Given Sequence

#define CHIP_6713 1
#include"dsk6713.h"
#include"dsk6713_aic23.h"
#include"stdio.h"
#include"math.h"
#define PI 3.1416

void main(){

	int lx,n,N,k;
	float x[10],XR[10],XI[10],mag[10],phase[10];

	//input the length of x(n)
	printf("Enter the length of x(n)");
	scanf("%d",&lx);
	
	//input the elements of x(n)
	printf("Enter the elements of x(n)");
	for(n=0;n<lx;n++)
		scanf("%f",&x[n]);

	//input the length of DFT
	printf("Enter the length of DFT");
		scanf("%d",&N);

	//append (N-lx) zeroes to x(n)
	for(n=lx;n<N;n++)
		x[n]=0;

	//To compute real part and imaginary part of DFT
	for(k=0;k<N;k++)
	{
		XR[k]=0;
		XI[k]=0;
		for(n=0;n<N;n++)
		{
			XR[k]=XR[k]+x[n]*cos(2*PI/N*k*n);
			XI[k]=XI[k]-x[n]*sin(2*PI/N*k*n);
		}

	}



	//To Compute Magnitude Spectrum and Phase Spectrum
	for(k=0;k<N;k++)
	{
		mag[k]=sqrt(pow(XR[k],2)+pow(XI[k],2));
		phase[k]=atan2(XI[k],XR[k]);

	}

	//To Display DFT
	printf("\n DFT of the given sequence is \n");
	for(k=0;k<N;k++)
		printf("%f +j(%f) \t",XR[k],XI[k]);

	//To Display Magnitude Spectrum
	printf("\n Magnitude Spectrum of the given sequence is \n");
	for(k=0;k<N;k++)
		printf("%f \t ",mag[k]);

	//To Display Phase Spectrum
		printf("\n Phase Spectrum of the given sequence is \n");
		for(k=0;k<N;k++)
			printf("%f \t ",phase[k]);

}

