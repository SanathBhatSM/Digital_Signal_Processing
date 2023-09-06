%Matlab Program to verify Parseval's theorem
clc
clear all
close all

x=input('Enter the sequence')
E1=sum(abs(x).^2) %To find energy using x(n)

%To find DFT of x(n)
X=fft(x)
N=length(x)

%To find energy using X(k)
E2=(1/N)*sum(abs(X).^2)

if(E1==E2)
    disp('Parsevals Theorem Verified')
end