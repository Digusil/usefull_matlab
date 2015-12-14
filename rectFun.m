function [y, dy, ddy ] = rectFun(t, A, omega, n)

    y = 0;

    for k = 1:n
        y = y + sin( (2*k-1)*omega*t )/(2*k-1);
    end

    y = 2*A/pi*y + 1/2*A;

    if nargout > 1
        dy = 0;

        for k = 1:n
            dy = dy + omega*cos( (2*k-1)*omega*t);
        end

        dy = 2*A/pi*dy;
    end

    if nargout > 2
        ddy = 0;

        for k = 1:n
            ddy = ddy - (2*k-1)*omega^2*sin( (2*k-1)*omega*t);
        end

        ddy = 2*A/pi*ddy;
    end

end