
if (((arena select 3) == 1) || ((arena select 3) == 4)) then 
{
	if (bouteilles_restantes != 0) then 
	{
		bouteilles_restantes = bouteilles_restantes - 1;

		if (urinePourcent < 95) then 
		{
			urinePourcent = urinePourcent + 5;
		} 
		else 
		{
			urinePourcent = 100;
		};

		if (eau <= 70) then 
		{
			eau = eau + 30;
		} 
		else 
		{
			eau = 100;
		};

		titleText [format["Il vous reste %1 bouteilles", bouteilles_restantes], "PLAIN DOWN", 0.25];
	}
	else
	{
		titleText["Vous n'avez plus de bouteilles !", "PLAIN DOWN", 0.25];
		playSound "AddItemFailed";
	};
}
else
{
	titleText["Rien, c'est une erreur !", "PLAIN DOWN", 0.25];
	playSound "AddItemFailed";
};