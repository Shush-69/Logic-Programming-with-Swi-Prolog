
lease(propertyID4, tennantID4, businessID2, start(2019,november,26), end(2025,november,25), 6, 1405, deposit(2405)).

mortgage(propertyID4,type('buy to rent'),value(560000),deposit(140000),420000, 40).

leaseTax(PropertyID) :-
	lease(PropertyID,_,_,_,_,_,Pcm,_),
	mortgage(PropertyID,_,_,_,Loan,Term),
	YearlyRevenue is Pcm * 12,
	YearlyRepayment is Loan / Term,
	YearProfit is YearlyRevenue - YearlyRepayment,
	write('profit = '), write(YearProfit).

	