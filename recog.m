threshold = -4721;
%% ¼ÆËã¾«¶È
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
    fprintf('%d:  %d/%d(%.4f)\n',i,fallnum,length(samples{i}),fallnum/length(samples{i}));
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