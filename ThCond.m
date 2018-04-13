function [K] = ThCond(Temp, Name)
%Asks the user for an alloy name and computes the Thermal Conductivity
%based on Temperature T, T can be an a scalar, a vector or a matrix
T_shape =size(T);

K = [];

switch Name
    case 'Al1'
        lower = 298;
        upper = 840;
        for ii = 1:T_shape(1)
            for jj = 1:T_shape(2)
                t = Temp(ii,jj);
                if(lower<=t && t<= upper)
                    k = 149.7+0.0809*t-1*10^-4*t^2;
                    K(ii,jj) = k;
                else
                    error('Temperature out of Range for Alloy ' + Name);
                    break;
                end
                
            end      
    
                
        end
    
    case 'Al2'
        lower = 298;
        upper = 773;
        for ii = 1:T_shape(1)
            for jj = 1:T_shape(2)
                t = Temp(ii,jj);
                if(lower<=t && t<= upper)
                    k = 76.64+0.2633*t-2*10^-4*t^2;
                    K(ii,jj) = k;
                else
                    error('Temperature out of Range for Alloy ' + Name);
                    break;
                end
                
            end      
    
                
        end
end
end
            
