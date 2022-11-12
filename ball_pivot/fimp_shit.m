f_imp = @(x, y) x*cos(y)^2 + y*cos(x)^2 - 1;

fimplicit(f_imp, [-7, 7])