function out = imod(signal, limit)

	dy = [0;diff(signal)]/limit;

	mask = (dy<=-0.5)-(dy>=0.5);

	cor = zeros(size(mask));

	for id = 2:length(mask)
		cor(id) = cor(id-1) + mask(id)*limit;
	end
	
	out = signal+cor;

end