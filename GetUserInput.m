%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   R�cup�rer les donn�es utilisateur
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [UserInput, GAParameters] = GetUserInput()

disp('Algorithme g�n�tique');
disp('------------------------------------------------------------');

%-----------------------------------------
%   Choix probl�me
%-----------------------------------------
disp('I - Probl�me � traiter');
UserInput.Probleme = input('     1 = Rosenbrock, 2 = Griewank (valeurs n�gatives)\n     Votre choix : ');
%Test validit�
if (UserInput.Probleme ~= 1 && UserInput.Probleme ~= 2)
    disp('     Choix non valide -> Probl�me 1 = Rosenbrock choisi par d�faut');
    UserInput.Probleme = 1;
end

%-----------------------------------------
%   Param�tres g�n�raux
%-----------------------------------------
disp('II - Param�tres g�n�raux du probl�me');
GAParameters.PopSize = input('     Taille de population (N) : ');
GAParameters.NbGenes = input('     Nombre de g�nes (> 10) : ');
%Test nombre de g�nes (obligatoire car bugs si nombre de g�nes trop petit)
if (GAParameters.NbGenes < 10)
    disp('     Choix non valide -> Nombre de g�nes = 10 (par d�faut)');
    GAParameters.NbGenes = 10;
end
GAParameters.Gmax = input('     Nombre de g�n�rations max (Gmax) : ');
GAParameters.Pc = input('     Probabilit� de croisement Pc (entre 0 et 1) : ');
GAParameters.Pm = input('     Probabilit� de mutation Pm (entre 0 et 1) : ');

%-----------------------------------------
%   Choix crit�re arr�t
%-----------------------------------------
disp('III - Choix du crit�re arr�t');
UserInput.CritereArret = input('     1 = Nb g�n�rations max, 2 = Rapports valeurs de fitness, 3 = Taux changement valeur de fitness\n     Votre choix : ');
%Test validit�
if (UserInput.CritereArret ~= 1 && UserInput.CritereArret ~= 2 && UserInput.CritereArret ~= 3)
    disp('     Choix non valide -> Crit�re arr�t 1 = Gmax choisie par d�faut');
    GAParameters.Gmax = input('     Nombre de g�n�rations max : ');
    UserInput.CritereArret = 1;
end

%-----------------------------------------
%   Choix s�lection
%-----------------------------------------
disp('IV - Choix de la m�thode de s�lection');
UserInput.Selection = input('     1 = RWS, 2 = Kill Tournament, 3 = SUS\n     Votre choix : ');
%Eviter probl�me cas kill tournament
if (UserInput.Selection == 2)
    GAParameters.NbIndividusRemplacer = GAParameters.PopSize;
end
%Test validit�
if (UserInput.Selection ~= 1 && UserInput.Selection ~= 2 && UserInput.Selection ~= 3)
    disp('     Choix non valide -> S�lection 1 = RWS choisie par d�faut');
    UserInput.Selection = 1;
end

%-----------------------------------------
%   Choix Classement
%-----------------------------------------
if (UserInput.Selection == 3)
    disp('Choix de la m�thode de classement pour SUS');
    UserInput.Classement = input('     1 = Lin�aire ((a+i*(b-a)/(N-1))/N), 2 = Lin�aire (q-r*(i-1)), 3 = Non Lin�aire\n     Votre choix : ');
end

%-----------------------------------------
%   Choix Changement d'�chelle
%-----------------------------------------
 disp('V - Choix du changement �chelle');
 UserInput.ChgmtEchelle = input('     1 = Lin�aire, 2 = Troncature Sigma, 3 = Pas de changement �chelle\n     Votre choix : ');
 

%-----------------------------------------
%   Choix croisement
%-----------------------------------------
disp('VI - Choix de la m�thode de croisement');
UserInput.Croisement = input('     1 = SinglePoint, 2 = MultiplePoint, 3 = Uniform, 4 = WholeArithmetic, 5 = LocalArithmetic, 6 = Blend, 7 = SimulatedBinary, 8 = ThreeParent\n     Votre choix : ');
%K-Point Crossover
if (UserInput.Croisement == 2)
    GAParameters.KPointCrossOver = input('     Nombre de points de croisement : ');
    if(GAParameters.KPointCrossOver < 2 || GAParameters.KPointCrossOver > GAParameters.NbGenes-1)
        disp('     Choix non valide -> Nombre de points = 4 par d�faut');
        GAParameters.KPointCrossOver = 4;
    end
end
%Test validit�
if (UserInput.Croisement ~= 1 && UserInput.Croisement ~= 2 && UserInput.Croisement ~= 3 && UserInput.Croisement ~= 4 && UserInput.Croisement ~= 5 && UserInput.Croisement ~= 6 && UserInput.Croisement ~= 7 && UserInput.Croisement ~= 8)
    disp('     Choix non valide -> Croisement 4 = WholeArithmetic choisi par d�faut');
    UserInput.Croisement = 4;
end

%-----------------------------------------
%   Choix mutation
%-----------------------------------------
disp('VII - Choix de la m�thode de mutation');
if (UserInput.Croisement == 1 || UserInput.Croisement == 2 || UserInput.Croisement == 3 || UserInput.Croisement == 8)
    disp('     Mutation 1 = Bit-Flip choisie par d�faut');
    UserInput.Mutation = 1;
else
    UserInput.Mutation = input('     2 = Uniform, 3 = Boundary, 4 = NonUniform, 5 = Normal, 6 = Polynomial\n     Votre choix : ');
    %Test validit�
    if (UserInput.Mutation ~= 2 && UserInput.Mutation ~= 3 && UserInput.Mutation ~= 4 && UserInput.Mutation ~= 5 && UserInput.Mutation ~= 6)
    disp('     Choix non valide -> Mutation 2 = Uniform choisie par d�faut');
    UserInput.Mutation = 2;
    end
end

%-----------------------------------------
%   Choix operateur variation
%-----------------------------------------
disp('VIII - Op�rateur de variation pour assurer la faisabilit�');
UserInput.OperateurVariation = input('     1 = Assigne valeur borne � individu si hors des bornes, 2 = Assigne 2*valBorne-valIndividus � individu si hors des bornes\n     Votre choix : ');
%Test validit�
if (UserInput.OperateurVariation ~= 1 && UserInput.OperateurVariation ~= 2)
    disp('     Choix non valide -> Op�rateur Variation 2 choisi par d�faut');
    UserInput.OperateurVariation = 1;
end
    
        
%-----------------------------------------
%   Choix remplacemement
%-----------------------------------------
disp('IX - D�rouler algorithme avec un remplacement ?');
choix = input('     1 = Oui, 2 = Non\n     Votre choix : ');
switch (choix)
    case 1
        UserInput.Remplacement = true;
        GAParameters.NbIndividusRemplacer = input('     Nb individus � remplacer : ');
    case 2
        UserInput.Remplacement = false;
    otherwise
        UserInput.Remplacement = false;
        disp('     Choix non valide -> Pas de remplacememnt par d�faut');
end

disp('X - Lancement');
disp('------------------------------------------------------------');