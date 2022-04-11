%Data format for repairDetails - repairDetails(PropertyID, RepairNO, Date, job, Costs).
%Data format for Date - date(Year,Month,Day).

%Repair Details
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

repairDetails(propertyID1, repairNO1, date(2021,march,7), job('plumming'),120).
repairDetails(propertyID1, repairNO2, date(2021,january,12), job('damp proofing'),1250).
repairDetails(propertyID2, repairNO3, date(2020,november,12), job('door replacement'), 350).
repairDetails(propertyID2, repairNO4, date(2021,january,15), job('leak from roof'), 80).


%Total Repair cost calculation
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

repairCosts(PropertyID) :- 
	repairDetails(PropertyID,_,_,_,Cost1),
	repairDetails(PropertyID,_,_,_,Cost2),
	not(Cost1 = Cost2),
	X is Cost1 + Cost2, 
	write(PropertyID), write(' total repair costs are  £ '),write(X).
	
%repairCosts calculates the total costs of repairs assosiated to the PropertyID
%At the moment repairCosts 