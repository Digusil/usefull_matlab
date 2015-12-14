function [y, dy, ddy] = jumpFun(x, epsilon)

	y = 1/pi * atan(x/epsilon) + 1/2;

	if nargout > 1
		dy = 1/pi*epsilon./(x.^2+epsilon^2);
	end

	if nargout > 2
		ddy = - 1/pi * 2*epsilon * x ./ (x.^2+epsilon^2).^2;
	end

end