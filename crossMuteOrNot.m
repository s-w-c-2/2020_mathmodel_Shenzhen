function crossProbc = crossMuteOrNot(crossMuteProb)
% ���ݱ���򽻲���ʣ�����һ�� 0 �� 1 ����   100�� 0��1ѡ��
test(1: 100) = 0;  %ȫ��ֵΪ0
L = round(100 * crossMuteProb);%L����1����������100���������
test(1 : L) = 1;
n = round(rand * 99) + 1;%rand������0-1֮���������round��ȡ��������Ļ����0������Ĳ�����0��
crossProbc = test(n);
end