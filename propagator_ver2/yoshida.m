function r = yoshida(r0, v0, h, N)

%{
Orbit propagator using Yoshida's Method

Parameters
----------
r0 : vector(2,1)
    Initial location of the satellite.
v0 : vector(2,1)
    Initial velocity of the satellite.
h : float
    Time step size
N : int
    Number of steps

Returns
----------
    None

%}

    M = 5.97219 * 10^24;
    G = 6.67408 * 10^-11;
    
    a = @(x) -G * M / (norm(x)^3) * x;
    
    v = zeros(2,N);
    r = zeros(2,N);
    
    v(:,1) = v0;
    r(:,1) = r0;
    
    w0 = -2^(1/3)/(2 - 2^(1/3));
    w1 = 1/(2 - 2^(1/3));
    
    c1 = w1/2;
    c4 = c1;
    c2 = (w0 + w1)/2;
    c3 = c2;
    
    d1 = w1;
    d3 = d1;
    d2 = w0;
    
    for i = 1:N-1
        r_i = r(:,i);
        v_i = v(:, i);
        r1 = r_i + c1 * h * v_i;
        v1 = v_i + d1 * h * a(r1);
        r2 = r1 + c2 * v1 * h;
        v2 = v1 + d2 * a(r2) * h;
        r3 = r2 + c3 * v2 *h;
        v3 = v2 + d3 * a(r3)*h;
        r(:, i+1) = r3 + c4* v3 * h;
        v(:, i+1) = v3;
    end
    
    plot(r(1,:), r(2,:))
    
    hold on
    plot(0,0,'o');
    xlabel("X (m)")
    ylabel("Y (m)")
    title("Propagated Orbit")
    hold off
end

