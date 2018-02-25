%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Probleme
%
%       S�lectionne le probl�me � traiter
%       en fonction du choix utilisateur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function p = Probleme(idProbleme,x,y)

switch idProbleme
    %Fonction de Rosenbrock n�gative
    case 1
        p = Rosenbrock(x,y);
    %Fonction de Griewank
    case 2
        p = Griewank(x,y);
end