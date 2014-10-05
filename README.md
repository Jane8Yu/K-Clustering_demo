K-Clustering_demo
=================

Achieve K-Clustering with matlab

It's a homework of data mining.
The test data is from http://www.wisdom.weizmann.ac.il/~vision/Seg_Evaluation_DB/index.html.

The basic idea:

1.1 Read the image, save the picture information

1.2 Judge whether it's gray-scale images, if not converted to grayscale images in convenience of the distance calculation

1.3 Randomly pick a point A as the representative points of the first kind

1.4 Pick another point B which is fathest from point A as the representative of the second kind (the experiment is classified into two types)

1.5 Calculate the distance between the rest of a points and point A B .Comparing the nearest distance .

1.6 Draw different colors for two kind point and output the image file. 

Summary in ch:
通过这次试验，让我从代码实现的角度明白聚类算法的意义，以及K-Cluster 是如何进行聚类。
聚类属于无监督学习，是在未知类定义的情况下对数据集进行分类，关键在于相似性的计算，通常会采用欧氏距离。而K-Cluster则是先在数据集中随机选取一点A作为第一类，再在其余样本选择距离A最远的点为第二类，以此类推至第K类，然后再计算其余各点到每一类的距离，距离x类最近的则归为x类。在定义其余各点到每一类的距离，一开始是定义为相对类里每点距离的最小值，但容易出现较大的误差，于是改为距离类中心点的距离，以减少误差。另外由于第一类的第一点是随机选择的，也会产生随机误差。为避免由于上述原因而造成的较大误差，可以缩小随机选择点的集合：如选择颜色平均值的点、或者灰度值较大的点，也可以增加随机选择的次数以抵消偶然极端的随机点。
图像特征值关系到距离的计算，因此图像特征值选择也至关重要。选择不当也可能产生较大偏差。由于这是我初次接触Matlab来进行图像分割，对于图像特征选择不太熟悉，因此选择了灰度值作为特征。通过阅读其它文献，我了解到选择Lab HSL等作为特征值会是个更好的选择。
此次实验也让我对k-center、k-means、k-cluster这几种聚类算法间的区别更清楚。k-center是最大半径最小化，k-means是聚类内部距离平方之和的最小化，k-cluster是最大直径最小化。通过查阅资料，我了解到K-means是用得最多的一种传统的聚簇方法，我认为它是一直在修正聚类中心点的位置，因此误差相对减小。但同时我也猜想，一开始指定聚类个数会否是产生误差的另一个分量不小的原因。若本来就是两类的，硬要分出三类出来，会否造成人工误差呢？如果算法可以自动判断最适合分出几类，也许可以减小误差。
最后，这次实验也狠狠地锻炼我写代码的能力，比如for循环、矩阵下标等，以及对Matlab的熟悉和应用，它确实是个分析数学不错的工具，以后要多加利用。