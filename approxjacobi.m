function dx = approxjacobi(foo, x)

	dx0 = foo(x);
	
	m = size(dx0,1);
	n = size(x,1);
	
	dx = zeros(m,n);
	
	delta = 1e-6;
	
	for idx = 1:n
		
		d = zeros(size(x));
		
		d(idx) = 1;
	
		dx(:,idx) = ((foo(x.*d*(1-delta)) - foo(x.*d*(1+delta))))...
				   ./(ones(m,1)*(x(idx)*(1-delta) - x(idx)*(1+delta))');
		 
	end

end