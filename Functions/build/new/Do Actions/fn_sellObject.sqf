/* ----------------------------------------------------------------------------
Function: BLWK_fnc_sellObject;

Description:
	Sells the selected object, adds the cost of it back into the player's pool

	Executed from ""

Parameters:
	0: _object : <OBJECT> - The object to sell

Returns:
	Nothing

Examples:
    (begin example)

		[myObject] call BLWK_fnc_sellObject;

    (end)

Author:
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
params ["_object"];

if !(isNull attachedTo _object) then {
	detach _object;

	call BLWK_fnc_removePickedUpObjectActions;
};

private _objectType = typeOf _object;
private _playerKillpoints = missionNamespace getVariable ["BLWK_playerKillPoints",0];

private _indexOfType = BLWK_buildableObjects_array findIf {(_x select 2) == _objectType};
private _price = (BLWK_buildableObjects_array select _indexOfType) select 0;

BLWK_playerKillPoints = _playerKillpoints + _price;

deleteVehicle _object;

true