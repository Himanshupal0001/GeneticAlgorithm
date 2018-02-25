%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%   Crit�res d'arr�t
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function critereArret = CritereArret(choixUser,G,Gmax,P,Generations)

switch (choixUser)
    
    %Crit�re : Num G�n�ration courante doit �tre inf�rieure � Nb g�n�rations max
    case 1
        if(G <= Gmax)
            critereArret = true;
        else
            critereArret = false;
        end
        
    %Rapport des valeurs de fitness
    case 2
        r = min(P(:,3))/max(P(:,3));
        Seuil = 0.95;
        
        if(r <= Seuil)
            critereArret = true;
        else
            critereArret = false;
        end
   
    %Taux changement valeur de fitness
    case 3
        %Doit au moins faire 3 g�n�rations
        if (G > 3)
            %Fitness moyenne g�n�ration actuelle
            fitG1 = abs(mean(Generations{G,1}(:,3)));
            %Fitness moyenne g�n�ration -1
            fitG2 = abs(mean(Generations{(G-1),1}(:,3)));
            %Fitness moyenne g�n�ration -2
            fitG3 = abs(mean(Generations{(G-2),1}(:,3)));
            %Taux d�finissant les bornes d'acceptation du changemement de la valeur de fitness entre g�n�rations
            tauxFit = fitG1*0.1;

            %Si moyenne de fitness des g�n�rations pr�cedentes proche de la valeur de fitness de la valeur actuelle, on s'arr�te
            if((fitG2 > (fitG1-tauxFit) && fitG2 < (fitG1+tauxFit)) && (fitG3 > (fitG1-tauxFit) && fitG3 < (fitG1+tauxFit)))
                critereArret = false;
            else
                critereArret = true;
            end
        else
            critereArret = true;
        end
end