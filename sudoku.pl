:- use_module(library(clpfd)).

sudoku(Board) :-
        length(Board, 9), maplist(same_length(Board), Board),
        append(Board, Cells), Cells ins 1..9,
        maplist(all_distinct, Board),
        transpose(Board, Cols),
        maplist(all_distinct, Cols),
        Board = [R1,R2,R3,R4,R5,R6,R7,R8,R9],
        blocks(R1, R2, R3),
        blocks(R4, R5, R6),
        blocks(R7, R8, R9).

blocks([], [], []).
blocks([A,B,C|Rest1], [D,E,F|Rest2], [G,H,I|Rest3]) :-
        all_distinct([A,B,C,D,E,F,G,H,I]),
        blocks(Rest1, Rest2, Rest3).

problem(1, [[_,_,_,2,6,_,7,_,1],
            [6,8,_,_,7,_,_,9,_],
            [1,9,_,_,_,4,5,_,_],
            [8,2,_,1,_,_,_,4,_],
            [_,_,4,6,_,2,9,_,_],
            [_,5,_,_,_,3,_,2,8],
            [_,_,9,3,_,_,_,7,4],
            [_,4,_,_,5,_,_,3,6],
            [7,_,3,_,1,8,_,_,_]]).

% consult('/Users/user/pl_final_project/sudoku.pl').
% problem(1, Board), sudoku(Board), maplist(portray_clause, Board).