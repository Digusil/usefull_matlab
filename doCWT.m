function doCWT(data, Fs, freqrange)

	fc = centfrq('cmor1-1');
	scalerange = fc./(freqrange*(1/Fs));
	
	scales = scalerange(end):0.2:scalerange(1);
	Coeffs = cwt(data,scales,'cmor1-1');
	
	wscalogram('image',Coeffs);
	
end