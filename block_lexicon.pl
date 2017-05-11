%Diego Valdes
%CSCE 580
%Feb 13, 2017
%block lexicon

%articles
article(a). article(the). article(any).

%common nouns
common_noun(block, X) :- block(X).
common_noun(cube, X) :- block(X), shape(X, cube).
common_noun(pyramid, X) :- block(X), shape(X, pyramid).
common_noun(wedge, X) :- block(X), shape(X, wedge).

%adjectives
adjective(large, X) :- size(X, large).
adjective(small, X) :- size(X, small).
adjective(orange, X) :- color(X, orange).
adjective(green, X) :- color(X, green).
adjective(red, X) :- color(X, red).
adjective(pyramid, X) :- shape(X, pyramid).
adjective(wedge, X) :- shape(X, wedge).
adjective(cube, X) :- shape(X, cube).

%prepositions
preposition(on, X, Y) :- located_on(X, Y).
preposition(above, X, Y) :- above(X, Y).
preposition(beside, X, Y) :- beside(X, Y).
preposition(below, X, Y) :- below(X, Y).

proper_noun(X, X) :- \+ article(X), \+ adjective(X,_),
	\+ common_noun(X,_), \+ preposition(X,_,_).
