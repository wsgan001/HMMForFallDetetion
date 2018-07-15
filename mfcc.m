function ccc = mfcc(x)
% Parameters
mfccDegree = 24; % �˲�������(����ʾmfcc�����Ľ���)
fs = 1190; % ����Ƶ��
frame = 80; % һ֡�źŵĵ���
inc = 20; % ֡��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��һ��mel�˲�����ϵ��
bank=melbankm(mfccDegree,frame,fs,0,0.5,'m');
bank=full(bank);
bank=bank/max(bank(:));

% DCTϵ��,12*mfccDegree
for k=1:12
  n=0:mfccDegree-1;
  dctcoef(k,:)=cos((2*n+1)*k*pi/(2*mfccDegree));
end

% ��һ��������������
w = 1 + 6 * sin(pi * [1:12] ./ 12);
w = w/max(w);

% Ԥ�����˲���
xx=double(x);
xx=filter([1 -0.9375],1,xx);

% �����źŷ�֡
xx=enframe(xx,frame,inc);

% ����ÿ֡��MFCC����
for i=1:size(xx,1)
  y = xx(i,:);
  s = y' .* hamming(frame);
  t = abs(fft(s));
  t = t.^2;
  c1=dctcoef * log(bank * t(1:frame/2+1));
  c2 = c1.*w';
  m(i,:)=c2';
end

%���ϵ��
% ��׼��mfcc����ֵֻ��ӳ�����������ľ�̬���ԣ����˶��������Ķ�̬������Ϊ���У�
% ͨ����ֵ��ײ�������������̬����
dtm = zeros(size(m));
for i=3:size(m,1)-2
  dtm(i,:) = -2*m(i-2,:) - m(i-1,:) + m(i+1,:) + 2*m(i+2,:);
end
dtm = dtm / 3;

%�ϲ�mfcc������һ�ײ��mfcc����
ccc = [m dtm];
%ȥ����β��֡����Ϊ����֡��һ�ײ�ֲ���Ϊ0
ccc = ccc(3:size(m,1)-2,:);
