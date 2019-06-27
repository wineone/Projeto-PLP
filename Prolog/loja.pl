:- module(loja,[]).

:- use_module(print).
:- use_module(entidades).
:- use_module(util).
:- use_module(bau).


lojaOp(1,[A,B,C,D,E,F,G,H,I,J,K,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :-
     print:printDinheiro(H),%mostra o dinheiro atual do personagem   
     print:armas(1,ListAr),%funcao que lista as armas
     print:leOpArma(Opcao),%funcao que le a opção escolhida pelo usuario
     util:getElement(ListAr,Opcao,[Na,Da,Pa,Daa,Fa,Aa]),% pega a opcao escolhida pelo usuario
     ((H >= Pa) -> % Se o personagem tiver dinheiro suficiente, a compra é feita
     Ndinheiro is (H - Pa),%Diminui do dinheiro do persogem o valor do item
     bau:addArma([Na,Da,Pa,Daa,Fa,Aa],K,FF),
     Aux = [A,B,C,D,E,F,G,Ndinheiro,I,J,K],
     print:printComprou(Na);%printa o item comprado
     writeln("\nDinheiro insuficiente\n"),Aux = [A,B,C,D,E,F,G,H,I,J,K],util:digite),
     loja(Aux,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo).

lojaOp(2,[A,B,C,D,E,F,G,H,I,J,K],[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :- 
    print:printDinheiro(H), 
    print:armaduras(1,ListaArmadura),
    print:leOpArmadura(Opcao),
    util:getElement(ListaArmadura,Opcao,[Nar,Dar,Par,Daar,Far,Aar,Var]),
    ((H >= Par) ->
    Ndinheiro is (H - Par),
    Aux = [A,B,C,D,E,F,G,Ndinheiro,I,J,K],
    print:printComprou(Nar);
    writeln("\nDinheiro insuficiente\n"),Aux = [A,B,C,D,E,F,G,H,I,J,K],util:digite),
    loja(Aux,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo).

lojaOp(3,[A,B,C,D,E,F,G,H,I,J,K],[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :- 
    print:printDinheiro(H), 
    print:pocoes(1,ListaPocoes),
    print:leOpPocao(Opcao),
    util:getElement(ListaPocoes,Opcao,[Np,Dp,Pp,Vp]),
    ((H >= Pp) -> 
    Ndinheiro is (H - Pp),
    Aux = [A,B,C,D,E,F,G,Ndinheiro,I,J,K],
    print:printComprou(Np);
    writeln("\nDinheiro insuficiente\n"),Aux = [A,B,C,D,E,F,G,H,I,J,K],util:digite),
    loja(Aux,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo).

lojaOp(4,Per,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :- Novo = Per.

lojaOp(_,Per,Lojinha,Novo) :- loja(Per,Lojinha,Novo).


loja(Per,Loj,N) :-
    print:printLoja(Opcao,Per),
    lojaOp(Opcao,Per,Loj,N).