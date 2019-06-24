:- module(util, [lerString/1,lerNumero/1,digite/0,enter/0,getElement/3]).

% -----------------------------------------------------------------

lerString(Input) :-
    read_line_to_string(user_input, Input).


lerNumero(Input) :-
    read_line_to_string(user_input, Entrada),
    string_to_atom(Entrada, Atom),
    atom_number(Atom, Number),
    Input is Number.

% -----------------------------------------------------------------

auxGetElement([Head|Tail], Index, CurrentInd, Return) :-
    CurrentInd =:= Index,
    Return = Head.

auxGetElement([Head|Tail], Index, CurrentInd, Return) :-
    CurrentInd =\= Index,
    Increment is (CurrentInd + 1),
    auxGetElement(Tail, Index, Increment, Return).

getElement(List, Index, Element) :-
    auxGetElement(List, Index, 1, Element).

% -----------------------------------------------------------------

digite :-
    writeln("Digite enter para continuar... "),
    lerString(D).

enter :-
    lerString(D).

% -----------------------------------------------------------------