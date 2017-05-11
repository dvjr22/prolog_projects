% solve hw06




solve() :-
 word(P11,P12,P13),
 word(P11,P21,P31),
 word(P21,P22,P23),
	
	word(P12,P22,P32),
 word(P31,P32,P33),
 word(P13,P23,P33),
	
	nl, write('solution:'), nl,
	
	printrow(P11,P12,P13),
	printrow(P21,P22,P23),
	printrow(P31,P32,P33).



printrow(A,B,C) :- write(' '), write(A), write(' '),
	write(B), write(' '), write(C), nl.


word(a,d,d). 
word(a,d,o). 
word(a,g,e). 
word(a,g,o). 
word(a,i,d).

word(a,i,l). 
word(a,i,m). 
word(a,i,r). 
word(a,n,d). 
word(a,n,y).

word(a,p,e). 
word(a,p,t). 
word(a,r,c). 
word(a,r,e). 
word(a,r,k).

word(a,r,m). 
word(a,r,t). 
word(a,s,h). 
word(a,s,k). 
word(a,u,k).

word(a,w,e). 
word(a,w,l). 
word(a,y,e). 
word(b,a,d). 
word(b,a,g).

word(b,a,n). 
word(b,a,t). 
word(b,e,e). 
word(b,o,a). 
word(e,a,r).

word(e,e,l). 
word(e,f,t). 
word(f,a,r). 
word(f,a,t). 
word(f,i,t).

word(l,e,e). 
word(o,a,f). 
word(r,a,t). 
word(t,a,r). 
word(t,i,e).