function [out, t] = cycleMean(data, T, Fs)

	[m,n] = size(data);
	
	N = T*Fs;
	
% 	N_periods = m/N;

	out = zeros(ceil(N),n);
	
	for ind = 1:ceil(N)
		x = round(ind:N:m)';
		out(ind,:) = nanmean(data(x,:),1);
	end

	if nargout > 1
		t = linspace(0,ceil(N)/Fs,size(out,1))';
	end

end