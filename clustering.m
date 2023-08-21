function [M]=clustering(dataSheet)

tab=readtable(dataSheet,'VariableNamingRule','preserve');
%tab = tab(:,3:end);
%[rows,colums]=size(tab);

%table of just the training log-liklyhoods
%M= csvread(dataSheet,1,3);

validTab = tab.max_log_likelihood<=-5900;
reltab = tab(validTab,:);

M=table2array(reltab(:,4:end));

%filename = 'Full_Tree_Matrix.xlsx';
%xlswrite(filename,M);
Z=linkage(M,'ward')
T = cluster(Z)