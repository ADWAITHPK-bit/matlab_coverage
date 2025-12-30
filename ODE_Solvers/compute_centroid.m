function [cx, cy] = compute_centroid(px, py)

poly = polyshape(px, py);
[cx , cy] = centroid(poly);

end
