function CDI=CDI_CLUSTER(fljg,K,D,Bcen,sam)
    d0=0;
    for i=1:K
        aa=find(fljg==i);
        kk(i)=length(aa);
        for j=1:kk(i)
            sam1(j,:)=sam(aa(j),:);
        end
            A=pdist2(sam1,sam1);
            A=(A.^2)./D;
            d2(i)=(sum(A(:)))/kk(i);
            d2(i)=d2(i)/(2*kk(i));
            d0=d0+d2(i);
    end
    d0=sqrt(d0/K);
    B=pdist2(Bcen,Bcen);
            B=(B.^2)./D;
            dd0=((sum(B(:)))/K)/(2*K);
            dd0=sqrt(dd0);
            CDI=d0/dd0;
            
            
            
    
    
    
    end
    
    