function [K] = ThCond(Temp, Name)
%Asks the user for an alloy name and computes the Thermal Conductivity
%based on Temperature T, T can be an a scalar, a vector or a matrix
T_shape =size(Temp);

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
                    error('Temperature out of Range for Alloy');
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
                    error('Temperature out of Range for Alloy');
                    break;
                end
                
            end
            
            
        end
    case 'Al3'
        lower = 298;
        upper = 890;
        for ii = 1:T_shape(1)
            for jj = 1:T_shape(2)
                t = Temp(ii,jj);
                if(lower<=t && t<= upper)
                    k = 124.7 + 0.56*t+1*10^-5*t^2;
                    K(ii,jj) = k;
                else
                    error('Temperature out of Range for Alloy');
                    
                end
                
            end
            
            
        end
    case 'Cu1'
        lower = 100;
        upper = 1200;
        for ii = 1:T_shape(1)
            for jj = 1:T_shape(2)
                t = Temp(ii,jj);
                if(lower<=t && t<= upper)
                    k = 453.9-0.1054*t;
                    K(ii,jj) = k;
                else
                    error('Temperature out of Range for Alloy');
                    break;
                end
                
            end
            
            
        end
    case 'Cu2'
        lower = 460;
        upper = 1188;
        for ii = 1:T_shape(1)
            for jj = 1:T_shape(2)
                t = Temp(ii,jj);
                if(lower<=t && t<= upper)
                    k = 140.62+112.14*10^-4*t;
                    K(ii,jj) = k;
                else
                    error('Temperature out of Range for Alloy');
                    break;
                end
                
            end
            
            
        end
    case 'Cu3'
        
        upper = 773;
        for ii = 1:T_shape(1)
            for jj = 1:T_shape(2)
                t = Temp(ii,jj);
                if(t<= upper)
                    k = 16.041+438.9*10^-4*t;
                    K(ii,jj) = k;
                else
                    error('Temperature out of Range for Alloy');
                    break;
                end
                
            end
            
            
        end
    case 'St1'
        lower = 400;
        upper = 1000;
        for ii = 1:T_shape(1)
            for jj = 1:T_shape(2)
                t = Temp(ii,jj);
                if(lower<=t && t<= upper)
                    k = 76.63-0.0459*t;
                    K(ii,jj) = k;
                else
                    error('Temperature out of Range for Alloy');
                    break;
                end
                
            end
            
            
        end
    case 'St2'
        lower = 298;
        upper = 1573;
        for ii = 1:T_shape(1)
            for jj = 1:T_shape(2)
                t = Temp(ii,jj);
                if(lower<=t && t<= upper)
                    k = 6.31+27.2*10^-3*t-7*10^-6*t^2;
                    K(ii,jj) = k;
                else
                    error('Temperature out of Range for Alloy');
                    break;
                end
                
            end
            
            
        end
    case 'St3'
        
        upper = 1727;
        for ii = 1:T_shape(1)
            for jj = 1:T_shape(2)
                t = Temp(ii,jj);
                if(t<= upper)
                    k = 20+61.5*10^-4*t;
                    K(ii,jj) = k;
                else
                    error('Temperature out of Range for Alloy');
                    break;
                end
                
            end
            
            
        end
    otherwise
        error('Not a valid Alloy');
        
end
end

