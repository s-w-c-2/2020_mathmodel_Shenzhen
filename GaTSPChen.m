function GaTSPChen

%%%%���ֹ���
%
%%%%%��������
%��ʼ������ʼ����������ʼ����Ⱥ����Ⱥ��ʼ���㣩
%���Ӳ���������ѡ��
%%��ͼ


%%���ú���
%%calPopualtionValue
%%select
%%cross
%%mut
%%CalDist
%%drawTSP
%%tsp


%%%%���ݳ�ʼ��

load ('data.mat');

data_s=size(lola,1);

CityNum = data_s; % ������Ŀ
[dislist, Clist] = tsp(CityNum,lola); % dislist Ϊ����֮���໥�ľ��룬Clist Ϊ�����е����� 
                                  %tsp�������ɴ���ԭʼ����
inn = 50; % ��ʼ��Ⱥ��С
gnMax = 300;  % ������
crossProb = 0.8; % �������
muteProb = 0.8; % �������
 
% �������һ����ʼ��Ⱥ
population = zeros(inn, CityNum); % population Ϊ��ʼ��Ⱥ����������Ⱦɫ��
for i = 1 : inn
    population(i,:) = randperm(CityNum);%��1-30 ������� inn��
end

[~, cumulativeProbs] = calPopulationValue(population, dislist); % ������Ⱥÿ��Ⱦɫ����ۼƸ������������̶�ѡ����ۻ�����
 
generationNum = 1;%��Ŀ
generationMeanValue = zeros(generationNum, 1); % ÿһ����ƽ������
generationMaxValue = zeros(generationNum, 1);  % ÿһ������̾���
bestRoute = zeros(inn, CityNum); % ���·��
newPopulation = zeros(inn, CityNum); % �����µ���Ⱥ
%%%%


%���Ӳ���
while generationNum < gnMax + 1
   for j = 1 : 2 : inn   %��������Ϊ2��������������ĸ����
      selectedChromos = select(cumulativeProbs);  % ѡ�������ѡ��������Ҫ��������Ⱦɫ�壬������ĸ��  ԭ����Ч������
      crossedChromos = cross(population, selectedChromos, crossProb);  % ������������ؽ�����Ⱦɫ��
      
      newPopulation(j, :) = mut(crossedChromos(1, :),muteProb);  % �Խ�����Ⱦɫ����б����������������Ⱥ
      newPopulation(j + 1, :) = mut(crossedChromos(2, :), muteProb); % �Խ�����Ⱦɫ����б����������������Ⱥ
   end
   population = newPopulation;  %�������µ���Ⱥ
   
   [populationValue, cumulativeProbs] = calPopulationValue(population, dislist);  % ��������Ⱥ����Ӧ�����������̶�ѡ����ۻ�����
   % ��¼��ǰ����ú�ƽ������Ӧ��
   [fmax, nmax] = max(populationValue); % ��Ϊ������Ӧ��ʱȡ����ĵ�����������ȡ���ĵ���������̵ľ��룬����ֵ���±�
   
   
   %%%%����̬·���仯ͼ
   generationMeanValue(generationNum) = 1 / mean(populationValue);   % ÿһ����ƽ������
   generationMaxValue(generationNum) = 1 / fmax;                     % ÿһ������̾���
   bestChromo = population(nmax, :);  % ��¼��ǰ�����Ⱦɫ��·������ΪbestChromo  %
   bestRoute(generationNum, :) = bestChromo; % ��¼ÿһ�������Ⱦɫ��
   drawTSP(Clist, bestChromo, generationMaxValue(generationNum), generationNum, 0);
   generationNum = generationNum + 1;
end

%%%%������·������ͼ
[bestValue,index] = min(generationMaxValue);
drawTSP(Clist, bestRoute(index, :), bestValue, index,1);
 
figure(2);
plot(generationMaxValue, 'r');  
hold on;
plot(generationMeanValue, 'b'); 
grid;
title('��������');
legend('���Ž�', 'ƽ����');
fprintf('�Ŵ��㷨�õ�����̾���: %.2f\n', bestValue);
fprintf('�Ŵ��㷨�õ������·��');
disp(bestRoute(index, :));

end



