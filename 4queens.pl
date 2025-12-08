solve_4(Sol) :-
  permutation([1,2,3,4], Sol),
  safe(Sol).

safe([]).
safe([Q|Qs]) :- safe(Qs), no_attack(Q, Qs, 1).

no_attack(_, [], _).
no_attack(Q, [Q1|Qs], D) :-
  Q =\= Q1 + D, Q =\= Q1 - D,
  D1 is D+1, no_attack(Q, Qs, D1).

run:

?- solve_4_queens(Solution).
% Solution = [2,4,1,3] ; Solution = [3,1,4,2]

