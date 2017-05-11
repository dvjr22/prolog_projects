%problem # 3
%cryptarithmetic puzzle CROSS + ROADS = DANGER
solution(C,R,O,S,A,D,G,E,N) :-
	dig(S),
	R is (S+S) mod 10, C1 is (S+S) // 10,
	dig(S), dig(D),
	E is (S+D+C1) mod 10, C10 is (S+D+C1) // 10,
	dig(O), dig(A),
	G is (O+A+C10) mod 10, C100 is (O+A+C10) // 10,
	dig(R), dig(O),
	N is (R+O+C100) mod 10, C1000 is (R+O+C100) // 10,
	dig(C), C > 0, dig(R), R > 0,
	A is (C+R+C1000) mod 10, D is (C+R+C1000) // 10,
	uniq_digits(C,R,O,S,A,D,G,E,N).

%uniq for digits
uniq_digits(C,R,O,S,A,D,G,E,N) :-
	dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(G), dig(E), dig(N),
	\+C =R, \+C= O, \+C= S, \+C= A, \+C =D, \+C =G, \+C =E, \+C =N,
	        \+R= O, \+R= S, \+R =A, \+R =D, \+R =G, \+R =E, \+R =N,
		        \+O= S, \+O =A, \+O =D, \+O =G, \+O =E, \+O =N,
			        \+S =A, \+S =D, \+S =G, \+S =E, \+S =N,
				        \+A =D, \+A =G, \+A =E, \+A =N,
					        \+D =G, \+D =E, \+D =N,
						        \+G =E, \+G =N,
							        \+E =N.




%digits
dig(0). dig(1). dig(2). dig(3). dig(4).
dig(5). dig(6). dig(7). dig(8). dig(9).
