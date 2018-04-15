T_Al1 = linspace(298,840,100);
T_Al2 = linspace(298,773,100);
T_Al3 = linspace(298,890,100);
T_Cu1 = linspace(100,1200,100);
T_Cu2 = linspace(460,1188,100);
T_Cu3 = linspace(0,1143,100);
T_St1 = linspace(400,1000,100);
T_St2 = linspace(298,1573,100);
T_St3 = linspace(0,1727,100);

k_Al1 = ThCond(T_Al1,'Al1');
k_Al2 = ThCond(T_Al2,'Al2');
k_Al3 = ThCond(T_Al3,'Al3');
k_Cu1 = ThCond(T_Cu1,'Cu1');
k_Cu2 = ThCond(T_Cu2,'Cu2');
k_Cu3 = ThCond(T_Cu3,'Cu3');
k_St1 = ThCond(T_St1,'St1');
k_St2 = ThCond(T_St2,'St2');
k_St3 = ThCond(T_St3,'St3');

hold on
semilogy(T_Al1,k_Al1,'r--');
semilogy(T_Al2,k_Al2,'k--');
semilogy(T_Al3,k_Al3,'m--');

semilogy(T_Cu1,k_Cu1,'g<');
semilogy(T_Cu2,k_Cu2,'c*:');
semilogy(T_Cu3,k_Cu3,'b+');

semilogy(T_St1,k_St1,'k-');
semilogy(T_St2,k_St2,'g+');
semilogy(T_St3,k_St3,'rx:');
legend('Al1','Al2','Al3','Cu1','Cu2','Cu3','St1','St2','St3');
grid on
title('Thermal Conductivity of Al, Cu, St 1-3');
ylabel('Thermal Conductivity [W/m.K]');
xlabel('Temperature [K]');
