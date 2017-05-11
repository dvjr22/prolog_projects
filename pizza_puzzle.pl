%problem # 4
%who ordered the pizza
solution(Donna,Danny,David,Doreen,Steak,Chicken,Lasagna,Pizza,Coke,Milk,Coffee,Water) :-
        variables(Donna,Danny,David,Doreen,Steak,Chicken,Lasagna,Pizza,Coke,Milk,Coffee,Water),
        own_the_pizza(Pizza,Danny,'Danny'),
        own_the_pizza(Pizza,Donna,'Donna'),
        own_the_pizza(Pizza,Doreen,'Doreen'),
        own_the_pizza(Pizza,David,'David').

own_the_pizza(X,X,Name) :- write(Name), write(' ordered the pizza.').
own_the_pizza(X,Y,_) :- \+ X=Y.

variables(Donna,Danny,David,Doreen,Steak,Chicken,Lasagna,Pizza,Coke,Milk,Coffee,Water) :-
	uniq_people(Donna,Danny,David,Doreen),
	uniq_people(Steak,Chicken,Lasagna,Pizza),
        uniq_people(Coke,Milk,Coffee,Water),

	Chicken = Coke,        % The chicken came with a Coke.
        \+ David = Coffee,     % David never drinks coffee.
        Donna = Water,         % Donna only drinks water.
        \+ Danny = Steak,      % Danny could not afford to order steak.
	across_table(Danny,David),
        across_table(Donna,Doreen),  %The men sat across from each other, as did the women.
        beside_table(Doreen,Steak),  % Doreen sat beside the person who ordered steak.
	across_table(Lasagna,Milk).  % The person with the lasagna sat across from the person with milk.



% table arrangements
uniq_people(A,B,C,D) :-
        position(A), position(B), position(C), position(D),
        \+ A=B, \+ B=C, \+ C=D,
	\+ A=C, \+ B=D,
	\+ A=D.

position(1). position(2). position(3). position(4).

across_table(X,Y) :- X =:= Y-2.
across_table(X,Y) :- X =:= Y+2.
beside_table(X,Y) :- X =:= Y-1.
beside_table(X,Y) :- X =:= Y+1.
