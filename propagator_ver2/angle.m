function angles = angle(r, location, d_theta)
    angles = zeros(1, size(r,2));
    A = [cos(d_theta) -sin(d_theta); sin(d_theta) cos(d_theta)];
    for i = 1:size(r,2)
        location = A*location;
        angles(:, i) = acos(dot(r(:,i), location)/(norm(r(:,i)) * norm(location)));
    end 
end