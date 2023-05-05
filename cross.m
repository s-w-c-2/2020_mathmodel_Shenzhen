function crossedChromos = cross(population, selectedChromoNums, crossProb)  %传入当前种群，选中的染色体，交叉概率
%------------------------------------------------
% “交叉”操作   （随机交叉（部分） PMX）   （关于操作范围有点问题，能跑就行）
length = size(population, 2); % 染色体的长度
crossProbc = crossMuteOrNot(crossProb);  %flag  根据交叉概率决定是否进行交叉操作，1则是，0则否

%%编号——>染色体
crossedChromos(1,:) = population(selectedChromoNums(1), :);
crossedChromos(2,:) = population(selectedChromoNums(2), :);

if crossProbc == 1     
   c1 = round(rand * (length - 1)) + 1;  %在[1,bn ]范围内随机产生一个交叉位 c1   （1-30）
   c2 = round(rand * (length - 1)) + 1;  %在[1,bn ]范围内随机产生一个交叉位 c2
   chb1 = min(c1, c2);
   chb2 = max(c1,c2);
   middle = crossedChromos(1,chb1+1:chb2); % 两条染色体 chb1 到 chb2 之间互换位置
   crossedChromos(1,chb1 + 1 : chb2)= crossedChromos(2, chb1 + 1 : chb2);
   crossedChromos(2,chb1 + 1 : chb2)= middle;
   % 看交叉后，染色体上是否有相同编码的情况（路径上重复出现两个城市）。若有，则该编码不参与交叉
   % 和交叉部分相同的被  交叉部分在另一条染色体上的映射替换
   %两个前半段
   for i = 1 : chb1 
       while find(crossedChromos(1,chb1 + 1: chb2) == crossedChromos(1, i))
           location = find(crossedChromos(1,chb1 + 1: chb2) == crossedChromos(1, i));% 染色体交叉部分有相同的位置（是交叉部分的编号）
           y = crossedChromos(2,chb1 + location);
           crossedChromos(1, i) = y;
       end
       while find(crossedChromos(2,chb1 + 1 : chb2) == crossedChromos(2, i))
           location = find(crossedChromos(2, chb1 + 1 : chb2) == crossedChromos(2, i));
           y = crossedChromos(1, chb1 + location);
           crossedChromos(2, i) = y;
       end
   end
   %两个后半段
   for i = chb2 + 1 : length
       while find(crossedChromos(1, 1 : chb2) == crossedChromos(1, i))
           location = logical(crossedChromos(1, 1 : chb2) == crossedChromos(1, i));
           y = crossedChromos(2, location);
           crossedChromos(1, i) = y;
       end
       while find(crossedChromos(2, 1 : chb2) == crossedChromos(2, i))
           location = logical(crossedChromos(2, 1 : chb2) == crossedChromos(2, i));
           y = crossedChromos(1, location);
           crossedChromos(2, i) = y;
       end
   end
end
end