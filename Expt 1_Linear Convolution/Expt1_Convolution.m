%Matlab Program to find linear convolution 
%of the given sequences
%Output of an LTI system can be found by
%convolving input and impulse response

clc
clear all
close all

x=input('Enter the first sequence')
h=input('Enter the second sequence')

disp('Convolution output sequence is')
y=conv(x,h)%conv is the matlab command to do convolution

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
stem(y)
grid on
xlabel('Discrete Time')
ylabel('Amplitude')
title('Convolution Output')


