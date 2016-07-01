function d = distance(x1,x2,y1,y2)

deltax = x2 - x1;
deltay = y2 - y1;

d = sqrt((deltax .^ 2) + (deltay .^2));

end
