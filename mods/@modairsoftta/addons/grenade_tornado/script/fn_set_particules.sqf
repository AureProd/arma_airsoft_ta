
fn_set_particules = 
{
	private _variableNew = _this;

	sleep 2;

	source = "#particlesource" createVehicle (getPos _variableNew);     
		
	source setParticleCircle [0.01, [0, 0, 0]];     
	source setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];     
	source setParticleParams [     
		["\A3\data_f\Cl_water", 1, 0, 1], "", // Particula     
		"Billboard",  // Tipo de particula     
		1, // Timer     
		4, // Lifetime     
		[0, 0, 0], // Pos       
		[0, 0, 2],  // Move vel     
		1, //rotationvel    
		25, //weight     
		0.1, //volume    
		0, //rubbing     
		[0.05,0.05,0.05], 
		[[0,0,0,0],[0.929,0.996,0.078,1],[0.929,0.996,0.078,1],[0.929,0.996,0.078,1],[0.929,0.996,0.078,1],[0.929,0.996,0.078,1],[0.929,0.996,0.078,1]],      
		[0.005],  // Anim speed     
		0.5,  // randDirPeriod     
		10,  // ranDirIntensity     
		"",  // On timer script     
		"",  // Destroy script     
		_this,  // Follow     
		20,  // Angulo     
		false,  // Bounce     
		5,  // How much bounces on ground     
		[[0.8,0.2,0.2,0]]  // Color emisivo     
	];     
		
	source setDropInterval 0.01;  

	sleep 3; 

	deleteVehicle source;
};

[] spawn
{
	private _variable = nil;

	private _thrownSmokeShell = "Chemlight_green";

	while {true} do 
	{
		if (isNil "_variable") then 
		{
			waituntil
			{
				_smokeShell = (getPos player) nearestObject _thrownSmokeShell;
				(_smokeShell distance player) < 3
			};
		} 
		else 
		{
			waituntil
			{
				_smokeShell = (getPos player) nearestObject _thrownSmokeShell;
				((_smokeShell distance player) < 3) && (_variable != _smokeShell)
			};
		};

		_smokeShell = (getPos player) nearestObject _thrownSmokeShell;
		_variable = _smokeShell;	

		_smokeShell remoteExec ["fn_set_particules", 0];	
	};
};

