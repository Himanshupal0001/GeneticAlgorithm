%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Resultats
%
%       Permet l'affichage des r�sultats
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Resultats(Generations,GAParameters,ProblemParameters,choix_prob)

%Init variables
N = GAParameters.PopSize;
Gmax = size(Generations,1);

%R�cup�ration des bornes du probl�mes
x = ProblemParameters.LowerLimit(1,1):ProblemParameters.step:ProblemParameters.UpperLimit(1,1);
y = ProblemParameters.LowerLimit(1,2):ProblemParameters.step:ProblemParameters.UpperLimit(1,2);

%Appel du probl�me
probleme = Probleme(choix_prob,x,y);
[X,Y] = meshgrid(x,y);

%G�n�ration initiale
Po = Generations{1,1};
%G�n�ration finale
Pf = Generations{Gmax,1};

%Params figure
figure('rend','painters','pos',[450 10 1000 600])

%On trace les points correspondant � la g�n�rations initiale et finale
for i = 1:N
    s1 = scatter3(Po(i,1),Po(i,2),Po(i,3),'filled','m'); %G initiale
    sf = scatter3(Pf(i,1),Pf(i,2),Pf(i,3),'b'); %G finale
    hold on
end

%Tra�age de la courbe du probl�me
h = plot3(X,Y,probleme,':');
hold on

%Titres et l�gendes
title('�volution de la population en fonction des g�n�rations');
xlabel('Chromosome x');
ylabel('Chromosome y');
zlabel('Valeur de fitness');
legend('G�n�ration finale','1�re g�n�ration');
hold off