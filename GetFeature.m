function feature = GetFeature(x,fs)
    
    % –≈∫≈∑÷÷°
    xx=enframe(x,50,10);
    
    ASDdata=getASD(xx);
%     PSDdata=getPSD(xx,fs);
    feature=[ASDdata];
%     [feature,~]=featureNormalize(feature,0);
end