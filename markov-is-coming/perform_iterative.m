function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

  [m, n] = size(c);
  x = zeros(m, n);
  steps = 0;
  err = 1;
  while (steps < max_steps) && (tol < err)
    x = G * x0 + c;
    err = norm(abs(x - x0));
    x0 = x;
    steps++;
  endwhile
   
endfunction
