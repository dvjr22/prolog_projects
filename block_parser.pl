%Diego Valdes
%CSCE 580
%Feb 13, 2017
%block parser
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
