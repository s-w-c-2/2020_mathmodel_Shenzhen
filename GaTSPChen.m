function GaTSPChen

%%%%部分过程
%
%%%%%经历步骤
%初始化（初始化参数，初始化种群，种群初始计算）
%算子操作，迭代选择
%%画图


%%调用函数
%%calPopualtionValue
%%select
%%cross
%%mut
%%CalDist
%%drawTSP
%%tsp


%%%%数据初始化

load ('data.mat');

data_s=size(lola,1);

CityNum = data_s; % 城市数目
[dislist, Clist] = tsp(CityNum,lola); % dislist 为城市之间相互的距离，Clist 为各城市的坐标 
                                  %tsp函数生成处理原始数据
inn = 50; % 初始种群大小
gnMax = 300;  % 最大代数
crossProb = 0.8; % 交叉概率
muteProb = 0.8; % 变异概率
 
% 随机产生一个初始种群
population = zeros(inn, CityNum); % population 为初始种群，包括多条染色体
for i = 1 : inn
    population(i,:) = randperm(CityNum);%对1-30 随机排序 inn次
end

[~, cumulativeProbs] = calPopulationValue(population, dislist); % 计算种群每条染色体的累计概率与用来轮盘赌选择的累积概率
 
generationNum = 1;%代目
generationMeanValue = zeros(generationNum, 1); % 每一代的平均距离
generationMaxValue = zeros(generationNum, 1);  % 每一代的最短距离
bestRoute = zeros(inn, CityNum); % 最佳路径
newPopulation = zeros(inn, CityNum); % 收纳新的种群
%%%%


%算子操作
while generationNum < gnMax + 1
   for j = 1 : 2 : inn   %步长设置为2，两个父代，父母产生
      selectedChromos = select(cumulativeProbs);  % 选择操作，选出两条需要交叉编译的染色体，即父亲母亲  原代码效果不好
      crossedChromos = cross(population, selectedChromos, crossProb);  % 交叉操作，返回交叉后的染色体
      
      newPopulation(j, :) = mut(crossedChromos(1, :),muteProb);  % 对交叉后的染色体进行变异操作并返回新种群
      newPopulation(j + 1, :) = mut(crossedChromos(2, :), muteProb); % 对交叉后的染色体进行变异操作并返回新种群
   end
   population = newPopulation;  %产生了新的种群
   
   [populationValue, cumulativeProbs] = calPopulationValue(population, dislist);  % 计算新种群的适应度与用来轮盘赌选择的累积概率
   % 记录当前代最好和平均的适应度
   [fmax, nmax] = max(populationValue); % 因为计算适应度时取距离的倒数，这里面取最大的倒数，即最短的距离，返回值和下标
   
   
   %%%%画动态路径变化图
   generationMeanValue(generationNum) = 1 / mean(populationValue);   % 每一代的平均距离
   generationMaxValue(generationNum) = 1 / fmax;                     % 每一代的最短距离
   bestChromo = population(nmax, :);  % 记录下前代最佳染色体路径保存为bestChromo  %
   bestRoute(generationNum, :) = bestChromo; % 记录每一代的最佳染色体
   drawTSP(Clist, bestChromo, generationMaxValue(generationNum), generationNum, 0);
   generationNum = generationNum + 1;
end

%%%%画最优路径折线图
[bestValue,index] = min(generationMaxValue);
drawTSP(Clist, bestRoute(index, :), bestValue, index,1);
 
figure(2);
plot(generationMaxValue, 'r');  
hold on;
plot(generationMeanValue, 'b'); 
grid;
title('搜索过程');
legend('最优解', '平均解');
fprintf('遗传算法得到的最短距离: %.2f\n', bestValue);
fprintf('遗传算法得到的最短路线');
disp(bestRoute(index, :));

end



