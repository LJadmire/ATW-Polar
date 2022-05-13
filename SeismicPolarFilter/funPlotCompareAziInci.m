function [] = funPlotCompareAziInci(Fs, dat0Z, dat0P_f_pZ1, dat0P_f_pZ2, dat0P_f_pZ3,...
                                    ang0, ang1, ang2, ang3,...
                                    Inc0, Inc1, Inc2, Inc3)

figure;
clf;
gcolorB = [0 0.44 0.74];

dataPlot = dat0Z;


tms = (0:numel(dataPlot)-1)/Fs;timeMax = max(tms);dat0Zmin = min(dataPlot);dat0Zmax = max(dataPlot);
colorb = 'jet';% colorcube jet

fontSize = 15;
%-------------------------------------------------------
StPoint = 858;EndPoint = 1006;

ang0(1:StPoint) = nan;ang0(EndPoint:end) = nan; Inc0(1:StPoint) = nan;Inc0(EndPoint:end) = nan;
ang1(1:StPoint) = nan;ang1(EndPoint:end) = nan; Inc1(1:StPoint) = nan;Inc1(EndPoint:end) = nan; 
ang2(1:StPoint) = nan;ang2(EndPoint:end) = nan; Inc2(1:StPoint) = nan;Inc2(EndPoint:end) = nan; 
ang3(1:StPoint) = nan;ang3(EndPoint:end) = nan; Inc3(1:StPoint) = nan;Inc3(EndPoint:end) = nan; 
%-------------------------------------------------------
subplot(4,3,1);plot(tms, dataPlot,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[dat0Zmin dat0Zmax]);ylabel('Ampl.');text(0,dat0Zmax*0.7,'a-1','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
subplot(4,3,2);plot(tms, ang0,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[0 360]);ylabel('Azi.');text(0,310,'a-2','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
set(gca,'ygrid','on','YTick',[90 180 270]);
subplot(4,3,3);plot(tms, Inc0,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[0 180]);ylabel('Inci.');text(0,155,'a-3','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
set(gca,'ygrid','on','YTick',[60 120]);

subplot(4,3,4);plot(tms, dat0P_f_pZ1,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[dat0Zmin dat0Zmax]);ylabel('Ampl.');text(0,dat0Zmax*0.7,'b-1','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
subplot(4,3,5);plot(tms, ang1,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[0 360]);ylabel('Azi.');text(0,310,'b-2','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
set(gca,'ygrid','on','YTick',[90 180 270]);
subplot(4,3,6);plot(tms, Inc1,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[0 180]);ylabel('Inci.');text(0,155,'b-3','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
set(gca,'ygrid','on','YTick',[60 120]);

subplot(4,3,7);plot(tms, dat0P_f_pZ2,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[dat0Zmin dat0Zmax]);ylabel('Ampl.');text(0,dat0Zmax*0.7,'c-1','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
subplot(4,3,8);plot(tms, ang2,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[0 360]);ylabel('Azi.');text(0,310,'c-2','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
set(gca,'ygrid','on','YTick',[90 180 270]);
subplot(4,3,9);plot(tms, Inc2,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[0 180]);ylabel('Inci.');text(0,155,'c-3','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
set(gca,'ygrid','on','YTick',[60 120]);

subplot(4,3,10);plot(tms, dat0P_f_pZ3,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[dat0Zmin dat0Zmax]);xlabel('Time (s)');ylabel('Ampl.');text(0,dat0Zmax*0.7,'d-1','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
subplot(4,3,11);plot(tms, ang3,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[0 360]);xlabel('Time (s)');ylabel('Azi.');text(0,310,'d-2','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
set(gca,'ygrid','on','YTick',[90 180 270]);
subplot(4,3,12);plot(tms, Inc3,'color',gcolorB);set(gca,'XLim',[0 timeMax],'YLim',[0 180]);xlabel('Time (s)');ylabel('Inci.');text(0,155,'d-3','FontWeight','bold','fontname','Times New Roman','FontSize',fontSize);
set(gca,'ygrid','on','YTick',[60 120]);
end