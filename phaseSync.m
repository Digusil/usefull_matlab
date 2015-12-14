function out = phaseSync(data, phase, trigger, triggerValue)

	[m,~] = size(data);
	
	dataNorm = (data-mean(data))/range(data)+0.5;
	
	switch trigger
		case 'up'
			triggerFire = sign(numDerivate((dataNorm >= triggerValue),1)).*linspace(0,1,m)'*2*pi;
			phase0 = max(triggerFire);
		otherwise
			error('Wrong trigger! Please chose one: {up}')
	end
	
	phaseShift = round((phase - phase0)/(2*pi)*m);
	
	x = (1:m)+mod(-phaseShift, m);
	
	tmp1 = x <= 0;
	tmp2 = x > m;
	
	x = x + ( tmp1-tmp2 )*m;
	
	out = x;
	
end