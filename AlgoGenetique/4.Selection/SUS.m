%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Stochastic Universal sampling
%
%       S�lectionne les 'meilleurs' individus
%       et les mets dans le mating pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MP = SUS(P,GAParameters,choix_classement)

%-----------------------------------------
%   Init variables
%-----------------------------------------
N = GAParameters.PopSize;
pointeur = rand;
MP = [];
somme = 0;

%-----------------------------------------
%   R�cup�ration du classement
%-----------------------------------------
[pi, P] = Classement(choix_classement,N,P);

%-----------------------------------------
%   Fl�che de la roue
%-----------------------------------------
distPointers = sum(pi(:,1))/N; %distance entre les pointeurs
fleche = rand*distPointers; %Offstet du premier pointeur

%-----------------------------------------
%   Parcours et s�lection de la population
%-----------------------------------------
for i = 1:N
    
    somme = somme + pi(i,1);
    
    while somme >= fleche
        MP = [MP; P(i,:)];
        fleche = fleche + distPointers;
    end

end