%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   S�lection par tournoi
%
%       S�lectionne les 'meilleurs' individus
%       et les mets dans le mating pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MP = KillTournament(choix_maxmin,P,GAParameters)

%-----------------------------------------
%   Init variables
%-----------------------------------------
k = 2; %Nb d'individus en comp�tition dans le tournoi (binaire)
MP = [];
NbIndividus = GAParameters.NbIndividusRemplacer;
N = GAParameters.PopSize;

%-----------------------------------------
%   Parcours du nombre d'individus � s�lectionner (N dans le cas g�n�ral)
%-----------------------------------------
for i = 1:NbIndividus

    kj = [];
    
    %G�n�ration de k permutations al�atoires
    for j = 1:k
        kj = [kj; randperm(N)];
    end

    switch(choix_maxmin)
        %Maximisation (on garde les meilleurs)
        case 1
            if P(kj(1,i),3) > P(kj(2,i),3)
                MP(i,:) = P(kj(1,i),:);
            else
                MP(i,:) = P(kj(2,i),:);
            end

        %Minimisation (on garde les pires)
        case 2
            if P(kj(1,i),3) < P(kj(2,i),3)
                MP(i,:) = P(kj(1,i),:);
            else
                MP(i,:) = P(kj(2,i),:);
            end
    end
end