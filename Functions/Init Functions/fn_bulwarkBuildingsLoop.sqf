/* ----------------------------------------------------------------------------
Function: BLWK_fnc_bulwarkBuildingsLoop

Description:
	Makes (terrain) buildings within the selected radius of the Crate indestructable

	Executed from "initServer.sqf"

Parameters:
	NONE

Returns:
	NOTHING

Examples:
    (begin example)

		null = [] spawn BLWK_fnc_bulwarkBuildingsLoop;

    (end)

Author(s):
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
if (!isServer OR {!canSuspend}) exitWith {};

private _invincibleBuildings = [];
// get "houses" within the mission param radius (in 2d space) of The Crate that are terrain objects
private _buildingsCurrentlyNear = nearestTerrainObjects [BLWK_mainCrate,["house"],BLWK_buildingsNearTheCrateAreIndestructable_radius,false,true];
private _buildingsToMakeVulnerable = [];

while {BLWK_buildingsNearTheCrateAreIndestructable_radius > 0} do {
	_buildingsCurrentlyNear = nearestTerrainObjects [BLWK_mainCrate,["house"],BLWK_buildingsNearTheCrateAreIndestructable_radius,false,true];

	if !(_buildingsCurrentlyNear isEqualTo _invincibleBuildings) then {
		// get the buildings no longer in the The Crate's radius
		_buildingsToMakeVulnerable = _invincibleBuildings select {!(_x in _buildingsCurrentlyNear)};
		_buildingsToMakeVulnerable apply {
			_x allowDamage true;
		};
		_buildingsCurrentlyNear apply {
			if (isDamageAllowed _x) then {
				_x allowDamage false;
			};
		};

		_invincibleBuildings = _buildingsCurrentlyNear;
	};

	sleep 5;
};