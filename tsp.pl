d(a,b,10). d(a,c,15). d(a,d,20). d(b,c,35). d(b,d,25). d(c,d,30).
dist(X,Y,D):-d(X,Y,D);d(Y,X,D).
tour([_],0). tour([A,B|T],D):-dist(A,B,D1),tour([B|T],D2),D is D1+D2.
tsp(S,P,C):-findall(X,(dist(S,X,_),X\=S),L),list_to_set(L,N),permutation(N,R),
            append([S|R],[S],P),tour(P,C).
shortest(S,P,C):-setof([C1,P1],tsp(S,P1,C1),[[C,P]|_]).
%run:
%?- shortest(a, Path, Cost).
% Path = [a,b,d,c,a], Cost = 80

