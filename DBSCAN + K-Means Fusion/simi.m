function a=simi(A) %数据归一化处理

[M ~] = size(A);
for i = 1:M
    a(i,:)= (A(i,:)-min(A(i,:)))./(max(A(i,:))-min(A(i,:)));% (X-MIN)/(MAX-MIN)
end

end
