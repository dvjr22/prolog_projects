%problem # 2
%map coloring problem for central Europe
solution(F, S, I, B, H, G, A) :-
	color(F), color(S), color(I), color(B), color(H), color(G), color(A),
	\+ F = B, \+ F = S, \+ F = I,
	\+ B = S, \+ B = G, \+ B = H,
	\+ H = G,
	\+ G = S, \+ G = A,
	\+ A = S, \+ S = I.

%colors to be selected
color(red).
color(yellow).
color(orange).
