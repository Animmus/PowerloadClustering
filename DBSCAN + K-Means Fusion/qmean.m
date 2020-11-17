function x= qmean(a,isnoise )

    k=find(isnoise~=true); %找出非噪声点
    x1=0;
    
    
    %对非噪声点求和再求均值
    
    for i=1:length(k)
    x1=x1+a(k(i),:);
    end
    x=x1/(length(k));
        
    
    end
    
    