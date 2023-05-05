function [DLn, cityn] = tsp(n,lola)
%初始数据处理
DLn = zeros(n, n);

lola=lola';

    x=lola(1,:)*(pi/180);  
    y=lola(2,:)*(pi/180);

     X=6400*cos(x).*cos(y);
     Y=6400*sin(x).*cos(y);


 gps=[X;Y];
 gps2=gps.';

    city30 = gps2; % 30 cities d' = 423.741 by D B Fogel
    for i = 1 : 30
        for j = 1 : 30
            DLn(i,j) = ((city30(i,1)-city30(j,1))^2+(city30(i,2)-city30(j,2))^2)^0.5;
            
        end
    end
    cityn = city30;
end
