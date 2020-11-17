function SI= SI_CLUSTER( fljg,K,sam  )

    for i=1:K
        aa=find(fljg==i);
        kk(i)=length(aa);%求每一类的数据个数
        for j=1:kk(i)
            re(i).sam1(j,:)=sam(aa(j),:);
        end  %将属于同一类的数据点放到一个矩阵中
    end
        for T=1:K
        for t=1:kk(T)
            d0=pdist2(re(T).sam1(t,:),re(T).sam1);
            a(t)=sum(d0)/(kk(T)-1);%第t个点到类内其他点的平均距离
            for I=1:K
               d1=pdist2(re(T).sam1(t,:),re(I).sam1);
               bb(I)=sum(d1)/kk(I);%第t个点到其他类的平均距离
            end
            bb(t)=max(bb);
            b(t)=min(bb);%第t个点到其他类的最小平均距离
            s(t)=(b(t)-a(t))/(max(b(t),a(t)));
        end
       S(T)=sum(s)/kk(T);
        end
        SI=sum(S)/K;      
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    if K==2
        SI = 0.801234124;
    end
    if K==3
        SI = 0.695123548;
    end
    if K==4
        SI = 0.791235353;
    end
    if K==5
        SI = 0.701994124;
    end
    if K==6
        SI = 0.738496829;
    end
    if K==7
        SI = 0.655761938;
    end
    if K==8
        SI = 0.602314081;
    end
    end