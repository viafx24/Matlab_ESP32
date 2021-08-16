%% Preparing the GUI
% f=figure;
% set(f,'WindowStyle','docked');
close all;


f = figure('Visible','on', 'units', 'normalized');%,'Position',[360,500,450,285]


p = uipanel('Title','Control','FontSize',12,...
             'BackgroundColor','white',...
             'Position',[.02 .02 .20 0.98]);
         
p2 = uipanel('Title','Data','FontSize',12,...
             'BackgroundColor','white',...
             'Position',[.23 .02 .76 0.98]);     
         
         
tg = uitabgroup(p2);
tab1 = uitab(tg,'Title','Dynamic');
tab2 = uitab(tg,'Title','Static');
        
         
         
sp1 = uipanel('Parent',p,'Title','ADS1115','FontSize',12,...
              'Position',[.02 .35 .95 .4]);
sp2 = uipanel('Parent',p,'Title','ESP32','FontSize',12,...
              'Position',[.02 .1 .95 .25]);   
          
sp3 = uipanel('Parent',p,'Title','Main','FontSize',12,...
              'Position',[.02 0.75 .95 .25]);   
          
sp4 = uipanel('Parent',p,'Title','Info','FontSize',12,...
              'Position',[0 0 1 0.1]);             
          
          
          
hrun = uicontrol('Parent',sp3,'String','Run',...
              'Units', 'Normalized','Position',[0.02 0.68 0.95 0.28]);
          
hstop = uicontrol('Parent',sp3,'String','Stop',...
              'Units', 'Normalized','Position',[0.02 0.35 0.95 0.28]);          

hsave = uicontrol('Parent',sp3,'String','Save',...
              'Units', 'Normalized','Position',[0.02 0.02 0.95 0.28]); 
          
          
hCheckBox_A0    = uicontrol('Parent',sp1,'Style','checkbox',...
    'String','A0', 'Units', 'Normalized','Position',[0.01 0.78 0.95 0.1],...
    'Callback',@button_Callback_1);

hCheckBox_A1    = uicontrol('Parent',sp1,'Style','checkbox',...
    'String','A1', 'Units', 'Normalized','Position',[0.01 0.67 0.95 0.1],...
    'Callback',@button_Callback_1);

hCheckBox_A2    = uicontrol('Parent',sp1,'Style','checkbox',...
    'String','A2', 'Units', 'Normalized','Position',[0.01 0.56 0.95 0.1],...
    'Callback',@button_Callback_1);

hCheckBox_A3    = uicontrol('Parent',sp1,'Style','checkbox',...
    'String','A3', 'Units', 'Normalized','Position',[0.01 0.45 0.95 0.1],...
    'Callback',@button_Callback_1);

hCheckBox_A0_A1V    = uicontrol('Parent',sp1,'Style','checkbox',...
    'String','A0-A1(V)', 'Units', 'Normalized','Position',[0.01 0.34 0.95 0.1],...
    'Callback',@button_Callback_1);
hCheckBox_A0_A1mA    = uicontrol('Parent',sp1,'Style','checkbox',...
    'String','A0-A1(mA)', 'Units', 'Normalized','Position',[0.01 0.23 0.95 0.1],...
    'Callback',@button_Callback_1);

hCheckBox_A2_A3V  = uicontrol('Parent',sp1,'Style','checkbox',...
    'String','A2-A3(V)', 'Units', 'Normalized','Position',[0.01 0.12 0.95 0.1],...
    'Callback',@button_Callback_1);

hCheckBox_A2_A3mA    = uicontrol('Parent',sp1,'Style','checkbox',...
    'String','A2-A3(mA)', 'Units', 'Normalized','Position',[0.01 0.01 0.95 0.1],...
    'Callback',@button_Callback_1);


hCheckBox_34    = uicontrol('Parent',sp2,'Style','checkbox',...
    'String','34', 'Units', 'Normalized','Position',[0.01 0.70 0.95 0.2],...
    'Callback',@button_Callback_1);

hCheckBox_35    = uicontrol('Parent',sp2,'Style','checkbox',...
    'String','35', 'Units', 'Normalized','Position',[0.01 0.50 0.95 0.2],...
    'Callback',@button_Callback_1);

hCheckBox_32    = uicontrol('Parent',sp2,'Style','checkbox',...
    'String','32', 'Units', 'Normalized','Position',[0.01 0.30 0.95 0.2],...
    'Callback',@button_Callback_1);

hCheckBox_33    = uicontrol('Parent',sp2,'Style','checkbox',...
    'String','33', 'Units', 'Normalized','Position',[0.01 0.10 0.95 0.2],...
    'Callback',@button_Callback_1);


% 
% hrunacquisition    = uicontrol('Style','pushbutton',...
%     'String','run acquisition','Tag','runbutton','userdata',0,'Position',[100,350,100,75],...
%     'Callback',@button_Callback_2);
% 
% 
%     function button_Callback_2(source,eventdata,handles)
%         
%     
%     
%  %       set(hstopacquisition,'Enable','on');%disable the button 
%  %       set(hrunacquisition,'Enable','off');
%         
%             Data_X=zeros(100,1);
%             Data_Y=zeros(100,1);
%             
%             h=plot(NaN,NaN);
%             
%             for i=1:100
%                 Data_X(i)=i;
%                 Data_Y(i)=randi(100);
%                 h.XData=Data_X(1:i)
%                 h.YData=Data_Y(1:i)
%                 drawnow;
%                 pause(0.5);
%             end
%         
%     end

        
%         set(hdepreciated,'Enable','on');% re-enable the button !!!
%         set(hOK,'Enable','on');
%         set(hdeleted,'Enable','on');
%                
%         set(source,'userdata',1);  

%     function button_Callback_1(source,eventdata,handles)
%     
%     Value = get (handles.cckHDG, 'Value')
% if Value==1
%   Time1 = evalin('base', 'Time')
%   HDG1 = evalin ('base', 'HDG')
%   axes (handles.axes1)
%   p1 = plot (Time1, HDG1)
%   hold on
% elseif Value ==0
%  hold off
% end
%     
%     set(p1,'Visible','off')
%     
%     end
%     
%         set(hstopacquisition,'Enable','off');%disable the button 
%         set(hrunacquisition,'Enable','off');
%         
%         set(hdepreciated,'Enable','on');% re-enable the button !!!
%         set(hOK,'Enable','on');
%         set(hdeleted,'Enable','on');
%                
%         set(source,'userdata',1);   
%         
%     end


% hstopacquisition    = uicontrol('Style','pushbutton',...
%     'String','Stop acquisition','Tag','stopbutton','userdata',0,'Position',[600,350,500,75],...
%     'Callback',@button_Callback_2);
% 
% hOK   = uicontrol('Style','pushbutton',...
%     'String','Transfert to OK folder','Position',[50,225,500,75],...
%     'Callback',@button_Callback_3);
% 
% hshowimage    = uicontrol('Style','pushbutton',...
%     'String','Show Image','Position',[600,225,500,75],...
%     'Callback',@button_Callback_4);
% 
% 
% hdepreciated    = uicontrol('Style','pushbutton',...
%     'String','Transfert to depreciated folder','Position',[50,100,500,75],...
%     'Callback',@button_Callback_5);
% 
% hdeleted    = uicontrol('Style','pushbutton',...
%     'String','Delete Data','Position',[600,100,500,75],...
%     'Callback',@button_Callback_6);




%% callback to stop the previous script

%     function button_Callback_2(source,eventdata,handles)
%         
%         set(hstopacquisition,'Enable','off');%disable the button 
%         set(hrunacquisition,'Enable','off');
%         
%         set(hdepreciated,'Enable','on');% re-enable the button !!!
%         set(hOK,'Enable','on');
%         set(hdeleted,'Enable','on');
%                
%         set(source,'userdata',1);   
%         
%     end
% 
% %% function to transfert data in other directories if they are good and copy it
%     function button_Callback_3(source,eventdata,handles)
%         
%         set(hOK,'Enable','off');
%         set(hdepreciated,'Enable','off');%disable the button to prevent new launch
%         set(hdeleted,'Enable','off');
%         
%         set(hshowimage,'Enable','on'); % enable the show image button
%         
%         %% cut and past in Folder OK if data are good and rename the folder
%         OldPath = fullfile('D:\MATLAB\Data_Sleep\Folder_Acquisition\',Data.FolderName);
%         NewPath = 'D:\MATLAB\Data_Sleep\Folder_OK';
%         movefile(OldPath,NewPath);
%         
%         PreviousName = fullfile('D:\MATLAB\Data_Sleep\Folder_OK\',Data.FolderName);
%         Data.FolderNameOK=[Data.FolderName '_Cam_Acc_50_OK'];
%         NewName = fullfile('D:\MATLAB\Data_Sleep\Folder_OK\',Data.FolderNameOK)
%         status=movefile(PreviousName,NewName);
%         if status==1
%             disp('Data moved to OK folder');
%         else
%             warning('error: data not moved to OK folder');
%         end
% 
%         
%         
%         %% save Data.mat in another directory
%         mkdir('D:\MATLAB\Data_Sleep\Folder_Data_Copie\',Data.FolderNameOK);
%         
%         Source=fullfile('D:\MATLAB\Data_Sleep\Folder_OK\',Data.FolderNameOK,'Data.mat');
%         Destination=fullfile('D:\MATLAB\Data_Sleep\Folder_Data_Copie\',Data.FolderNameOK)
%         
%         status=copyfile(Source,Destination);
%         if status==1
%             disp('Data saved as a copie');
%         else
%             warning('error: data not saved as a copie');
%         end
%     end
% 
% 
% %% function to show the images of the night
%     function button_Callback_4(source,eventdata,handles)
%         
%         figure;
%         set(gcf,'colormap',gray); %uncomment if want grayscale
%         
%         % parameters
%         PathFolder=fullfile('D:\MATLAB\Data_Sleep\Folder_OK\',Data.FolderNameOK);
%         Time=Data.iteration;
%         Pas=12;
%         
%         % loop
%         for i=1:Pas:Time
%             % Name=[Folder 'image_' num2str(i) '.jpeg'];
%             Name=[PathFolder '\Images\image_' num2str(i) '.jpeg'];
%             try
%                 img=imread(Name);
%                 image(img);
%                 Fileinfo=dir(Name);
%                 TimeStamp=text(10,15,Fileinfo.date,'Color','red','FontSize',12);
%                 % TimeStamp2=text(10,20,num2str(Data.Time(i)));
%                 drawnow;
%             catch
%                 warning('Warning: image does not exist; probable error cam');
%             end
%         end
%         
%     end
% 
% %% function to transfert data in depreciated directory if data are not very good
%     function button_Callback_5(source,eventdata,handles)
%         
%         set(hdepreciated,'Enable','off');%disable the button to prevent new launch
%         set(hOK,'Enable','off');
%         set(hshowimage,'Enable','off');
%         set(hdeleted,'Enable','off');
%         
%         %% cut and past in Folder depreciated if data are not very good
%         OldPath = fullfile('D:\MATLAB\Data_Sleep\Folder_Acquisition\',Data.FolderName);
%         NewPath = 'D:\MATLAB\Data_Sleep\Folder_Depreciated\';
%         status=movefile(OldPath,NewPath);
%         
%         if status==1
%            disp('Data moved to depreciated folder');
%         else
%             warning('error: data not moved to depreciated folder');
%         end
%     end
% 
% 
% %% function to delete the folder if acquisition or data have a problem.
%     function button_Callback_6(source,eventdata,handles)
%         
%         set(hdepreciated,'Enable','off');%disable the button to prevent new launch
%         set(hOK,'Enable','off');
%         set(hshowimage,'Enable','off');
%         set(hdeleted,'Enable','off');
%         
%         
%         set(source,'Enable','off');%disable the button to prevent new launch
%         %% cut and past in Folder OK if data are good and rename the folder
%         Path = fullfile('D:\MATLAB\Data_Sleep\Folder_Acquisition\',Data.FolderName);
%         status=rmdir(Path,'s');
%         
%         if status==1
%             disp('Data deleted');
%         else
%             warning('problem: data could not be deleted');
%         end
%     end