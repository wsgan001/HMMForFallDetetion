outpath='.\hydOutSeg2\';
for i=1:10
    load([outpath,'fall - ���� (',num2str(i),')_1190k.mat']);
    samples{1}{i} = sum( gccData,1 );
end

for i=1:10
    load([outpath,'slip - ���� (',num2str(i),')_1190k.mat']);
    samples{2}{i} = sum( gccData,1 );
end
save('fallsample','samples');