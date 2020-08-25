%聚类

clear all
load('D3.mat')
k=5;
tempo = [];
[~,n]= size(X);
for i=1:n% normalized the X
    tempo(:,i) = normalization(X(:,i),1);%对数据进行归一化
end
[idx,sc] = kmeans_Gu(X,k);
notNanValues=sc(~isnan(sc));

meanvalue=sum(notNanValues)./length(notNanValues);

meanvalue
figure(k+1)
plot(tempo');
J = [X idx];
for i = 1:k
    P = find(idx == i);
    if i == 1
        A = tempo(P,:);
    end
    if i == 2
        B = tempo(P,:);
    end
    if i == 3
        C = tempo(P,:);
    end
    if i == 4
        D = tempo(P,:);
    end
    if i == 5
        E = tempo(P,:);
    end
    if i == 7
        F = tempo(P,:);
    end
    figure(i)
    plot(tempo(P,:)');
end
A = mean(A,1);
figure(k+2)
plot(A)
B = mean(B,1);
figure(k+3)
plot(B)
C = mean(C,1);
figure(k+4)
plot(C)
D = mean(D,1);
figure(k+5)
plot(D)
E = mean(E,1);
figure(k+6)
plot(E)



