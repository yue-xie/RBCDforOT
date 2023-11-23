function w=operator_At_sparse(y,m,n,index)
% % % % % % % % % % % % % % % % % % % % % % % % %
%
%   OT_IPM: operator_At_sparse
%
%   Given a m+n vector y=[u;v], computes the
%    vector of all possible sums u_i+v_j, i.e.
%    it applies the transpose of the constraint
%    matrix, A'. Sparse version
%  
%  
%   Filippo Zanetti, 2022
%
% % % % % % % % % % % % % % % % % % % % % % % % %

if size(y,2)>1
    y=y';
end

u=y(1:m);
v=y(m+1:m+n);


indmod=mod(index,m);
indmod(indmod==0)=m;
indceil=ceil(index/n);
w=u(indmod)+v(indceil);



% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% END OF FUNCTION operator_At_sparse
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
