function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits
  
  % Labyrinth -> the matrix of all encodings for the labyrinth's walls
  
  f = fopen(file_path, "r");
  m = fscanf(f, "%d", 1);
  n = fscanf(f, "%d", 1);
  for i = 1:m
    for j = 1:n
      Labyrinth(i,j) = fscanf(f, "%d", 1);
    endfor
  endfor
  fclose(f);

endfunction
