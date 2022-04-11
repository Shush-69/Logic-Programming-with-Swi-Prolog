subclass(commercial, property).
subclass(residential, property).


properties(property, has_landlords).
properties(property, has_energy_performance_certificate).
properties(property, has_fire_safety).
properties(property, has_gas_safety_record).
properties(property, has_tennancy_deposit_scheme).
properties(property, has_bulding_insurance).
properties(property, has_asbestos_management).

properties(commercial, has_value_added_tax).
properties(commercial, has_business_rates).
properties(commercial, has_business_lease).

properties(residential, has_water_supply).
properties(residential, has_tennancy_agreement).
properties(residential, has_gas_and_electrial_appliances).
properties(residential, has_tennancy_agreement_repair_clauses).

is_A(X,Y) :- subclass(X,Y).
is_A(X,Y) :- subclass(X,Z), is_A(Z,Y).
has_properties(Property, Requirements) :- properties(Property, Requirements).
has_properties(Property, Requirements) :- is_A(Property, Superclass), has_properties(Superclass, Requirements).