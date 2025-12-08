% base distances (define only each pair once)
d(a,b,10). d(a,c,15). d(a,d,20).
d(b,c,35). d(b,d,25).
d(c,d,30).

dist(X,Y,D) :- d(X,Y,D).
dist(X,Y,D) :- d(Y,X,D).

tour_dist([_],0).
tour_dist([A,B|T], D) :- dist(A,B, D1), tour_dist([B|T], D2), D is D1 + D2.

tsp(Start, Path, Cost) :-
  findall(C, (dist(Start,C,_), C\=Start), Cs0),
  list_to_set(Cs0,Cs),
  permutation(Cs,Perm),
  append([Start|Perm], [Start], Path),
  tour_dist(Path, Cost).

shortest(Start, BestPath, MinCost) :-
  setof([C,P], (tsp(Start,P,C)), Set),
  Set = [[MinCost, BestPath]|_].


run:
?- shortest_tsp(a, Path, Cost).
% Path = [a,b,d,c,a], Cost = 80

