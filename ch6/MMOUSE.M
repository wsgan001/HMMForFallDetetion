function mmouse(cmd, handles)
global waves

hf = handles.mcut;
hw = handles.axes_wave;

ud = get(hf,'userdata');

% GUI not started
if isempty(ud)
    return
end

% make sure the mouse is above the wave
pos = get(hw,'position');
pt  = get(hf,'currentpoint');
if pt(1)<pos(1) | pt(1)>pos(1)+pos(3) | pt(2)<pos(2) | pt(2)>pos(2)+pos(4)
    setptr(hf, 'arrow');
    return
end

% find the current point of the mouse over the wave
pt = get(hw,'currentpoint');
pt = fix(pt(1));
pt = max(pt,1);
pt = min(pt,length(ud.wave));

% find the current xlim and x-range
xlim = get(hw, 'XLim');
xlen = xlim(2)-xlim(1);

switch cmd
case 'down'
    % mouse down
    if abs(ud.x1 - pt)/xlen < 0.02
        ud.drag = 1;
    elseif abs(ud.x2 - pt)/xlen < 0.02
        ud.drag = 2;
    else
        ud.drag = 3;
        ud.x0 = pt;
    end
    setptr(hf, 'closedhand');

case 'motion'
    % mouse is moving
    switch ud.drag
    case 0
        %fprintf('%d %d %d\n', ud.x1, ud.x2, fix(pt))
        if abs(ud.x1 - pt)/xlen < 0.02
            setptr(hf, 'hand1');
        elseif abs(ud.x2 - pt)/xlen < 0.02
            setptr(hf, 'hand2');
        else
            setptr(hf, 'glass');
        end

    case 1
        % dragging start line
        set(ud.h1, 'Xdata', [pt pt]);
        ud.x1 = pt;

    case 2
        % dragging end line
        set(ud.h2, 'Xdata', [pt pt]);
        ud.x2 = pt;

    case {3,4}
        % dragging the whole wave
        xlim = xlim + (ud.x0 - pt);
        set(hw, 'XLim', xlim);
        % yes, it was dragged
        ud.drag = 4;
        
    end

case 'up'
    % mouse is up
    if ud.drag == 3
        ud.drag = 0;
    end

    if ud.drag == 0
        %zoom
        m = get(hf,'SelectionType');
        if strcmp(m,'normal') == 1
            %zoom in
            xlim = [fix((xlim(1)+pt)/2) fix((xlim(2)+pt)/2)];
            set(hw, 'XLim', xlim);
        elseif strcmp(m,'alt') == 1
            %zoom out
            xlim = [2*xlim(1)-pt 2*xlim(2)-pt];
            xlim(1) = max(xlim(1),1);
            xlim(2) = min(xlim(2),length(ud.wave));
            set(hw, 'XLim', xlim);
        end
    end

    setptr(hf, 'glass');
    ud.drag = 0;
    ud.x0   = 0;

    waves(ud.index).x1 = ud.x1;
    waves(ud.index).x2 = ud.x2;
    
end

% modify the userdata
set(hf,'userdata', ud);
