%a)
%Rewriting equations into Ax = b and solving for unknown T values parts 1-2
%Initilize A
%node_limit =6
%node_limit = 11
%node_limit = 21
node_limit = 101
A = zeros(node_limit,node_limit);
b = zeros(node_limit,1);
T0 = 200;
%Constants
k = 180;
L =5;
%Convert to meters
L = L/100;
base_thickness = 1;
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
T_values = T_values(:,node_limit+1)

% part 3
w =1;
%heat transfer
Qfin = h*(w*delta_x/cos(theta));
inside_Qfin = (T_values(1,1) - Tinf) + (T_values(node_limit,1) - Tinf);
run_sum = 0;
for m = 2:1:node_limit-1
    run_sum = (T_values(m,1) - Tinf);
    
end
inside_Qfin= inside_Qfin + 2*run_sum;
Qfin = Qfin*inside_Qfin;
%fin efficiency
Qmax = h*(2*w*L/cos(theta))*(T0 - Tinf);
nfin = Qfin/Qmax;

