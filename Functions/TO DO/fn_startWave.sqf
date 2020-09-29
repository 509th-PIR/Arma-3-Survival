// decide if special wave

// decide what AI should spawn

// start AI que loop

// spawn AI

// give AI the hit event handlers that add points

// inform pepople the round has started and what kind it is/number

// need to decide on special waves

if (!isServer) exitWith {};

// spawn loot
call BLWK_fnc_spawnLoot;


private _previousWaveNum = missionNamespace getVariable ["BLWK_currentWaveNumber",0];
missionNamespace setVariable ["BLWK_currentWaveNumber", _previousWaveNum + 1];

BLWK_friendly_menClasses
BLWK_friendly_vehicleClasses
BLWK_level1_menClasses
BLWK_level1_vehicleClasses
BLWK_level2_menClasses
BLWK_level2_vehicleClasses
BLWK_level3_menClasses
BLWK_level3_vehicleClasses
BLWK_level4_menClasses
BLWK_level4_vehicleClasses
BLWK_level5_menClasses
BLWK_level5_vehicleClasses

/*
	VEHICLES:
		- any round with above 4 players can have 2 vehicles spawn but less, only one will spawn
		
		- Vehicles will be staggered by at least 120 seconds. So first 1 spawns then the 2nd
		
		- vehicles are seperated into light and heavy cars, and light and heavt armour
		- -	There will be max percentage changces that each of these will be able to spawn
		- - - These spawn rates will be affected by:
		- - - - player count
		- - - - how long its been since a vehicle spawned
		- - Use a weighted array to select what gets spawned
		
		- There will still be a param value to determine when vehicles can spawn
		
		- vehicles can not spawn 2 waves in a row
		
		- There will be a threshold to determine if a vehicle will spwn or not:
		- - so if we wind up at 0 - 0.25 no vehicle spawns
		- - 0.25 - 0.5 small chance
		- - 0.5 - 0.75 Likely
		- - 0.75 - 1 100% you will get a vehicle

		- There will need to be two values to consider
		- - A. How likely is it that ANY vehicle will spawn this round?
		- - B. How likely is it that each TYPE of vehicle wil spawn?
*/
if (!isServer) exitWIth {};

#define BASE_LIKELIHOOD_HEAVY_ARMOUR 0.10
#define BASE_LIKELIHOOD_LIGHT_ARMOUR 0.15
#define BASE_LIKELIHOOD_HEAVY_CAR 0.25
#define BASE_LIKELIHOOD_LIGHT_CAR 0.50

#define BASE_VEHICLE_SPAWN_LIKELIHOOD 0.05
#define ROUNDS_SINCE_MINUS_TWO(TOTAL_ROUNDS_SINCE) TOTAL_ROUNDS_SINCE - 2 

// CIPHER COMMENT: check for max wave upon end wave (the ting that will end the mission)


if (BLWK_currentWaveNumber >= BLWK_vehicleStartWave) then {
	private _howLikelyIsAVehicleToSpawn = 0;
	private _howLikelyIsAVheicleNOTToSpawn = 1 - _howLikelyIsAVehicleToSpawn;

	// The default value for BLWK_roundsSinceVehicleSpawned is 2 rounds because
	/// it will always have been at least two rounds before the BLWK_vehicleStartWave
	private _roundsSinceVehicleSpawned = missionNamespace getVariable ["BLWK_roundsSinceVehicleSpawned",2];
	private _vehicleWillSpawn = selectRandomWeighted [true,_howLikelyIsAVehicleToSpawn,false,_howlikelyIsAVheicleToNotSpawn];

	// wait until it has been at least two rounds to spawn another vehicle
	if (_roundsSinceVehicleSpawned >= 2) then {
		
		// only the rounds after the two will contribute to the LIKELIHOOD percentage (5% per round)
		private _howLikelyIsAVehicleToSpawn = ROUNDS_SINCE_MINUS_TWO(_roundsSinceVehicleSpawned) * BASE_VEHICLE_SPAWN_LIKELIHOOD;

		private _vehcileWillSpawn = selectRandomWeighted [true,_howLikelyIsAVehicleToSpawn,false,1 - _howLikelyIsAVehicleToSpawn];
		if (_vehicleWillSpawn) then {
			missionNamespace setVariable ["BLWK_roundsSinceVehicleSpawned",0];
			/*
				just use base likelihoods in a weighted array to get the type
				they will never change

				also, check see what vehicles are available from the current levels to determine
				what can actually be chosen.
				Do a pushBack of the probability into an array if the vehicle type is available

				Maybe ALL available levels should be used in the array of chances, not just the highest
				level currently. Could also do a mini random check between all of the available types between
				each level and then do one check between the winners of each type
			*/
			private _likelihoodItsHeavyArmour = BASE_LIKELIHOOD_HEAVY_ARMOUR;
			private _likelihoodItsLightArmour = BASE_LIKELIHOOD_LIGHT_ARMOUR;
			private _likelihoodItsHeavyCar = BASE_LIKELIHOOD_HEAVY_CAR;
			private _likelihoodItsLightCar = BASE_LIKELIHOOD_LIGHT_CAR;
			


		};
	};
};


// Cipher Comment: Special wave decsion should be added here

null = remoteExec ["BLWK_fnc_handleWaveAI",BLWK_theAIHandler];

// CIPHER COMMENT: might use a Gvar and waitUntil to have things spawned before the server continues