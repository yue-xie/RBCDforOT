function [iter,time,feas,fval,X0,X_k]=SKstab(r,c,epsilon,C,f_opt,maxIter)

% r -- vector of first measure
% c -- vector of second measure

n = size(r,1);

gamma = epsilon/4/log(n); %regularization parameter
Cinf = max(max(C));
A = -C/Cinf/gamma;
X0 = round_matrix(exp(A),r,c);

k=0;
u = zeros(n,1);

feas = norm(r - sum(X0,2)) + norm(c - sum(X0,1)');
fval = trace(C'*X0)-f_opt;
time = 0;
etime = 0;
logc = log(c);
logr = log(r);

while k < maxIter
    tic
    k = k+1;
    v = logc - logsumexp(A' + ones(n,1)*u');
    u = logr - logsumexp(A + ones(n,1)*v');
    etime = etime + toc;

    % Note that the following step aims to find a feasible solution via
    % a rounding procedure introduced as Algorithm 2 in J. Altschuler, J. Niles-Weed, and P. Rigollet, Near-linear time approximation algorithms for optimal 
    % transport via Sinkhorn iteration, Advances in Neural Information
    % Processing Systems, 30 (2017). 
    % We have excluded the time of the following step from Sinkhorn when
    % comparing with others. It does not affect Sinkhorn's algorithm or convergence at
    % all. It is added only for evaluation purpose.
    if mod(k,100) == 0
        T = exp(A+u*ones(1,n)+ones(n,1)*v');
        X_k = round_matrix(T,r,c);
        feas = [feas;norm(r - sum(X_k,2)) + norm(c - sum(X_k,1)')];
        residual = trace(C'*X_k)-f_opt;
        fval = [fval;residual];
        time = [time;etime];
    end
    if mod(k,1000) == 0
        str = ['k = ',num2str(k),', accuracy = ',num2str(residual)];
        disp(str);
    end
end

iter = k;

end

function rs = logsumexp(M)
[~,n] = size(M);
rmax = max(M,[],2);
rs = rmax + log(sum(exp(M - rmax*ones(1,n)),2));
end