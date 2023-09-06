%Matlab Program To Simulate Digital IIR HPF
clc
clear all
close all

%To Read a Music File 
[x, fs]=audioread('music.wav');
%x will contain samples of music file
%fs is the sampling frequency used to encode music signal

%Specifications of the filter
fpb=8000 %Passband edge in Hz
omega_pb=fpb/(fs/2) %Normalized Passband edge 

fsb=4000 %Stopband edge in Hz
omega_sb=fsb/(fs/2) %Normalized Stopband edge 

apb=2 %passband attenuation in dB
asb=35 %stopband attenuation in dB

%To find the order and cut-off frequency of the IIR Filter
[n,Wc] = buttord(omega_pb,omega_sb,apb,asb)

%To design a Butterworth filter to meet the given specifications
[B,A] = butter(n,Wc,'high')
%B is the numerator coefficient matrix of the transfer function
%A is the denominator coefficient matrix of the transfer function

%To see the frequency response of the filter 
fvtool(B,A) 

%fv tool stands for filter visualization tool
%fvtool is the Matlab Command to show Impulse Response,
%Magnitude Response,Phase Response and Pole-Zero plot

frequency=linspace(-fs/2,fs/2,length(x));
figure
subplot(2,1,1)
%To plot the spectrum of the audio file before filtering
plot(frequency,abs(fftshift(fft(x))))
grid on
xlabel('frequency in Hz')
ylabel('amplitude')
title('Spectrum of the music signal before highpass filtering')

%To play the music before filtering
sound(x)

%To pass the music samples through the filter
y=filter(B,A,x);

frequency=linspace(-fs/2,fs/2,length(y));
subplot(2,1,2)
%To plot the spectrum of the audio file after filtering
plot(frequency,abs(fftshift(fft(y))));
grid on
xlabel('frequency in Hz')
ylabel('amplitude')
title('Spectrum of the music signal after highpass filtering')

%To play the music after filtering
sound(y)