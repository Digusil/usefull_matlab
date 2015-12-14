function [f_an, f_an_g] = gendecads(n, n_decads)
	f_an = zeros(n*n_decads, 1);
	f_an_g = ones(n*n_decads+1, 1);

	for i_decade = 1:n_decads
		f_an(n*(i_decade-1)+1:n*i_decade) = 10.^[(0:1/n:1-1/n)-(n_decads-i_decade+1)]';
		f_an_g(n*(i_decade-1)+1:n*i_decade) = 10.^[(0-1/(2*n):1/n:1-3/(2*n))-(n_decads-i_decade+1)]';
	end
	
	f_an_g(n*n_decads+1) = 10.^[(-1/(2*n))]';

end
