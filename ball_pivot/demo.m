r = 87.5/6378e3 * 180/pi;

n = 100;
load("../propagator_ver2/beta.mat");

%dummy time
utc = [2000 1 12 4 52 12.4]; 

%generating scanlines
x = scanline_gen(r, n, beta, 1)';
x = [x(:, 2) x(:, 1) zeros(size(x, 1), 1)];

%generating ECI coords
d = zeros(size(x));
for i = 1:size(x, 1)
    d(i, :) = lla2eci(x(i,:), utc);
end

disp(d)

