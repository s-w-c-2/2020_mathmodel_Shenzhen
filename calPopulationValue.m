function [chromoValues, cumulativeProbs] = calPopulationValue(s, dislist) %读入初始种群，和距离


% 计算所有染色体的适应度chromoValues及其选择时用的累计概率
%以将目标函数，总体距离取倒数的形式作为适应函数

inn = size(s, 1);  % 读取种群大小
chromoValues = zeros(inn, 1); %初始化
for i = 1 : inn
    chromoValues(i) = CalDist(dislist, s(i, :));  % 计算每条染色体的适应度，种群的每行是条染色体chromo，成为适应度向量chromoValues
end
chromoValues = 1./chromoValues'; % 因为让距离越小，选取的概率越高，所以取距离倒数，也就是取倒数的适应函数



% 根据个体的适应度计算其被选择的概率
fsum = 0;
for i = 1 : inn
    % 放大操作，乘以15次方的原因是让好的个体被选取的概率更大（因为适应度取距离的倒数，若不乘次方，则个体相互之间的适应度差别不大），换成一个较大的数也行
    fsum = fsum + chromoValues(i)^15;   %fsum是用来归一化的求和
end

% 计算单个概率
probs = zeros(inn, 1);
for i = 1: inn
    probs(i) = chromoValues(i)^15 / fsum;  %归一化，
end

% 计算累积概率
%累计概率每个染色体最后被选到
%就是ppt上的轮盘赌
cumulativeProbs = zeros(inn,1);
cumulativeProbs(1) = probs(1);
for i = 2 : inn
    cumulativeProbs(i) = cumulativeProbs(i - 1) + probs(i);
end
cumulativeProbs = cumulativeProbs';
end