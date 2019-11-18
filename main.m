figure;
hold on;

plot(0,0);
axis([0 10 0 10]);
xticks(0.5:1:9.5);
xticklabels({'1','2','3','4','5','6','7','8','9','10'});
yticks(0.5:1:9.5);
yticklabels({'A','B','C','D','E','F','G','H','I','J'});
for i = 0:10
    line([0 10], [i i], "color", "black");
    line([i i], [0 10], "color", "black");
end