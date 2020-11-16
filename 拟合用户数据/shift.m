function shift = shift(num)
%产生位移序列 shift是由不等概率生成的1行num列的含0（40%），1（30%），-1（30%）的向量
%num-样本的数量
%shift-返回每个样本的移动情况
rands = rand(1,num);%生成1行num列(0,1)的值
for i = 1:num
    if rands(i)>=0 && rands(i)<=0.4
        shift(i) = 0;
    end
    if rands(i)>0.4 && rands(i)<=0.7
        shift(i) = 1;
    end
    if rands(i)>0.7 && rands(i)<=1
        shift(i) = -1;
    end
end
end