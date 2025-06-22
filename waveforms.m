
function waveforms
figure("Name",'waveforms','Position',[400 300 500 400],NumberTitle='off');

uicontrol("Style","text","String",'frequency =','Position',[150 300 100 30],FontSize=18);
f=uicontrol("Style","edit",'Position',[260 300 100 30],FontSize=18);


uicontrol("Style","pushbutton","String",'sine','Position',[50 200 100 30],'callback',@(src,event) waveform('sine',f),FontSize=18);

uicontrol("Style","pushbutton","String",'ramp','Position',[200 200 100 30],'callback',@(src,event) waveform('ramp',f),FontSize=18);

uicontrol("Style","pushbutton","String",'triangle','Position',[350 200 100 30],'callback',@(src,event) waveform('triangle',f),FontSize=18);

uicontrol("Style","pushbutton","String",'noise','Position',[100 100 100 30],'callback',@(src,event) waveform('noise',f),FontSize=18);

uicontrol("Style","pushbutton","String",'sqaure','Position',[275 100 100 30],'callback',@(src,event) waveform('square',f),FontSize=18);



function waveform(op,f)

freq = str2double(get(f,'string'));
t=0:0.01:3;
if isnan(freq)
    errordlg('youuuu son of a bitch 🤭','error_69');
    return
end

switch op

    case'sine', 
        y=sin(2*pi*freq*t);
figure('Name', 'sine waveform',NumberTitle='off')
         plot(t,y);
title('');

    case'ramp',
        y=t;
     figure('Name','ramp waveform',NumberTitle='off')
        plot(t,y)
title('');

    case'noise',
        y = randn(size(t));  % white gaussian noise

        figure('Name','white gaussian noise',NumberTitle='off')
        plot(t,y)


    case'triangle',
        y= sawtooth(2*pi*freq*t,0.5)
        figure('Name','triangle waveform',NumberTitle='off')
        plot(t,y)

    case'square',
        y= square(2*pi*freq*t)
        figure('Name','square waveform',NumberTitle='off')
        plot(t,y)




end
end



























end

