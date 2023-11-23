function [index,pred,sred,coladd,colrem]=updateindexred_heuristic(index,redcostred,ind_rc,m,pred,sred,mu)
% % % % % % % % % % % % % % % % % % % % % % % % % % %
% 
%   OT_IPM: Update Index
%
%   Updates basis indexes based on estimated reduced
%    costs and the primal variable.
%   Heuristic version
%
%   INPUT
%   index     : current set of presumed basic variables
%   redcostred: sparsified vector of reduced costs
%   ind_rc    : indices of reduced costs considered
%   m         : size of the problem
%   pred,sred : sparsified primal and dual variables
%   mu        : IPM parameter
%
%   OUTPUT
%   index     : new set of presumed basic variables
%   pred,sred : new primal/dual variables
%   coladd    : number of variables added
%   colrem    : number of columns removed
%
%
%
%   Filippo Zanetti, 2022
%
% % % % % % % % % % % % % % % % % % % % % % % % % % %

indadd = [];
indrem = [];

if ~isempty(ind_rc)
    
    col = length(ind_rc);
    col = min(col,m);
    [~,ind] = mink(redcostred,col);
    indadd = ind_rc(ind);
    
    index = [index;indadd];
    pred = [pred;sqrt(mu)*ones(length(indadd),1)];
    sred = [sred;sqrt(mu)*ones(length(indadd),1)];
    
    [index,ind] = sort(index);
    pred = pred(ind);
    sred = sred(ind);
end

ind_rc = find((pred)<1e-6);
if ~isempty(ind_rc)
    col = length(ind_rc);
    col = min(col,m);
    [~,indrem] = mink(pred(ind_rc),col);
    indrem = ind_rc(indrem);
    
    index(indrem) = [];
    pred(indrem) = [];
    sred(indrem) = [];  
end



coladd=length(indadd);
colrem=length(indrem);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% END OF FUNCTION updateindexred_heuristic
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
