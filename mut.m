function snnew = mut(chromo,muteProb)
%--------------------------------------------------
%“变异”操作  （变异交叉产生一条染色体的一部分）
% choromo 为一条染色体
length = size(chromo, 2); % 染色体的的长度
snnew = chromo;
muteProbm = crossMuteOrNot(muteProb);  % 根据变异概率决定是否进行变异操作，1则是，0则否
if muteProbm == 1
    c1 = round(rand*(length - 1)) + 1;  % 在 [1, bn ]范围内随机产生一个变异位
    c2 = round(rand*(length - 1)) + 1;  % 在 [1, bn]范围内随机产生一个变异位
    chb1 = min(c1, c2);
    chb2 = max(c1, c2);
    
    x = chromo(chb1 + 1 : chb2);
    snnew(chb1 + 1 : chb2) = fliplr(x); % 变异，则将变异位置那部分的染色体倒转
end
end
 
