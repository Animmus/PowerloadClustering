clear
n = 10；%产生的样本的数量（一组里有多少条曲线）
z = 0.2;%随机数的衰减值，可在此决定整组曲线轮廓离散程度，z越大轮廓越大
shift = shift (n);生成1行n列的只含0（40%），1（30%），-1（30%）的向量
a = 1:1:96;
d = [];

%rand(m,n) 生成m行n列（0，1）的随机数

for i = i:n


  x1 = (0.7+0.005):0.005:0.8;
  ri = z*(rand(1,20)*2-1);
  x1 = x1 + r1;
  x1 = flip(x1);
  
  deta = 0.25/16;
  x2 = (0.7+deta):deta:0.95;
  r2 = z*(rand(1,16)*2-1);
  x2 = x2 + r2;
  
  deta = 0.12/12;
  x3 = (0.83+deta):deta:0.95;
  r3 = z*(rand(1,12)*2-1);
  x3 = x3 + r3;
  x3 = flip(x3);
  
  deta = 0.08/8;
  x4 = (0.83+deta):deta:0.91;
  r4 = z*(rand(1,8)*2-1);
  x4 = x4 + r4;
  
  deta = 0.1/40;
  x5 = (0.81+deta):deta:0.91;
  r5 = z*(rand(1,40)*2-1);
  x5 = x5+r5;
  x5 = flip(x5);
  
  x = [x1,x2,x3,x4,x5];
  x= round_shift(x,shift(i));
  b(2*i - 1,:) = a;
  b(2*1,:) = x;
  xn(i,:) = x;
  d = [d; a'];
end
b = b';
y2 = xn';
y2 = reshape(y2,96*n,1);
e = mean(xn);
figure(3)
plot(e);
axis([0 96 0 1.2])


for i = i:n
  figure(1)
  plot(xn(i,:))
  axis([0 96 0 1.2])
  set(gcf,'color','white');
  hold on
end
