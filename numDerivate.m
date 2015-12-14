function dy = numDerivate(y, N)

	switch N
		case 1
			coeff_c = [-1,0,1]/2;
			coeff_fb = [-1,1];
		case 2
			coeff_c = [1/12,-2/3,0,2/3,-1/12];
			coeff_fb = [-3/2,2,-1/2];
		case 3
			coeff_c = [-1/60,3/20,-3/4,0,3/4,-3/20,1/60];
			coeff_fb = [-11/6,3,-3/2,1/3];
		case 4
			coeff_c = [1/280,-4/105,1/5,-4/5,0,4/5,-1/5,4/105,-1/280];
			coeff_fb = [-25/12,4,-3,4/3,-1/4];
		otherwise
			error('Wrong order! Please choose from n = 1...4')
	end

%	switch N
%		case 1
%			coeff_fb = [-1,1];
%		case 2
%			coeff_fb = [-3/2,2,-1/2];
%		case 3
%			coeff_fb = [-11/6,3,-3/2,1/3];
%		case 4
%			coeff_fb = [-25/12,4,-3,4/3,-1/4];
%		otherwise
%			error('Wrong order! Please choose form n = 1...4')
%	end

	[m,n] = size(y);
	
	dy1 = zeros(N,n);
	dy2 = zeros(m-2*N,n);
	dy3 = zeros(N,n);

	for idn = -N:N
		dy2 = dy2 + coeff_c(idn+1+N)*y(idn+1+N:end+(idn-N),:);
	end

	for idn = 1:N+1
		dy1 = dy1 + coeff_fb(idn)*y(idn:idn+N-1,:);
		dy3 = dy3 - coeff_fb(end-idn+1)*y(end+idn-2*N:end+idn-N-1,:);
	end
	
	dy = [dy1;dy2;dy3];

end