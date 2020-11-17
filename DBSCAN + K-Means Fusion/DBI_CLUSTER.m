function DBI=DBI_CLUSTER(fljg,Bcen,tmpcc,K)
    D=pdist(Bcen);%各聚类中心间的距离Mij
    %计算每个聚类中的点数
    for i=1:K
        aa=find(fljg==i);
        kk(i)=length(aa);
    end
    ii=1;
    for i=1:K
        for j=(i+1):K
            RR=tmpcc(i)/(sqrt(kk(i)))+tmpcc(j)/(sqrt(kk(j)));%Ri+Rj
            dist(ii)=RR/(D(ii));%(Ri+Rj)/Mij
            ii=ii+1;
        end
    end
    Dist=sort(dist,'descend');
    sumK=0;
    if K==2
       sumK=Dist(1);
    else
    for k=1:K
        sumK=sumK+Dist(k);
    end
    end
    DBI=sumK/K;%戴维森堡丁指数
            
        
    
    
    
    
    
    
    end
    
    