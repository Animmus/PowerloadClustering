function normal = normalization(x,kind)
% 对数据进行归一化处理

%x，样本（行为样本，列为属性，即200个样本，96个属性，样本为200*96）
%kind，归一化的类别
%normal，返回归一化的数据

if nargin < 2
    kind = 2;%kind = 1 or 2 表示第一类或第二类规范化
end

[m,n]  = size( x );
normal = zeros( m,n );
%% normalize the data x to [0,1]
if kind == 1
    ma = max( x );
    mi = min( x );
    for i = 1:m        
        normal(i,:) = ( x(i)-mi )./( ma-mi );
    end
end
%% normalize the data x to [-1,1]
if kind == 2
    for i = 1:m
        mea = mean( x(i,:) );
        va = var( x(i,:) );
        normal(i,:) = ( x(i,:)-mea )/va;
    end
end
