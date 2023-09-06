//C Program to Find Forced Response
//The Given Difference Equation Is
//y(n)-7y(n-1)+12y(n-2)=x(n)-3x(n-1)+12x(n-2) . . . Eq(1)
//x(n)=(1/2)^n*u(n)
//Initial Conditions : y(-1)=0, y(-2)=0

#define CHIP_6713 1
#include"dsk6713.h"
#include"dsk6713_aic23.h"
#include"stdio.h"
#include"math.h"
void main()
{
	float ic1,ic2,x[30],y[30];
	int N,n;
	ic1=0;//This is actually y(-1)
	ic2=0;//This is actually y(-2)

	//To simulate x(n)
	printf("Enter the length of input sequence");
	scanf("%d",&N);
	for(n=0;n<N;n++)
	{
		x[n]=pow(0.5,n);
	}

//y(n)=x(n)-3x(n-1)+12x(n-2)+7y(n-1)-12y(n-2)... Eq(2)
	//put n=0 in Eq(2)
	//y(0)=x(0)-3x(-1)+12x(-2)+7y(-1)-12y(-2)
	y[0]=x[0]+7*ic1-12*ic2;

	//put n=1 in Eq(2)
	//y(1)=x(1)-3x(0)+12x(-1)+7y(0)-12y(-1)
	y[1]=x[1]-3*x[0]+7*y[0]-12*ic1;

	//y(2)=x(2)-3*x(1)+12x(0)+7y(1)-12y(0)
	y[2]=x[2]-3*x[1]+12*x[0]+7*y[1]-12*y[0];

	for(n=3;n<N;n++)
	{
		y[n]=x[n]-3*x[n-1]+12*x[n-2]+7*y[n-1]-12*y[n-2];
	}
printf("Forced Response of the system is ");
for(n=0;n<N;n++)
{
printf("%f \t",y[n]);
}
}

