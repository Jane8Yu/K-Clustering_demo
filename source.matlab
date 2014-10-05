% k-cluster 算法实现

% 清理
clear;    
clc;
tic;

	path1=input('请输入图像文件路径：','s');
	path2=input('请保存图像文件路径：','s');

	% 读取文件
	img=imread(path1);
	% 判断是否%转换为灰度图
	[m,n,c]=size(img);
	if c~=1
	img=rgb2gray(img);
	end
	[m,n]=size(img);

% 增加随机选次数，减小误差
for count=1:10
	% 随机选取第一个聚类点
	r=randint(1,1,[1,m]);
	c=randint(1,1,[1,n]);
	% 存放聚类1点位置
	cp1=[r,c];
	% 存放聚类1点的值
	cv1=img(r,c);
end

	%获取距离第一个聚类点的最远的第二种聚类的点
	distM=abs(img-cv1);
	[row col]=find(max(max(distM)));
	% 存放聚类2点位置	
	cp2=[row,col];
	% 存放聚类2点的值
	cv2=img(row,col);

for i=1:m
	for j=1:n
		if (i==r||i==row)&&(j==c||j==col) 
			continue 
		else
			d1=min(abs(img(i,j)-cv1));
			d2=min(abs(img(i,j)-cv2));
			% d1=min(abs(img(i,j)-img(r,c)));
			% d2=min(abs(img(i,j)-img(row,col)));
			if(d1<d2)
				cv1=[cv1 img(i,j)];
				cp1=[cp1;i,j];
			else
				cv2=[cv2 img(i,j)];
				cp2=[cp2;i,j];
			end
		end
	end
end

size1=size(cp1, 1);
size2=size(cp2, 1);

% 聚类1的点变成黑色
for i=1:size1
	img(cp1(i,1),cp1(i,2))=0;
end

% 聚类2的点变成白色
for i=1:size2
	img(cp2(i,1),cp2(i,2))=255;
end
	
	%存入变换后的图片
	img=uint8(img);
 	imwrite(img,path2);
