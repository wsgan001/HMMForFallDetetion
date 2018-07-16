samples = [];
%% Out
outpath='.\outSeg2\';
for i=1:40
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
outpath='.\newData\hydOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{5}{i} = sum(gccData,1);
end
outpath='.\newData\lshOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{6}{i} = sum( gccData,1);
end

outpath='.\newData\chjOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{7}{i} = sum( gccData,1);
end

outpath='.\newData\zyhOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{8}{i} = sum( gccData,1);
end
%% 后期
outpath='.\newData\cwqOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{9}{i} = sum( gccData,1);
end
outpath='.\newData\lmyOutSeg2\';
for i=1:12
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{10}{i} = sum( gccData,1);
end
outpath='.\newData\samOutSeg2\';
for i=1:17
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{11}{i} = sum( gccData,1);
end
outpath='.\newData\yqOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{12}{i} = sum( gccData,1);
end
outpath='.\newData\cstOutSeg2\';
for i=1:20
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{13}{i} = sum( gccData,1);
end
%% 跳步
% outpath='.\newData\cstWalkOutSeg2\';
% for i=1:10
%     load([outpath,'walk - 副本 (',num2str(i),')_1190k.mat']);
%     samples{14}{i} = sum( gccData,1);
% end
% outpath='.\newData\cwqWalkOutSeg2\';
% for i=1:10
%     load([outpath,'walk - 副本 (',num2str(i),')_1190k.mat']);
%     samples{15}{i} = sum( gccData,1);
% end
% outpath='.\newData\samWalkOutSeg2\';
% for i=1:5
%     load([outpath,'walk - 副本 (',num2str(i),')_1190k.mat']);
%     samples{16}{i} = sum( gccData,1);
% end
% outpath='.\newData\yqWalkOutSeg2\';
% for i=1:16
%     load([outpath,'walk - 副本 (',num2str(i),')_1190k.mat']);
%     samples{17}{i} = sum( gccData,1);
% end

save('test','samples');

%% Train
samples = [];
outpath='.\newData\lshOutSeg2\';
for i=1:10
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{1}{i} = sum(gccData,1);
end
outpath='.\newData\cstOutSeg2\';
for i=1:10
    load([outpath,'fall - 副本 (',num2str(i),')_1190k.mat']);
    samples{1}{i+10} = sum(gccData,1);
end
save('samples','samples');