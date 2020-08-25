function [idx,cents,SSE] = kmeans_process(X,cents,k)
%kmeans算法迭代过程

%X，样本（行为样本，列为属性，即200个样本，96个属性，样本为200*96）
%cents，样本中心
%k,聚类数量
%idx，返回每个样本的类别，1，2，...,k
%cents,返回新的样本中心
%SSE，返回均方误差

%计算所有点到每个中心的的距离
[m,n] = size(X);
SSE = 0;
D = zeros(m,k);
idx = zeros(m,1);
for c=1:k
    for i=1:m
        temp =0;%对m行数据每换一次行把temp清零
        for j=1:n
            temp = temp+(cents(c,j)-X(i,j))^2;%得到第i条曲线的点与中心点的距离并求和
        end
        D(i,c) = temp;%把第i条的中心差距之和放入D矩阵（m行k列）的第i行 第c列（c指与某类的中心曲线标号）
    end    
end

%计算idx和SSE
for i=1:m
    temp = find(D(i,:) == min(D(i,:)));%找到D中每行最小值，最小值数据的*****列数*****通过find函数记录入idx的第i行》》》》》所以idx里面都是整数
    idx(i) = temp(1,1);
    SSE = SSE+D(i,idx(i));%将D中每行最小值求和
end
%更新聚类中心
for i=1:k
    new_cents = zeros(1,n);
    temp = find(idx == k);%找到被归入第k类的曲线的号数
    [m_temp,n_temp] = size(temp);%得到第k类簇中有多少条曲线（记为m_temp）
    for j=1:m_temp
        new_cents = new_cents(1,:)+X(temp(j),:);%将已经归入第i类的曲线求和
    end
    cents(k,:) = new_cents/m_temp;%对上述和球均值以形成新的中心点集《《《《《为什么不用原生曲线《《《《《因为求和平均后为拟合的曲线，不再是原生曲线的一员
end
end