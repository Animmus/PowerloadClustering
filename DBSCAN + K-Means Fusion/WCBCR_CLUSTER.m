function WCBCR=WCBCR_CLUSTER(Bcen,fljg,K,sam)
    d0=0;
    for i=1:K
        aa=find(fljg==i);
        kk(i)=length(aa);
        for j=1:kk(i)
            sam1(j,:)=sam(aa(j),:);
        end
        A=pdist2(Bcen(i,:),sam1);
       A=(A.^2);
         d2(i)=sum(A(:));
         d0=d0+d2(i);
    end
    B=pdist(Bcen);
    B=B.^2;
    dd0=sum(B(:));
    WCBCR=d0/dd0;
         
        
    
    
    end
    
    