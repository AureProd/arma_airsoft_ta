
_joueur_mort = _this select 0;

if (!isNil "_joueur_mort") then 
{
	_add_action_revive = nil;

	if (player != _joueur_mort) then 
	{
		if (!(_joueur_mort getVariable "revive") && kit_soin_restant != 0) then {
			_add_action_revive = _joueur_mort addAction ["Revive", "(_this select 0) call fn_soigne", [], 1.5, true, true, "", "_this distance _target <= 5 && (side _this) == (side _target) && kit_soin_restant != 0 && !(_this getVariable 'revive') && !beingHit"];
		}
		else
		{
			if (kit_soin_restant == 0) then {
				_add_action_revive = _joueur_mort addAction ["Plus de kits de soins", "", [], 1.5, true, true, "", "_this distance _target <= 5 && (side _this) == (side _target) && !beingHit"]; 
			}
			else
			{
				_add_action_revive = _joueur_mort addAction ["A déjà été revive 1 fois", "", [], 1.5, true, true, "", "_this distance _target <= 5 && (side _this) == (side _target) && !beingHit"]; 
			};
		};
		
	
		[_add_action_revive, _joueur_mort] spawn
		{
			_action = _this select 0;
			_mort = _this select 1;

			//sleep 20;

			waitUntil{!(_mort getVariable ["hit", false])};

			_mort removeAction _action;
		}; 
	};  
};