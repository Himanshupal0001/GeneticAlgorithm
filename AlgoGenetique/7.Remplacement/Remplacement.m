%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   �tape de remplacement
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Parents = Remplacement(choix_prob,GAParameters,ProblemParameters,Enfants,Parents)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = GAParameters.PopSize;
%On r�cup�re les x (choix utilisateur) pires individus des parents
WorstIndividualsOfP = KillTournament(2,Parents,GAParameters);

%-----------------------------------------
%	Parcours de la population
%-----------------------------------------
for i = 1:N
    
    %Parcours des x pires individus
    for j = 1:size(WorstIndividualsOfP,1)
        
        %Si l'�l�ment parcours correspond � un des pires individus, on le remplace par l'enfant
        if WorstIndividualsOfP(j,:) == Parents(i,:)
            Parents(i,:) = Enfants(i,:);
        end
    end
end
    