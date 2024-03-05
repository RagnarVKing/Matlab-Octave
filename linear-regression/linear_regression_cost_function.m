function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  Theta(1, :) = [];
  m = length(Y);
  vector = FeatureMatrix * Theta;
  Error = 0;
  for i = 1:m
    Error += (vector(i, 1) - Y(i, 1))^2;
  endfor
  Error /= 2 * m;
endfunction