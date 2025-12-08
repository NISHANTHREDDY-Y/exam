hanoi(1, S, D, _) :- format('Move 1: ~w -> ~w~n', [S,D]).
hanoi(N, S, D, T) :-
  N>1, M is N-1,
  hanoi(M, S, T, D),
  hanoi(1, S, D, _),
  hanoi(M, T, D, S).


run:

?- hanoi(3,left,right,center).

