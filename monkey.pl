:- set_prolog_flag(answer_write_options, [max_depth(0)]).

initial(state(left, floor, right, no)).
initial(state(left,floor,right,no)).
goal(state(_,_,_,yes)).

action(move(X,Y),  state(X,floor,B,H),   state(Y,floor,B,H)).
action(push(X,Y),  state(X,floor,X,H),   state(Y,floor,Y,H)).
action(climb,      state(X,floor,X,H),   state(X,onbox,X,H)).
action(grasp,      state(middle,onbox,middle,no), 
                    state(middle,onbox,middle,yes)).

solve(Plan) :- initial(S), dfs(S, [], Plan), write(Plan).

dfs(S, _, []) :- goal(S).
dfs(S, V, [A|R]) :-
    action(A, S, S2),
    \+ member(S2, V),
    dfs(S2, [S|V], R).


run:

?- solve(Plan).
% Plan = [move(left,right), push(right,middle), climb, grasp]
