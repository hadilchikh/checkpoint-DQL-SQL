SELECT
    e.Nom,
    COUNT(ep.Projet_Num_P) AS Nombre_Projets
FROM GestionEntreprise.dbo.Employes AS e
JOIN GestionEntreprise.dbo.Employes_projet AS ep
    ON e.Num_E = ep.Employe_Num_E
GROUP BY e.Num_E, e.Nom
HAVING COUNT(ep.Projet_Num_P) > 1;

SELECT
    d.Label,
    d.Nom_du_manager,
    p.Titre
FROM GestionEntreprise.dbo.Departement AS d
JOIN GestionEntreprise.dbo.Projet AS p
    ON d.Num_S = p.Departement_Num_S;

SELECT
    e.Nom,
    ep.Role
FROM GestionEntreprise.dbo.Employes AS e
JOIN GestionEntreprise.dbo.Employes_projet AS ep
    ON e.Num_E = ep.Employe_Num_E
JOIN GestionEntreprise.dbo.Projet AS p
    ON ep.Projet_Num_P = p.Num_P
WHERE p.Titre = 'Website Redesign';

SELECT TOP 1 WITH TIES
    d.Label,
    d.Nom_du_manager,
    COUNT(e.Num_E) AS Nombre_Employes
FROM GestionEntreprise.dbo.Departement AS d
LEFT JOIN GestionEntreprise.dbo.Employes AS e
    ON d.Num_S = e.Departement_Num_S
GROUP BY d.Num_S, d.Label, d.Nom_du_manager
ORDER BY COUNT(e.Num_E) DESC;

SELECT
    e.Nom,
    e.Position,
    e.Salary,
    d.Label AS Departement
FROM GestionEntreprise.dbo.Employes AS e
JOIN GestionEntreprise.dbo.Departement AS d
    ON e.Departement_Num_S = d.Num_S
WHERE e.Salary > 60000;

SELECT
    p.Titre,
    COUNT(ep.Employe_Num_E) AS Nombre_Employes
FROM GestionEntreprise.dbo.Projet AS p
LEFT JOIN GestionEntreprise.dbo.Employes_projet AS ep
    ON p.Num_P = ep.Projet_Num_P
GROUP BY p.Num_P, p.Titre;

SELECT
    e.Nom,
    p.Titre,
    ep.Role
FROM GestionEntreprise.dbo.Employes AS e
JOIN GestionEntreprise.dbo.Employes_projet AS ep
    ON e.Num_E = ep.Employe_Num_E
JOIN GestionEntreprise.dbo.Projet AS p
    ON ep.Projet_Num_P = p.Num_P;
    
SELECT
    d.Label,
    d.Nom_du_manager,
    SUM(e.Salary) AS Depense_Totale
FROM GestionEntreprise.dbo.Departement AS d
LEFT JOIN GestionEntreprise.dbo.Employes AS e
    ON d.Num_S = e.Departement_Num_S
GROUP BY d.Num_S, d.Label, d.Nom_du_manager;

