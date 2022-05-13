function [] = funPlotCompareTF(dat0Z, dat0P_f_pZ1, dat0P_f_pZ2, dat0P_f_pZ3, Fs)

figure;
clf;
gcolorB = [0 0.44 0.74];

dataPlot = dat0Z;

tms = (0:numel(dataPlot)-1)/Fs;timeMax = max(tms);dat0Zmin = min(dataPlot);dat0Zmax = max(dataPlot);
colorb = 'jet';% colorcube jet

labelY = Fs/2-50;
plotY = Fs/2;

TFhightX = [1.71 1.71 2.4 2.4 1.71];TFhightY = [150 245 245 150 150];

%-------------------------------------------------------
subplot(4,2,1);plot(tms, dataPlot,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[dat0Zmin dat0Zmax]);ylabel('Ampl.');text(0,dat0Zmax*0.8,'a','FontWeight','bold','fontname','Times New Roman','FontSize',20);
% hold on;plot([0.31 0.31 0.37 0.37 0.31],[dat0Zmin dat0Zmax dat0Zmax dat0Zmin dat0Zmin],'r');
% hold on;plot([0.39 0.39 0.45 0.45 0.39],[dat0Zmin dat0Zmax dat0Zmax dat0Zmin dat0Zmin],'r');hold off;

subplot(4,2,2);[cfs,tms,frq] = st(dataPlot,0,fix(length(dataPlot)/2),1/Fs,1);imagesc('XData',tms,'YData',frq,'CData',abs(cfs));
colormap(colorb);colorbar;axis tight;%shading flat;set(gca,'YScale','log');
hold on;plot(TFhightX,TFhightY,'r');hold off;
set(gca,'YLim',[0 plotY]);
ylabel('Freq. (Hz)');text(0,labelY,'b','FontWeight','bold','fontname','Times New Roman','FontSize',20,'color',[1 1 1]);
%-------------------------------------------------------
subplot(4,2,3);plot(tms, dat0P_f_pZ1,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[dat0Zmin dat0Zmax]);ylabel('Ampl.');text(0,dat0Zmax*0.8,'c','FontWeight','bold','fontname','Times New Roman','FontSize',20);
% hold on;plot([0.31 0.31 0.37 0.37 0.31],[dat0Zmin dat0Zmax dat0Zmax dat0Zmin dat0Zmin],'r');
% hold on;plot([0.39 0.39 0.45 0.45 0.39],[dat0Zmin dat0Zmax dat0Zmax dat0Zmin dat0Zmin],'r');hold off;

subplot(4,2,4);[cfs,tms,frq] = st(dat0P_f_pZ1,0,fix(length(dataPlot)/2),1/Fs,1);imagesc('XData',tms,'YData',frq,'CData',abs(cfs),'CDataMapping','scaled');
colormap(colorb);colorbar;axis tight;%shading flat;set(gca,'YScale','log');
hold on;plot(TFhightX,TFhightY,'r');hold off;
set(gca,'YLim',[0 plotY]);
ylabel('Freq. (Hz)');text(0,labelY,'d','FontWeight','bold','fontname','Times New Roman','FontSize',20,'color',[1 1 1]);
%-------------------------------------------------------
subplot(4,2,5);plot(tms, dat0P_f_pZ2,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[dat0Zmin dat0Zmax]);ylabel('Ampl.');text(0,dat0Zmax*0.8,'e','FontWeight','bold','fontname','Times New Roman','FontSize',20);
% hold on;plot([0.31 0.31 0.37 0.37 0.31],[dat0Zmin dat0Zmax dat0Zmax dat0Zmin dat0Zmin],'r');
% hold on;plot([0.39 0.39 0.45 0.45 0.39],[dat0Zmin dat0Zmax dat0Zmax dat0Zmin dat0Zmin],'r');hold off;

subplot(4,2,6);[cfs,tms,frq] = st(dat0P_f_pZ2,0,fix(length(dataPlot)/2),1/Fs,1);imagesc('XData',tms,'YData',frq,'CData',abs(cfs),'CDataMapping','scaled');
colormap(colorb);colorbar;axis tight;%shading flat;set(gca,'YScale','log');
hold on;plot(TFhightX,TFhightY,'r');hold off;
set(gca,'YLim',[0 plotY]);
ylabel('Freq. (Hz)');text(0,labelY,'f','FontWeight','bold','fontname','Times New Roman','FontSize',20,'color',[1 1 1]);
%-------------------------------------------------------
subplot(4,2,7);plot(tms, dat0P_f_pZ3,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[dat0Zmin dat0Zmax]);xlabel('Time (s)');ylabel('Ampl.');text(0,dat0Zmax*0.8,'g','FontWeight','bold','fontname','Times New Roman','FontSize',20);
% hold on;plot([0.31 0.31 0.37 0.37 0.31],[dat0Zmin dat0Zmax dat0Zmax dat0Zmin dat0Zmin],'r');
% hold on;plot([0.39 0.39 0.45 0.45 0.39],[dat0Zmin dat0Zmax dat0Zmax dat0Zmin dat0Zmin],'r');hold off;

subplot(4,2,8);[cfs,tms,frq] = st(dat0P_f_pZ3,0,fix(length(dataPlot)/2),1/Fs,1);imagesc('XData',tms,'YData',frq,'CData',abs(cfs),'CDataMapping','scaled');
colormap(colorb);colorbar;axis tight;%shading flat;set(gca,'YScale','log');
hold on;plot(TFhightX,TFhightY,'r');hold off;
set(gca,'YLim',[0 plotY]);
xlabel('Time (s)');ylabel('Freq. (Hz)');text(0,labelY,'h','FontWeight','bold','fontname','Times New Roman','FontSize',20,'color',[1 1 1]);

end
