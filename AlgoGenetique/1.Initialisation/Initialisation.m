%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   �tape d'initialisation
%
%       G�n�re des individus al�atoire
%       dans les limites du probl�me
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Po = Initialisation(ProblemParameters,GAParameters)

%-----------------------------------------
%	Init variables
%-----------------------------------------
A = ProblemParameters.LowerLimit;
B = ProblemParameters.UpperLimit;
N = GAParameters.PopSize;
Po = zeros(N,size(A,2));

%-----------------------------------------
%   G�n�ration d'une population al�atoire
%   entre les bornes du probl�me
%-----------------------------------------
for i = 1:size(A,2)
        
    Po(1:N,i) = A(i)+(B(i)-A(i))*rand(N,1);

end