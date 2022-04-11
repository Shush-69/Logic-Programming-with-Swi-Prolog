%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%BUSINESS LEASE


%Data format for tennant - commercialTennant(TennantID, name(Surname, Firstname), Email, Phone).
%Data format for Business - business(BusinessID, CompanyNo, BusinessName, BusinessType, BusinessEmail, BusinessPhone).
%Data format for property - commercialProperty(PropertyID, Type, Address).
%Data format for lease - lease(TennantID, PropertyID, BusinessID, Start, End, Years, Pcm, Deposit).
%Data format for start date - Start(Year,Month,Day).
%Data format for end date - End(Year,Month,Day).

%TENNANT DETAILS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


commercialTennant(tennantID3, name(dixson,james), 'dixson@gmail.com', '07765869834').

commercialTennant(tennantID4, name(smith,becky), 'beckysmith@yahoo.com', '07789234498').



%BUSINESS DETAILS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


business(businessID1, '04458962', businessName('Gallery Fortyone Ltd'),businessType(resturant), 'info@gallery-fortyone.com','01132740041').

business(businessID2, '04485612', businessName('Illegally Blonde'),businessType('hair dresser'), 'info@Blonde.co.uk','01135148621').


%PROPERTY DETAILS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

commercialProperty(propertyID3, type(commercial),'41 Commercial Road, LS53AW, leeds').

commercialProperty(propertyID4, type(commercial), '10A Otley Road, LS62AD, leeds').





%LEASE AGREEMENT DETAILS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



lease(propertyID4, tennantID4, businessID2, start(2019,november,26), end(2025,november,25), 6, 1705, deposit(2405)).

lease(propertyID3, tennantID3, businessID1, start(2021,january,12), end(2024,january,11), 3, 1604, deposit(1504)).




%LEASE AGREEMENT
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



commercialLease(PropertyID, BusinessID, name(X,Y), BusinessName, Phone, Pcm, Deposit, Years, End):-
	commercialTennant(TennantID, name(X,Y),_,Phone),
	business(BusinessID,_,BusinessName,_,_,_),
	commercialProperty(PropertyID,_,_),
	lease(PropertyID, TennantID, BusinessID,_,End,Years,Pcm,Deposit).



%LEASE YEARLY REVENUE CALCULATIONS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

leaseYear(PropertyID) :- lease(PropertyID,_,_,_,_,_,Pcm,_),
	 X is Pcm * 12, write(PropertyID), write(' Total Yearly Revenue for Lease £ '), write(X).


%LEASE TOTAL REVENUE CALCULATIONS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

leaseTotal(PropertyID) :- lease(PropertyID,_,_,_,_,Years,Pcm,_),
	 X is Pcm * (Years * 12), write(PropertyID), write(' Total Revenue Expected for Lease over '), write(Years), write(' years is £ '), write(X).


%LEASE VAT CALCULATIONS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

leaseVat(PropertyID) :- lease(PropertyID,_,_,_,_,_,Pcm,_),
	 X is Pcm * 12, 
	 Vat is X * 0.2,
 	 write(PropertyID), write(' total payable VAT for the year is £ '),write(Vat).

%COMMERCIAL BREAK DOWN CALCULATIONS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

comBreakDown(PropertyID) :- lease(PropertyID,_,_,_,_,_,Pcm,_),
		loans(PropertyID,_,_,Loan,Term),
		Revenue is Pcm * 12,
		write(PropertyID), write(' Total Yearly Revenue for Lease £ '), write(Revenue),nl,
		YearlyPayment is Loan / Term,
		write(PropertyID), write(' Yearly Loan repayment is £ '), write(YearlyPayment),nl,
		Vat is Revenue * 0.2,
 	 	write(PropertyID), write(' total payable VAT for the year is £ '),write(Vat),nl,
		Profit is Revenue - (YearlyPayment + Vat),
		write(PropertyID), write(' total Profit for the year is £ '),write(Profit),nl.

%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%TENNANCY AGREEMENT



%Data format for tennant - tennant(TennantID, name(Surname, Firstname), Email, Phone).
%Data format for property - property(PropertyID, Type, Address).
%Data format for agreement - agreement(TennantID, PropertyID, Start, End, Months, Pcm, Deposit).
%Data format for start date - Start(Year,Month,Day).
%Data format for end date - End(Year,Month,Day).

%TENNANT DETAILS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


tennant(tennantID1, name(myers,mike), 'myers@gmail.com', '07768824834').

tennant(tennantID2, name(bentley,olivia), 'bentlyoliv@yahoo.com', '07552334498').




%PROPERTY DETAILS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


property(propertyID1, type(residential),'flat 1, 8 holly bank, ls64dj, leeds').

property(propertyID2, type(residential), 'flat 2, 8 holly bank, ls64dj, leeds').





%AGREEMENTS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


agreement(propertyID1, tennantID1, start(2021,january,12), 
		end(2022,january,11), 12, 
		550, deposit(650)).

agreement(propertyID2, tennantID2, start(2021,november,26), 
		end(2022,november,25), 12, 
		650, deposit(775)).





%TENNANCY AGREEMENT
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


tennancyAgreement(name(X,Y), Phone, PropertyID, Pcm, Deposit, Months, End):-
	tennant(TennantID, name(X,Y),_,Phone),
	property(PropertyID,_,_),
	agreement(PropertyID, TennantID,_,End,Months,Pcm,Deposit).



%TOTAL RENT CALCULATIONS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
totalRent(PropertyID) :- agreement(PropertyID,_,_,_,Months,Pcm,_),
	 X is Pcm * Months, write(PropertyID), write(' Total Earnings for Agreement £ '), write(X).


%RESIDENTIAL BREAK DOWN CALCULATIONS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

resBreakDown(PropertyID) :- agreement(PropertyID,_,_,_,_,Pcm,_),
		loans(PropertyID,_,_,Loan,Term),
		repairDetails(PropertyID,_,_,_,Cost1),
		repairDetails(PropertyID,_,_,_,Cost2),
		not(Cost1 = Cost2),
		not(Cost2 = Cost1),
		RepairCost is Cost1 + Cost2,
		Revenue is Pcm * 12,
		write(PropertyID), write(' Total Yearly Revenue for Lease £ '), write(Revenue),nl,
		YearlyPayment is Loan / Term,
		write(PropertyID), write(' Yearly Loan repayment is £ '), write(YearlyPayment),nl,
 	 	write(PropertyID), write(' total Repair Costs for the year is £ '),write(RepairCost),nl,
		Profit is Revenue - (YearlyPayment + RepairCost),
		write(PropertyID), write(' total Profit for the year is £ '),write(Profit),nl.





%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%REPAIRS


%Data format for repairDetails - repairDetails(PropertyID, RepairNO, Date, job, Costs).
%Data format for Date - date(Year,Month,Day).



%REPAIR DETAILS 
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

repairDetails(propertyID1, repairNO1, date(2021,march,7), job('plumming'),120).
repairDetails(propertyID1, repairNO2, date(2021,january,12), job('damp proofing'),1250).
repairDetails(propertyID2, repairNO3, date(2020,november,12), job('door replacement'), 350).
repairDetails(propertyID2, repairNO4, date(2021,january,15), job('leak from roof'), 80).




%TOTAL REPAIR COSTS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

repairCosts(PropertyID) :- 
	repairDetails(PropertyID,_,_,_,Cost1),
	repairDetails(PropertyID,_,_,_,Cost2),
	not(Cost1 = Cost2),
	not(Cost2 = Cost1),
	X is Cost1 + Cost2, 
	write(PropertyID), write(' total repair costs are  £ '),write(X).
	









%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%LOANS

%Data format for loans - loans(PropertyID, Value, Deposit, Loan, Term).

%LOANS DETAILS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


loans(propertyID1,value(250000),deposit(62500), 187500, 35).
loans(propertyID2,value(350000),deposit(87500), 262500, 40).
loans(propertyID3,value(750000),deposit(187500),562500, 50).
loans(propertyID4,value(560000),deposit(140000),420000, 50).


%LOANS REPAYMENTS CALCULATIONS
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
loanRepayment(PropertyID) :- 
		loans(PropertyID,_,_,Loan,Term),
		MonthlyPayment is Loan / (Term * 12),
		YearlyPayment is Loan / Term,
		write(PropertyID), write(' Monthly Loan repayment is £ '), write(MonthlyPayment),nl,
		write(PropertyID), write(' Yearly Loan repayment is £ '), write(YearlyPayment),nl.