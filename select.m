function selectedChromoNums = select(cumulatedPro)
%--------------------------------------------------
%��ѡ�񡱲�����������ѡ��Ⱦɫ������Ⱥ�ж�Ӧ��λ��
% cumulatedPro ����Ⱦɫ����ۼƸ���
% ���̶�
selectedChromoNums = zeros(2, 1); 
% ����ת���Σ�����Ⱥ��ѡ��������ͬ���壨��ò�Ҫ����ѡ��ͬһ�����壩
for i = 1 : 2
   r = rand;  % ����һ��0-1�������r���������Ǹ�ָ��
   
 %%%������ж��߼������ϲ�һ������ָ�����ĳ���䣬�ٰ�����Ӧ�±��һ���ǵ�ǰ����
   prand = cumulatedPro - r;%ѡ�����Խ������Խ��prand����С��0��Խ���ױ�ѡ��
   j = 1;
   while prand(j) < 0       %С��0����ζָ����������
       j = j + 1;          %�������ۻ����ʵ�ͼ�ȽϺ����
   end
   selectedChromoNums(i) = j; % ѡ�и�������
   if i == 2 && j == selectedChromoNums(i - 1)    % ����ͬ����ѡһ�Σ���ʵ�ϻ����п��ܱ�ѡ�����ȽϺøķ�Ӧ���ǰѵ�һ���޳����пտ��Ըĸ�
       r = rand;  % ����һ�������
       prand = cumulatedPro - r;
       j = 1;
       while prand(j) < 0
           j = j + 1;
       end
   end
end
end