function chromoValue = CalDist(dislist, chromo)
%------------------------------------------------
% ����һ��Ⱦɫ�����Ӧ��
% dislist Ϊ���г����໥֮��ľ������
% chromo Ϊһ��Ⱦɫ�壬��һ��·��
%ʵ�ʱ�ʾ��·�����룬��������Ⱥ��ٵ�������ɸ���
DistanV = 0;
n = size(chromo, 2); % Ⱦɫ��ĳ���
for i = 1 : (n - 1)
    DistanV = DistanV + dislist(chromo(i), chromo(i + 1));%һ��·���ľ������
end
DistanV = DistanV + dislist(chromo(n), chromo(1));%�з������⣬��Ҫ������ʼ��
chromoValue = DistanV;
end