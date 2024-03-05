function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  [Link] = get_adjacency_matrix(Labyrinth);
  [m, n] = size(Link);
  m = m - 2;
  vector = zeros(m);
  for i = 1:m
    for j = 1:n
      if Link(i, j) == 1
        vector(i)++;
      endif
    endfor
  endfor
  for i = 1:m
    for j = 1:n
      if Link(i, j) == 1
        Link(i, j) = 1 / vector(i);
      endif
    endfor
  endfor
endfunction
