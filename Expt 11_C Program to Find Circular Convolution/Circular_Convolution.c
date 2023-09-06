//C Program to Compute Circular Convolution
#define CHIP_6713 1
#include"dsk6713.h"
#include"dsk6713_aic23.h"
#include"stdio.h"
void main()
{
	float x[10],h[10],y[15];
	int N,lx,lh,n,k;

	//Input the length of Circular Convolution
	printf("Enter the length of circular convolution");
	scanf("%d",&N);

	//Input the length of x(n)
	printf("\n Enter the length of the x[n]");
	scanf("%d",&lx);

	//Input the elements of x[n]
	printf("\n Enter the elements of  x[n]");
	for(n=0;n<lx;n++)
		scanf("%f",&x[n]);

	//Input the length of h(n)
	printf("\n Enter the length of the h[n]");
	scanf("%d",&lh);

	//Input the elements of h[n]
	printf("\n Enter the elements of h[n]");
	for(n=0;n<lh;n++)
		scanf("%f",&h[n]);

	//Append (N-lx) zeroes to x(n)
	for(n=lx;n<N;n++)
		x[n]=0;

	//Append (N-lh) zeroes to h(n)
		for(n=lh;n<N;n++)
			h[n]=0;

	//Compute Circular Convolution
	for(n=0;n<N;n++)
	{
		y[n]=0;
		for(k=0;k<N;k++)
		{
				y[n]=y[n]+x[k]*h[(n-k+N)%N];
		}
	}

	//Display y[n]
	printf("\n The result of circular convolution is \n");
	for(n=0;n<N;n++)
			printf("%f \t",y[n]);
}

