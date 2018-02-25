%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Algorithme g�n�tique
%      
%       Fait appel aux diff�rentes �tapes
%       de l'algorithme g�n�tique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Po = GA(UserInput,ProblemParameters,GAParameters)

%-----------------------------------------
%   Init variables
%-----------------------------------------
Gmax = GAParameters.Gmax;
Generations = [];

%-----------------------------------------
%   Initialisation
%-----------------------------------------
Po = Initialisation(ProblemParameters,GAParameters);
G = 1;

%-----------------------------------------
%   Evaluation de Po
%-----------------------------------------
P = Evaluation(UserInput,GAParameters,Po);

%-----------------------------------------
%   1er test du crit�re d'arr�t
%-----------------------------------------
critereArret = CritereArret(UserInput.CritereArret,G,Gmax,P,Generations);

%-----------------------------------------
% Boucle de g�n�ration des populations
%-----------------------------------------
while (critereArret == true)
    
    %-----------------------------------------
    %   S�lection
    %-----------------------------------------
    MP = Selection(UserInput,P,GAParameters);
    
    %-----------------------------------------
    %   Croisement
    %-----------------------------------------
    Enfants = Croisement(UserInput.Croisement,GAParameters, MP,ProblemParameters);
    
    %-----------------------------------------
    %   Mutation
    %-----------------------------------------
    Mutants = Mutation(UserInput.Mutation,GAParameters,ProblemParameters,Enfants,G);
    
    %-----------------------------------------
    %   Op�rateur de variation pour faisabilit�
    %-----------------------------------------
    P = OperateurVariation(UserInput.OperateurVariation,GAParameters,ProblemParameters,Mutants);
    
    %-----------------------------------------
    %   Evaluation
    %-----------------------------------------
    P = Evaluation(UserInput,GAParameters,P);

    %-----------------------------------------
    %   Remplacement
    %-----------------------------------------
    if UserInput.Remplacement == true
         P = Remplacement(UserInput.Probleme,GAParameters,ProblemParameters,P,MP);
    end

    %-----------------------------------------
    %   Sauvegarde de la g�n�ration
    %-----------------------------------------
    Generations{G,1} = P;
    
    %-----------------------------------------
    %   Test du crit�re d'arr�t
    %-----------------------------------------
    critereArret = CritereArret(UserInput.CritereArret,G,Gmax,P,Generations);
    
    %G�n�ration suivante
    G = G + 1;
end

%Sauvegarde de la g�n�ration dans un fichier
save('generation_data.mat','Generations');
Gmax = G;

%-----------------------------------------
%   R�sultats
%-----------------------------------------
Resultats(Generations,GAParameters,ProblemParameters,UserInput.Probleme);