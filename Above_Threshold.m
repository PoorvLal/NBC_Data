function []=Above_Threshold(outputSheet,index)
%Purpose: Returns a list of the Loci whos max-log-liklihood falls above the
%Threashold but are Unknown
%Name   :Poorv Lal
%Date   : 7/18/23

%input example:
%Above_Threshold('Set3_2.csv',215294)
%where the index is the location at which the output file changes from Known to unknown
%index for Set3_2 is 215294

tab=readtable(outputSheet,'VariableNamingRule','preserve');
tab=tab(index:end,[1 3]);

%locus = table2cell(tab);

valid = tab(:,2)>-5900;

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

writecell(valid_locus,'valid_locus.txt')

%inputTab=readtable(inputSheet,'VariableNamingRule','preserve')

%for i = 1:valid_index




