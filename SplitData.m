testData1=[];testData2=[];testData3=[];
outpath='.\newData\cstWalkOutSeg\';
for i=1:5
    load([outpath,'walk - 副本 (',num2str(i),')_1190k.mat']);
    testData1=[testData1;gccData(1:2,:)];
    testData2=[testData2;gccData(3:4,:)];
    testData3=[testData3;gccData(5:6,:)];
end

for i=1:size(testData1,1)
    name=[outpath,'walk - 副本 (',num2str(i),')_1190k.mat'];
    gccData = [testData1(i,:) ; testData2(i,:) ;testData3(i,:)];
    save(name,'gccData');
end