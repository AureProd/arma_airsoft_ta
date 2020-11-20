
if(isServer) then
{
	_flag = _this select 0;
	_val = _this select 1;

	switch (_val) do
	{
		case -1:
		{
			_flag setFlagTexture "\A3\Data_F\Flags\Flag_red_CO.paa";
		};

		case 1:
		{
			_flag setFlagTexture "\A3\Data_F\Flags\Flag_blue_CO.paa";
		};
	};
};