clc;
gap = 25;
load('test.mat')
fall=[]; other=[];
for i=1:length(samples)
	for k=1:length(samples{i})
		m=samples{i}{k};
        m=mfcc(m);
        pout = viterbi(hmm{1}, m);
        if i>=5 && i<=14
        	fall = [fall; pout];
        else
            other = [other; pout];
        end
    end
end
%% 确定最佳阈值
bestT = 0;
leastError = Inf;
minFall = min(fall);
maxOther = max(other);
if minFall >= maxOther
    bestT = (minFall+maxOther)/2;
else
    threshold = maxOther;
    while threshold > minFall
        threshold = threshold - gap;
        fallError = length( find(fall<threshold));
        otherError = length( find(other>threshold));
        if leastError>fallError+otherError
            leastError=fallError+otherError;
            bestT = threshold;
        end
    end
end
threshold = bestT;
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
    fprintf('%f\n',fallnum/length(samples{i}));
end
%% plot
begin = 0.5;
line = 1:length(result);
figure; scatter(line,result,'filled'); hold on;
for i=1:length(samples)
    begin = begin + length(samples{i});
	plot([begin begin],[max(result) min(result)],'r');
    if i==4 || i==14
        plot([begin begin],[max(result) min(result)],'b--');
    end
end
 grid on;
 plot([0 length(result)],[threshold threshold],'r--');