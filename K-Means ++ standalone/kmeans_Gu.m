function [idx,sc] = kmeans_Gu(X,k)
%kmeans�㷨-Gu
%X����������Ϊ��������Ϊ���ԣ���200��������96�����ԣ�����Ϊ200*96��
%idx������ÿ�����������1��2��...,k
%sc,����ÿ������������ϵ��


[m,n] = size(X);%����X��ά��
for i=1:n% normalized the X
    X(:,i) = normalization(X(:,i),1);%�����ݽ��й�һ��
end

TEMP = X;

init = kmeans_init(X,k);% select the init


% plot_Gu(init,1)%������ʼ��



%��һ�ν��г�ʼ��
[idx,cents,SSE] = kmeans_process(X,init,k);
SSE_old = SSE;

%���е�������
for i=1:1000
    [idx,cents,SSE] = kmeans_process(X,cents,k);
    if (abs(SSE_old-SSE))<0.01
        break
    end
    SSE_old = SSE;
end
sc = SC(X,idx,k);
end