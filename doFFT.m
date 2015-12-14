function [f,Y,a] = doFFT(data, Fs)
	
	L = size(data,1);

	NFFT = 2^nextpow2(L); % Next power of 2 from length of y
	Y_raw = fft(data,NFFT)/L;
	f = Fs/2*linspace(0,1,NFFT/2+1);
	
	Y = 2*abs(Y_raw(1:NFFT/2+1));
	a = 180/pi*angle(Y_raw(1:NFFT/2+1));
	
	if nargout == 0
		figure()
		plot(f,Y)
		grid on
		set(gca,'xscale','log')
		set(gca,'yscale','log')
		
		xlabel('Frequency (Hz)')
		ylabel('|Y(f)|')
	end
	
end