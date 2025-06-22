function calci
figure('name','calci')

uicontrol('style','text','string','num_1 :','position',[20 350 100 30],'fontsize',20)
num_1 = uicontrol('style','edit','position',[140 350 100 25],'fontsize',20);

uicontrol('style','text','string','num_2 :','position',[20 300 100 30],'fontsize',20)
num_2 = uicontrol('style','edit','position',[140 300 100 25],'fontsize',20);

uicontrol('style','text','string','result :','position',[50 200 100 25],'fontsize',20)
result_txt = uicontrol('style','edit','position',[140 200 400 30],'fontsize',20);

uicontrol('style','pushbutton','string','+','position',[20 100 50 40], ...
    'callback', @(src,event) calci('+', num_1, num_2, result_txt));
uicontrol('style','pushbutton','string','-','position',[80 100 50 40], ...
    'callback', @(src,event) calci('-', num_1, num_2, result_txt));
uicontrol('style','pushbutton','string','*','position',[140 100 50 40], ...
    'callback', @(src,event) calci('*', num_1, num_2, result_txt));
uicontrol('style','pushbutton','string','/','position',[200 100 50 40], ...
    'callback', @(src,event) calci('/', num_1, num_2, result_txt));

function calci(op, num_1, num_2, result_txt)
    a = str2double(get(num_1, 'string'));
    b = str2double(get(num_2, 'string'));

    if isnan(a) || isnan(b)
        set(result_txt, 'string', 'are you blind, plz check your inputs');
        return;
    end

    switch op
        case '+', res = a + b;
        case '-', res = a - b;
        case '*', res = a * b;
        case '/'
            if b == 0
                set(result_txt, 'string', 'go fuck yourself');
                return;
            end
            res = a / b;
    end

    set(result_txt, 'string', num2str(res));
end
end
