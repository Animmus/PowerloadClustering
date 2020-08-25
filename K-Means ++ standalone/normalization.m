function normal = normalization(x,kind)
% �����ݽ��й�һ������

%x����������Ϊ��������Ϊ���ԣ���200��������96�����ԣ�����Ϊ200*96��
%kind����һ�������
%normal�����ع�һ��������

if nargin < 2
    kind = 2;%kind = 1 or 2 ��ʾ��һ���ڶ���淶��
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
