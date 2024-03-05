function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  [m, n] = size(path);
  m = m - 1;
  decoded_path = zeros(m, n + 1);
  for i = 1:m
    row = cols;
    while 1
      if (path(i, n) > (row - cols)) && (path(i, n) < (row + 1))
        row = row / cols;
        column = rem(path(i, n), cols);
        if column == 0
          column = cols;
        endif
        break;
      endif
      row = row + cols;
    endwhile
    decoded_path(i, n) = row;
    decoded_path(i, n + 1) = column;
  endfor

endfunction
