function Theta = theta(M, beta, gamma)
tanTheta = 2*cotd(beta)*(M*M*sind(beta)*sind(beta) -1)/(M*M*(gamma+cosd(2*beta))+2);
Theta = atand(tanTheta);
end