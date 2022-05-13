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
