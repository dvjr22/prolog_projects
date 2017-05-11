add(X, Y, Z) :- Z is X + Y.
add_test(X, Y) :- 12 is X + Y.

mult(X, Y, Z) :- Z is X*Y.
mult_test(X, Y) :- 12 is X*Y.

div(X, Y, Z) :- Z is X/Y.
div(X, Y) :- 2 is X/Y.
