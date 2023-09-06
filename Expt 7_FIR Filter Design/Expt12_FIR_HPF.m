%Matlab Program To Simulate Digital HPF
clc
clear all
close all

N=61; %Length of Impulse Response of HPF
n=0:N-1;
alpha=(N-1)/2; %Impulse Response will be shifted to right by Alpha steps
                       %so that the system becomes CAUSAL
wc=pi/4; %Cut-off frequency of HPF

%Simulate Window Functions
rectangular_window=ones(1,N);
hamming_window=0.54-0.46*cos(2*pi*n/(N-1));

%To Plot Window Sequences
subplot(2,1,1)
stem(n,rectangular_window)
grid on
xlabel('n')
ylabel('amplitude')
title('Rectangular Window')

subplot(2,1,2)
stem(n,hamming_window)
grid on
xlabel('n')
ylabel('amplitude')
title('Hamming Window')

% Impulse Response of HPF
h=-sin(wc*(n-alpha))./(pi*(n-alpha));
h(alpha+1)=1-wc/pi;

%Multiply Impulse Response with Window Functions
h_rect=h.*rectangular_window;
h_hamm=h.*hamming_window;

%To see the frequency response of the filter designed 
%Using rectangular window
fvtool(h_rect) 

%fv tool stands for filter visualization tool
%fvtool is the Matlab Command to show Impulse Response,
%Magnitude Response,Phase Response and Pole-Zero plot

%To see the frequency response of the filter designed 
%Using Hamming window
fvtool(h_hamm)

%%To Read a Music File 
[x, fs]=audioread('music.wav');
%x will contain samples of music file
%fs is the sampling frequency used to encode music signal

frequency=linspace(-fs/2,fs/2,length(x));
figure
subplot(2,1,1)
%To plot the spectrum of the audio file before filtering
plot(frequency,abs(fftshift(fft(x))))
grid on
xlabel('frequency in Hz')
ylabel('amplitude')
title('Spectrum of the music signal before filtering')

%To play the music before filtering
sound(x)

%To pass the music samples through the filter
y=filter(h,1,x);

frequency=linspace(-fs/2,fs/2,length(y));
subplot(2,1,2)
%To plot the spectrum of the audio file after filtering
plot(frequency,abs(fftshift(fft(y))));
grid on
xlabel('frequency in Hz')
ylabel('amplitude')
title('Spectrum of the music signal after high pass filtering')

%To play the music after filtering
sound(y)

