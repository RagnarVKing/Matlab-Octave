function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  Theta(1, :) = [];
  m = length(Y);
  vector = FeatureMatrix * Theta;
  Error = 0;
  for i = 1:m
    Error += (vector(i, 1) - Y(i, 1))^2;
  endfor
  Error /= 2 * m;
  theta = 0;
  for i = 1:(length(Theta))
    theta += Theta(i)^2;
  endfor
  Error += lambda * theta;
endfunction