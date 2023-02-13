%% 620 HW 3
% Problem 3.6
% Consider the compression of air by means of 
% a) shock compression
% b) isentropic compression
% Start from same (pressure)_1 and (dynamic viscosity)_1

gamma = 1.4;

% choosing my own P1
P1 = 0.5; % atm
% have nu be a vector 
nu = linspace(1.13, 0.3, 1000);

P2_sh(1) = P1;
P2_isen(1) = P1;

for i=2:length(nu)
    % For shock compression
    P2_sh(i) = P1*((2.4/0.4)*nu(1)/nu(i) - 1) / ((2.4/0.4) - nu(1)/nu(i));
    
    % For an isentropic compression, P*nu is constant
    P2_isen(i) = P1*nu(1)/nu(i);
end

plot(nu, P2_sh)
hold on
plot(nu, P2_isen)
legend('Shock Compression','Isentropic Compression')
grid on
ylabel('Pressure [atm]')
xlabel('Dynamic Viscosity [kg/m**3]')
title('Problem 3.6')