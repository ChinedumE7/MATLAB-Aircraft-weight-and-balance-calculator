clear,clc
%{
Chinedum Echedom, Project, Problem 1
You will obtain values from the user using the "input" function and check
that the aircraft is within the weight and balance as specified from the man-
ufacture.
1. Obtain missing information from the user
2. Define variables you will use with the information given
3. Calculate the weight of the fuel
4. Calculate the ramp weight
5. Calculate the moment arm for each area of the aircraft
6. Calculate the Center of Gravity (CG) of the aircraft
7. Determine if the aircraft is within it's weight and balance
8. Print out the ramp weight, loaded moment, and if it is in W&B
I will obtain the values from the user using the function I already made
"userinput"
userinput
function[fuel,pilotWeight,coPilotWeight,passenger1Weight,passenger2Weight]= userinput(fuel,pilotWeight,coPilotWeight,passenger1Weight,passenger2Weight)
%}

answer = 0; % initialize "answer" for the while loop
while answer == 0 % While loop too run as long as the user wants to use the calculator
    disp("Hello, today we will be using our Aircraft (Piper Cherokee PA-28-180), weight and balance calculator. Please follow instructions!"); % Greet the user to begin
    
    [fuel, pilotWeight, coPilotWeight, passenger1Weight, passenger2Weight] = userinput; % call the function
    % Calculate the weight of the fuel (assuming 6 lbs per gallon)
    fuelWeight = fuel * 6; %fuel weight calculation
    fprintf("The total weight of the fuel is %g lbs. \n",fuelWeight) %display the total fuel weight to the user
    % Calculate the ramp weight (total weight of the aircraft)
    Empty_weight = 1471; % set empty weight of the aircraft as 1471 pounds
    rampWeight = fuelWeight + pilotWeight + coPilotWeight + passenger1Weight + passenger2Weight+Empty_weight; % calculate the ramp weight
    fprintf("The ramp weight of the aircraft is %g lbs. \n", rampWeight); % display the ramp weight to the user.
    % Determine if we have exceeded maximum weight. If not, go on with the program
    maxWeight = 2400; % Define the maximum allowable weight for the aircraft
    if rampWeight <= maxWeight %if statement to calculate the proceeding values if the rampweight is not greater than the maximum weight
        % Calculate the moment arm for each area of the aircraft 
        Front_Seats_Moment_Arm = 85.5; % distance from reference point (fulcrum) to Front Seats in inches
        Fuel_Tanks_Moment_Arm = 95; % distance from reference point (fulcrum) to Fuel Tanks in inches
        Rear_Seats_Moment_Arm = 118.1; % distance from reference point (fulcrum) to Rear Seats in inches
        Center_of_gravity = 85.9; % distance from reference point  (fulcrum) to center of gravity in inches
        % Calculate the moments for each weight
        frontSeatsMoment = (pilotWeight+coPilotWeight) * Front_Seats_Moment_Arm; % calculate the front seats moment 
        fuelMoment = fuelWeight * Fuel_Tanks_Moment_Arm; % calculate the fuel moment
        rearSeatsMoment = (passenger1Weight + passenger2Weight) * Rear_Seats_Moment_Arm; % calculate the rear seats moment
        empty_aircraft_moment = Empty_weight*Center_of_gravity;
        % Calculate the total moment and the Center of Gravity (CG)
        totalMoment = frontSeatsMoment + fuelMoment + rearSeatsMoment + empty_aircraft_moment; % calculate the total moment
        CG = totalMoment / rampWeight; % Calculate the Center of Gravity
        fprintf("The Center of Gravity (CG) of the aircraft is located at %g inches.\n", CG); % Display the CG to the user.
        % Determine if the aircraft is within its weight and balance limits
        if CG >= 86.8 && CG<= 95.8 % if statement to finish the program if the center of gravity value is within the bounds
            % Print out the ramp weight, loaded moment, and if it is within weight and balance
            fprintf("Ramp Weight: %g lbs\n", rampWeight); % display the total airplane weight
            fprintf("Total Moment: %g lb-in\n", totalMoment); % display the total airplane moment 
            fprintf("The aircraft is within its weight and balance limits.\n"); % state that the aircraft is within weight and balance limits
        else
            fprintf("Warning: The aircraft is outside its weight and balance limits, you are not safe to fly.\n"); % state that the aircraft is not within weight and balance limits
        end
        else
        fprintf("Warning: The ramp weight exceeds the maximum allowable weight of %g lbs, you are not safe to fly. We will not go on with the calculation.\n", maxWeight); % state that the aircraft is not within weight limits
    end
    answer = input('Would you like to perform another calculation? (1 for No): '); % ask the user if they want to use the calculator again
    if answer ==1
        disp(" Thank you for using our program, I hope you will come again! Goodbye.") % Display exit greeting to the user
    end

end
