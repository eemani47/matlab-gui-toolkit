%function plots
% create the figure
close all
clearvars
figure('Name','analysis',NumberTitle='off',Position=[200 250 500 500]);
% create inputs
uicontrol('style','text','Position',[100 450 150 30],'String','numerator(tf) =',FontSize=17);
uicontrol('style','text','Position',[100 400 150 30],'String','denominator(tf) =',fontsize=17);
num= uicontrol('style','edit','Position',[250 450 150 50],fontsize=17);
dem= uicontrol('style','edit','Position',[250 400 150 50],fontsize=17);



%type of plots

uicontrol("Style","pushbutton","String",'step response','Position',[15 350 150 50],'Callback',@(src,event) code('step_response',num,dem));
uicontrol("Style","pushbutton","String",'impulse response','Position',[180 350 150 50],'Callback',@(src,event) code('impulse_response',num,dem));
uicontrol("Style","pushbutton","String",'bode response+margin','Position',[340 350 150 50],'Callback',@(src,event) code('bode_response+margin',num,dem));
uicontrol("Style","pushbutton","String",'root locus','Position',[15 300 150 50],'Callback',@(src,event) code('root_locus',num,dem));
uicontrol("Style","pushbutton","String",'nyquist plot','Position',[180 300 150 50],'Callback',@(src,event) code('nyquist_plot',num,dem));
uicontrol("Style","pushbutton","String",'state space model','Position',[340 300 150 50],'Callback',@(src,event) code('state_space_model',num,dem));
uicontrol("Style","pushbutton","String",'zero+pole','Position',[15 250 150 50],'Callback',@(src,event) code('zero_pole',num,dem));
uicontrol("Style","pushbutton","String",'closed loop poles','Position',[180 250 150 50],'Callback',@(src,event) code('closed_loop',num,dem));
uicontrol("Style","pushbutton","String",'step info','Position',[340 250 150 50],'Callback',@(src,event) code('step_info',num,dem));
uicontrol("Style","pushbutton","String",'bandwith','Position',[180 200 150 50],'Callback',@(src,event) code('band',num,dem));


%end



function code(op,num,dem)

numo=str2num(get(num,'string'));
demo=str2num(get(dem,'string'));

if  any(isnan(numo)) || any(isnan(demo))
 errordlg('youuu son of aaaa bitch!!','error_69');
 return
end

g=tf(numo,demo);

switch op
    case 'step_response'
        figure('Name','step response',NumberTitle='off');
        step(g);
        title('');

    case 'impulse_response'
        figure('Name','impulse response',NumberTitle='off');
        impulse(g)
        title('');

    case 'bode_response+margin'
        figure('Name','bode plot+margin',NumberTitle='off');
        bode(g)
        title('');

       case 'root_locus'
        figure('Name','root locus',NumberTitle='off');
        rlocus(g)
        title(''); 

        case 'nyquist_plot'
        figure('Name','nyquist plot',NumberTitle='off');
        nyquist(g)
        title('');

    case 'zero_pole'
   

        case'state_space_model'
  ss(g)
      
    case 'closed_loop'
     
        pole(feedback(g,1))
    

    case 'step_info'
     stepinfo(g)

case 'band'
     bandwidth(g)

    






end
end

      















        








