:- module(batalha,[]).

:- use_module(util).
:- use_module(print).

%-------------------------------------------

% Inimigo = [nome, descr, vidaAtual, vidaMax, dano, forca, agilidade, defesa]
verificaListaMortos([],Sai) :- 
	Sai is 1.
verificaListaMortos([[_,_,V,_,_,_,_,_]|Resto], Sai) :- 
	(V =< 0) -> verificaListaMortos(Resto,Sai); 
	Sai is 0. 

%-------------------------------------------

tipoAtk(1, BD, BE) :-       % bonus de dano, bonus de esquiva
	BD is 5,
	BE is 4.
tipoAtk(2, BD, BE) :-
	BD is 0,
	BE is 0.

%-------------------------------------------

critico(Agilidade, Sai) :-
	random(1, 101, Random),
	random(1, 11, AuxRand),
	RandomA is AuxRand + (Agilidade * 4 / 10),
	((Random < RandomA) -> Sai is 1; 
	Sai is 0).

esquiva(Agilidade, Sai) :-
	random(1, 101, Random),
	random(1, 11, AuxRand),
	RandomA is AuxRand + (Agilidade * 4 / 10),
   
	((Random < RandomA) -> Sai is 1; 
	Sai is 0).

%-------------------------------------------

atkCritico(Atk, 0, NewAtk) :-
	fixNum(Atk, NewAtk).
atkCritico(Atk, 1, NewAtk) :-
	fixNum((Atk * 2), NewAtk).

% Heroi = [Nome, vidaAtual, vidaMaxima, Dano, Defesa, Forca, Agilidade, Dinheiro, Arma, Armadura, Bolsa]
heroiAtaca([Nome,_,_,D,F,A,_,_,_,_,_], Bonus, Dano) :-
	Aux is (D + (F / 10) + ((D * Bonus) / 100)),
	critico(A, Critic),
	atkCritico(Aux, Critic, Dano),
	print:printHeroiAtaca(Nome, Dano).

%-------------------------------------------

% Inimigo = [nome, descr, vidaAtual, vidaMax, dano, forca, agilidade, defesa]
inimigoAtaca([Nome,_,_,_,D,F,A,_], Dano) :-
	Aux is (D + (F / 10)),
	critico(A,Critic),
	atkCritico(Aux, Critic, Dano),
	print:printInimigoAtaca([Nome,_,_,_,_,_,_,_], Dano).


%-------------------------------------------

consertaVida(VidaAtual, 0) :-
	VidaAtual =< 0.
consertaVida(VidaAtual, Nova) :-
	VidaAtual > 0,
	fixNum(VidaAtual, Nova).
	
%-------------------------------------------

heroiTomaDano([N,Va,Vm,D,Def,F,Agi,M,Wea,Arm,Bag], DanoInimigo, NovoPer, 0) :-
	Dano_c_armor is (DanoInimigo - (DanoInimigo * Def / 100)),

	fixNum(Dano_c_armor, Dano),
	Vida is (Va - Dano),

	consertaVida(Vida, NewVida),
	NovoPer = [N,NewVida,Vm,D,Def,F,Agi,M,Wea,Arm,Bag],
	print:printHeroiTomaDano(N, Dano).

heroiTomaDano([N,Va,Vm,D,Def,F,Agi,M,Wea,Arm,Bag], _, NovoPer, 1) :-
	print:printEsquiva(N),
	NovoPer = [N,Va,Vm,D,Def,F,Agi,M,Wea,Arm,Bag].

heroiRecebeDano([N,Va,Vm,D,Def,F,Agi,M,Wea,Arm,Bag], DanoInimigo, NovoPer) :-
	esquiva(Agi, Dodge),
	heroiTomaDano([N,Va,Vm,D,Def,F,Agi,M,Wea,Arm,Bag], DanoInimigo, NovoPer, Dodge).
	

%-------------------------------------------

% não esquivou
inimigoTomaDano([Nome, Descr, Va, Vm, Dam, F, Ag, Def], 0, DanoHeroi, NovoEnemy) :-
	DanoArmor is (DanoHeroi - (DanoHeroi * Def / 100)),
	fixNum(DanoArmor, Dano),

	Vida is (Va - DanoArmor),
	consertaVida(Vida, NewVida),

	NovoEnemy = [Nome, Descr, NewVida, Vm, Dam, F, Ag, Def],
	print:printInimigoTomaDano([Nome,_,Va,_,_,_,_,_], Dano).

% esquivou
inimigoTomaDano([Nome, Descr, Va, Vm, Dam, F, Ag, Def], 1, DanoHeroi, NovoEnemy) :-
	print:printEsquiva(Nome),
	NovoEnemy = [Nome, Descr, Va, Vm, Dam, F, Ag, Def].

% Inimigo = [nome, descr, vidaAtual, vidaMax, dano, forca, agilidade, defesa]
inimigoRecebeDano([Nome, Descr, Va, Vm, Dam, F, Ag, Def], BE, DanoHeroi, NovoEnemy) :-
	Agil is (Ag + (Ag * BE / 10)),
	esquiva(Agil, Dodge),
	inimigoTomaDano([Nome, Descr, Va, Vm, Dam, F, Ag, Def], Dodge, DanoHeroi, NovoEnemy).

%-------------------------------------------

verificaVida([_,0,_,_,_,_,_,_,_,_,_], Loot, Return) :-
	lostBattle(Loot),
	Return is 0.

verificaVida(_, _, 1).

%-------------------------------------------

% Heroi = [Nome, vidaAtual, vidaMaxima, Dano, Defesa, Forca, Agilidade, Dinheiro, Arma, Armadura, Bolsa]

inimigoAtacaSozinho([_,_,0,_,_,_,_,_], Heroi, NewHero) :-
	NewHero = Heroi.

inimigoAtacaSozinho(Inimigo, Heroi, NewHero) :-
	inimigoAtaca(Inimigo, DanoIni),
	heroiRecebeDano(Heroi, DanoIni, NewHero).

% _______________________________________________

grupoAtaca([I|[]] , Heroi, NewHero) :-
	inimigoAtacaSozinho(I, Heroi, NewHero).

grupoAtaca([I|Inimigos], Heroi, NewHero) :-
	inimigoAtacaSozinho(I, Heroi, Aux),
	grupoAtaca(Inimigos, Aux, NewHero).

%-------------------------------------------


substituiInimigo([Head|[]], IndAtual, Destino, Inimigo, [Come|Fim]) :-
	IndAtual =:= Destino,
	Come = Inimigo, Fim = [].

substituiInimigo([Head|[]], IndAtual, Destino, Inimigo, [Come|Fim]) :-
	IndAtual =\= Destino,
	Come = Head, Fim = [].

substituiInimigo([Head|Tail],IndAtual, Destino, Inimigo, [Come|Fim]) :-
	IndAtual =\= Destino,
	Come = Head,
	Aux is (IndAtual + 1),
	substituiInimigo(Tail,Aux,Destino,Inimigo,Fim).

substituiInimigo([Head|Tail] ,IndAtual, Destino, Inimigo, [Come|Fim]) :-
	IndAtual =:= Destino,
	Come = Inimigo,
	Aux is (IndAtual + 1),
	substituiInimigo(Tail,Aux,Destino,Inimigo,Fim).



%-----------------------------------------------

batalha([A,V,B,C,D,E,F,G,H,I,J],[QuaInimi,Loot,ListIni],Novo) :- 
	V =< 0,
	print:lostBattle(Loot),
	NLoot is (G - Loot),
	Novo = [A,V,B,C,D,E,F,NLoot,H,I,J].       % ajeitar a porcentagem aqui

batalha([A,V,B,C,D,E,F,G,H,I,J],[QuaInimi,Loot,ListIni],Novo) :- 
	verificaListaMortos(ListIni,Sai), 
	Sai =:= 1,
	print:wonBattle(A,Loot),
	NLoot is (G + Loot), 
	Novo = [A,V,B,C,D,E,F,NLoot,H,I,J],
	getElement(ListIni, 1, [Nome,_,_,_,_,_,_,_]),
	((Nome == "Light Theme IDE") -> print:final(A);
	write("")).

batalha(Heroi,[QuaInimi,Loot,ListIni],Novo) :-

	print:escolhaTipoAtk(Heroi,ListIni,Opcao),
	tipoAtk(Opcao, BD, BE),

	print:escolheInimigo(OpIni, [QuaInimi,Loot,ListIni]),
	
	write("\n"), print:divisorias,

	heroiAtaca(Heroi, BD, DanoHeroi),

	util:getElement(ListIni,OpIni, Enemy),
	inimigoRecebeDano(Enemy, BE, DanoHeroi, NovoEnemy),

	substituiInimigo(ListIni,1,OpIni,NovoEnemy,NovaLista),
	
	grupoAtaca(NovaLista, Heroi, NewHero),
	
	write("\n"), print:divisorias, write("\n"),
	digite,
	

	batalha(NewHero, [QuaInimi,Loot,NovaLista], Novo).