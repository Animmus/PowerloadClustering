function [idx,cents,SSE] = kmeans_process(X,cents,k)
%kmeans�㷨��������

%X����������Ϊ��������Ϊ���ԣ���200��������96�����ԣ�����Ϊ200*96��
%cents����������
%k,��������
%idx������ÿ�����������1��2��...,k
%cents,�����µ���������
%SSE�����ؾ������

%�������е㵽ÿ�����ĵĵľ���
[m,n] = size(X);
SSE = 0;
D = zeros(m,k);
idx = zeros(m,1);
for c=1:k
    for i=1:m
        temp =0;%��m������ÿ��һ���а�temp����
        for j=1:n
            temp = temp+(cents(c,j)-X(i,j))^2;%�õ���i�����ߵĵ������ĵ�ľ��벢���
        end
        D(i,c) = temp;%�ѵ�i�������Ĳ��֮�ͷ���D����m��k�У��ĵ�i�� ��c�У�cָ��ĳ����������߱�ţ�
    end    
end

%����idx��SSE
for i=1:m
    temp = find(D(i,:) == min(D(i,:)));%�ҵ�D��ÿ����Сֵ����Сֵ���ݵ�*****����*****ͨ��find������¼��idx�ĵ�i�С�������������idx���涼������
    idx(i) = temp(1,1);
    SSE = SSE+D(i,idx(i));%��D��ÿ����Сֵ���
end
%���¾�������
for i=1:k
    new_cents = zeros(1,n);
    temp = find(idx == k);%�ҵ��������k������ߵĺ���
    [m_temp,n_temp] = size(temp);%�õ���k������ж��������ߣ���Ϊm_temp��
    for j=1:m_temp
        new_cents = new_cents(1,:)+X(temp(j),:);%���Ѿ������i����������
    end
    cents(k,:) = new_cents/m_temp;%�����������ֵ���γ��µ����ĵ㼯����������Ϊʲô����ԭ�����ߡ�����������Ϊ���ƽ����Ϊ��ϵ����ߣ�������ԭ�����ߵ�һԱ
end
end