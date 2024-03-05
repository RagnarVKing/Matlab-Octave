function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  % TODO: split_dataset implementation
  
  [m, n] = size(X);
  random = randperm(m);
  X = X(random, :);
  y = y(random, :);
  X_train = X(1:round(m * percent), :)
  X_test = X((round(m * percent) + 1):m, :);
  y_train = y(1:round(m * percent), :)
  y_test = y((round(m * percent) + 1):m, :);
endfunction
