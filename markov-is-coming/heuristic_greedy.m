function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
  [m, n] = size(Adj);
  m = m - 2;
  n = n - 2;
  visited = zeros(m + 2, 1);
  path(1) = start_position;
  visited(start_position) = 1;
  while length(path)
   position = path(end);
   if position == (m + 1)
     path = path';
     return;
   endif
   stop = 0;
   maxprob = 0;
   for i = 1:(m + 2)
     if Adj(position, i) == 1
       if (visited(i) == 1) && (stop == 0)
         continue;
       else
         stop = 1;
         if (probabilities(i) > maxprob)
           maxprob = probabilities(i);
           neigh = i;
         endif
       endif
     endif
   endfor
   if stop == 1
     visited(neigh) = 1;
     path(end + 1) = neigh;
   else
     path(end) = [];
   endif
  endwhile
  path = path';
endfunction

