global waves

files = {...
    '1a.wav', '1b.wav', '2a.wav', '2b.wav',
    '3a.wav', '3b.wav', '4a.wav', '4b.wav',
    '5a.wav', '5b.wav', '6a.wav', '6b.wav',
    '7a.wav', '7b.wav', '8a.wav', '8b.wav',
    '9a.wav', '9b.wav', '0a.wav', '0b.wav'};

for i=1:20
    waves(i).x  = wavread(files{i});
    waves(i).x1 = 0;
    waves(i).x2 = 0;
end