function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;
  [m, n] = size(FeatureMatrix);
  x_0 = zeros(n, 1);
  
  if A != A'
    Theta = zeros(n + 1, 1);
    return;
  endif
  eig_values = eig(A);
  for i = 1:(length(eig_values))
    if eig_values(i) < 0
      Theta = zeros(n + 1, 1);
      return;
    endif
  endfor

  r = b - A * x_0;
  v = r;
  Theta = x_0;
  tolsquared = tol^2;
  k = 1;
  while (k <= iter) && (r' * r > tol)
    t = (r' * r) / (v' * A * v);
    Theta += t * v;
    r_prevoius = r;
    r -= t * A * v;
    s = (r' * r) / (r_prevoius' * r_prevoius);
    v = r + s * v;
    k++;
  endwhile
  Theta = [0; Theta];
endfunction