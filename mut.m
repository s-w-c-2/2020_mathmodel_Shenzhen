function snnew = mut(chromo,muteProb)
%--------------------------------------------------
%�����족����  �����콻�����һ��Ⱦɫ���һ���֣�
% choromo Ϊһ��Ⱦɫ��
length = size(chromo, 2); % Ⱦɫ��ĵĳ���
snnew = chromo;
muteProbm = crossMuteOrNot(muteProb);  % ���ݱ�����ʾ����Ƿ���б��������1���ǣ�0���
if muteProbm == 1
    c1 = round(rand*(length - 1)) + 1;  % �� [1, bn ]��Χ���������һ������λ
    c2 = round(rand*(length - 1)) + 1;  % �� [1, bn]��Χ���������һ������λ
    chb1 = min(c1, c2);
    chb2 = max(c1, c2);
    
    x = chromo(chb1 + 1 : chb2);
    snnew(chb1 + 1 : chb2) = fliplr(x); % ���죬�򽫱���λ���ǲ��ֵ�Ⱦɫ�嵹ת
end
end
 
