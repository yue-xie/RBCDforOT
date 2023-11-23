function [x,iter,r,flag]=mypcg(fa,b,tol,itmax,fp)
% % % % % % % % % % % % % % % % % % % % % % % % % % %
% Home made PCG
% 
% INPUT
% fa    = function that applies matrix A
% b     = rhs
% x0    = starting vector
% tol   = tolerance
% itmax = maximum number of iterations
% fp    = function that applies the preconditioner
%
% OUTPUT
% x      = solution
% iter   = number of iterations
% res    = final residual
% flag   = 0: converged within maxit
%          1: not converged
% 
% % % % % % % % % % % % % % % % % % % % % % % % % % %

x0=zeros(length(b),1);
r=b-fa(x0);
r0=norm(r);
z=fp(r);
p=z;
iter=0;
x=x0;
rhon=dot(r,z);
flag=0;

while norm(r)>tol*r0 && iter<itmax
    rho=rhon;
    Ap=fa(p);
    alfa=rho/dot(Ap,p);
    x=x+alfa*p;
    r=r-alfa*Ap;
    z=fp(r);
    rhon=dot(r,z);
    beta=rhon/rho;
    p=z+beta*p;
    iter=iter+1;
end

if iter==itmax && norm(r)>tol*r0
    flag=1;
end

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% END OF FUNCTION mypcg
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
