calc(X, '+', Y, R) :- R is X + Y.
calc(X, '-', Y, R) :- R is X - Y.
calc(X, '*', Y, R) :- R is X * Y.
calc(X, '/', Y, R) :- Y =\= 0, R is X / Y.


run: 

?- calculate(10,'+',5,R).  % R = 15
?- calculate(20,'/',4,R).  % R = 5.0

