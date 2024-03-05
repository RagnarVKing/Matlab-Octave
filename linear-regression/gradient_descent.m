function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  [x, y] = size(FeatureMatrix);
  Theta = zeros(y, 1);
  for i = 1:iter
    vector = FeatureMatrix * Theta;
    for j = 1:n
      error = 0;
      for k = 1:m
        error += (vector(k, 1) - Y(k, 1)) * FeatureMatrix(k, j);
      endfor
      d(j, 1) = error;
    endfor
    Theta -= alpha * d / m;
  endfor
  Theta = [0; Theta];
endfunction