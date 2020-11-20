
GroupESP =
{
    if ((side player) == west) then 
    {
        if ((arena select 3) == 2 || (arena select 3) == 1 || (arena select 3) == 4) then 
        {
            if ((arena select 3) == 2) then 
            {
                {
                    if((_x != player) && (side _x == side player)) then
                    {
                        if (_x == VIP) then {
                            _pos = _x modelToWorld(_x selectionPosition "head");
                            
                            drawIcon3D ["iconMan", [1,1,0,0.5],[_pos select 0, _pos select 1, (_pos select 2) + 0.35], 1, 1, 0, name _x, 1, 0.04, "PuristaMedium"];
                        }
                        else
                        {
                            if(player getVariable "hit" && (arena select 3) == 2) then
                            {
                                _pos = _x modelToWorld(_x selectionPosition "head");
                                
                                drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa", [1, 0.6, 0.3, 0.9],[_pos select 0, _pos select 1, (_pos select 2) + 0.35], 1, 1, 0, name _x, 1, 0.04, "PuristaMedium"];
                            }
                            else
                            {
                                _pos = _x modelToWorld(_x selectionPosition "head");
                        
                                drawIcon3D ["iconMan", [0,0,1,0.5],[_pos select 0, _pos select 1, (_pos select 2) + 0.35], 1, 1, 0, name _x, 1, 0.04, "PuristaMedium"];
                            };
                        };
                    };
                } foreach playableUnits;
            } 
            else 
            {
                {
                    if((_x != player) && (side _x == side player)) then
                    {
                        if(player getVariable "hit" && (arena select 3) == 2) then
                        {
                            _pos = _x modelToWorld(_x selectionPosition "head");
                            
                            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa", [1, 0.6, 0.3, 0.9],[_pos select 0, _pos select 1, (_pos select 2) + 0.35], 1, 1, 0, name _x, 1, 0.04, "PuristaMedium"];
                        }
                        else
                        {
                            _pos = _x modelToWorld(_x selectionPosition "head");
                        
                            drawIcon3D ["iconMan", [0,0,1,0.5],[_pos select 0, _pos select 1, (_pos select 2) + 0.35], 1, 1, 0, name _x, 1, 0.04, "PuristaMedium"];
                        };
                    };
                } foreach playableUnits;
            };
        } 
        else 
        {
            {
                if((_x != player) && (side _x == side player)) then
                {
                    _pos = _x modelToWorld(_x selectionPosition "head");
                    
                    drawIcon3D ["iconMan", [0,0,1,0.5],[_pos select 0, _pos select 1, (_pos select 2) + 0.35], 1, 1, 0, name _x, 1, 0.04, "PuristaMedium"];
                };
            } foreach playableUnits;
        };
    } 
    else 
    {
        if ((arena select 3) == 2 || (arena select 3) == 1 || (arena select 3) == 4) then 
        {
            {
                if((_x != player) && (side _x == side player)) then
                {
                    if(player getVariable "hit" && (arena select 3) == 2) then
                    {
                        _pos = _x modelToWorld(_x selectionPosition "head");
                        
                        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa", [1, 0.6, 0.3, 0.9],[_pos select 0, _pos select 1, (_pos select 2) + 0.35], 1, 1, 0, name _x, 1, 0.04, "PuristaMedium"];
                    }
                    else
                    {
                        _pos = _x modelToWorld(_x selectionPosition "head");
                    
                        drawIcon3D ["iconMan", [1,0,0,0.5],[_pos select 0, _pos select 1, (_pos select 2) + 0.35], 1, 1, 0, name _x, 1, 0.04, "PuristaMedium"];
                    };
                };
            } foreach playableUnits;
        } 
        else 
        {
            {
                if((_x != player) && (side _x == side player)) then
                {
                    _pos = _x modelToWorld(_x selectionPosition "head");
                
                    drawIcon3D ["iconMan", [1,0,0,0.5],[_pos select 0, _pos select 1, (_pos select 2) + 0.35], 1, 1, 0, name _x, 1, 0.04, "PuristaMedium"];
                };
            } foreach playableUnits;
        };
    };
};

sleep 43;

LocESP =
{
    switch (arena select 3) do 
    {
        case 1: 
        {
            _Apos = getPos (call compile ((arena select 7) select 0));
            _Bpos = getPos (call compile ((arena select 8) select 0));
            _Cpos = getPos (call compile ((arena select 9) select 0));

            switch (cpAValue) do 
            {
                case 0: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 1, 1, 0.8], _Apos, 1, 1, 0, "Control Point A", 1, 0.035, "PuristaMedium"];
                };
                case -1: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 0, 0, 0.8], _Apos, 1, 1, 0, "Control Point A", 1, 0.035, "PuristaMedium"];
                };
                case 1: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [0, 0, 1, 0.8], _Apos, 1, 1, 0, "Control Point A", 1, 0.035, "PuristaMedium"];
                };
            };

            switch (cpBValue) do 
            {
                case 0: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 1, 1, 0.8], _Bpos, 1, 1, 0, "Control Point B", 1, 0.035, "PuristaMedium"];
                };
                case -1: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 0, 0, 0.8], _Bpos, 1, 1, 0, "Control Point B", 1, 0.035, "PuristaMedium"];
                };
                case 1: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [0, 0, 1, 0.8], _Bpos, 1, 1, 0, "Control Point B", 1, 0.035, "PuristaMedium"];
                };
            };

            switch (cpCValue) do 
            {
                case 0: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 1, 1, 0.8], _Cpos, 1, 1, 0, "Control Point C", 1, 0.035, "PuristaMedium"];
                };
                case -1: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 0, 0, 0.8], _Cpos, 1, 1, 0, "Control Point C", 1, 0.035, "PuristaMedium"];
                };
                case 1: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [0, 0, 1, 0.8], _Cpos, 1, 1, 0, "Control Point C", 1, 0.035, "PuristaMedium"];
                };
            };
        };
        case 3: 
        {
            _Apos = arena select 7;
            _Bpos = arena select 8;
            _Cpos = arena select 9;

            switch (cpAValue) do 
            {
                case 0: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 1, 1, 0.8], _Apos, 1, 1, 0, "Terminal A", 1, 0.035, "PuristaMedium"];
                };
                case -1: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 0, 0, 0.8], _Apos, 1, 1, 0, "Terminal A", 1, 0.035, "PuristaMedium"];
                };
            };

            switch (cpBValue) do 
            {
                case 0: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 1, 1, 0.8], _Bpos, 1, 1, 0, "Terminal B", 1, 0.035, "PuristaMedium"];
                };
                case -1: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 0, 0, 0.8], _Bpos, 1, 1, 0, "Terminal B", 1, 0.035, "PuristaMedium"];
                };
            };

            switch (cpCValue) do 
            {
                case 0: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 1, 1, 0.8], _Cpos, 1, 1, 0, "Terminal C", 1, 0.035, "PuristaMedium"];
                };
                case -1: 
                {
                    drawIcon3D ["\A3\ui_f\data\map\markers\military\warning_CA.paa", [1, 0, 0, 0.8], _Cpos, 1, 1, 0, "Terminal C", 1, 0.035, "PuristaMedium"];
                };
            };
        };
    };
};

PointDraw =
{
    {
        drawIcon3D ["\A3\ui_f\data\map\markers\military\circle_CA.paa", [1, 0.2, 0.1, 0.35], visiblePosition _x, 1, 1, 0, "", 1, 0.035, "PuristaMedium"];
    } foreach PointsTarget;

    {
        drawIcon3D ["\A3\ui_f\data\map\markers\military\circle_CA.paa", [1, 0.2, 0.1, 0.35], _x, 1, 1, 0, "", 1, 0.035, "PuristaMedium"];
    } foreach PointsPos;
};

/*------------------------==Frame Eventhandler that calls above methods==----------------------------*/
FrameEH =
{
    call GroupESP;
    call LocESP;
    call PointDraw;
};

addMissionEventHandler ["Draw3D", {call FrameEH}];