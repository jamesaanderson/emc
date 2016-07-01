clear; close all; clc;

[x, y] = meshgrid(1:800, 1:800);
% circle: (x-h)^2 + (y-k)^2 = r^2
circle = (x-400).^2 + (y-400).^2 <= 200^2;
imshow(circle);

img = imread('Sample_Worm.png');
centroid = findCentroid(img);

figure
imshow(img);
hold on
plot(centroid(1), centroid(2), 'r*');
hold off

v = VideoReader('Behavior_Video.avi');
frames = read(v);
n_frames = size(frames, 4);
 
X = zeros(n_frames,1);
Y = zeros(n_frames,1);

stage = xlsread('Stage_Data.xls');

for i = 1:n_frames
    frame = frames(:,:,:,i);
    [centroid, mm] = findCentroid(frame);

    X(i) = mm(1) + stage(i,2);
    Y(i) = mm(2) + stage(i,3);
end

figure
plot(X, Y);
title('Center of Mass');
xlabel('X (mm)');
ylabel('Y (mm)');