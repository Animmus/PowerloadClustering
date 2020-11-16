function new = circle_class(old,num)
%圆周序列位移，因为位移变化后最后面的数据补到最前面，所以称圆周位移
%old-原始数据
%num-移动的位数
%new-返回移动号的数据
[m,n] = size(old);%此时n=96而不是50！！
k = 1;
if num > 0
    %num = shift(i) == 1, 将x所有元素左移一位（30%），头尾相接，故称圆周序列位移
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
    %num = shift(i) == -1, 将x所有元素右移一位（30%）
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
    %num = shift(i) == 0, 不移(40%)
    new = old;
end
end