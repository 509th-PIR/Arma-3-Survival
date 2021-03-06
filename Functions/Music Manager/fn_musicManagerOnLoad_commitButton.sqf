#include "..\..\Headers\descriptionEXT\GUI\musicManagerCommonDefines.hpp"
/* ----------------------------------------------------------------------------
Function: BLWK_fnc_musicManagerOnLoad_commitButton

Description:
	Adds functionality to the commit button of the Music Manager.

Parameters:
	0: _control : <CONTROL> - The control for the commit button

Returns:
	NOTHING

Examples:
    (begin example)
		[_control] call BLWK_fnc_musicManagerOnLoad_commitButton;
    (end)

Author(s):
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
#define SCRIPT_NAME "BLWK_fnc_musicManagerOnLoad_commitButton"
scriptName SCRIPT_NAME;

params ["_control"];

_control ctrlAddEventHandler ["ButtonClick",{

	if !(GET_PUBLIC_ARRAY_DEFAULT isEqualTo []) then {
		null = remoteExecCall ["BLWK_fnc_musicManager_setPlaylistServer",2];
		hint "Playlist set on server";
	} else {
		hint "You can't commit an empty playlist";
	};

}];