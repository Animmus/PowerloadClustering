function [IDX, isnoise]=DBSCAN(X,epsilon,MinPts)

    C=0;
    
    n=size(X,1);%确定用户的个数
    IDX=zeros(n,1);
    
    D=pdist2(X,X);%求向量之间的距离
    %逻辑数组取零
    visited=false(n,1);
    isnoise=false(n,1);
    
    for i=1:n
        if ~visited(i)
            visited(i)=true;
            
            Neighbors=RegionQuery(i);
            %若在半径内的个数小于阈值，则认为是噪声点
            if numel(Neighbors)<MinPts
                % X(i,:) is NOISE
                isnoise(i)=true;
                %若不是噪声点，则寻找密度可达的点，进行聚类
            else
                C=C+1;
                ExpandCluster(i,Neighbors,C);
            end
            
        end
    
    end
    
    function ExpandCluster(i,Neighbors,C)
        IDX(i)=C;
        
        k = 1;
        while true
            j = Neighbors(k);
            
            if ~visited(j)
                visited(j)=true;
                Neighbors2=RegionQuery(j);
                %大于阈值，就取为同一类
                if numel(Neighbors2)>=MinPts
                    Neighbors=[Neighbors Neighbors2];   %#ok
                end
            end
            if IDX(j)==0
                IDX(j)=C;
            end
            %若对半径内的所有点都查询过了，就停止循环
            k = k + 1;
            if k > numel(Neighbors)
                break;
            end
        end
    end
    
    function Neighbors=RegionQuery(i)
        Neighbors=find(D(i,:)<=epsilon);
    end

end
