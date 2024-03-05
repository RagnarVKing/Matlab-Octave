function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  [m, n] = size(InitialMatrix);
  cols = n;
  for i = 1:n
    if strcmp(InitialMatrix(1, i), 'furnished') == 1
      cols++;
    elseif strcmp(InitialMatrix(1, i), 'unfurnished') == 1
      cols++;
    elseif strcmp(InitialMatrix(1, i), 'semi-furnished') == 1
      cols++;
    endif
  endfor
  %FeatureMatrix = cell(m, cols);
  for i = 1:m
    k = 1;
    for j = 1:n
      if strcmp(InitialMatrix(i, j), 'furnished') == 1
        FeatureMatrix(i, k) = 0;
        k++;
        FeatureMatrix(i, k) = 0;
      elseif strcmp(InitialMatrix(i, j), 'unfurnished') == 1
        FeatureMatrix(i, k) = 0;
        k++;
        FeatureMatrix(i, k) = 1;
      elseif strcmp(InitialMatrix(i, j), 'semi-furnished') == 1
        FeatureMatrix(i, k) = 1;
        k++;
        FeatureMatrix(i, k) = 0;
      elseif strcmp(InitialMatrix(i, j), 'yes') == 1
        FeatureMatrix(i, k) = 1;
      elseif strcmp(InitialMatrix(i, j), 'no') == 1
        FeatureMatrix(i, k) = 0;
      else
        FeatureMatrix(i, k) = str2double(InitialMatrix(i, j));
      endif
      k++;
    endfor
  endfor
  %FeatureMatrix = cell2mat(FeatureMatrix);
endfunction