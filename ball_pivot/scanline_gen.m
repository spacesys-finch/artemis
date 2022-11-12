function coord = scanline_gen(r, n, beta, mode)
f = @(x) beta(1) + x * beta(2) + x.^2 * beta(3) ;
df = @(x) beta(2) + 2*x*beta(3);

x0 = -79.3832;

coord = zeros(2, n);


for i = 1:n
    grad = df(x0);
    if mode == 1
        xx = x0 + r/sqrt(1 + grad^2);
    else
       xx = x0 - r/sqrt(1 + grad^2);
    end
    coord(1, i) = xx;
    coord(2, i) = f(xx);
    x0 = xx;
end
end
