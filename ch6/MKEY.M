% --------------------------------------------------------------------
function mkey(cmd, handles)
global waves

hf = handles.mcut;
ud = get(hf,'userdata');

if strcmp( cmd, 'start')
	ud.index = 1;
    ud = refresh(ud, handles);
	set(hf,'userdata', ud);
    return
end

if isempty(ud) 
    return
end

index = ud.index;

switch cmd
case 'previous'
    % previous sample
    if index > 1
        index = index-1;
    end
    ud.index = index;
    ud = loadwave(ud, handles);
    ud = refresh (ud, handles);

case 'next'
    % next sample
    if index < length(waves)
        index = index+1;
    end
    ud.index = index;
    ud = loadwave(ud, handles);
    ud = refresh(ud, handles);

case 'sound'
	soundsc(ud.wave(ud.x1 : ud.x2));
    
case 'jump'
    while(1)
        answer = inputdlg('输入Word:', '输入欲跳转到的记录号', 1, {'1'});
        if isempty(answer)
            continue;
        end
        index  = str2num(answer);
        if index<1 | index>length(waves)
            continue;
        end
        break;
    end
 
    ud.index = index;
    ud = loadwave(ud, handles);
    ud = refresh(ud, handles);
    
otherwise
    disp('Unknown method');

end

% modify the userdata
set(hf,'userdata', ud);

% --------------------------------------------------------------------
function ud = refresh(uu, handles)
global waves

hf = handles.mcut;
hw = handles.axes_wave;
ht = handles.text_prop;

uu = loadwave(uu, handles);

plot(uu.wave,'Parent',hw);
set(hw, 'XLim', [1 length(uu.wave)]);
set(hw,'NextPlot','add');
ylim = get(hw, 'YLim');
uu.h1 = plot([uu.x1 uu.x1],ylim, 'Parent',hw, 'Color','red'  ,'LineWidth',2);
uu.h2 = plot([uu.x2 uu.x2],ylim, 'Parent',hw, 'Color','green','LineWidth',2);
set(hw,'NextPlot','replace');

uu.drag = 0;
uu.x0   = 0;  % where the mouse clicked

txt = sprintf('编号: %d  总数: %d', uu.index, length(waves));
set(ht, 'String', txt);

ud = uu;

% --------------------------------------------------------------------
function ud = loadwave(uu, handles)
global waves

uu.wave = waves(uu.index).x;     % 语音数据
uu.x1   = waves(uu.index).x1;    % 开始点
uu.x2   = waves(uu.index).x2;    % 结束点

if uu.x1==0 | uu.x2==0                    % 未进行自动/手工端点检测前, x1=x2=0
    uu.x1 = fix(length(uu.wave) * 0.1);
    uu.x2 = fix(length(uu.wave) * 0.9);
end

ud = uu;
