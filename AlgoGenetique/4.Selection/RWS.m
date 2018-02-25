%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Roulette Wheel Selection
%
%       S�lectionne les 'meilleurs' individus
%       et les mets dans le mating pool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MP = RWS(P,GAParameters)

%-----------------------------------------
%   Init variables
%-----------------------------------------
MP = [];
N = GAParameters.PopSize;
k = 0;

%Matrice qui contient les pi
pi =  zeros(N,1);
%Matrice qui contient les pci
pci = zeros(N,1);

%Somme S de toutes les valeurs de fitness de la population
Sf = sum(P(:,3));

%-----------------------------------------
%   Calcul de pi pour chaque individu i de P
%-----------------------------------------
for i = 1:N
   
    %pi = valeur de fitness / somme des valeurs de fitness
    pi(i,1) = P(i,3)/Sf;

end

%-----------------------------------------
%   Calcul de pci pour chaque individu i de P
%-----------------------------------------
for i = 1:N
    
     %pci = somme cumulative des pi
     k = k + pi(i,1);
     pci(i,1) = k;
     
end

%-----------------------------------------
%   Tant que le mating pool est plus petit 
%   que la population initiale
%-----------------------------------------
while (size(abs(MP),1) < N)
    
    %On g�n�re un nombre al�atoire
    r = rand;
    
    %Parcours des individus i de P 
    for i = 1:N
        
        %Borne sup�rieure pour le rand
        PciSup = pci(i,1);
            
        %1er �l�ment
        if (i == 1)
            %Si le rand est inf�rieur � la borne
            if(r < PciSup)
                %On ajoute cet individu au mating pool
                MP = [MP; P(i,:)];
            end

        %Autres �l�ments
        else
            %Borne inf�rieure pour le rand
            PCiInf = pci(i-1,1);

            %Si le rand est entre les 2 bornes
            if(r > PCiInf && r < PciSup)
                %On ajoute cet individu au mating pool
                MP = [MP; P(i,:)];
            end
        end
    end
end