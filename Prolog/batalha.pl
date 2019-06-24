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
     writeln(Random),
    random(1, 11, AuxRand),
    RandomA is AuxRand + (Agilidade * 4 / 10),
   
    ((Random < RandomA) -> Sai is 1; 
    Sai is 0).

%-------------------------------------------

% Heroi = [Nome, vidaAtual, vidaMaxima, Dano, Defesa, Forca, Agilidade, Dinheiro, Arma, Armadura, Bolsa]
heroiAtaca([Nome,_,_,D,F,A,_,_,_,_,_], Bonus, Dano) :-
    Aux is (D + (F / 10) + ((D * Bonus) / 100)),
    critico(A, Critic),
    ((Critic =:= 1) -> Dano is Aux * 2;
    Dano is Aux),
    print:printHeroiAtaca(Nome, Dano).

%-------------------------------------------

% Inimigo = [nome, descr, vidaAtual, vidaMax, dano, forca, agilidade, defesa]
inimigoAtaca([Nome,_,_,_,D,F,A,_], Dano) :-
    Aux is D + (F / 10),
    critico(A,Critic),
    (Critic =:= 1) -> Dano is Aux * 2;
    Dano is Aux,
    print:printInimigoAtaca([Nome,_,_,_,_,_,_,_], Dano).


%-------------------------------------------

consertaVida(VidaAtual, 0) :-
    VidaAtual =< 0.
consertaVida(VidaAtual, Nova) :-
    VidaAtual > 0,
    Nova is VidaAtual.

%-------------------------------------------

heroiTomaDano([N,Va,Vm,D,Def,F,Agi,M,Wea,Arm,Bag], DanoInimigo, NovoPer, 0) :-
    Dano_c_armor is DanoInimigo - (DanoInimigo * Def / 100),
    Vida is Va - Dano_c_armor,
    consertaVida(Vida, NewVida),
    NovoPer = [N,NewVida,Vm,D,Def,F,Agi,M,Wea,Arm,Bag],
    print:printHeroiTomaDano(N, Dano_c_armor).

heroiTomaDano([N,Va,Vm,D,Def,F,Agi,M,Wea,Arm,Bag], _, NovoPer, 1) :-
    print:printEsquiva(N),
    NovoPer = [N,Va,Vm,D,Def,F,Agi,M,Wea,Arm,Bag].

heroiRecebeDano(Heroi, DanoInimigo, NovoPer) :-
    esquiva(A, Dodge),
    heroiTomaDano(Heroi, DanoInimigo, NovoPer, Dodge).
    

%-------------------------------------------

% não esquivou
inimigoTomaDano([Nome, Descr, Va, Vm, Dam, F, Ag, Def], 0, DanoHeroi, NovoEnemy) :-
    DanoArmor is DanoHeroi - (DanoHeroi * Def / 100),
    Vida is Va - DanoArmor,
    consertaVida(Vida, NewVida),
    NovoEnemy = [Nome, Descr, NewVida, Vm, Dam, F, Ag, Def],
    print:printInimigoTomaDano([Nome,_,NewVida,_,_,_,_,_], DanoArmor).

% esquivou
inimigoTomaDano([Nome, Descr, Va, Vm, Dam, F, Ag, Def], 1, DanoHeroi, NovoEnemy) :-
    print:printEsquiva(Nome),
    NovoEnemy = [Nome, Descr, Va, Vm, Dam, F, Ag, Def].

% Inimigo = [nome, descr, vidaAtual, vidaMax, dano, forca, agilidade, defesa]
inimigoRecebeDano([Nome, Descr, Va, Vm, Dam, F, Ag, Def], BE, DanoHeroi, NovoEnemy) :-
    Agil is Ag + (Ag * BE / 10),
    esquiva(Agil, Dodge),
    writeln(Dodge),
    inimigoTomaDano(Inimigo, Dodge, DanoHeroi, NovoEnemy).

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

% __________________________ 

auxGrupoAtaca([QtdIni,_,Inimigos], CurrIndex, Heroi, NewHero) :-
    Aux is QtdIni + 1,
    CurrIndex =:= Aux,
    NewHero = Heroi.

auxGrupoAtaca([QtdIni,Loot,Inimigos], CurrIndex, Heroi, NewHero) :-
    CurrIndex =/= QtdIni,
    getElement(Inimigos, CurrIndex, Enemy),
    verificaVida(Heroi, Loot, Return),

    (Return =:= 1) -> (     % encapsular??
        inimigoAtacaSozinho(Enemy, Heroi, NewHero),
        Increment is CurrIndex + 1,
        auxGrupoAtaca([QtdIni,_,Inimigos], Increment, NewHero, Novo)
    ); (    % else
        NewHero = Hero
    ).


% __________________________ 

grupoAtaca(Grupo, Heroi, NewHero) :-
    auxGrupoAtaca(Grupo, 1, Heroi, NewHero).


%-------------------------------------------


% substituiInimigo([Head|[]], IndAtual, Destino, Inimigo, [Come|Fim]) :-
%     Come = Head.

% substituiInimigo([Head|Tail],IndAtual, Destino, Inimigo, [Come|Fim]) :-
%     IndAtual =\= Destino,
%     Come = Head,
%     Aux is IndAtual + 1,
%     substituiInimigo(Tail,Aux,Destino,Inimigo,Fim).

% substituiInimigo([Head|Tail] ,IndAtual, Destino, Inimigo, [Come|Fim]) :-
%     IndAtual =:= Destino,
%     Come = Inimigo,
%     Aux is IndAtual + 1,
%     substituiInimigo(Tail,Aux,Destino,Inimigo,Fim).


%-----------------------------------------------

batalha([A,V,B,C,D,E,F,G,H,I,J],[QuaInimi,Loot,ListIni],Novo) :- 
    V =< 0,
    print:lostBattle(Loot),
    NLoot is G - Loot,
    Novo = [A,V,B,C,D,E,F,NLoot,H,I,J],
    lerString(K).       % ajeitar a porcentagem aqui

batalha([A,V,B,C,D,E,F,G,H,I,J],[QuaInimi,Loot,ListIni],Novo) :- 
    verificaListaMortos(ListIni,Sai), 
    Sai =:= 1,
    print:wonBatlle(Per,Loot), 
    NLoot is G + Loot, 
    Novo = [A,V,B,C,D,E,F,NLoot,H,I,J].

batalha(Heroi,[QuaInimi,Loot,ListIni],Novo) :-
    print:escolhaTipoAtk(Heroi,ListaIni,Opcao),
    tipoAtk(Opcao, BD, BE),
    util:digite,

    print:escolheInimigo(OpIni, [QuaInimi,Loot,ListIni]),
    
    heroiAtaca(Heroi, BD, DanoHeroi),

    util:getElement(ListIni,OpIni, Enemy),

    inimigoRecebeDano(Enemy, BE, DanoHeroi, NovoEnemy),

    substituiInimigo(ListIni,1,OpIni,NovoEnemy,NovaLista),

    % grupoAtaca([QuaInimi,Loot,NovaLista], Heroi, NewHero),

    batalha(NewHero, [QuaInimi,Loot,NovaLista], Novo).