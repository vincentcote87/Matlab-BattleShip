clear;
clc;



% ships = struct(...
%         'name', {'Carrier', 'Battleship', 'Cruiser', 'Submarine', 'Destroyer'},...
%         'size', {5, 4, 3, 3, 2},...
%         'position', {[],[],[],[],[]});
% 
% ships(1).position = ([2:3] [3:3] [4:3]);
% disp(ships(1).position);


figure;
hold on;

y_coord = containers.Map([0,1,2,3,4,5,6,7,8,9], {'A','B','C','D','E','F','G','H','I','J'});
x_coord = containers.Map([0,1,2,3,4,5,6,7,8,9], {'1','2','3','4','5','6','7','8','9','10'});
% genMoveList();
genGrid();

playerShips = genShips();
drawShips(playerShips);

% rectangle('position', [2 5 3 1], 'FaceColor', [0.2 0.2 0.2]);


% ships = genShips();
% drawShips(ships);

% colorSquare(3,5,[0 1 0]);

% arr = [2 5 3 1];
% str = [];
% 
% carrier = struct('name', 'Carrier', 'size', 5, 'coord', {[]});
% battleship = struct('name', 'Battleship', 'size', 4, 'coord', {[]});
% cruiser = struct('name', 'Cruiser', 'size', 3, 'coord', {[]});
% 
% allShips = [carrier battleship  cruiser];

% disp(allShips(1).name);

function genGrid()
plot(0,0);
axis([0 10 0 10]); % Grid size
xticks(0.5:1:9.5); % move ticks to center text
xticklabels({'1','2','3','4','5','6','7','8','9','10'});
yticks(0.5:1:9.5);
yticklabels({'A','B','C','D','E','F','G','H','I','J'});
for i = 0:10 % Generate lines for grid
    line([0 10], [i i], "color", "black");
    line([i i], [0 10], "color", "black");
end
end

function colorSquare(x,y,color)
    rectangle('position', [x y 1 1], 'FaceColor', color);
end

% function ships = genShips()
%     ships = struct(...
%         'name', {'Carrier', 'Battleship', 'Cruiser', 'Submarine', 'Destroyer'},...
%         'size', {5, 4, 3, 3, 2},...
%         'position', {[],[],[],[],[]});
%     for i = 1:5
%         [x, y, z, w] = genShipPosition(ships(i).size);
%         ships(i).position = [x y z w];
%     end
%     
% end
% 
% function [x_start, y_start, x_end, y_end] = genShipPosition(size)
%     direction = randi(2);
%     if direction == 1 % horizontal ship
%         x_start = randi([0 (9 - size)]);
%         y_start = randi([0 9]);
%         x_end = size;
%         y_end = 1;
%     else % vertical ship
%         x_start = randi([0 9]);
%         y_start = randi([0 (9 - size)]);
%         x_end = 1;
%         y_end = size;
%     end
% end

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
    color = [0.1 0.1 0.1];
    ships = genShipPosition(shipSize(1), color);
    for i = 2:5
        tmp = genShipPosition(shipSize(i), [i*.1 i*.1 i*.1]);
        while ~isValid(ships, tmp)
            tmp = genShipPosition(shipSize(i), [i*.1 i*.1 i*.1]);
        end
        ships = [ships tmp];
    end
    
end

function coords = genShipPosition(size, color)
    direction = randi(2);
    if direction == 1 % horizontal ship
        x = randi([0 (9 - size)]);
        y = randi([0 9]);
        for i = 1:size
            coords(i).x = x + i;
            coords(i).y = y;
            coords(i).color = color;
        end 
    else % vertical ship
        x = randi([0 9]);
        y = randi([0 (9 - size)]);
        for i = 1:size
            coords(i).x = x;
            coords(i).y = y + i;
            coords(i).color = color;
        end
    end
end

function drawShips(ships)
    for i = 1:length(ships)
        rectangle('position', [ships(i).x ships(i).y 1 1], 'FaceColor', ships(i).color);
    end
end

function genMoveList()
    for i = 1:10
        for j = 1:10
            disp([y_coord(i) x_coord(j)]);
        end
    end  
end