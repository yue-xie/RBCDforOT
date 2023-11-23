function [dy,iterpcg]=LinearSolver(in,Mat,rhs,tol)
% % % % % % % % % % % % % % % % % % % % % % % % % % %
% 
%   OT_IPM: LinearSolver
%
%   Solves the normal equations linear system with
%    PCG or full factorization
%
%   INPUT
%   in      : input struct, produces using CheckInput
%   Mat     : Mat struct, produced using PrepareMatrices
%   rhs     : right hand side of the linear system
%   tol     : tolerance for CG
%
%   OUTPUT
%   dy      : Newton direction
%   iterpcg : number of cg iterations performed
%
%
%   Filippo Zanetti, 2022
%
% % % % % % % % % % % % % % % % % % % % % % % % % % %

switch in.method
    
    case 'iterative'    
        [dy,iterpcg] = mypcg(@(x)Mat.S*x,rhs,tol,in.CGmaxit,@(x)Mat.Lfactort\(Mat.Lfactor\x));
    
    case 'direct'
        dy = Mat.Lfactort\(Mat.Dfactor\(Mat.Lfactor\rhs(Mat.perm)));
        dy(Mat.perm) = dy;
        iterpcg = 0;
        
end


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% END OF FUNCTION LinearSolver
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    