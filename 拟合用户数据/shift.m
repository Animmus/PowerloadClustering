function shift = shift(num)
%����λ������ shift���ɲ��ȸ������ɵ�1��num�еĺ�0(40%)��1(30%)��-1(30%)������
%num-����������
%shift-����ÿ���������ƶ����
rands = rand(1,num);%����1��num��(0,1)��ֵ
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