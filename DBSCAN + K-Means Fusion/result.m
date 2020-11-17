function results=result(Idx,K,sam)

    for i=1:K
        aa=find(Idx==i);
        kk(i)=length(aa);
        for j=1:kk(i)
          results(i).sam1(j,:)=sam(aa(j),:);
        end
    end