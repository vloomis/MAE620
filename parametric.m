% Parametric Plot for Problem 4.9
% Function takes gamma, the 3 mach numbers from the 3 regions, and the
% index number of the region

% M was given
% M2 and M3 calculated in handwritten work
M = 3;
M2 = 1.99;
M3 = 2.255;

gamma = 1.4;

% send to function
[pressure1, theta1] = parametrics(gamma, M,  1);
[pressure2, theta2] = parametrics(gamma, M2, 2);
[pressure3, theta3] = parametrics(gamma, M3, 3);

% mirror the pressure diagram so we have a full diagram
p1 = [pressure1, pressure1];
th1 = [theta1, -theta1];
p2 = [pressure2, pressure2];
th2 = [theta2, -theta2];
p3 = [pressure3, pressure3];
th3 = [theta3, -theta3];

plot(th1, p1)
grid on
title('Pressure-Deflection Diagram for Problem 4.9')
hold on
plot(th2 +20, p2) % we are given theta2 so we can shift (left running)
plot(th3- 15, p3) % we are given theta3 so we can shift (right running)
legend('M1','M2','M3')


function [P2P1, theta] = parametrics(gamma, M, n)
% This function calculates the pressure ratio and theta for a given set of
% gamma, mach number, and index of flow region
    beta = linspace(asind(1/M), 90, 1000);

    % These are the pressure ratios calculated at each region after the
    % shockwave. They are applied to the P2P1 equation
    if n == 1
        a = 1;
    elseif n ==2
        a = 3.77;
    else
        a = 2.82;
    end

    for i = 1:length(beta)
        P2P1(i) = a * (1 + 2*gamma/(gamma+1) *(M*M*sind(beta(i))*sind(beta(i)) - 1));
        theta(i) = atand(2*cotd(beta(i))*(M*M*sind(beta(i))*sind(beta(i)) -1) / (M*M*(gamma+cosd(2*beta(i)))+2));
    end
end
