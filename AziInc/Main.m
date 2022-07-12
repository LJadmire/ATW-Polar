clc;
clear all;
close all;

[filename, pathname] = uigetfile({'*.*';'*.sg2';'*.sgy';'*.sac';'*.xls';'*.xlsx'}, 'load seismic data','MultiSelect','on');

if isequal(filename,0)   % Is choosing a file?
    msgbox('Choose no file');
    return;
else
    pathfile=fullfile(pathname, filename);  % Obtaining file path
    if (iscell(filename)) % for Multi sac files reading
        [~,~,exc]=fileparts(pathfile{1,1});
        filenums = size(filename,2);  % for Multi files reading
    else
        [~,~,exc]=fileparts(pathfile);% for Multi files reading
    end
end

switch exc
    case {'.sac','.SAC'}
        for i=1:1:filenums
            fd=fopen(pathfile{i},'rb');
            [a,cn]=fread(fd,70,'float');
            [b,cb]=fread(fd,10,'int32');
            [c,cc]=fread(fd,25,'int32');
            [d,cdd]=fread(fd,5,'int32');
            [e,ce]=fread(fd,24*8,'schar');
            [dat0(:,i),count]=fread(fd,'float');
			fclose(fd);
            dt=a(1);
            t0(:,i)=(0:count-1)*dt;
        end
        Fs=1/a(1);
end


%%
[ang1, vang1] = funMain(dat0, Fs, {'InvariantWin',399});
[ang2, vang2] = funMain(dat0, Fs, {'CentralFreWin'});
[ang3, vang3] = funMain(dat0, Fs, {'VariableWin'});

%%
figure(1)

tms = (0:numel(dat0(:,1))-1)/Fs;xMax = max(tms);

subplot(4,2,1);plot(tms,dat0(:,1),'color','[0.00,0.35,0.67]');xlabel('Time (s)');ylabel('Amplitude');set(gca,'XLim',[0 xMax],'FontSize',13);text(0,5.4e4,'a','FontWeight','bold','FontSize',25);
subplot(4,2,2);plot(tms,dat0(:,3),'color','[0.00,0.35,0.67]');xlabel('Time (s)');ylabel('Amplitude');set(gca,'XLim',[0 xMax],'FontSize',13);text(0,1.4e5,'b','FontWeight','bold','FontSize',25);

subplot(4,2,3);plot(tms,ang1,'color','[0.00,0.35,0.67]');xlabel('Time (s)');ylabel('Azimuth (\circ)');set(gca,'XLim',[0 xMax],'FontSize',13);text(0,370,'c','FontWeight','bold','FontSize',25);
subplot(4,2,4);plot(tms, vang1,'color','[0.00,0.35,0.67]');xlabel('Time (s)');ylabel('Incidence (\circ)');set(gca,'XLim',[0 xMax],'FontSize',13);text(0,170,'d','FontWeight','bold','FontSize',25);

subplot(4,2,5);plot(tms,ang2,'color','[0.00,0.35,0.67]');xlabel('Time (s)');ylabel('Azimuth (\circ)');set(gca,'XLim',[0 xMax],'FontSize',13);text(0,370,'e','FontWeight','bold','FontSize',25);
subplot(4,2,6);plot(tms, vang2,'color','[0.00,0.35,0.67]');xlabel('Time (s)');ylabel('Incidence (\circ)');set(gca,'XLim',[0 xMax],'FontSize',13);text(0,170,'f','FontWeight','bold','FontSize',25);

subplot(4,2,7);plot(tms,ang3,'color','[0.00,0.35,0.67]');xlabel('Time (s)');ylabel('Azimuth (\circ)');set(gca,'XLim',[0 xMax],'FontSize',13);text(0,370,'g','FontWeight','bold','FontSize',25);
subplot(4,2,8);plot(tms, vang3,'color','[0.00,0.35,0.67]');xlabel('Time (s)');ylabel('Incidence (\circ)');set(gca,'XLim',[0 xMax],'FontSize',13);text(0,170,'h','FontWeight','bold','FontSize',25);

