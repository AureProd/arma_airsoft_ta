
fn_notifDrapeau =
{
    _cp = _this select 0;
    _value = _this select 1;

    switch (_cp) do
    {
        case "A":
        {
            if(_value == 1) then
            {
                [
                    "Notif_bleu", ["Control Point", "L'équipe bleue a capturé le point de contrôle Alpha."]
                ] call BIS_fnc_showNotification;

                playSound "usobjectivesecure";
            };

            if(_value == -1) then
            {
                [
                    "Notif_rouge", ["Control Point", "L'équipe rouge a capturé le point de contrôle Alpha."]
                ] call BIS_fnc_showNotification;

                playSound "gerpointcaptured";
            }
        };

        case "B":
        {
            if(_value == 1) then
            {
                [
                    "Notif_bleu", ["Control Point", "L'équipe bleue a capturé le point de contrôle Bravo."]
                ] call BIS_fnc_showNotification;

                playSound "usobjectivesecure";
            };

            if(_value == -1) then
            {
                [
                    "Notif_rouge", ["Control Point", "L'équipe rouge a capturé le point de contrôle Bravo."]
                ] call BIS_fnc_showNotification;

                playSound "gerpointcaptured";
            }
        };

        case "C":
        {
            if(_value == 1) then
            {
                [
                    "Notif_bleu", ["Control Point", "L'équipe bleue a capturé le point de contrôle Charlie."]
                ] call BIS_fnc_showNotification;

                playSound "usobjectivesecure";
            };

            if(_value == -1) then
            {
                [
                    "Notif_rouge", ["Control Point", "L'équipe rouge a capturé le point de contrôle Charlie."]
                ] call BIS_fnc_showNotification;

                playSound "gerpointcaptured";
            }
        };
    };
};

_cp = _this select 0;
_value = _this select 1;

switch _cp do
{
	case "A":
	{
		cpAValue = _value;
		publicVariable "cpAValue";

		titleText["250 -C- attribué pour la capture Alpha", "PLAIN DOWN"];
		250 call fn_AddCreditsSound;

		if(side player == west) then
		{
			[cpAValueID, _value] remoteExec ["mission_fnc_setFlagColor"];
			
			couleurA = drapeauBleu_A;
			publicVariable "couleurA";
		}
		else
		{
			[cpAValueID, _value] remoteExec ["mission_fnc_setFlagColor"];

			couleurA = drapeauRouge_A;
			publicVariable "couleurA";
		};
	};

	case "B":
	{
		cpBValue = _value;
		publicVariable "cpBValue";

		titleText["150 -C- attribué pour la capture Bravo", "PLAIN DOWN"];
		150 call fn_AddCreditsSound;

		if(side player == west) then
		{
			[cpBValueID, _value] remoteExec ["mission_fnc_setFlagColor"];

			couleurB = drapeauBleu_B;
			publicVariable "couleurB";
		}
		else
		{
			[cpBValueID, _value] remoteExec ["mission_fnc_setFlagColor"];

			couleurB = drapeauRouge_B;
			publicVariable "couleurB";
		};
	};

	case "C":
	{
		cpCValue = _value;
		publicVariable "cpCValue";

		titleText["150 -C- attribué pour la capture Charlie", "PLAIN DOWN"];
		150 call fn_AddCreditsSound;

		if(side player == west) then
		{
			[cpCValueID, _value] remoteExec ["mission_fnc_setFlagColor"];

			couleurC = drapeauBleu_C;
			publicVariable "couleurC";
		}
		else
		{
			[cpCValueID, _value] remoteExec ["mission_fnc_setFlagColor"];

			couleurC = drapeauRouge_C;
			publicVariable "couleurC";
		};
	};
};

[_cp, _value] remoteExec ["fn_notifDrapeau"];
