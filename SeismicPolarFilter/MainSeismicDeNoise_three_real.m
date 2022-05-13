
clc;
clear all;
% close all;

load('data.mat');
%% Preprocessing: detrending
dat0X=detrend(dat0X);
dat0Y=detrend(dat0Y);
dat0Z=detrend(dat0Z);

%% Calculate the filtered signals in different time windows
dat0Cal = [dat0X dat0Y dat0Z];

[~, ~, ~, ~, ~,~, ~, f1,Pf1, F_new1] = funMainReal(dat0Cal, Fs, {'InvariantWin',0.131,40});% Win length
[~, ~, ~, ~, ~,~, ~, f2,Pf2, F_new2] = funMainReal(dat0Cal, Fs, {'CentralFreWin',0.131});% cyc
[~, ~, ~, ~, ~,~, ~, f3,Pf3, F_new3] = funMainReal(dat0Cal, Fs, {'VariableWin',0.131,8});% cyc


dat0P_f_pX1(:,1) = f1(:,1).* F_new1(:,1);
dat0P_f_pY1(:,1) = f1(:,1).* F_new1(:,2);
dat0P_f_pZ1(:,1) = f1(:,1).* F_new1(:,3);

dat0P_f_pX2(:,1) = f2(:,1).* F_new2(:,1);
dat0P_f_pY2(:,1) = f2(:,1).* F_new2(:,2);
dat0P_f_pZ2(:,1) = f2(:,1).* F_new2(:,3);

dat0P_f_pX3(:,1) = f3(:,1).* F_new3(:,1);
dat0P_f_pY3(:,1) = f3(:,1).* F_new3(:,2);
dat0P_f_pZ3(:,1) = f3(:,1).* F_new3(:,3);


%% Calculate the azimuth and incident angle of the filtered signal
[ang0, Inc0, ~, ~, ~,~, ~, ~,~, ~] = funMainReal(dat0Cal, Fs, {'InvariantWin',0.131,90});
[ang1, Inc1, ~, ~, ~,~, ~, ~,~, ~] = funMainReal([dat0P_f_pX1 dat0P_f_pY1 dat0P_f_pZ1], Fs, {'InvariantWin',0.131,90});
[ang2, Inc2, ~, ~, ~,~, ~, ~,~, ~] = funMainReal([dat0P_f_pX2 dat0P_f_pY2 dat0P_f_pZ2], Fs, {'InvariantWin',0.131,90});
[ang3, Inc3, ~, ~, ~,~, ~, ~,~, ~] = funMainReal([dat0P_f_pX3 dat0P_f_pY3 dat0P_f_pZ3], Fs, {'InvariantWin',0.131,90});

%% Comparison of results

funPlotCompareAziInci(Fs, dat0Z, dat0P_f_pZ1, dat0P_f_pZ2, dat0P_f_pZ3,...
                                    ang0, ang1, ang2, ang3,...
                                    Inc0, Inc1, Inc2, Inc3);
                                
funPlotCompareTF(dat0Z, dat0P_f_pZ1, dat0P_f_pZ2, dat0P_f_pZ3, Fs);

