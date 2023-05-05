function crossProbc = crossMuteOrNot(crossMuteProb)
% 根据变异或交叉概率，返回一个 0 或 1 的数   100内 0，1选择
test(1: 100) = 0;  %全赋值为0
L = round(100 * crossMuteProb);%L不是1，，，，，100以内随机数
test(1 : L) = 1;
n = round(rand * 99) + 1;%rand是生成0-1之间随机数，round是取整，下面的会包含0，上面的不包含0。
crossProbc = test(n);
end