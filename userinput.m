function[fuel,pilotWeight,coPilotWeight,passenger1Weight,passenger2Weight]= userinput(fuel,pilotWeight,coPilotWeight,passenger1Weight,passenger2Weight)
% Echedom,AERE1610,Project Problem 1
% write a function that will ask the user for the input. Your function will prompt the user
% for an input  Your function will need to ask the user to input how much fuel is on-board, the weight of the pilot,
% co-pilot, passenger 1 and passenger 2.
% if the fuel is less than 50 gallons, tell the user that it's invalid and
% needs to be inputed again
fuel = input('Enter the amount of fuel on-board (in gallons): ');
while fuel > 50
    disp('Invalid input. Fuel can not be more than 50 gallons. Please try again.');
    fuel = input('Enter the amount of fuel on-board (in gallons): ');
end
% Prompt the user for the weight of the pilot, co-pilot, and passengers
pilotWeight = input('Enter the weight of the pilot (in lbs): ');
coPilotWeight = input('Enter the weight of the co-pilot (in lbs): ');
passenger1Weight = input('Enter the weight of passenger 1 (in lbs): ');
passenger2Weight = input('Enter the weight of passenger 2 (in lbs): ');
% Store the weights in an array (including fuel) for further processing if needed
end
