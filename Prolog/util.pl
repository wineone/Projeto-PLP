:- module(util, [lerString/1,lerNumero/1]).

lerString(Input) :-
    read_line_to_string(user_input, Input).

lerNumero(Input) :-
    read_line_to_string(user_input, Entrada),
    string_to_atom(Entrada, Atom),
    atom_number(Atom, Number),
    Input is Number.