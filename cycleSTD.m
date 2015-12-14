function [out, t] = cycleSTD(data, T, Fs)

	[m,n] = size(data);
	
	N = T*Fs;
	
% 	N_periods = m/N;

	out = zeros(floor(N),n);
	
	for ind = 1:floor(N)
		x = round(ind:N:m)';
		out(ind,:) = nanstd(data(x,:),1);
	end

	if nargout > 1
		t = linspace(0,floor(N)/Fs,size(out,1))';
	end

end