%problem 6, chapter 7
%lists clauses
%(X=3)
exactly_3(X) :- append([_,_,_|[]],[],X).
%(X>=3)
at_least_3(X) :- append([_,_,_|_],_,X).

%cascade through possibilities (X<=3)
%0
at_most_3(X) :- append([],[],X).
%1
at_most_3(X) :- append([_|[]],[],X).
%2
at_most_3(X) :- append([_,_|[]],[],X).
%3
at_most_3(X) :- append([_,_,_|[]],[],X).


%intersection w/o recursion
intersect(X,Y) :- member(Z,X), member(Z,Y).

%intersection w/ recursion
all_intersect([],_).
all_intersect([X|Y],Z):- intersect(X,Z), all_intersect(Y,Z).
