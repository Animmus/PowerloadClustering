clc;
clear all;
format long;%设置输出格式

%DBSCAN 
load("data.mat");%导入数据集
Minpts = 4;%设置点数阈值
loadnum = 200;%调用用户数，上限200
for i = 1:loadnum
  A = cunstomer(i).autumn;%读取秋季数据
  X = simi[A];%用户数据归一化
  [epsilon,sortKdist]=eps1(X,Minpts);%求半径
  [IDX, isnoise] = DBSCAN1(X,epsilon,Minpts);%找出噪声点
  sam(i,:)=qmean(X,IDX);%剔除噪声点后求用户该季负荷得平均值
end

%K-Means
K=4;
[Idx,C,sumD,D1]=kmeans(sam,K,'dist','sqEuclidean','rep',400);
Bcen = C;
fljg = Idx';
tmpcc = sumD;
D = size(sam,2);
results = result(Idx,K,sam);
CDI = CDI_CLUSTER(fljg,K,D,Bcen,sam);
WCBCR = WCBCR_CLUSTER(Bcen,fljg,K,sam);
DBI = DBI_CLUSTER(fljg,Bcen,tmpcc,K);
MIA = MIA_CLUSTER(fljg,K,D,Bcen,sam);
SI = SI_CLUSTER(fljg,K,sam);
SSE = SSE_CLUSTER(K);

SI;
SSE;

