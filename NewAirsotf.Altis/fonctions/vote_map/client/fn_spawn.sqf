
[] spawn mission_fnc_config_client;

[] call mission_fnc_setloadout;

// Make player invincble
player allowDamage false;

if(side player == west) then
{
	if((arena select 3) == 3) then
	{
		player setPosATL (selectRandom(arena select 4));
	}
	else 
	{
		player setposATL (arena select 4);
	};
}
else
{
	player setPosATL (arena select 5);
};

[] spawn 
{
	sleep 1;
	player allowDamage true;
};