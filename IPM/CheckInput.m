function in = CheckInput(in)
% % % % % % % % % % % % % % % % % % % % % % % % % % %
% 
%   OT_IPM: CheckInput
%
%   Checks the input struct and assigns the
%    default values to the empty fields.
%
%   INPUT/OUTPUT
%    in: struct with fields
%   
%   m, n    : size of the problem
%   print   : verbosity (true/false)
%   tol     : IPM tolerance
%   maxit   : IPM max iterations
%   maxcc   : max number of correctors
%   predtol : CG tolerance for predictor direction
%   corrtol : CG tolerance for corrector directions
%   CGmaxit : CG max iterations
%
%   Other technical fields are shown at the bottom 
%    of the script
%
%
%   Filippo Zanetti, 2022
%
% % % % % % % % % % % % % % % % % % % % % % % % % % %


if ~isfield(in,'m')
    error('Missing field m in input struct')
end

if ~isfield(in,'n')
    in.n=in.m;
end

if ~isfield(in,'print')
    in.print=true;
end

if ~isfield(in,'tol')
    in.tol=1e-6;
end

if ~isfield(in,'maxit')
    in.maxit=200;
end

if ~isfield(in,'maxcc')
    in.maxcc=3;
end

if ~isfield(in,'predtol')
    in.predtol=1e-6;
end

if ~isfield(in,'corrtol')
    in.corrtol=1e-3;
end

if ~isfield(in,'CGmaxit')
    in.CGmaxit=1000;
end


%% Other parameters

%starting droptol for ichol
in.droptol=1e-3;

%scaling factor for stepsize
in.rho = 0.995;

%neighbourhood coefficient
in.gamma=0.1;

%fraction for affine scaling direction
in.sigma_aff=0.05;

%initial linear solver
in.method='iterative';

%threshold for heuristic
in.cmax=10;

%parameter for switching solution method
in.varedges = -0.2;


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% END OF FUNCTION CheckInput
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
