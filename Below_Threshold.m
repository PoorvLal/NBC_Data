function [valid_locus]=Below_Threshold(outputSheet)
%Poorv Lal
%8/9/2023
%Finds all of the files that fall below a log likelihood threshold of -5900 and outputs a text file listing out those loci

tab=readtable(outputSheet,'VariableNamingRule','preserve');
tab=tab(1:end,[1 3]);

%locus = table2cell(tab);

valid = tab(:,2)<-5900;

tab(:,2)=valid.*tab(:,2);
cel=table2cell(tab);
%tab;
valid_locus={};
%valid_index={};
count=0;
for i = 1:numel(tab{:,1})
	if tab{i,2}~=0
		count=count+1;
		%valid_index{count}=i;
		valid_locus{count,1}=cel{i,1};
	end	
end

writecell(valid_locus,'Below_Threshold_Full_Tree.txt')

%inputTab=readtable(inputSheet,'VariableNamingRule','preserve')

%for i = 1:valid_index
