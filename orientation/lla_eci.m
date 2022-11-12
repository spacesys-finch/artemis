function d =  lla_eci(u, time)
    %   u, v: 3 x 1 - LLA'
    %   vectors in spherical coordinates. Compute relative position of u
    %   with respect to v. Vector addition and subtraction needs both of
    %   them to be in cartesian, must convert first
    %   wgs84 LLA to XYZ (LLA TO ECEF, ECEF TO ECI)
    u_ecef = lla2ecef(u, "WGS84");
    d = ecef2eci(time, u_ecef);   
end
