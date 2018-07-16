% 	[x1 x2] = vad(x);
% 	m = mfcc(x);
% 	m = m(x1-2:x2-2,:);
% 	for j=1:10
% 		pout(j) = viterbi(hmm{j}, m);
% 	end
% 	[d,n] = max(pout);
%% 计算阈值
load('rand.mat')
result=[];
for k=1:length(samples{1})
    m=samples{1}{k};
    m=mfcc(m);
    pout = viterbi(hmm{1}, m);
    result = [result; pout];
end
threshold = mean(result)*1.04;
fprintf('Threshold:%.f\n',threshold);
%% 计算精度
load('test.mat')
result=[];
for i=1:length(samples)
    fallnum = 0;
	for k=1:length(samples{i})
		m=samples{i}{k};
        m=mfcc(m);
        pout = viterbi(hmm{1}, m);
        result = [result; pout];
        if pout > threshold
            fallnum = fallnum + 1;
        end
    end
    fprintf('%d/%d(%.4f)\n',fallnum,length(samples{i}),fallnum/length(samples{i}));
end
%% plot
begin = 0.5;
figure; plot(result,'k'); hold on;
for i=1:length(samples)
    begin = begin + length(samples{i});
	plot([begin begin],[max(result) min(result)],'r');
end
 grid on;
 plot([0 length(result)],[threshold threshold],'r--');