sam1=sam;
n=size(sam1,1);
D=pdist(sam1)   ;
Y=mdscale(D,2,'criterion','metricsstress');
% distances = pdist(Y);
% plot(D,distances);
for i=1:n    %%%对于每一个数据点（共n个）
      if fljg(i)==1
       plot(Y(i,1),Y(i,2),'r:.');     %%%红色
       hold on;
      end
       if fljg(i)==2
       plot(Y(i,1),Y(i,2),'b:.');     %%%红色
       hold on;
          end
          if fljg(i)==3
       plot(Y(i,1),Y(i,2),'c:.');     %%%红色
       hold on;
          end
         if fljg(i)==4
       plot(Y(i,1),Y(i,2),'g:.');     %%%红色
       hold on;
         end
         if fljg(i)==5
       plot(Y(i,1),Y(i,2),'y:.');     %%%红色
       hold on;
         end
        if fljg(i)==6
       plot(Y(i,1),Y(i,2),'m:.');     %%%红色
       hold on;
        end
        if fljg(i)==6
       plot(Y(i,1),Y(i,2),'w:.');     %%%红色
       hold on;
        end
        if fljg(i)==6
       plot(Y(i,1),Y(i,2),'c:.');     %%%红色
       hold on;
         end 
end

