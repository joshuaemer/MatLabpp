

%node_limit =6;
%node_limit = 11
%node_limit = 21
node_limit = 101;
%Initilize A
A = zeros(node_limit,node_limit);
b = zeros(node_limit,1);
T0 = 200;
%Constants
k = 180;
L =5;
%Convert to meters
L = L/100;
base_thickness = 1;
%Convert to meters
base_thickness = base_thickness/100;
delta_x = L/(node_limit-1);
Tinf = 25;

theta = atan((base_thickness/2)/L);
h = 15;


%m = 1
A(1,1) = 1;
b(1,1) = T0;



%m = node_limit;
A(node_limit,node_limit-1) = 1;
delta_x_ex = delta_x;
A(node_limit,node_limit) = -1*(1+(h*delta_x/(k*sin(theta))));
b(node_limit,1) = -1*((h*delta_x_ex/(k*sin(theta)))) * Tinf;

%internal nodes
for m = 2:1:node_limit-1
    coff_T_prev = 1-(m-(1/2))*delta_x/L;
    A(m,m-1) = coff_T_prev;
    coff_T = -1*((2-2*m*delta_x/L) + h*delta_x^2/(k*L*sin(theta)));
    A(m,m)= coff_T;
    coff_T_next = 1-((m+(1/2))*delta_x/L);
    A(m,m+1) = coff_T_next;
    b(m,1) = -1*(h*delta_x^2/(k*L*sin(theta)))*Tinf;
end

%formating to display nicely, solving with reduced row echilon function
T_values = rref([A b]);
T_values = T_values(:,node_limit+1);

% part 3
w =1;
%heat transfer
Qfin = h*(w*delta_x/cos(theta));
inside_Qfin = (T_values(1,1) - Tinf) + (T_values(node_limit,1) - Tinf);
run_sum = 0;
for m = 2:1:node_limit-1
    run_sum = run_sum + (T_values(m,1) - Tinf);
    
end
inside_Qfin= inside_Qfin + 2*run_sum;
Qfin = Qfin*inside_Qfin;
%fin efficiency
Qmax = h*(2*w*L/cos(theta))*(T0 - Tinf);
nfin = Qfin/Qmax;
%Finding node locations by starting at 0 and increasing each node by
%delta_x
x = 0;
for ii = 2:node_limit
    x = [x;(ii-1)*delta_x];
end
%End of numerical solution

%Anylitical solution
 
N  = 2*sqrt(h/(k*(base_thickness/2)));

ztop =sqrt(L*(L-x)).*N; 
zBottom = N*sqrt(L^2);
T_Ana = besseli(0,ztop)./besseli(0,zBottom);
T_Ana = T_Ana.*(T0-Tinf);
T_Ana = T_Ana + Tinf;

%Analytical Qfin and nfin
Qfin_Ana = 2*w*sqrt(h*k*(base_thickness/2))*(T0-Tinf);
bess1 = (besseli(1,2*sqrt(h*L^2/(k*(base_thickness/2)))));

bess0 = (besseli(0,2*sqrt(h*L^2/(k*(base_thickness/2)))));

Qfin_Ana = Qfin_Ana * (bess1 /bess0);

Qmax_Ana = 2*h*sqrt(L^2+(base_thickness/2)^2)*(w*(T0-Tinf));

nfin_Ana = Qfin_Ana/Qmax_Ana;

fprintf('Numerical : Rate of Heat Transfer %f, Fin Efficiency %f\n',Qfin,nfin);
fprintf('Analytical : Rate of Heat Transfer %f, Fin Efficiency %f\n',Qfin_Ana,nfin_Ana);








hold on
plot(x,T_values,'g*:');
plot(x,T_Ana,'ko-');
ylabel('Temperature(C)');
xlabel('Node Location (m)');
title('Temperature vs Node Location');
legend('Numerical T','Analytical T');
hold off
