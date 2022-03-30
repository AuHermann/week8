
function [z] = calculate_z(coef)
    x0 = -coef(1)/coef(2);
    angle = asin(coef(1)/(sqrt(coef(1)^2+ x0^2)));  
    z = 0.1 * (angle-(pi/2)) ;

end