
uriner = true;

if (!boire) then 
{
	[player, "Acts_GetAttention_Loop"] remoteExec ["switchMove", 0];
	animationOn = true;

	playSound "urine";
	titleText["Vous urinez !", "PLAIN DOWN"];
	sleep 7;

	if (!beingHit) then 
	{
		titleFadeOut 1;
		urinePourcent = 0;

		[player, "normal"] remoteExec ["switchMove", 0];
		animationOn = false;
	};
};

uriner = false;