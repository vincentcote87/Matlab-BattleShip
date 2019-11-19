clear;
clc;

figure;
hold on;

y_coord = containers.Map([0,1,2,3,4,5,6,7,8,9], {'A','B','C','D','E','F','G','H','I','J'});
x_coord = containers.Map([0,1,2,3,4,5,6,7,8,9], [1,2,3,4,5,6,7,8,9,10]);

genGrid();

rectangle('position', [2 5 3 1], 'FaceColor', [0.2 0.2 0.2]);


ships = genShips();
drawShips(ships);

colorSquare(3,5,[0 1 0]);

arr = [2 5 3 1];
str = [];

carrier = struct('name', 'Carrier', 'size', 5, 'coord', {[]});
battleship = struct('name', 'Battleship', 'size', 4, 'coord', {[]});
cruiser = struct('name', 'Cruiser', 'size', 3, 'coord', {[]});

allShips = [carrier battleship  cruiser];

disp(allShips(1).name);

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

function ships = genShips()
    ships = struct(...
        'name', {'Carrier', 'Battleship', 'Cruiser', 'Submarine', 'Destroyer'},...
        'size', {5, 4, 3, 3, 2},...
        'position', {[],[],[],[],[]});
    for i = 1:5
        [x, y, z, w] = genShipPosition(ships(i).size);
        ships(i).position = [x y z w];
    end
    
end

function [x_start, y_start, x_end, y_end] = genShipPosition(size)
    direction = randi(2);
    if direction == 1 % horizontal ship
        x_start = randi([0 (9 - size)]);
        y_start = randi([0 9]);
        x_end = size;
        y_end = 1;
    else % vertical ship
        x_start = randi([0 9]);
        y_start = randi([0 (9 - size)]);
        x_end = 1;
        y_end = size;
    end
end


function drawShips(ships)
    for i = 1:length(ships)
        rectangle('position', ships(i).position, 'FaceColor', [0.2 0.2 0.2]);
    end
end