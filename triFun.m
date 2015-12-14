function [y, dy, ddy ] = rectFun(t, A, omega, n)

    y = 0;

    for k = 1:n
        y = y + cos( (2*k-1)*omega*t )/(2*k-1)^2;
    end

    y = -4*A/pi^2*y + 1/2*A;

    if nargout > 1
        dy = 0;

        for k = 1:n
            dy = dy - omega*sin( (2*k-1)*omega*t)/(2*k-1);
        end

        dy = -4*A/pi^2*dy;
    end

    if nargout > 2
        ddy = 0;

        for k = 1:n
            ddy = ddy - omega^2*cos( (2*k-1)*omega*t);
        end

        ddy = -4*A/pi^2*ddy;
    end

end