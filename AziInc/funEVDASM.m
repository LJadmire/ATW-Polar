function [eigValue, eigVector] = funEVDASM(dat0,nWin)
%
%
N = length(dat0(:,1));

eigValue = zeros(N-1,3);
eigVector = {};

for k=1:1:N
    if length(nWin) ~= 1
        [nWinSt, nWinEnd] = funIndex(k,nWin(k),N-1);
    else
        [nWinSt, nWinEnd] = funIndex(k,nWin,N-1);
    end
    
    a = dat0(round(nWinSt):round(nWinEnd), :)';
    a = a'; % Row--->Column
    
    zh = hilbert(a(:,3)); %construct analytic signal
    nh = hilbert(a(:,2));
    eh = hilbert(a(:,1));
    
    aa = [eh,nh,zh];
    
    M = cov(aa);
    [v1, d1]=eig(M);
    
    [d, index] = sort(diag(d1),'descend');
    v = v1(:,index);
    
    eigValue(k,:) = d';
    eigVector{k} = v;
end
end
%--------------------------
function [nWinSt, nWinEnd] = funIndex(k,Win,N)


if Win >= N
     Win = floor(N/2);
end
%------------------right
if k-Win >= 0
    nWinSt = k-Win+1;
    nWinEnd = k;
elseif k<=500
    nWinSt = 1;
    nWinEnd = 500;
else
    nWinSt = 1;
%     nWinEnd = ceil(Win/10);
    nWinEnd = k;
end
%--------------------left
% if N-k < Win
%     nWinSt = N- Win+ 1;
%     nWinEnd = N;
% else
%     nWinSt = k;
%     nWinEnd = k+ Win- 1;
% end
%--------------------mid
% if N-k < Win
%     nWinSt = N- Win+ 1;
%     nWinEnd = N;
% elseif k-Win <= 0
%     nWinSt = 1;
%     nWinEnd = Win;
% else
%     nWinSt = k - floor(Win/2);
%     nWinEnd = k + floor(Win/2);
% end



end
