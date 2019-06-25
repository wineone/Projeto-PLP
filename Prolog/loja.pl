:- module(loja,[]).

:- use_module(print).
:- use_module(entidades).
:- use_module(util).


lojaOp(1,Per,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :-
     print:printDinheiro(Per),   
     armas(ListAr),
     print:leOpArma(Opcao),
     util:getElement(ListAr,Opcao,Y),
     write(Y),
     loja(Aux,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo).

lojaOp(2,Per,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :- 
    print:printDinheiro(Per), 
    armaduras(ListaArmadura),
    print:leOpArmadura(Opcao),
    util:getElement(ListaArmadura,Opcao,Y),
    write(Y),
    loja(Aux,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo).

lojaOp(3,Per,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :- 
    print:printDinheiro(Per), 
    pocoes(ListaPocoes),
    print:leOpPocao(Opcao),
    util:getElement(ListaPocoes,Opcao,Y),
    write(Y),
    loja(Aux,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo).

LojaOp(4,Per,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :- Novo = Per.

LojaOp(_,Per,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo) :- 
    loja(Per,[QtdArmas , ListAr , QtdArmadura, ListaArmadura,QtdPocoes ,ListaPocoes],Novo).

armas([]):- util:digite.
armas([[NomeArma, DescArma, PrecoArma, DanoArma, ForcaArma, AgilidadeArma]|Resto]):-
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
    armas(Resto).

armaduras([]):- util:digite.
armaduras([[NomeArmadura, DesArmadura, PrecoArmadura, DanoArmadura, ForcaArmadura, AgilidadeArmadura, VidaArmadura]|Resto]):-
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
    armaduras(Resto).

pocoes([]):- util:digite.
pocoes([[NomePocao,DescPocao,PrecoPocao,VidaPocao]|Resto]):-
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
    pocoes(Resto).



loja(Per,Loj,N) :-
    print:printLoja(Opcao,Per),
    lojaOp(Opcao,Per,Loj,Novo).