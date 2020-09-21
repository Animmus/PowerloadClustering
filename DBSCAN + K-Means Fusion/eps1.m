function [epsilon,sorKdist] = eps1(a,MinPts)

A=a;
Kvalue = Minpts;
numData = size(A,1);%求A的行
Kdist = zeros(numData,Kvalue);

[IDX0,Dist] = knnsearch(A);%寻找A（1，：）最近的Kvalue个索引，Dist为Kvalue个最近距离，IDX0为相对应的向量
Kdist(1,:)=Dist;
for i=2:size(A,1)
    [IDX0,Dist] = knnsearch(A([1:i-1,i+1:numData],:),A(i,:),'K',Kvalue);
    Kdist(i,:)=Dist;
end
Kdist1=reshape(Kdist,size(Kdist,1)*size(Kdist,2),1);%对所有距离整到一个向量中
%对距离做降序排列
[sortKdist,sortKdistIdx]=sort(Kdist1,'descend');
%确定半径
epsilon=sortKdist(numData);
% distX=[1:numData*Kvalue]';

% plot(distX,sortKdist,'r+-','LineWidth',2);
% set(gcf,'position',[1000 340 350 350]);
% grid on;
end
