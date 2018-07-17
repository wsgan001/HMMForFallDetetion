% 导入训练样本 
load('samples.mat')

for i=1:length(samples)
	sample=[];
	for k=1:length(samples{i}) % 装载训练数据--nick
		sample(k).wave=samples{i}{k};
		sample(k).data=[];
	end
	hmm{i}=train(sample,[3 3 3 3 3 3 3]); % 进行训练，每个数字都得训练一个对应的hmm模型--nick
end
% GMM(guassian mixture model)
% 混合高斯模型，顾名思义，就是用多个带有权重的高斯密度函数来描述数据的分布情况。
% 理论上来说，高斯分量越多，极值点越多，
% 混合高斯密度函数可以逼近任意概率密度函数，刻画模型越精确，需要的训练数据也就越多。