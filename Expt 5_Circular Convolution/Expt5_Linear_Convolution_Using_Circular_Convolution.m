%Matlab Program to find linear convolution using circular convolution


clc
clear all
close all

x=input('Enter the first sequence')
h=input('Enter the second sequence')
N=length(x)+length(h)-1

%Method 1
disp('Circular Convolution output sequence is')
y1=cconv(x,h,N)%cconv is the matlab command to do circular convolution
y2=conv(x,h) %y2 should be equal to y1

%To plot the sequences
%Divide the figure window into 3 rows, 1 column
%And select the first position in that
subplot(3,1,1)
stem(x)
grid on
xlabel('Discrete Time')
ylabel('Amplitude')
title('First Sequence')

%Divide the figure window into 3 rows, 1 column
%And select the second position in that
subplot(3,1,2)
stem(h)
grid on
xlabel('Discrete Time')
ylabel('Amplitude')
title('Second Sequence')

%Divide the figure window into 3 rows, 1 column
%And select the third position in that
subplot(3,1,3)
stem(y1)
grid on
xlabel('Discrete Time')
ylabel('Amplitude')
title('Linear Convolution Output')