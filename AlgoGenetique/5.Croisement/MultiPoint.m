%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Multiple Point Crossover
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Enfants = MultiPoint(GAParameters, MPbinary)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = GAParameters.PopSize;
l = GAParameters.NbGenes;
C = GAParameters.NumberOfChromosomes;
pc = GAParameters.Pc;
nbPoint = GAParameters.KPointCrossOver;

Enfants = cell(GAParameters.PopSize,1);
E1 = [];
E2 = [];

segment = nbPoint+1;
randPoint = [];

%-----------------------------------------
%	Parcours des parents 2 par 2
%-----------------------------------------
for i = 1:2:N
    
    %S�lection des couples de parents 
    binP1 = MPbinary{i};
    if(i < N)
        binP2 = MPbinary{i+1};
    else
        binP2 = binP1;
    end
    
    %Points de croisement al�atoire
    while(size(randPoint) ~= nbPoint)
        randPoint = [randPoint ; randi([1, l-1])];
        randPoint = unique(randPoint); %evite les doublons
    end
    
    %Crossover avec probabilit� de croisement pc
    if(rand <= pc)
        for j = 1:C
            for k = 1:segment
                %Premi�re partie du g�ne
                if (k == 1)
                    E1 = [E1 binP1(j,1:randPoint(k))];
                    E2 = [E2 binP2(j,1:randPoint(k))];
                %Derni�re partie du g�ne
                elseif (k == segment)
                    if (mod(segment,2) == 0)
                        E1 = [E1 binP2(j,randPoint(k-1)+1:end)];
                        E2 = [E2 binP1(j,randPoint(k-1)+1:end)];
                    else
                        E1 = [E1 binP1(j,randPoint(k-1)+1:end)];
                        E2 = [E2 binP2(j,randPoint(k-1)+1:end)];
                    end
                %Alternement entre les deux parents
                elseif (mod(k,2) == 0)
                    E1 = [E1 binP2(j,randPoint(k-1)+1:randPoint(k))];
                    E2 = [E2 binP1(j,randPoint(k-1)+1:randPoint(k))];
                else
                    E1 = [E1 binP1(j,randPoint(k-1)+1:randPoint(k))];
                    E2 = [E2 binP2(j,randPoint(k-1)+1:randPoint(k))];
                end
            end
            Enfants{i,1} = [Enfants{i,1} ; E1];
            Enfants{i+1,1} = [Enfants{i+1,1} ; E2];
            E1 = [];
            E2 = [];
        end
    else
        Enfants{i,1} = binP1;
        Enfants{i+1,1} = binP2;
    end
end