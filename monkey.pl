% initial and goal states
initial(state(left, floor, right, no)).
goal(state(_, _, _, yes)).

% actions
action(move(X,Y),
       state(X, floor, B, H),
       state(Y, floor, B, H)).

action(push(X,Y),
       state(X, floor, X, H),
       state(Y, floor, Y, H)).

action(climb,
       state(X, floor, X, H),
       state(X, onbox, X, H)).

action(grasp,
       state(middle, onbox, middle, no),
       state(middle, onbox, middle, yes)).

% solver
solve(State, []) :- goal(State).
solve(State, [A|Rest]) :-
    action(A, State, S2),
    solve(S2, Rest).
