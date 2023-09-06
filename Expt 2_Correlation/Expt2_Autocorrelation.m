%Matlab Program to find the autocorrelation 
%of the given sequence
%Autocorrelation is the correlation of the given sequence
%with itself

clc
clear all
close all

x=input('Enter the sequence')

disp('Autocorrelation sequence is')
y=xcorr(x)%xcorr is the matlab command to find correlation

%Divide the figure window into 2 rows, 1 column
%And select the first position in that
subplot(2,1,1)
stem(x)
grid on
xlabel('Discrete Time')
ylabel('Amplitude')
title('Given Sequence')

%Divide the figure window into 2 rows, 1 column
%And select the second position in that
subplot(2,1,2)
stem(y)
grid on
xlabel('Discrete Time')
ylabel('Amplitude')
title('Autocorrelation Sequence')

%Properties of Autocorrelation

%Autocorrelation sequence is a symmetric sequence
%Verify this by observing the autocorrelation sequence

if(y==fliplr(y))
    disp('Autocorrelation sequence is a symmetric sequence')
end

%fliplr is the Matlab command to flip (reverse) a sequence

%The center value will be the highest
%The center value will be equal to the energy of the signal

%To find the energy of the given signal
energy=sum(abs(x).^2)

ly=length(y)
center_value=y((ly-1)/2+1) %center value of autocorrelation sequence

if(center_value==energy)
    disp('Center value will be equal to the energy of the signal')
end


