function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  [m, n] = size(Labyrinth);
  Adj = zeros(m * n + 2, m * n + 2);
  sparse(Adj);
  index = 1;
  Adj(m * n + 1, m * n + 1) = 1;
  Adj(m * n + 2, m * n + 2) = 1;
  for i = 1:m
    for j = 1:n
      if i == 1
        if rem(Labyrinth(i, j), 16) < 8 %%nord
            Adj(index, m * n + 1) = 1;
        endif
        if rem(Labyrinth(i, j), 8) < 4 %%sud
            Adj(index, index + n) = 1;
        endif
      elseif i == m
        if rem(Labyrinth(i, j), 16) < 8 %%nord
            Adj(index, index - n) = 1;
        endif
        if rem(Labyrinth(i, j), 8) < 4 %%sud
            Adj(index, m * n + 1) = 1;
        endif
      else
        if rem(Labyrinth(i, j), 16) < 8 %%nord
            Adj(index, index - n) = 1;
        endif
        if rem(Labyrinth(i, j), 8) < 4 %%sud
            Adj(index, index + n) = 1;
        endif
      endif
      
      if j == 1
        if rem(Labyrinth(i, j), 2) == 0 %%vest
            Adj(index, m * n + 2) = 1;
        endif
        if rem(Labyrinth(i, j), 4) < 2 %%est
            Adj(index, index + 1) = 1;
        endif
      elseif j == n
        if rem(Labyrinth(i, j), 2) == 0 %%vest
            Adj(index, index - 1) = 1;
        endif
        if rem(Labyrinth(i, j), 4) < 2 %%est
            Adj(index, m * n + 2) = 1;
        endif
      else
        if rem(Labyrinth(i, j), 2) == 0 %%vest
            Adj(index, index - 1) = 1;
        endif
        if rem(Labyrinth(i, j), 4) < 2 %%est
            Adj(index, index + 1) = 1;
        endif
      endif
      index++;
    endfor
  endfor
endfunction
