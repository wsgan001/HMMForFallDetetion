% 导入训练样本 
load('samples.mat')

for i=1:length(samples)
	sample=[];
	for k=1:length(samples{i}) % 装载训练数据--nick
		sample(k).wave=samples{i}{k};
		sample(k).data=[];
	end
	hmm{i}=train(sample,[3 3 3 3]); % 进行训练，每个数字都得训练一个对应的hmm模型--nick
end