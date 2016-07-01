clear; close all; clc;

output = xlsread('Sample_Nemo_Output.xlsx');

x1 = output(:,6);
x2 = output(:,8);
y1 = output(:,7);
y2 = output(:,9);

distance(x1,x2,y1,y2)

lengths = zeros(1800,1);
for col = 6:2:44
    for row = 1:1800
        x1 = output(row,col);
        x2 = output(row,col+2);
        y1 = output(row,col+1);
        y2 = output(row,col+3);

        lengths(row) = lengths(row) + distance(x1,x2,y1,y2);
    end
end

mean(lengths)

X = output(1:10,2);
Y = lengths(1:10);
error = std(Y) * ones(length(Y),1);

bar(X,Y)
ylabel('Length (mm)')
xlabel('Time (s)')
hold on
errorbar(X,Y,error);
hold off