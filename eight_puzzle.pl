% neighbors: index positions that can swap with blank
neighbor(0,[1,3]).
neighbor(1,[0,2,4]).
neighbor(2,[1,5]).
neighbor(3,[0,4,6]).
neighbor(4,[1,3,5,7]).
neighbor(5,[2,4,8]).
neighbor(6,[3,7]).
neighbor(7,[4,6,8]).
neighbor(8,[5,7]).

swap(List,I,J,New) :-
  nth0(I,List,A), nth0(J,List,B),
  set_nth(List,I,B,Tmp), set_nth(Tmp,J,A,New).

set_nth([_|T],0,X,[X|T]).
set_nth([H|T],I,X,[H|R]) :- I>0, I1 is I-1, set_nth(T,I1,X,R).

bfs([[State|Path]|_], _, [State|Path]) :- State = [1,2,3,4,5,6,7,8,0].
bfs([[State|Path]|Q], Vis, Sol) :-
  nth0(I,State,0),
  findall([N,State|Path],
    (neighbor(I,Ns), member(J,Ns), swap(State,I,J,N), \+ member(N,Vis), \+ member(N,[State|Path])),
    New),
  append(Q, New, Q2),
  bfs(Q2, [State|Vis], Sol).

solve(Start, Path) :- bfs([[Start]], [], P), reverse(P, Path).


run: 

?- solve([2,8,3,1,6,4,7,0,5]).

