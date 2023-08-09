function []=histogramMaker(Sheet1,Sheet2)
%Just makes histograms 
%Histogram of all the data

hold on
M= csvread(Sheet1,1,2);
V=M(:,1);
histogram(V,'BinWidth',25,'FaceColor','b')

M= csvread(Sheet2,1,2);
V=M(:,1);
histogram(V,'BinWidth',25,'FaceColor','y')