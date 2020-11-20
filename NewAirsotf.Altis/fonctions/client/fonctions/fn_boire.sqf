
boire = true;
    
if (!uriner) then 
{
	[player, "Acts_GetAttention_Loop"] remoteExec ["switchMove", 0];
	animationOn = true;

	playSound "eau";
	titleText["Vous Buvez !", "PLAIN DOWN"];
	sleep 7;
	
	if (!beingHit) then 
	{
		titleFadeOut 1;

		eau = 100;

		if(urinePourcent < 80) then
		{
			urinePourcent = urinePourcent + 20;
		}
		else 
		{
			urinePourcent = 100;
		};

		[player, "normal"] remoteExec ["switchMove", 0];
		animationOn = false;
	};
};

boire = false;