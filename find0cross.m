function zCross = find0cross(data)

	x = sign(data);
	
	dx = numDerivate(x,1);
	
	dxn = dx.*( (1:size(data,1))'*ones(1,size(data,2)) );
	
	tmp = dxn(dxn~=0);
	
	zCross = abs(tmp(1:2:end,:));
end