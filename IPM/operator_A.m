function y=operator_A(p,m,n)
% % % % % % % % % % % % % % % % % % % % % % % % %
%
%   OT_IPM: operator_A
%
%   Given a mn vector p, computes the sum of
%    rows and columns of P=vec^-1(p), i.e.
%    it applies the constraint matrix A.
%  
%  
%   Filippo Zanetti, 2022
%
% % % % % % % % % % % % % % % % % % % % % % % % %

P=reshape(p,m,n);
y1=sum(P,2);
y2=sum(P,1);
y=[y1;y2'];


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% END OF FUNCTION operator_A
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
