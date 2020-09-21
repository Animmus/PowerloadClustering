function DBSCANPROTO
clear;
close all;
clc;
%image = imread('1.png');
%disp(image); %该程序改编于普通的“培养皿菌群”一类图像的DBSCAN代码，并重新测试，此处IMAGE指的就是原生“菌群”的图像文件（超低像素黑白图）
user_approxi;
%[x1,y] = find (image == 1);
data = [d,y2];
%data = xn;%←该调用未实现
hold on
dbscan(data,5,0.13);%把'1.png'放好在figure背景里后正式启动主函数dbscan，dbscan输入参数（负荷数据集，最小邻域个数，最小邻域半径）=（data,3,0.2）
end

function [class,type,clusteridx]=dbscan(data,k,Eps)%输入（数据集，个数，半径），对所有点编号，输出（几号点被分到了哪类簇，几号点是核心、边界、噪点，核心簇的点集）
 x=zscore(data);%对数据及进行-1 1标准化
 [m,~] = size(data);%获取点个数m
 if nargin<3||isempty(Eps)%若输入参数不齐或半径未给出
     [Eps] = epsilon(x,k);%则自动计算半径
 end
 x=[(1:m)',x];                  %为每一个点标号，形成（点个数m）行3列（序号x坐标y坐标）的点阵 
    [m,n] = size(x);            % 获得点阵尺寸（m行3列）
    type = zeros(1,m);          % 初始化点类型向量
    no = 1;                     % 初始化簇的组号，赋值1
    touched = zeros(m,1);       % 初始化遍历历史矩阵（未遍历记为0，已遍历记为1） m行1列 0向量
    class = zeros(1,m)-2;       % 初始化簇号矩阵 1行m列 0向量
    % 作图第一步：列出背景和坐标
    figure(2);
    plot(x(:,2),x(:,3),'.k');  
    xlabel('x');ylabel('y');
    title('Predict data by using DBSCAN');
    hold on;
    color1 = [rand(),rand(),rand()];
    color2 = [rand(),rand(),rand()];
    for i = 1:m                             % *******开始遍历整个输入点集（核心功能）*********
        if touched(i) == 0                  % 若第i点未遍历
            ob = x(i,:);                    % 从点集中获取第i点的坐标
            ind=kdtree(x(:,2:n),ob(2:n),Eps);           %获得第i个点的半径Eps内的内点的坐标
            if(length(ind) > 1 && length(ind) < k+1)    % 判断边界点
                type(i) = 0;                            % 若是，将该边界点记为1
                class(i) = 0;
            end
            if(length(ind)==1)                  % 判断离群点
                type(i) = -1;                   % 若是，将该离群点记为-1
                class(i) = -1;
                touched(i)=1;                   % 若是，将该离群点从遍历名单中除名，后续无需再遍历
            end
            if(length(ind)>=k+1)                % 判断核心点
                type(i)=1;                      % 若是，将该核心点记为1
                class(ind)=ones(length(ind),1)*max(no);     % 将该核心点的内点分配至第no号簇
                figure(2)
                draw(x,no,ind,color1)                  % ***************在背景染色核心点（可视化核心）*************
                h=circle(x,Eps,i);
                draw(x,4,i,color2)                     % *******在背景染色核心点的内点并显示半径（可视化核心）******
                %pause(0.00001)                     % pause
                drawnow;
                delete(h);
                color1 = [rand(),rand(),rand()];
                color2= [rand(),rand(),rand()];
                while ~isempty(ind)             % 对第i点的核心点半径Eps的内点迭代判断，寻找密度直达和密度可达关系
                    ob = x(ind(1),:);           % 检查内点序列中第一个点
                    touched(ind(1))=1;          % 设为已遍历
                    ind(1)=[];                  % 将内点序列中第一个点清空（这样就能在下一次循环中读取第二个点）
                    i1=kdtree(x(:,2:n),ob(2:n),Eps);%获取内点序列第一个点的半径（Eps）内的点集i1
                    
                    if length(i1)>1             % 若不是噪点
                        class(i1)=no;           % 将第一个点归入第no号簇
                        if length(i1)>=k+1      % 若不是噪点，且是核心点
                            type(ob(1))=1;      % 核心点标记1
                        else                    % 若不是噪点，且是边界点
                            type(ob(1))=0;      % 边界点标记0
                        end
                        figure(2)
                        draw(x,no,i1,color1)           % 画出边界点
                        draw(ob,4,1,color2)            % 画出核心点  
                        h=circle(ob,Eps,1);
                        %pause(0.00001)             % Pause
                        drawnow;
                        delete(h)
                        figure(2)
                        draw(ob,no,1,color1)           % 染色核心点
                        for k1=1:length(i1)
                            if touched(i1(k1))==0   % 若有邻点
                                touched(i1(k1))=1;  % 设为已遍历
                                ind=[ind,i1(k1)];   % 将该点重列入内点序列队尾
                                class(i1(k1))=no;   % 将该点分配入第no号簇
                            end
                        end
                    end
                end
                no = no+1;  % 簇号更新 赋值加一
            end
        end
    end
    i1=find(class==0);          % 若有遗漏
    class(i1)=-1;               % 将其归入-1号簇
    type(i1)=-1;                % 边界点标记为-1
    maxlab = max(class);        % 获得簇的标号（查看no，有几个簇）
    clusteridx=[];              % 在某簇内的点
    clun=[];                    % 某个簇的点的个数
    
    for ck=1:maxlab
        tidx=find(class==ck);
        clusteridx=[clusteridx;[tidx,zeros(1,m-length(tidx))]];
        %clusteridx=[clusteridx;tidx];        %每个簇内的点的编号
        clun=[clun,length(tidx)];            % 每个簇内的点的数量
    end
    disp(clun);
    hold off
end

function [D] = dist(i,x)
    [m,~] = size(x);
    D = sqrt(sum((ones(m,1)*i-x).^2'));
end

function [Eps] = epsilon(x,k)
    [m,n] = size(x);
    Eps=((prod(max(x)-min(x))*k*gamma(.5*n+1))/(m*sqrt(pi.^n))).^(1/n);
    disp('Eps');
    disp(Eps);
end
function draw(data,~,i,color)

plot(data(i,2),data(i,3),'*','Color',color,'MarkerFaceColor',color);
end

function [h]=circle(data,R,i) %画出半径（可视化插件）
alpha=0:pi/50:2*pi;%角度[0,2*pi]
%R=2;%半径
x=R*cos(alpha)+data(i,2);
y=R*sin(alpha)+data(i,3);
h = patch(x,y,'r','edgecolor','none','facealpha',0.2)

end


function [ret]=kdtree(data,obj,r)%MATLAB 内置函数 输入（全体点集，目标点集，半径） 输出（内点点集）
%Mdl = createns(X,'NSMethod','kdtree','Distance','euclidean');
%IdxNN = knnsearch(Mdl,Q,'K',5);
MdlKDT = KDTreeSearcher(data);
% r-Search radius
IdxKDT = rangesearch(MdlKDT,obj,r);     % Cell 
ret = IdxKDT{1};
end
