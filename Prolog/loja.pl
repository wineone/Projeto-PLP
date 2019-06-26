:- module(loja,[]).

:- use_module(print).
:- use_module(entidades).
:- use_module(util).
:- use_module(bau).


lojaOp(1,[A,B,C,D,E,F,G,H,I,J,K],[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :-
     print:printDinheiro(H),%mostra o dinheiro atual do personagem   
     armas(1,ListAr),%funcao que lista as armas
     print:leOpArma(Opcao),%funcao que le a opção escolhida pelo usuario
     util:getElement(ListAr,Opcao,[Na,Da,Pa,Daa,Fa,Aa]),% pega a opcao escolhida pelo usuario
     ((H >= Pa) -> % Se o personagem tiver dinheiro suficiente, a compra é feita
     Ndinheiro is (H - Pa),%Diminui do dinheiro do persogem o valor do item
     Aux = [A,B,C,D,E,F,G,Ndinheiro,I,J,K],
     print:printComprou(Na);%printa o item comprado
     writeln("\nDinheiro insuficiente\n"),Aux = [A,B,C,D,E,F,G,H,I,J,K],util:digite),
     loja(Aux,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo).

lojaOp(2,[A,B,C,D,E,F,G,H,I,J,K],[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :- 
    print:printDinheiro(H), 
    armaduras(1,ListaArmadura),
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
    pocoes(1,ListaPocoes),
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

armas(Ind, []):- write("").
armas(Ind, [[NomeArma, DescArma, PrecoArma, DanoArma, ForcaArma, AgilidadeArma]|Resto]):-
    write("[ "),write(Ind),write(" ]"), write(" - "),
    write(NomeArma),
    write(" "),
    write("Preço: "),
    write(PrecoArma),
    write(" "),
    write("Dano: "),
    write(DanoArma),
    write(" "),
    write("Força: "),
    write(ForcaArma),
    write(" "),
    write("Agilidade: "),
    write(AgilidadeArma),
    write("\n"),
    write("    +-> "),
    write(DescArma),
    write("\n\n"),
    Nind is (Ind + 1),
    armas(Nind, Resto).

armaduras(IndArmad, []):-  write("").
armaduras(IndArmad, [[NomeArmadura, DesArmadura, PrecoArmadura, DanoArmadura, ForcaArmadura, AgilidadeArmadura, VidaArmadura]|Resto]):-
    write("[ "),write(IndArmad),write(" ]"), write(" - "),
    write(NomeArmadura),
    write(" "),
    write("Preço: "),
    write(PrecoArmadura),
    write(" "),
    write("Dano: "),
    write(DanoArmadura),
    write(" "),
    write("Força: "),
    write(ForcaArmadura),
    write(" "),
    write("Agilidade: "),
    write(AgilidadeArmadura),
    write(" "),
    write("Vida: "),
    write(VidaArmadura),
    write("\n"),
    write("    +-> "),
    write(DesArmadura),
    write("\n\n"),
    Nind is (IndArmad + 1),
    armaduras(Nind,Resto).

pocoes(IndPocao, []):-  write("").
pocoes(IndPocao, [[NomePocao,DescPocao,PrecoPocao,VidaPocao]|Resto]):-
    write("[ "),write(IndPocao),write(" ]"), write(" - "),
    write(NomePocao),
    write(" "),
    write("Preço: "),
    write(PrecoPocao),
    write(" "),
    write("Vida: "),
    write(VidaPocao),
    write("\n"),
    write("    +-> "),
    write(DescPocao),
    write("\n\n"),
    Nind is (IndPocao + 1),
    pocoes(Nind, Resto).



loja(Per,Loj,N) :-
    print:printLoja(Opcao,Per),
    lojaOp(Opcao,Per,Loj,Novo).