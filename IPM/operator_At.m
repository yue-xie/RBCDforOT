function w=operator_At(y,m,n)
% % % % % % % % % % % % % % % % % % % % % % % % %
%
%   OT_IPM: operator_At
%
%   Given a m+n vector y=[u;v], computes the
%    vector of all possible sums u_i+v_j, i.e.
%    it applies the transpose of the constraint
%    matrix, A'.
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
w=reshape(u+v',m*n,1);


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% END OF FUNCTION operator_At
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

