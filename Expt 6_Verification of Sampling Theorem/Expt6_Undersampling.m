%Part 1 of Matlab Program To Verify Sampling Theorem
%Sampling Theorem : To reconstruct an analog signal
%from its samples, sampling frequency must be 
%greater than or equal to twice the maximum frequency 
%present in the analog signal

clc
clear all
close all

%To simulate the original analog signal
t=0:0.001:1;
x1=sin(2*pi*10*t)+sin(2*pi*12*t);
subplot(5,1,1)
plot(x1)
grid on
xlabel('Continuous Time')
ylabel('Amplitude')
title('Original Analog Signal')

fmax=12 %Maximum frequency component present in the original signal
Nyquist_Rate=2*fmax;
%Undersampling : Sampling Frequency is less than Nyquist Rate
fs=20;%Sampling frequency
ts=1/fs;%Sampling Interval
t=0:ts:1;
x2=sin(2*pi*10*t)+sin(2*pi*12*t);
subplot(5,1,2)
stem(x2)
grid on
xlabel('Discrete Time')
ylabel('Amplitude')
title('Undersampled Signal')

subplot(5,1,3)
plot(x2)
grid on
xlabel('Continuous Time')
ylabel('Amplitude')
title('Reconstructed Signal From Undersampled Signal')

M=3%Interpolation Factor
x3=interp(x2,M)%interp is the Matlab command to do interpolation
subplot(5,1,4)
stem(x3)
grid on
xlabel('Discrete Time')
ylabel('Amplitude')
title('Undersampled and Interpolated Signal')

subplot(5,1,5)
plot(x3)
grid on
xlabel('Continuous Time')
ylabel('Amplitude')
title('Reconstructed Signal From Undersampled and Interpolated Signal')

