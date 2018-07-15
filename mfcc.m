function ccc = mfcc(x)
% Parameters
mfccDegree = 24; % 滤波器个数(将表示mfcc参数的阶数)
fs = 1190; % 采样频率
frame = 80; % 一帧信号的点数
inc = 20; % 帧移
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 归一化mel滤波器组系数
bank=melbankm(mfccDegree,frame,fs,0,0.5,'m');
bank=full(bank);
bank=bank/max(bank(:));

% DCT系数,12*mfccDegree
for k=1:12
  n=0:mfccDegree-1;
  dctcoef(k,:)=cos((2*n+1)*k*pi/(2*mfccDegree));
end

% 归一化倒谱提升窗口
w = 1 + 6 * sin(pi * [1:12] ./ 12);
w = w/max(w);

% 预加重滤波器
xx=double(x);
xx=filter([1 -0.9375],1,xx);

% 语音信号分帧
xx=enframe(xx,frame,inc);

% 计算每帧的MFCC参数
for i=1:size(xx,1)
  y = xx(i,:);
  s = y' .* hamming(frame);
  t = abs(fft(s));
  t = t.^2;
  c1=dctcoef * log(bank * t(1:frame/2+1));
  c2 = c1.*w';
  m(i,:)=c2';
end

%差分系数
% 标准的mfcc参数值只反映了语音参数的静态特性，而人耳对语音的动态特征更为敏感；
% 通过差分倒谱参数可以描述动态特性
dtm = zeros(size(m));
for i=3:size(m,1)-2
  dtm(i,:) = -2*m(i-2,:) - m(i-1,:) + m(i+1,:) + 2*m(i+2,:);
end
dtm = dtm / 3;

%合并mfcc参数和一阶差分mfcc参数
ccc = [m dtm];
%去除首尾两帧，因为这两帧的一阶差分参数为0
ccc = ccc(3:size(m,1)-2,:);
