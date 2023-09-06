%Matlab Program to Compute N-point IDFT
%of the given sequence
clc
clear all
close all

X=input('Enter the sequence')
N=length(X)

WN=exp(-j*2*pi/N)%Twiddle Factor

%To generate WN Matrix
n=0:N-1
k=0:N-1

%To genrate powers of WN
powers=-n'*k

%To generate WN Matrix
%Raise WN to the powers element by element
matrix=WN.^powers

%To Compute IDFT
x1=(1/N)*matrix*X.' %To get transpose of a matrix, use .'

%To compute IDFT using inbuilt Matlab command
x2=ifft(X) %ifft is the Matlab command to compute IDFT

%To determine Magnitude Spectrum
mag_spectrum=abs(x2)%abs is the Matlab command to compute magnitude
phase_spectrum=angle(x2)%angle is the Matlab command to compute phase

%To plot the sequence X(k)
%Divide the graph window into 3 rows, 1 column 
%and select the first position
subplot(3,1,1)
stem(k,X)
grid on
xlabel('discrete frequency')
ylabel('Amplitude')
title('Input DFT Sequence')

%Select the second position
subplot(3,1,2)
stem(n,mag_spectrum)
grid on
xlabel('discrete time')
ylabel('Magnitude')
title('Magnitude Spectrum')

%Select the third position
subplot(3,1,3)
stem(n,phase_spectrum)
grid on
xlabel('discrete time')
ylabel('Phase')
title('Phase Spectrum')
