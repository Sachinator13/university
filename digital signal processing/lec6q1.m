Ft = 2; 
Fp = 0.45; 
Fs = 0.6;
ds = 0.0454; 
dp = 0.2043;

F = [Fp Fs]; 
A = [1 0]; 
DEV = [dp ds];

% Estimate order using remezord
[N, Fo, Ao, W] = remezord(F, A, DEV, Ft);

% Design filter of order N
b = remez(N, Fo, Ao, W);
[H, w] = freqz(b, 1, 512);

figure(1);
plot(w/pi, 20*log10(abs(H)));
xlabel('\omega / \pi');
ylabel('Gain (dB)');
title('N = 9');
% axis([0 0.45 -3 3]); % optional axis limit

% Design filter with order N = 11 for comparison
N = 40;
b = remez(N, Fo, Ao, W);
[H, w] = freqz(b, 1, 512);

figure(2);
plot(w/pi, 20*log10(abs(H)));
xlabel('\omega / \pi');
ylabel('Gain (dB)');
title('N = 11');
