%Matlab Program to find Impulse Response 
%From the given Difference Equation

%Impulse Response is the output of the system 
%when unit impulse is applied to the system under initial conditions

%The given difference equation  is 
%y(n)-7y(n-1)+12y(n-2)=x(n)-3x(n-1)+12x(n-2) ... Eq (1)

%Consider the input as x(n)=delta(n)=[1,0,0,0, . . .]

%Consider Initial Conditions as : y(-1)=0, y(-2)=0

clc
clear all
close all

N=input('Enter the desired length of output sequence')
%Let us simulate input x(n)
n=0:N-1
x=[1,zeros(1,N-1)] %First value is 1, remaining values are 0s

%Initial Conditions
ic1=0 %Make initial conditions 0 to find Forced Response
ic2=0 %Make initial conditions 0 to find Forced Response

%From Eq (1), we can write
%y(n)=x(n)-3x(n-1)+12x(n-2)+7y(n-1)-12y(n-2) . . .  Eq (2)
%Put n=0 in Eq(2)
%y(0)=x(0)-3x(-1)+12x(-2)+7y(-1)-12y(-2)
%But y(0) becomes y(1) in Matlab
%x(0) becomes x(1) in Matlab
%x(-1)=x(-2)=0

y(1)=x(1)+7*ic1-12*ic2 %This is actually y(0)

%Put n=1 in Eq2()
%y(1)=x(1)-3x(0)+12x(-1)+7y(0)-12y(-1)
%But y(1) becomes y(2) in Matlab
%x(1) becomes x(2) in Matlab
y(2)=x(2)-3*x(1)+7*y(1)-12*ic1%This is actually y(1)

%Remaining values of y(n) can be found iteratively 
%from the following for loop

for n=3:N
    y(n)=x(n)-3*x(n-1)+12*x(n-2)+7*y(n-1)-12*y(n-2);
end
y %This is to display values of y(n) in command window

subplot(2,1,1)
stem(x)
grid on
xlabel('discrete time')
ylabel('amplitude')
title('Input Sequence')

subplot(2,1,2)
stem(y)
grid on
xlabel('discrete time')
ylabel('amplitude')
title('Impulse Response')
