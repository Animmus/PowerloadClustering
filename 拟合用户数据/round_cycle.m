function new = circle_class(old,num)
%Բ������λ�ƣ���Ϊλ�Ʊ仯�����������ݲ�����ǰ�棬����ʹԲ����λ
%old-ԭʼ����
%num-�ƶ���λ��
%new-�����ƶ��ŵ�����
[m,n] = size(old);%��ʱn=96������50����
k = 1;
if num > 0
    %num = shift(i) == 1, ��x����Ԫ������һλ(30%)��ͷβ��ӣ��ʳ�Բ������λ��
    for i = num+1:n
        new(k) = old(i);
        k = k+1;
    end
    for i = 1:num
        new(k) = old(i);
        k = k+1;
    end
end
if num < 0
    %num = shift(i) == -1, ��x����Ԫ������һλ(30%)
    for i = (num+n+1):n
        new(k) = old (i);
        k = k+1;
    end
    for i = 1:(n+num)
        new(k) = old(i);
        k = k+1;
    end
end
if num == 0
    %num = shift(i) == 0, ����(40%)
    new = old;
end
end