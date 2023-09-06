%Part 2 of Matlab Program To Verify Sampling Theorem
%Let us now repeat the same steps for Oversampling
%To simulate the original analog signal
t=0:0.001:1;
x1=sin(2*pi*10*t)+sin(2*pi*12*t);
figure %This will open a new figure window
subplot(5,1,1)
plot(x1)
grid on
xlabel('Continuous Time')
ylabel('Amplitude')
title('Original Analog Signal')

fmax=12 %Maximum frequency component present in the original signal
Nyquist_Rate=2*fmax;
%Oversampling : Sampling Frequency is greater than Nyquist Rate
fs=30;%Sampling frequency
ts=1/fs;%Sampling Interval
t=0:ts:1;
x2=sin(2*pi*10*t)+sin(2*pi*12*t);
subplot(5,1,2)
stem(x2)
grid on
xlabel('Discrete Time')
ylabel('Amplitude')
title('Oversampled Signal')

subplot(5,1,3)
plot(x2)
grid on
xlabel('Continuous Time')
ylabel('Amplitude')
title('Reconstructed Signal From Oversampled Signal')

M=3%Interpolation Factor
x3=interp(x2,M)%interp is the Matlab command to do interpolation
subplot(5,1,4)
stem(x3)
grid on
xlabel('Discrete Time')
ylabel('Amplitude')
title('Oversampled and Interpolated Signal')

subplot(5,1,5)
plot(x3)
grid on
xlabel('Continuous Time')
ylabel('Amplitude')
title('Reconstructed Signal From Oversampled and Interpolated Signal')
