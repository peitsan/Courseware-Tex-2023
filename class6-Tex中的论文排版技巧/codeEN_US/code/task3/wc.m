%% goodness of fit calculation function
% r_adjusted refers to the adjusted goodness of fit, which is the fitting degree of the regression line to the observed value.

function R2=wc(reverse_out,test_y,k)
R2=1-(sum((reverse_out-test_y).^2)/(size(reverse_out,1)-k-1))
/(sum((mean(test_y)-test_y).^2)/(size(reverse_out,1)-1));、
end