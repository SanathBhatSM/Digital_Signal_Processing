%Matlab Program to find correlation 
%of the given sequences
%Correlation serves as a measure of 
%similarity between two sequences

clc
clear all
close all

x=input('Enter the first sequence')
h=input('Enter the second sequence')

disp('Correlation output sequence is')
y=xcorr(x,h)%xcorr is the matlab command to find correlation

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
title('Correlation Output')

%Property of correlation
y1=xcorr(x,h)
y2=xcorr(h,x)

if(y1==fliplr(y2))
    disp('Correlation of x,y = Flipped version of correlation of y,x')
end

%fliplr is the Matlab command to flip (reverse) a sequence
