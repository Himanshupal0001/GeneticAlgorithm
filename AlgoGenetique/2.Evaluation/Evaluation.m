%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   �tape d'�valuation
%
%       Affectation d'une 'qualit�' � chaque
%       individu, une valeur de fitness
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function P = Evaluation(UserInput,GAParameters,Po)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = GAParameters.PopSize;

%Ajout d'une colonne de z�ros qui contiendra les valeurs de fitness
P = [Po zeros(size(Po,1),1)];

%-----------------------------------------
%	Affectation des valeurs de fitness
%-----------------------------------------
for i = 1:N
   
    %Assignation de la valeur de fitness pour chaque individu
    P(i,3) = Probleme(UserInput.Probleme,Po(i,1),Po(i,2));

end

%-----------------------------------------
%	Changement d'�chelle 
%-----------------------------------------
if (UserInput.ChgmtEchelle == 1 || UserInput.ChgmtEchelle == 2)
    P(:,3) = ChangementEchelle(UserInput.ChgmtEchelle,P,N);
end

%-----------------------------------------
%	Probl�mes de minimisation et 
%   de valeurs n�gatives
%-----------------------------------------
if (UserInput.Probleme == 2 && UserInput.Selection == 3)
    P(:,3) = TransfValFitness(P(:,3),N);
end