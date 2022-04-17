%%Utilizes IoT system

%temp
temp_reef(29).
expected_reef_temp(27.2). %accepted mean temperature
 
%co2
co_levels(340).
expected_colevels(320.0646).%accepted average of Co2 levels

%salinity -  measured using a refractometer, which measures the index of refraction of a particular substance.
salinity(33).
expected_salinity(35). %expected salient is 35 parts/1000

%species that exist in the reef system that are considered endangered
endangered(seahorses).
endangered(pipefish).
endangered(sea_dragons).
endangered(potato_cod). 
endangered(queensland_grouper).
endangered(barramundi_cod).
endangered(maori_wrasse). 
endangered(groupers).

%in a good range
good_temp :- temp_reef(X),expected_reef_temp(Y), Z is X-Y,Z<1,Z> -1.
 
%negative, too cold
low_temp :- temp_reef(X),expected_reef_temp(Y), Z is X-Y,Z< -1.  

%positive, too hot
high_temp :- temp_reef(X),expected_reef_temp(Y), Z is X-Y,Z> 1.

%find co2 differences
%optimal c02
%optimal c02
good_co2 :- co_levels(X),expected_colevels(Y), Z is X-Y,Z<1,Z> -1.
 
%If the measured Co2 level is lower than prime conditions
low_co2 :- co_levels(X),expected_colevels(Y), Z is X-Y,Z< -7.

%positive, levels of Co2 too high
high_co2 :- co_levels(X),expected_colevels(Y), Z is X-Y,Z> 7.

%Desired levels of salinity
good_sal :- salinity(X),expected_salinity(Y), Z is X-Y,Z<5,Z> -5.

%Low levels of salinity
low_sal :- salinity(X), expected_salinity(Y),  Z is X-Y,Z< -5.

%High levels of salinity
high_sal :- salinity(X),expected_salinity(Y), Z is X-Y,Z> 5.

%Get the difference or temperatures and output comparison
temp :- good_temp->write("The current surface level temperature meets the standards of prime conditions.").
temp :- low_temp->write("The current surface level temperature is lower than the standards of prime conditions.").
temp :- high_temp->write("The sea surface temperature is at a crucial level - the coral reef is at high risk for coral bleaching. Regional scaled cooling infrastructures are highly recommended.").

%Get the difference or Co2 levels and output comparison
car :- low_co2->nl->write("The current co2 level meets the standards of prime conditions.").
car :- good_co2->nl->write("The current CO2 is lower than the standards of prime conditions.").
car :- high_co2->nl->write("The levels of Co2 are at a high risk for acidification. To combat the impact of this change, coral restoration is suggested through the forms of epigenetic modifications, marine permaculture, and coral nurseries.").

%Get the difference or salinity values and output comparison
sal :- good_sal->nl->write("The current saline levels meet the standards of prime conditions.").
sal :- low_sal->nl->write("The current salinity level is lower than the standards of prime conditions.").
sal :- high_sal->nl->write("The current saline levels are higher than the suggested .").

%check if the sensors are faulty (only called when temp and co2 mismatch)
faulty_sensor :- low_co2, high_temp->nl->write("Because the temperature is high and co2 levels are low, there could be a faulty sensor at hand.").
faulty_sensor :- high_co2, low_temp->nl->write("Because the temperature is low and co2 levels are high, there could be a faulty sensor at hand.").

%bleaching - causes by high co2 levels and high temperature
coral_bleaching :- high_co2, high_temp.

%threatened - Once endangered species also endure coral bleaching their population is at severe risk
threatened(X) :- endangered(X), coral_bleaching.

%diagnose the system and give recommendations
diagnostics(X) :- temp, car, sal->nl->write("These species are in immediate danger: "), threatened(X).
