samples = [];
%% Out
outpath='.\833\outSeg2\';
for i=1:16
    load([outpath,'walk - 副本 (',num2str(i),')_1190k.mat']);
    samples{1}{i} = sum( gccData,1);
end

for i=1:10
    load([outpath,'book - 副本 (',num2str(i),')_1190k.mat']);
    samples{2}{i} = sum( gccData,1);
end

for i=1:10
    load([outpath,'jump - 副本 (',num2str(i),')_1190k.mat']);
    samples{3}{i} = sum( gccData,1);
end

for i=1:10
    load([outpath,'push - 副本 (',num2str(i),')_1190k.mat']);
    samples{4}{i} = sum( gccData,1);
end
%% 前期
outpath='.\833\hydOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{5}{i} = sum(gccData,1);
end
outpath='.\833\lshOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{6}{i} = sum( gccData,1);
end
outpath='.\833\chjOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{7}{i} = sum( gccData,1);
end
outpath='.\833\zyhOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{8}{i} = sum( gccData,1);
end
%% 后期
outpath='.\833\cwqOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{9}{i} = sum( gccData,1);
end
outpath='.\833\samOutSeg2\';
for i=1:17
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{10}{i} = sum( gccData,1);
end
outpath='.\833\yqOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{11}{i} = sum( gccData,1);
end
outpath='.\833\cstOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{12}{i} = sum( gccData,1);
end
%% L
outpath='.\833\2018-07-16摔倒\chjOutSeg2\';
for i=1:18
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{13}{i} = sum( gccData,1);
end
outpath='.\833\2018-07-16摔倒\hydOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{14}{i} = sum( gccData,1);
end
%% 跳步
% outpath='.\833\cwqWalkOutSeg2\';
% for i=1:10
%     load([outpath,'walk - 副本 (',num2str(i),')_1190k.mat']);
%     samples{15}{i} = sum( gccData,1);
% end
% outpath='.\833\cstWalkOutSeg2\';
% for i=1:10
%     load([outpath,'walk - 副本 (',num2str(i),')_1190k.mat']);
%     samples{16}{i} = sum( gccData,1);
% end
% outpath='.\833\samWalkOutSeg2\';
% for i=1:5
%     load([outpath,'walk - 副本 (',num2str(i),')_1190k.mat']);
%     samples{17}{i} = sum( gccData,1);
% end
%% slip
outpath='.\833\hydOutSeg2\';
for i=1:20
    load([outpath,'slip - 副本 (',num2str(i),')_1190k.mat']);
    samples{15}{i} = sum( gccData,1);
end
outpath='.\833\lshOutSeg2\';
for i=1:20
    load([outpath,'slip - 副本 (',num2str(i),')_1190k.mat']);
    samples{16}{i} = sum( gccData,1);
end


save('test','samples');
%% Train
samples = [];
outpath='.\833\samOutSeg2\';
for i=1:10
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{1}{i} = sum(gccData,1);
end
tmp=length(samples{1});
outpath='.\833\chjOutSeg2\';
for i=1:10
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{1}{i+tmp} = sum(gccData,1);
end
tmp=length(samples{1});
outpath='.\833\lshOutSeg2\';
for i=1:10
    load([outpath,'slip - 副本 (',num2str(i),')_1190k.mat']);
    samples{1}{i+tmp} = sum(gccData,1);
end
save('samples','samples');