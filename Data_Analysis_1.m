function [out]=Data_Analysis_1(dataSheet)
%Purpose: creates a table detailing different attributes of each organism as well as a 2 histogram based indexes provided by the user
%Name   :Poorv Lal
%Date   : 7/18/23

%identify index where the organisum its looking at changes
%this gives you the first index when organisum changes
tab=readtable(dataSheet,'VariableNamingRule','preserve');
tab=tab(:,1);

locus = table2cell(tab);

indexloc={};
count=1;

indexloc{1}=1;

%temp1 = extractBetween(locus{1},1,6)
%temp1{1}


for i = 1:numel(locus)-1
	%t1=locus{i}
	%t2=locus{i+1}
	temp1=extractBetween(locus{i},1,6);
	temp1=temp1{1};
	temp2 =extractBetween(locus{i+1},1,6);
	temp2=temp2{1};
	if strcmp(temp1,temp2) == 0
		count=count+1;
		indexloc{count}=i+1;
	end
end

indexloc = cell2mat(indexloc);

%put the log liklihoods into a vector 
%M= xlsread(dataSheet);
M= csvread(dataSheet,1,2);
V=M(:,1);
%V=nonzeros(V);

%create output that tells you the starting index for 

out={};
count=0;
%create the header
out{1,1}='Locus';
out{1,2}='Starting Index';
out{1,3}='Ending Index';
out{1,4}='Average Max Log Likelihood';

for i = 1:numel(indexloc)-1
	count=count+1;
	out{i+1,1}=locus{indexloc(i)};
	out{i+1,2}=indexloc(i);
	out{i+1,3}=indexloc(i+1)-1;
	out{i+1,4}=mean(V(out{i+1,2}:out{i+1,3}));

end
count=count+1;
%add last data set
out{count+1,1}=locus{indexloc(count)};
out{count+1,2}=indexloc(count);
out{count+1,3}=numel(locus);
out{count+1,4}=mean(V(out{count+1,2}:out{count+1,3}));

out




%ask about histograms you want to create 
sh1=input("Enter the index of the start of the first histogram:");
eh1=input("Enter the index of the end of the first histogram:");
sh2=input("Enter the index of the start of the second histogram:");
eh2=input("Enter the index of the end of the second histogram:");


%Histogram of all the data
%histogram(V,'BinWidth',25,'FaceColor','b')
clf

%histogram of known
Known=V(sh1:eh1);
histogram(Known,'BinWidth',50,'FaceColor','g');
hold on


%hisogram of unknown
Unknown=V(sh2:eh2);
histogram(Unknown,'BinWidth',50,'FaceColor','r');

%his%hisogram of unknown without zeros
%V4=nonzeros(V3);
%histogram(V4)

title('Increased Data Set');
xlabel('Log-Likelihood');
ylabel('Number of Sequences');
xlim([-6100 -4000]);
legend;
saveas(gcf,'Set3_2.png');
hold off
