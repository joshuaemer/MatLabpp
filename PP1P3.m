Alloy_name =input('Enter an Alloy Name ');

node_limit= 101;
%Constants
T0 = 200;
w = 1;
h = 15;
L =5;
%Convert to meters
L = L/100;
base_thickness = 1;
%Convert to meters
base_thickness = base_thickness/100;
delta_x = L/(node_limit-1);
Tinf = 25;
theta = atan((base_thickness/2)/L);
%Finding node locations by starting at 0 and increasing each node by
%delta_x
x = 0;
for ii = 2:node_limit
    x = [x;(ii-1)*delta_x];
end
n = 0;
Told = zeros(node_limit,1) + T0;
error= 1;
while(n<100 && error>1E-8)
    k = ThCond(Told+273,Alloy_name);
    
    
    A = zeros(node_limit,node_limit);
    b = zeros(node_limit,1);
    A(node_limit,node_limit-1) = 1;
    delta_x_ex = delta_x;
    A(node_limit,node_limit) = -1*(1+(h*delta_x/(k(node_limit,1)*sin(theta))));
    b(node_limit,1) = -1*((h*delta_x_ex/(k(node_limit,1)*sin(theta)))) * Tinf;
    A(1,1) = 1;
    b(1,1) = Told(1,1);
    %internal nodes
    for m = 2:1:node_limit-1
        coff_T_prev = 1-(m-(1/2))*delta_x/L;
        A(m,m-1) = coff_T_prev;
        coff_T = -1*((2-2*m*delta_x/L) + h*delta_x^2/(k(m,1)*L*sin(theta)));
        A(m,m)= coff_T;
        coff_T_next = 1-((m+(1/2))*delta_x/L);
        A(m,m+1) = coff_T_next;
        b(m,1) = -1*(h*delta_x^2/(k(m,1)*L*sin(theta)))*Tinf;
    end
    
    %formating to display nicely, solving with reduced row echilon function
    T_values = rref([A b]);
    T_values = T_values(:,node_limit+1);
    Tnew = T_values;
    error = norm(Tnew- Told);
    Told = Tnew;
end
%below line was used for part c and d
%save('PP1P3.dat','x','Tnew','-ascii','-append')

% part f
T_values = Tnew;

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
fprintf('Rate of Heat Transfer %f, Fin Efficiency %f\n',Qfin,nfin); 


