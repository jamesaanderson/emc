function [centroid, mm] = findCentroid(img)

img_bw = im2bw(img);
labels = bwlabel(img_bw);
props = regionprops(labels, 'Centroid');
rows = size(img_bw, 1);

centroid = props.Centroid;
coord = [centroid(2) (rows+1)-centroid(1)];
mm = coord / 320;

end

