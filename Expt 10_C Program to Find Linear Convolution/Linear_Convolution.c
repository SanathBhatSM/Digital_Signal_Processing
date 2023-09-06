//C Program to find linear convolution of the given sequences

#define CHIP_6713 1
#include"dsk6713.h"
#include"dsk6713_aic23.h"
#include"stdio.h"
void main()
{
	float x[10],h[10],y[15];
	int lx,lh,ly,n,k;
	//Accept lx
	printf("\n Enter the length of the x[n]");
	scanf("%d",&lx);
	//Accept x[n]
	printf("\n Enter the samples of the x[n]");
	for(n=0;n<lx;n++)
		scanf("%f",&x[n]);
	//print x[n]
	printf("\n The samples of sequence x[n] are ");
	for(n=0;n<lx;n++)
		printf("\n x[%d]=%f \n",n,x[n]);

	//Accept lh
	printf("\n Enter the length of the h[n]");
	scanf("%d",&lh);
	//Accept h[n]
	printf("\n Enter the samples of h[n]");
	for(n=0;n<lh;n++)
		scanf("%f",&h[n]);
	//print h[n]
	printf("\n The samples of sequence h[n] are ");
	for(n=0;n<lh;n++)
		printf("\n h[%d]=%f \n",n,h[n]);

	//Find ly
	ly=lx+lh-1;




	//Find y[n]
	for(n=0;n<ly;n++)
	{
		y[n]=0;
		for(k=0;k<lx;k++)
		{
			if((n-k)>=0 && (n-k)<lh)
				y[n]=y[n]+x[k]*h[n-k];
		}
	}

	//Display y[n]
	printf("\n The result of linear convolution is");
	for(n=0;n<ly;n++)
			printf("\n y[%d]=%f \n",n,y[n]);
}

