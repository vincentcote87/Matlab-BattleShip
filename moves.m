clc;
clear;

function compAvailMoves = genCompMoves()
    index = 1;
    for i = 1:10
        for j= 1:10
            compAvailMoves(index).x = i;
            compAvailMoves(index).y = j;
            index = index + 1;
        end
    end
end

