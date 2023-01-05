clear all, close all, clc

A = [0.5 0.5 0.25;
    0.25 0 0.25;
    0.25 0.5 0.5];

xtoday = [1; 0; 0]; % today is rainy

for i=1:50
    xtomorrow = A * xtoday
    xtoday = xtomorrow;
end