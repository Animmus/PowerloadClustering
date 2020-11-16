function [idx,sc] = kmeans_Gu(X,k)
%kmeans算法-Gu
%X，样本（行为样本，列为属性，即200个样本，96个属性，样本为200*96）
%idx，返回每个样本的类别，1，2，...，k
%sc,返回每个样本的轮廓系数


[m,n] = size(X);%计算X的维度
for i=1:n% normalized the X
    X(:,i) = normalization(X(:,i),1);%对数据进行归一化
end

TEMP = X;

init = kmeans_init(X,k);% select the init


% plot_Gu(init,1)
%画出初始点



%第一次进行初始化
[idx,cents,SSE] = kmeans_process(X,init,k);
SSE_old = SSE;

%第一次进行迭代聚类
for i=1:1000
    [idx,cents,SSE] = kmeans_process(X,cents,k);
    if (abs(SSE_old-SSE))<0.01
        break
    end
    SSE_old = SSE;
end
sc = SC(X,idx,k);
end