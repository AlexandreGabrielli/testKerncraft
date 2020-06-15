# HPC TOOL PROJECT : kerncraft

> Auteur : Alexandre Gabrielli

**Introduction** 

L’outils kerncraft a pour d'effectuer une analyse statique d'un code noyau afin de donner un aperçu des goulots d'étranglement du noyaux et mémoire. Il permet de produire et récupérer les donner afin d'appliquer des modèles de performance.

Kerncraft propose donc des modèles d'analyse qui n'exécute pas réellement le code cible, il se base sur une description yaml de l'architecture cible afin de prédire les performances.

**Installation**

Lorsque l'on installe l'outils il nécessite IACA de Intel, pour ce faire un script python iaca_get est fourni malheureusement il n'est plus d'actualité. J'ai donc simplement réécrit rapidement le script en changeant les url de download des version d'IACA nécessaire (on peut voir dans la liste de commit git qu’ils sont en train d'essayer de fixer cella mais leur pipeline ne passe pas encore les tests).



**Modèle donnée utilisé par Kerncraft**

Kerncraft propose trois modèles d'analyse et de prédiction différente : ECM, Roofline et Benchmark. ECM et Roofline n'exécute pas le code à proprement parler tandis que Benchmark oui.

Roofline

Roofline est un modèle qui considéré l'intensité opérationnelle qui représente le nombre d'opérations par octet du trafic mémoire. Ce modèle permet de prédire dans un système donné ce chiffre grâce à des formule. Plus de détail dans la doc officiel.

**Exécution-Cache-Memory Model (ECM)**

Basé sur Roofline se modèle donne plus d'importance à la hiérarchie du cache et introduit d'autre mesure comme les opérations ponctuelles par seconde (FLOP/s) et le cycles par ligne de cache (cy/CL). (plus petite quantité de données transférable entre la mémoire principal et les niveaux de cache). 

**CLI** 

Kerncraft s'utilise principalement en ligne de commande 

kerncraft --machine MACHINE --pmodel PMODEL [-D KEY VALUE] [--verbose] [--asm-block BLOCK] KERNELFILE [KERNELFILE ...]

Ou machine est le chemin vers le yaml de description de la machine

KERNELFILE est le chemin vers le code noyau que l'on veut analyser 

-D permet de passer les paramètres nécessaires au code

PMODEL permet de passer le modèle de performance avec lequel on souhaite analyser le code il en existe plusieurs :

- ECM : combinaison d'ECMData     et d'ECMCPU
- ECMData : ECM avec le sous     modèle d'accès aux données et l'analyse du cache
- ECMCPU : ECM d’Intel (via     IACA)
- Roofline : Roofline "custom"     de Kerncraft
- RooflineIACA : donne le résultat     d'un Roofline Intel avec iaca
- Benchmark

**Utilisation** 

Normalement ont généré la description de notre machine en utilisant likwid_bench_auto et ont rempli les champs manquant (REQUIRED_INFORMATION) mais bien sur ce script ne fonctionne pas. Essayer de débugger deviens très compliquer car on peut qualifier les scripts de "code spaghetti" tellement il est complexe de le lire. Nous allons donc prendre un yaml de description d'architecture et utilisé pour analyser avec les deux modèle ECM et Roofline qui n'exécute pas réellement le code. ici nous nous baserons uniquement sur des yaml fourni.b  

**Conclusion**

Kerncraft est un outil extrêmement intéressant car il combine plusieurs autres outils et en résume les grandes étapes. Il permet grâce à sa description yaml de pouvoir prédire des résultats via une définition de la machine ce qui permet de bonne application comme le choix d'un processeur pour effectuer une opération. Malheureusement le code python (principal langage de Kerncraft) est un code spaghetti est on voit, lorsqu'on regarde les commit du repo git ,que son créateur a énormément de mal à le maintenir. Lorsque l'on veut l'utiliser on se retrouve souvent à devoir débugger des bouts de code ce qui rend son utilisation extrêmement complexe. 

 