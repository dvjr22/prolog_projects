%Diego Valdes
%CSCE 580
%Feb 13, 2017
%block world model

%allows changes to be made to located_on(X,Y)
:- dynamic (located_on/2).

%blocks a - g - X is a block
%block(X)
block(block_a). block(block_b).	block(block_c).
block(block_d). block(block_e). block(block_f).
block(block_g).

%shapes of blocks - X is the shape Y
%shape(X,Y)
shape(block_a, pyramid). shape(block_b, cube). shape(block_c, cube).
shape(block_d, cube). shape(block_e, cube). shape(block_f, cube).
shape(block_g, wedge).

%colors of blocks - X is the color Y
%color(X,Y)
color(block_a, red). color(block_b, red). color(block_c, green).
color(block_d, red). color(block_e, red). color(block_f, red).
color(block_g, orange).

%size of blocks - X is the size Y
%size(X,Y)
size(block_a, large). size(block_b, large). size(block_c, small).
size(block_d, large). size(block_e, large). size(block_f, large).
size(block_g, large).

%locations
%columns - X is located on top of Y
%located_on(X,Y)
located_on(block_a, block_b).
located_on(block_c, block_d).
located_on(block_f, table3).
located_on(block_g, table4).
located_on(block_b, table1).
located_on(block_d, block_e).
located_on(block_e, table2).

%modify located_on - put X on top of Y
%put_on(X,Y)
put_on(X, Y) :-
	%check if movement is possible
	%if so make modifications to kb
	is_possible(Y), !, modify(X, Y).

%check if destination block is available to have a block
%placed on top
is_possible(Y) :-
	%check if space above is empty
	%and block is a cube
	\+ below(Y,_), !, shape(Y, cube).


%make modifications to knowledge base
modify(X, Y) :-
	retract(located_on(X, _)),
	assert(located_on(X, Y)).


%areas of table - X is adjacent to Y
%adjacent(X,Y)
adjacent(table1, table2). adjacent(table2, table3). adjacent(table3, table4).
adjacent(table2, table1). adjacent(table3, table2). adjacent(table4, table3).

%which blocks are next to each other - X is immediately next to Y
%beside(X,Y)
% beside(block_a, block_d). beside(block_b, block_e). beside(block_e,
% block_f). beside(block_e, block_b).
%beside(block_f, block_g). beside(block_f, block_e).

%check to see if blocks are beside each other
%beside(X,Y)
beside(X, Y) :-
	above(X,A), above(Y,B), adjacent(A,B).


%which blocks are above each other - X is above Y
%above(X,Y)
above(X, Y) :- located_on(X, Y).
above(X, Y) :- located_on(X, Z), above(Z, Y).

%which blocks are below each other - X is below Y
below(X, Y) :- located_on(Y, X).
below(X, Y) :- located_on(Z, X), below(Z, Y).

% ********************block_lexicon************************

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

%*************block parser************************************
%taken from Thinking as Computation
%ch8 as instructed in exercise

np([Name], X) :- proper_noun(Name, X).
np([Art|Rest], X) :- article(Art), np2(Rest, X).

np2([Adj|Rest], X) :- adjective(Adj, X), np2(Rest, X).
np2([Noun|Rest], X) :- common_noun(Noun, X), mods(Rest, X).

mods([],_).
mods(Words, X) :-
	append(Start, End, Words),
	pp(Start, X),
	mods(End, X).

pp([Prep|Rest], X) :- preposition(Prep, X, Y), np(Rest, Y).

