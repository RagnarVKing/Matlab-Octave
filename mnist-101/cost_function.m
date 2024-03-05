function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg
  
  % TODO: cost_function implementation

  % TODO1: get Theta1 and Theta2 (from params). Hint: reshape
  
  s1 = input_layer_size;
  s2 = hidden_layer_size;
  s3 = output_layer_size;
  
  Theta1 = zeros(s2, s1 + 1);
  Theta2 = zeros(s3, s2 + 1);
  
  Theta1(:) = params(1:s2*(s1+1));
  Theta2(:) = params(s2*(s1+1)+1:end);
  
  Delta1 = zeros(s2, s1 + 1);
  Delta2 = zeros(s3, s2 + 1);
  
  % TODO2: Forward propagation
  % TODO3: Compute the error in the output layer and perform backpropagation
   
  [m, n] = size(X);
  matrix = zeros(m, 10);
  for i = 1:m
    a = X(i, :);
    a = a';
    a = [1; a];
    a1 = a';
    
    z = Theta1 * a;
    z2 = z;
    a = sigmoid(z);
    a = [1; a];
    a2 = a';
    
    z = Theta2 * a;
    
    a = sigmoid(z);
    
    matrix(i, :) = a;
    
    err = a;
    err(y(i))--;
    
    Delta2 += err * a2;
    
    err = (Theta2' * err) .* [1; (sigmoid(z2) .* (1 - sigmoid(z2)))];
    err(1, :) = [];
    Delta1 += err * a1;
      
  endfor
  Delta1 /= m;
  Delta2 /= m;
    
  Delta1(:, 2:end) += lambda / m * Theta1(:, 2:end);
  Delta2(:, 2:end) += lambda / m * Theta2(:, 2:end);
  
  
  % TODO4: Determine the gradients
  v1 = reshape(Delta1, [], 1);
  v2 = reshape(Delta2, [], 1);
  grad = [v1; v2];
  
  % TODO5: Final J and grad
   J = 0;
   for i = 1:m
     J -= log(matrix(i, y(i)));
     J -= sum(log(1 - matrix(i, :))) - log(1 - matrix(i, y(i)));
   endfor
   J /= m;

   J += (lambda / (2 * m)) * (sum(sum(Theta1(1:s2, 2:s1+1).^2)) + sum(sum(Theta2(1:s3, 2:s2+1).^2)));

   
endfunction
