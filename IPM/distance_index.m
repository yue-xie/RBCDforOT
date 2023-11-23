function index = distance_index(C,level)
% % % % % % % % % % % % % % % % % % % % % % % % % % %
% 
%   OT_IPM: distance_index
%
%   Compute initial support based on the elements 
%    of the cost matrix that are larger than level
%
%   INPUT
%   C     : cost matrix
%   level : threshold
%
%   OUTPUT
%   index : vector with the indices of presumed
%           basic variables
%
%
%   Filippo Zanetti, 2022
%
% % % % % % % % % % % % % % % % % % % % % % % % % % %

M = (C<=level);
index = find(M(:));


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% END OF FUNCTION distance_index
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
