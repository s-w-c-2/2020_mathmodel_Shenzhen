function chromoValue = CalDist(dislist, chromo)
%------------------------------------------------
% 计算一条染色体的适应度
% dislist 为所有城市相互之间的距离矩阵
% chromo 为一条染色体，即一条路径
%实际表示是路径距离，在整个种群里，再倒数换算成概率
DistanV = 0;
n = size(chromo, 2); % 染色体的长度
for i = 1 : (n - 1)
    DistanV = DistanV + dislist(chromo(i), chromo(i + 1));%一条路径的距离求和
end
DistanV = DistanV + dislist(chromo(n), chromo(1));%有返回问题，需要返回起始点
chromoValue = DistanV;
end