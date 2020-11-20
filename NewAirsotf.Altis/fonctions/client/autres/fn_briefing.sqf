
waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["TA","Tactique Airsoft"];
player createDiarySubject ["Mdj","Mode de jeux dispo"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
player createDiaryRecord [
	"TA",
	[
		"Notre équipe",
			"
			<br/>
			Nos Fondateurs :<br/>
			- Fondateur : Mysterfreez<br/>
			- Développeur : AureProd<br/>
			- Graphiste : Ghis<br/><br/>
			Notre Staff :<br/>
			- Admin : Dracoo<br/>
			- Manageur : Reinhard<br/><br/>
			"
	]
];

player createDiaryRecord [
	"TA",
	[
		"Site & Forums",
			"
			<img image='TA-image\TA-logo\TA - logo15.paa' width='300' height='100'/><br/>
			Communautée Tactique Airsoft : <br/><br/>
			Discord :<br/>
			- https://discord.gg/Aq7vaJH<br/><br/>
			Groupe Steam :<br/>
			- https://steamcommunity.com/groups/tactique-airsoft-arma-3<br/><br/>
			Twitter :<br/>
			- https://twitter.com/3Tactique<br/><br/>
			Site Web : En développement ...<br/><br/>
			Rejoignez-nous !<br/><br/>
			"
	]
];

player createDiaryRecord [
	"Mdj",
	[
		"Mode de jeu : Piratage", 
			"
			<br/>
			Vous êtes deux équipes sur une carte délimitée dans la nuit<br/>
			Cherchez sur la map, il y a des vendeurs pour les 2 équipes<br/><br/>
			L'équipe Blufor doit attaquer 3 terminaux<br/>
			Votre objectif est de pirater les terminaux avec votre désignateur laser<br/>
			Grace à votre souplesse pour sauter et vos lunette de vision nocturne<br/>
			vous devez éviter de vous faire Hit, par l'équipe Redfor<br/>
			vous avez que 30 vies, pour toute l'équipe<br/>
			Vous avez en votre possession un pistolet avec 25 billes pour toute la partie<br/><br/>
			L'équipe Redfor vous avez des billes illimitée, mais vous êtes très lourds<br/>
			Pour voir votre ennemi vous avez une lampe torche et une compétence<br/>
			Votre compétence est un battement de coeur à l'approche de votre ennemi,<br/>
			il s'accélère plus vous vous approchez de votre ennemi<br/>
			Vous devez donc empechez l'ennemi de pirater les terminaux<br/><br/>
			Bon courage Soldat<br/><br/>
			"
	]
];

player createDiaryRecord [
	"Mdj",
	[
		"Escorte du VIP", 
			"
			<br/>
			- Pour les Americains, Proteger le VIP des Allemands<br/>
			- Exfiltrer le VIP, si vous êtes Americains<br/>
			- Tuer le VIP, si vous êtes Allemands<br/><br/>
			Bon courage Soldat<br/><br/>
			"
	]
];

player createDiaryRecord [
	"Mdj",
	[
		"Mode de jeu : Course aux tickets", 
			"
			<br/>
			Vous êtes sur une carte délimitée avec 3 Drapeaux à capturer<br/>
			Chaques camps en les capturant gagnent des crédits,<br/>
			pour des achats de répliques et de billes<br/>
			En capturant un drapeau vous faites baisser les points de l'équipe adverse<br/>
			Votre but est d'arriver à baisser les tickets de l'équipe adverse à 0<br/><br/>
			Bon courage Soldat<br/><br/>
			"
	]
];
	