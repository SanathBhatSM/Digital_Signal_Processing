%Matlab Program to Verify
%Linearity property of DFT
clc
clear all
close all

x1=input('Enter the first sequence')
x2=input('Enter the second sequence')
a=input('Enter the first constant')
b=input('Enter the second constant')

%Linearity Property
%If x1(n) has DFT X1(k) and
%x2(n) has DFT X2(k), then
%a*x1(n)+b*x2(n) will have DFT a*X1(k)+b*X2(k)

X1=fft(x1)
X2=fft(x2)

LHS=fft(a*x1+b*x2)
RHS=a*X1+b*X2

if(LHS==RHS)
    disp('Linearity Property Verified')
end
