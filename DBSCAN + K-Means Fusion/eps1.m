function [epsilon,sorKdist] = eps1(a,MinPts)

A=a;
Kvalue = Minpts;
numData = size(A,1);%求A的行
Kdist = zeros(numData,Kvalue);

[IDX0,Dist] = knnsearch(A);%寻找A（1，：）最近的Kvalue个索引，Dist为Kvalue个最近距离，IDX0为相对应的向量
