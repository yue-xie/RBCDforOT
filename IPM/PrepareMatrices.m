function Mat = PrepareMatrices(pred,sred,index,in)
% % % % % % % % % % % % % % % % % % % % % % % % % % %
% 
%   OT_IPM: PrepareMatrices
%
%   Computes the Schur complement, preconditioner or
%    factorization
%
%   INPUT
%   pred    : sparsified primal variable
%   sred    : sparsified dual variable
%   index   : current set of presumed basic variables
%   in      : input struct
%
%   OUTPUT
%   Mat     : struct with fields
%       M,N,V    = blocks of the normal equations
%       S        = Schur complement        
%       Lfactor  = Triangular factor (either full or
%                  incomplete) of S
%       Lfactort = transpose of Lfactor
%       Dfactor  = D factor in ldl factorization
%       perm     = approx min degree permutation
%
%
%
%
%   Filippo Zanetti, 2022
%
% % % % % % % % % % % % % % % % % % % % % % % % % % %

m = in.m;
n = in.n;
q = length(index);

warning('off','all')
T = pred./sred;

%schur complement
vec = sparse([index;m*n],ones(q+1,1),[T;0]);
D = operator_A(vec,m,n);
M = D(1:m);
N = D(m+1:m+n);
[Row,Col] = ind2sub([m n],index);
Row = [Row;m];
Col = [Col;n];
T = [T;0];
V = sparse(Row,Col,T);
S = spdiags(N+1e-8,0,n,n)-V'*(spdiags(M+1e-8,0,m,m)\V);

switch in.method
    
    case 'iterative' 
        Sadd = max(-min(sum(S,2)),min(diag(S))*1e-12);
        Sp = S+Sadd*speye(n);
        L = ichol(Sp,struct('type','ict','droptol',in.droptol));

    case 'direct'
        [L,D,perm] = ldl(S,'vector');
        D = D+1e-12*max(diag(D))*speye(n);
        Mat.Dfactor = D;
        Mat.perm = perm;
end

Mat.M = M;
Mat.N = N;
Mat.S = S;
Mat.V = V;
Mat.Lfactor = L;
Mat.Lfactort = L';

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% END OF FUNCTION PrepareMatrices
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
