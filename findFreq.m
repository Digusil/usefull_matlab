function freq = findFreq(data, Fs)

	corrData = autocorr(data, ceil(length(data)-1), 0);
	
	[~, locs] = findpeaks(corrData,'MINPEAKHEIGHT', 0.5);
	
	if isempty(locs)
		freq = NaN;
	else
		n = median(locs./(1:length(locs))');

		freq = Fs/n;
	end

end