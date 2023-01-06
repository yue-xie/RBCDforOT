function [iter,time,feas,fval,X0,X_k]=Sinkhorn(r,c,epsilon,C,f_opt,maxIter)

%Sinkhorn's algorithm from [Altshuler et al, 2017], Alg.3

% r -- vector of first measure
% c -- vector of second measure

n = size(r,1);

gamma = epsilon/4/log(n); %regularization parameter

A = exp(-C/gamma);
X0 = round_matrix(A,r,c);

k=0;
x = zeros(n,1);
y = zeros(n,1);

feas = norm(r - sum(X0,2)) + norm(c - sum(X0,1)');
fval = trace(C'*X0)-f_opt;
time = 0;
etime = 0;

while k < maxIter
    k = k+1;
    tic
    if mod(k,2) == 1
        x = x + log(r./sum(A,2));
    else
        y = y + log(c./(sum(A,1)'));
    end
    C_new = -C/gamma+x*ones(1,n)+ones(n,1)*y';
    A = exp(C_new);
    etime = etime + toc;
    if mod(k,100) == 0
        X_k = round_matrix(A,r,c);
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