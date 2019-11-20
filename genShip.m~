clc;
clear;

myShips = genShips();

function valid = isValid(current_list, new_list)
    for i = 1:length(new_list)
        for j = 1:length(current_list)
            if current_list(j).x == new_list(i).x && current_list(j).y == new_list(i).y
                valid = false;
                return
            end
        end
    end
    valid = true;
end

function ships = genShips()
    shipSize = [5 4 3 3 2];
    ships = genShipPosition(shipSize(1));
    for i = 2:5
        tmp = genShipPosition(shipSize(i));
        while ~isValid(ships, tmp)
            tmp = genShipPosition(shipSize(i));
        end
        ships = [ships tmp];
    end
    
end

function coords = genShipPosition(size)
    direction = randi(2);
    if direction == 1 % horizontal ship
        x = randi([0 (9 - size)]);
        y = randi([0 9]);
        for i = 1:size
            coords(i).x = x + i;
            coords(i).y = y;
        end 
    else % vertical ship
        x = randi([0 9]);
        y = randi([0 (9 - size)]);
        for i = 1:size
            coords(i).x = x;
            coords(i).y = y + i;
        end
    end
end