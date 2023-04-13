function xdot=lorentz(t,x,constants)
    sigma = constants(1);
    rho = constants(2);
    beta = constants(3);
    xdot = zeros(3,1);
    xdot(1,1) = sigma*(x(2)-x(1));
    xdot(2,1) = x(1)*(rho-x(3));
    xdot(3,1) = x(1)*x(2)-beta*x(3);
end