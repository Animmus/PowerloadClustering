clc;

clear all;%从内存中清除变量和函数.

format long; %设置输出格式

K=3;%设置聚类的类数
% format long; %设置输出格式

%-------导入数据集
load('data.mat');
S=128;
D=48;
%  S=size(customer,2);
% D=size(customer(1).autumnavg,2);
for i=1:S
sam1(i,:)=customer(i).autumnavg;
end

for i=1:S
    MAX(i)=max(sam1(i,:));
 
end
for i=1:S
    for j=1:D
   
       sam(i,j)=sam1(i,j)/MAX(i);
    end
end
for i=1:D
    X1(1,i)=i
end
sample=sam;
% sample=load('julei.txt');%读入数据

% % [S D]=size(sample);%样本数与特征数

N=S;

clmat=randperm(S);%随机取从1到S共S个整数

clmat(clmat(1,:)>K)=ceil(rand(1,sum(clmat(1,:))>K)*K);%将这S个整数变为在1到K范围内的整数，
%即对数据进行初始的随机聚类

I=10;%随机取一个判据
J1=0;


%循环迭代开始
while(I>0.0001)%判断误差准则函数的值得大小，若满足精度则退出循环
   
    ww=zeros(S,K);%形成一个S*K的全0矩阵
    
    for i=1:S
        ww(i,clmat(1,i))=1;%判断每个样本分别属于哪一类，即在对应的位置为1
    end
    
    for j=1:K
        sumcs=sum(ww(:,j)*ones(1,D).*sample);%对同一类的样本进行求和
        countcs=sum(ww(:,j));%同一类样本的样本个数
        
        if countcs==0
            cen(j,:)=zeros(1,D);
        else
            cen(j,:)=sumcs/countcs;%求聚类中心
        end
    end
    tmp=0;

       for j=1:K
        aa=find(ww(:,j)==1);%求属于每一类的的样本是第总样本中的第几个
        %aa为一向量，向量的元素代表在总样本中排第几个
       tmp3(j)=0;
       
       if length(aa)~=0
            for i1=1:length(aa)
                tmp3(j)=tmp3(j)+sum((sample(aa(i1),:)-cen(j,:)).^2);%求每一类中每个元素到中心的距离和
                tmp=tmp+tmp3(j);%求总的距离的和
            end
       end
        samp(j).samp1=sample(aa,:);
       end
       
    J0=J1;
    J1=tmp;
    I=abs(J1-J0);%误差准则函数值的大小
    fljg=clmat;
     %重新归类   
       for ii=1:S
           tmp1=zeros(1,K);
          
           for k=1:K
               tmp1(k)=sum((sample(ii,:)-cen(k,:)).^2);%算每个点到聚类中心的距离
           end
           [tmp2 clmat(1,ii)]=min(tmp1);%归到距离最近的那一类，clmat(1,ii)代表归到的类，tmp2代表最小距离
       end
end
%计算每类数据点的个数
for j1=1:K
     cout(j1)=0;
    for j2=1:S
        if(fljg(j2)==j1)
            cout(j1)= cout(j1)+1;
        end
    end
end


ii=1;
for x=1:K
    for y=(x+1):K
        
        C1(ii)=sum((cen(x,:)-cen(y,:)).^2);
        C2(ii)=sqrt(C1(ii));%第x个与第y个聚类中心的欧式距离Mij
        D1(ii)=tmp3(x)/(sqrt(cout(x)))+tmp3(y)/(sqrt(cout(y)));%第x个聚类的类间距离和与第y个类的类间距离和的和Si+Sj
        D2(ii)=D1(ii)/C2(ii);
        ii=ii+1;%(Ri+Rj)/Mij
    end
end
D3=sort(D2,'descend');%对D2做降序排列
sumK=0;
if (K==2)
    sumK=D3(1);
else
for k=1:K
    sumK=sumK+D3(k);
end
end
DBI=sumK/K;%戴维森堡丁指数

DBI
    subplot(2,2,1);
    plot(X1,samp(1).samp1);
    subplot(2,2,2);
    plot(X1,samp(2).samp1);
    subplot(2,2,3);
    plot(X1,samp(3).samp1);
    subplot(2,2,4);
plot(X1,cen);
    
         
        
    
    
    
    
        