%Data format for tennant - commercialTennant(TennantID, name(Surname, Firstname), Email, Phone).
%Data format for Business - business(BusinessID, CompanyNo, BusinessName, BusinessType, BusinessEmail, BusinessPhone).
%Data format for property - commercialProperty(PropertyID, Type, Address).
%Data format for lease - lease(TennantID, PropertyID, BusinessID, Start, End, Years, Pcm, Deposit).
%Data format for start date - Start(Year,Month,Day).
%Data format for end date - End(Year,Month,Day).

%Tennant Details
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


commercialTennant(tennantID3, name(dixson,james), 'dixson@gmail.com', '07765869834').

commercialTennant(tennantID4, name(smith,becky), 'beckysmith@yahoo.com', '07789234498').



%Business Details
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


business(businessID1, '04458962', businessName('Gallery Fortyone Ltd'),businessType(resturant), 'info@gallery-fortyone.com','01132740041').

business(businessID2, '04485612', businessName('Illegally Blonde'),businessType('hair dresser'), 'info@Blonde.co.uk','01135148621').


%Property Details
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

commercialProperty(propertyID3, type(commercial),'41 Commercial Road, LS53AW, leeds').

commercialProperty(propertyID4, type(commercial), '10A Otley Road, LS62AD, leeds').





%Lease Agreement Details
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\



lease(propertyID4, tennantID4, businessID2, start(2019,november,26), end(2025,november,25), years(6), pcm(1405), deposit(2405)).

lease(propertyID3, tennantID3, businessID1, start(2021,january,12), end(2024,january,11), years(3), pcm(1004), deposit(1504)).




%TennancyAgreement
%/////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

commercialLease(PropertyID, BusinessID, name(X,Y), BusinessName, Phone, Pcm, Deposit, Years, End):-
	commercialTennant(TennantID, name(X,Y),_,Phone),
	business(BusinessID,_,BusinessName,_,_,_),
	commercialProperty(PropertyID,_,_),
	lease(PropertyID, TennantID, BusinessID,_,End,Years,Pcm,Deposit).


