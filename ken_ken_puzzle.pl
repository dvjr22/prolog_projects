% solve kensken
% Diego Valdes
% CSCE 580
% 1/2/2017

kenken() :-
    solution(A1,A2,A3,A4,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4),
    nl, write('The solution is: '), nl,
    printrow(A1,A2,A3,A4), printrow(B1,B2,B3,B4),
    printrow(C1,C2,C3,C4), printrow(D1,D2,D3,D4).

printrow(P,Q,R,S) :- write(' '), write(P), write(' '), write(Q), write(' '), write(R), write(' '), write(S), nl.



solution(A1,A2,A3,A4,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4) :-
    % test rows
    uniq(A1,A2,A3,A4), uniq(B1,B2,B3,B4), uniq(C1,C2,C3,C4), uniq(D1,D2,D3,D4),
    % test cols
    uniq(A1,B1,C1,D1), uniq(A2,B2,C2,D2), uniq(A3,B3,C3,D3), uniq(A4,B4,C4,D4),
    % test cells
    minusTwo(A1,A2), divTwo(A3,A4), minusThree(B1,C1), plusEight(B2,B3,C3),
    multSixteen(D1,D2,C2), plusSeven(C4,D4).

% uniq holds if all the cells are distinct and from 1 - 4
uniq(P,Q,R,S) :- num(P), num(Q), num(R), num(S),
              \+ P = Q,  \+ P = R,  \+ P = S,
                         \+ Q = R,  \+ Q = S,
                                    \+ R = S.

% cell math logic
minusTwo(X,Y) :- 2 is X - Y.
minusTwo(X,Y) :- 2 is Y - X.
divTwo(X,Y) :- 2 is X//Y.
divTwo(X,Y) :- 2 is Y//X.
minusThree(X,Y) :- 3 is X - Y.
minusThree(X,Y) :- 3 is Y - X.
plusEight(X,Y,Z) :- 8 is X + Y + Z.
multSixteen(X,Y,Z) :- 16 is X * Y * Z.
plusSeven(X,Y) :- 7 is X + Y.

% the numbers for the puzzle
num(1).
num(2).
num(3).
num(4).
