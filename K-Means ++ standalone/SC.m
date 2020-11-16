function sc = SC(X,idx,k)
%轮廓系数，处于-1到+1之间，取大值为优

%X，样本（行为样本，列为属性，即200个样本，96个属性，样本为200*96）
%idx，返回每个样本的类别，1，2，...，k
%k,聚类数量
%sc,返回样本点的轮廓系数

A = [X,idx];%A表作为访问表
B = A;%B表作为执行表
[m,n] = size(X);
D = zeros(m,k);
a = zeros(m,1);
b = zeros(m,1);
for i=1:m
    for j=1:m
        if i==j
            continue
        end
        if A(i,n+1) == B(j,n+1)%如果第i条和第j条在同一簇内
            for q=1:n
                D(i,A(i,n+1)) =  D(i,A(i,n+1))+(A(i,q)-B(j,q))^2;%第i条和第j条各点作差，x2，所有差求和，记录在D中*******************数量级个数
                E(i,A(i,n+1)) = D(i,A(i,n+1));%无聊赋值
                a(i) =  E(i,A(i,n+1));
                E(i,A(i,n+1)) = 0;%无聊清零》》》》》》指两条线同簇》》》》》》》》》》》在E中inf向量可突出代表同类簇
            end
        else%若第i条和第j条不在同一簇内
            for q=1:n
                D(i,B(j,n+1)) =  D(i,B(j,n+1))+(A(i,q)-B(j,q))^2;%同理，作差并记录**********************数量级上千
                E(i,B(j,n+1)) = D(i,B(j,n+1));%赋值》》》》》》》》》》》》》》》》》表示两条线不同簇
            end
        end        
    end    
end

%寻找a（i）、b（i） 并以此计算sc
for i=1:m
    temp = find(E(i,:) == max(E(i,:)));%找到第i条曲线作差和距离最小（除0外）的那个簇的序号《《《《列号，记为temp
    temp = temp(1,1);%若有两个以上，取第一个
    b(i) = E(i,temp);%将该最小值作为b
end

for i=1:m
    [numa,~] = size(find(A(:,n+1) == A(i,n+1)));%属于同一个簇的点的数量
    a(i) = a(i)/(numa - 1);%求平均值
    temp = find(E(i,:) == max(E(i,:)));
    [numb,~] = size(find(A(:,n+1) == temp));
    b(i) = b(i)./numb;   
    sc(i) = (b(i)-a(i))/max([a(i) b(i)]);
end

end