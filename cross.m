function crossedChromos = cross(population, selectedChromoNums, crossProb)  %���뵱ǰ��Ⱥ��ѡ�е�Ⱦɫ�壬�������
%------------------------------------------------
% �����桱����   ��������棨���֣� PMX��   �����ڲ�����Χ�е����⣬���ܾ��У�
length = size(population, 2); % Ⱦɫ��ĳ���
crossProbc = crossMuteOrNot(crossProb);  %flag  ���ݽ�����ʾ����Ƿ���н��������1���ǣ�0���

%%��š���>Ⱦɫ��
crossedChromos(1,:) = population(selectedChromoNums(1), :);
crossedChromos(2,:) = population(selectedChromoNums(2), :);

if crossProbc == 1     
   c1 = round(rand * (length - 1)) + 1;  %��[1,bn ]��Χ���������һ������λ c1   ��1-30��
   c2 = round(rand * (length - 1)) + 1;  %��[1,bn ]��Χ���������һ������λ c2
   chb1 = min(c1, c2);
   chb2 = max(c1,c2);
   middle = crossedChromos(1,chb1+1:chb2); % ����Ⱦɫ�� chb1 �� chb2 ֮�以��λ��
   crossedChromos(1,chb1 + 1 : chb2)= crossedChromos(2, chb1 + 1 : chb2);
   crossedChromos(2,chb1 + 1 : chb2)= middle;
   % �������Ⱦɫ�����Ƿ�����ͬ����������·�����ظ������������У������У���ñ��벻���뽻��
   % �ͽ��沿����ͬ�ı�  ���沿������һ��Ⱦɫ���ϵ�ӳ���滻
   %����ǰ���
   for i = 1 : chb1 
       while find(crossedChromos(1,chb1 + 1: chb2) == crossedChromos(1, i))
           location = find(crossedChromos(1,chb1 + 1: chb2) == crossedChromos(1, i));% Ⱦɫ�彻�沿������ͬ��λ�ã��ǽ��沿�ֵı�ţ�
           y = crossedChromos(2,chb1 + location);
           crossedChromos(1, i) = y;
       end
       while find(crossedChromos(2,chb1 + 1 : chb2) == crossedChromos(2, i))
           location = find(crossedChromos(2, chb1 + 1 : chb2) == crossedChromos(2, i));
           y = crossedChromos(1, chb1 + location);
           crossedChromos(2, i) = y;
       end
   end
   %��������
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