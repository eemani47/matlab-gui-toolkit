
function temp

    % create figure window
    figure('name','temperature converter','NumberTitle','off','Position',[600 300 500 450]);

    % ===== CELSIUS =====
    uicontrol("Style","text","Position",[120 350 100 30],"String",'Celsius (°C)','FontSize',18);
    C = uicontrol("Style","edit","Position",[240 350 100 30],'FontSize',15);

    % ===== KELVIN =====
    uicontrol("Style","text","Position",[120 300 100 30],"String",'Kelvin (K)','FontSize',18);
    K = uicontrol("Style","edit","Position",[240 300 100 30],'FontSize',15);

    % ===== FAHRENHEIT =====
    uicontrol("Style","text","Position",[120 250 120 30],"String",'Fahrenheit (°F)','FontSize',18);
    F = uicontrol("Style","edit","Position",[240 250 100 30],'FontSize',15);

    % ===== ENTER BUTTON =====
    uicontrol("Style","pushbutton","Position",[195 175 100 40],"String",'ENTER',...
        'FontSize',18,'Callback', @(src,event) temp(C,K,F));

    % ===== RESET BUTTON =====
    uicontrol("Style","pushbutton","Position",[195 120 100 30],"String",'RESET',...
        'FontSize',12,'Callback', @(src,event) reset(C,K,F));

% ================= MAIN CONVERSION FUNCTION ====================
function temp(C,K,F)
    % read values
    c_val = str2double(get(C, 'String'));
    k_val = str2double(get(K, 'String'));
    f_val = str2double(get(F, 'String'));

    % count how many are filled
    num_filled = ~isnan(c_val) + ~isnan(k_val) + ~isnan(f_val);

    % if not exactly 1 is filled, show error and return
    if num_filled ~= 1
        set(C,'string','69');
        set(K,'string','69');
        set(F,'string','69');
        return
    end

    % perform conversions
    if ~isnan(c_val)
        k_val = c_val + 273.15;
        f_val = (c_val * 9/5) + 32;
    elseif ~isnan(k_val)
        c_val = k_val - 273.15;
        f_val = (c_val * 9/5) + 32;
    elseif ~isnan(f_val)
        c_val = (f_val - 32) * 5/9;
        k_val = c_val + 273.15;
    end

    % update text boxes with converted values
    set(C, 'String', num2str(c_val));
    set(K, 'String', num2str(k_val));
    set(F, 'String', num2str(f_val));
end

% ================= RESET FUNCTION ====================
function reset(C,K,F)
    % clear all fields
    set(C, 'String', '');
    set(K, 'String', '');
    set(F, 'String', '');
end
end
