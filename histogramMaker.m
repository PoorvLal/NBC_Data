function []=histogramMaker(Sheet1,Sheet2)
%Just makes histograms 
%Histogram of all the data

hold on
M= csvread(Sheet1,1,2);
Known=M(:,1);
histogram(Known,'BinWidth',25,'FaceColor','g')

M= csvread(Sheet2,1,2);
Unknown=M(:,1);
histogram(Unknown,'BinWidth',25,'FaceColor','r')

title('Full Tree Data Set');
xlabel('Log-Likelihood');
ylabel('Number of Sequences');
xlim([-6100 -4000]);
legend;
saveas(gcf,'Set_Full_Tree.png');

saveas(gcf,'Full_Tree_EvenDis.png')
