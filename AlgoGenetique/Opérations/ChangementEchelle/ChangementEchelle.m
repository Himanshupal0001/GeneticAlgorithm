%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Changement d'�chelle 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Fitness = ChangementEchelle(choix_changement,P,N)

switch (choix_changement)
    
    %Changement d'�chelle lin�aire
    case 1
        Fitness = ChEchelleLineaire(P,N);

    %Troncature Sigma
    case 2
        Fitness = TroncatureSigma(P,N);
end