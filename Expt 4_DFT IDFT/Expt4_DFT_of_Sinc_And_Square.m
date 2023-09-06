%Matlab Program to find DFT of Sinc and Square Waves
clc
clear all
close all

%To generate a square pulse
x1=[zeros(1,20),ones(1,20),zeros(1,20)]

X1=fft(x1)
mag_spectrum1=abs(X1)%To find magnitude spectrum

subplot(2,1,1)
plot(x1)
grid on
xlabel('time')
ylabel('amplitude')
title('Square Pulse')

subplot(2,1,2)
plot(fftshift(mag_spectrum1))
grid on
xlabel('Frequency')
ylabel('Magnitude')
title('Magnitude Spectrum')

%To generate sinc signal
n=-10:0.01:10
x2=sinc(4*n)

X2=fft(x2)
mag_spectrum2=abs(X2)%To find magnitude spectrum

figure %This will open a new figure window
subplot(2,1,1)
plot(x2)
grid on
xlabel('time')
ylabel('amplitude')
title('Sinc Pulse')

subplot(2,1,2)
plot(fftshift(mag_spectrum2))
grid on
xlabel('Frequency')
ylabel('Magnitude')
title('Magnitude Spectrum')





