function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  f = fopen(file_path, "r");
  mat = csvread(file_path);
  fclose(f);
  [m, n] = size(mat);
  InitialMatrix = cell(m - 1, n - 1);
  Y = cell(m - 1, 1);
  mat(1, :) = [];
  Y = mat(:, 1);
  
  f = fopen(file_path, "r");
  line = fscanf(f, "%s", 1);
  for i = 1:(m - 1)
    line = fscanf(f, "%s", 1);
    [token, remain] = strtok(line, ", ");
    for j = 1:(n - 1)
      [token, remain] = strtok(remain, ", ");
      InitialMatrix(i, j) = token;
    endfor
  endfor
  fclose(f);
endfunction