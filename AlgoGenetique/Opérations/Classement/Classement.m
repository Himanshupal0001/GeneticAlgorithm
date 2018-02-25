%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Classement
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [pi, P] = Classement(choix_classement,N,P)


switch (choix_classement)
    
    %Classement lin�aire 1
    case 1
        [pi, P] = ClassementLineaire1(N,P);
        
    %Classement lin�aire 2
    case 2
        [pi, P] = ClassementLineaire2(N,P);

    %Classement Non lin�aire
    case 3
        [pi, P] = ClassementNonLineaire(N,P);
end