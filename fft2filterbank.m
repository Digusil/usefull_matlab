function [f_an, y] = fft2filterbank(x,f,n, n_decads,Fs)

	[f_an, f_an_g] = gendecads(n, n_decads);
	
	f_an = f_an * Fs/2;
	f_an_g = f_an_g *Fs/2;
	
	y = zeros(size(f_an));

	for id = 1:length(f_an)
		y(id) = sum(abs(x((f>=f_an_g(id)) & (f<=f_an_g(id+1)))));
	end
	
	sum_fft = sum(abs(y));
	
	y = 10*log10(y/sum_fft);

end