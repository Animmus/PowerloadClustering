function init = kmeans_init(X,k)
%选择初始点
%X，样本（行为样本，列为属性，即200个样本，96个属性，样本为200*96）
%k，聚类样本数
%init,返回初始中心

[m,n] = size(X);%k组数据共m行（m条曲线） n列（日采样个数）
init = zeros(k,n);%init 是k行 n列的0矩阵
D = zeros(m,1);%D 是m行（m条曲线） 1列的0矩阵
init(1,:) = X(1,:);
for i=2:k
    for j=1:m
        temp=0;
        for c=1:n
            temp = temp+(X(j,c)-init(i-1,c))^2;%将X中的第j行所有元素与第k类簇的中心曲线之差，×2，并求和
        end
        D(j) = D(j) + temp;%返回第j行的差值之和于列向量D中
        
    end
    
    idx = find(D(:) == max(D));%找到与上一簇中心曲线差距最大的一组数据，获得其在原始数据中的行数（idx）
    idx = idx(1,1);
    init(i,:) = X(idx,:);%取该曲线作为第i行的中心曲线，自此待定结束，进入下一条曲线中心的待定
end
end