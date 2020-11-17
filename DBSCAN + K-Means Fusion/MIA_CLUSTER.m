function MIA=MIA_CLUSTER(fljg,K,D,Bcen,sam )
    d0=0;
    for i=1:K
        aa=find(fljg==i);
        kk(i)=length(aa);
        for j=1:kk(i)
            sam1(j,:)=sam(aa(j),:);
        end
            A=pdist2(Bcen(i,:),sam1);
            A=(A.^2);
            sum1=sum(A)/D;
            d2(i)=sum1/kk(i);
            
           
    end
    d0=sum(d2)/K;
    MIA=sqrt(d0);
    
    
    end
    
    