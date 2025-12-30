function dz = robotODE(t,z)

global n;

x =z(1:n);
y =z(n+1:end);

[V, C] = voronoin([x y]);

cx = zeros(n,1);
cy = zeros(n,1);

for i = 1:n
    idx = C{i};
    if all(idx ~= 1)
        px = V(idx,1);
        py = V(idx,2);
        
        pg = polyshape(px,py);
        [cx(i), cy(i)] = centroid(pg);
    else
        cx(i) = x(i);
        cy(i) = y(i);
    end
end
dx = cx - x;
dy = cy - y;

dz = [dx; dy];
end
