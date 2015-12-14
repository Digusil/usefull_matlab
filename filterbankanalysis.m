%% FILTERBANKANALYSIS: Creats a filter bank and runs the analysis
%	
%	[spec, f] = FILTERBANKANALYSIS( signal, n, n_decads, fs, fo)
%	[spec, f, y_an] = FILTERBANKANALYSIS( signal, n, n_decads, fs, fo)
%
%	spec is the RMS in db of the frequency f.
%	signal is the vector of data that have to be analysed. 
%	n is the umber of steps per decade, n_decads is the number of decads.
%	fs is the smpling rate and fo is the order of the Butterworth filter.

function [spec, f, y_an] = filterbankanalysis(signal, n, n_decads, fs, fo)

	[f_an, f_an_g] = gendecads(n, n_decads);

	y_an = zeros(size(signal,1),length(f_an));
	spec = zeros(length(f_an),size(signal,2));
% 	f_an_N = zeros(length(f_an),size(signal,2));

	rms_y = norm(signal)/sqrt(size(signal,1));

	for id = 1:size(signal,2)
		y_an = zeros(size(signal,1),length(f_an));
		for idf = 1:length(f_an)

			[b,a] = butter(fo, [f_an_g(idf), f_an_g(idf+1)], 'bandpass');
			
% 			d = designfilt('bandpassiir','FilterOrder',fo, ...
% 				'HalfPowerFrequency1',f_an_g(idf)*fs/2,'HalfPowerFrequency2',f_an_g(idf+1)*fs/2, ...
% 				'SampleRate',fs);
	 
			y_an(:,idf) = filter(b, a, signal-mean(signal))+mean(signal);
			spec(idf,id) = 20*log10(norm(y_an(:,idf))/sqrt(length(y_an(:,idf)))/rms_y);
		end
	end

	f = f_an*fs/2;
end

%% gendecads: generates decade data
function [f_an, f_an_g] = gendecads(n, n_decads)
	f_an = zeros(n*n_decads, 1);
	f_an_g = ones(n*n_decads+1, 1);

	for i_decade = 1:n_decads
		f_an(n*(i_decade-1)+1:n*i_decade) = 10.^[(0:1/n:1-1/n)-(n_decads-i_decade+1)]';
		f_an_g(n*(i_decade-1)+1:n*i_decade) = 10.^[(0-1/(2*n):1/n:1-3/(2*n))-(n_decads-i_decade+1)]';
	end
	
	f_an_g(n*n_decads+1) = 10.^[(-1/(2*n))]';

end
