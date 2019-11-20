clc;
clear;



ship(1).x = 2;
ship(1).y = 4;

ship(2).x = 3;
ship(2).y = 4;

ship(3).x = 4;
ship(3).y = 4;

tmp.x = 1;
tmp.y = 5;
tmp(2).x = 1;
tmp(2).y = 6;

ship = [ship tmp];

disp(length(ship));


% playerShips = [2 4];
% newCoord = [3 4];
% playerShips = [playerShips ; [3 4]];
% newCoord = [4 4];
% playerShips = [playerShips ; newCoord];
% % playerShips(:;:) = [3;4];
% disp(playerShips);
% 
% if ismember(playerShips(), [1 4], 'row') == 0
%     disp('is a member');
% else
%     disp('not in');
% end


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