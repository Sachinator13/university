a = remez(40, [0, 0.3, 0.4, 1], [1, 1, 0, 0] );
[h,w] = freqz(a,1,1000);
plot([0:999]/1000, 20*log10(abs(h)), 'r');
axis([0,1,-50,0]);
grid on;
xlabel('Rel_freq / pi');
ylabel('Gain(dB)');