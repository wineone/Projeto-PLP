:- module(batalha,[]).

:- use_module(util).
:- use_module(print).


verificaListaMortos([],Sai) :- Sai is 1.
verificaListaMortos([[_,V,_,_,_,_,_,_]|Resto], Sai) :- (V =< 0) -> verificaListaMortos(Resto,Sai); Sai is 0. 




batalha([A,V,B,C,D,E,F,G,H,I,J],[QuaInimi,Loot,ListIni],Novo) :- V =< 0,print:lostBattle(Loot),NLoot is G - Loot ,Novo = [A,V,B,C,D,E,F,NLoot,H,I,J],lerString(K). % ajeitar a porcentagem aqui

batalha([A,V,B,C,D,E,F,G,H,I,J],[QuaInimi,Loot,ListIni],Novo) :- verificaListaMortos(ListIni,Sai), Sai =:= 1, print:wonBatlle(Per,Loot), NLoot is G + Loot, Novo = [A,V,B,C,D,E,F,NLoot,H,I,J].

batalha(Per,[QuaInimi,Loot,ListIni],Novo) :-
    print:escolhaTipoAtk(Per,ListaIni,Opcao),
    Novo = Per, 
    lerString(K).