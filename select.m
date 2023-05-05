function selectedChromoNums = select(cumulatedPro)
%--------------------------------------------------
%“选择”操作，返回所选择染色体在种群中对应的位置
% cumulatedPro 所有染色体的累计概率
% 轮盘赌
selectedChromoNums = zeros(2, 1); 
% 轮盘转两次，从种群中选择两个不同个体（最好不要两次选择同一个个体）
for i = 1 : 2
   r = rand;  % 产生一个0-1随机数，r就是轮盘那个指针
   
 %%%这里的判断逻辑和书上不一样，但指针过了某区间，再把它对应下标加一就是当前区间
   prand = cumulatedPro - r;%选择概率越大，区间越大，prand容易小于0，越容易被选中
   j = 1;
   while prand(j) < 0       %小于0就意味指针在区间里
       j = j + 1;          %对照着累积概率的图比较好理解
   end
   selectedChromoNums(i) = j; % 选中个体的序号
   if i == 2 && j == selectedChromoNums(i - 1)    % 若相同就再选一次，事实上还是有可能被选到，比较好改法应该是把第一个剔除，有空可以改改
       r = rand;  % 产生一个随机数
       prand = cumulatedPro - r;
       j = 1;
       while prand(j) < 0
           j = j + 1;
       end
   end
end
end