#include "..\..\Headers\descriptionEXT\GUI\shopGUICommonDefines.hpp"
/* ----------------------------------------------------------------------------
Function: BLWK_fnc_shop_getPartnerControl

Description:
	Finds a partnered control for keeping things like a slider and edit box
	 in sync.

Parameters:
	0: _controlIDC : <CONTROL or NUMBER> - The control or IDC of the control you want the partner of

Returns:
	CONTROL 

Examples:
    (begin example)

		[myControl] call BLWK_fnc_shop_getPartnerControl;

    (end)

Author(s):
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
#define CONTROL(IDC) (findDisplay BLWK_SHOP_IDD) displayCtrl IDC

params [
	["_controlIDC",controlNull,[controlNull,123]]
];

disableSerialization;

if (_controlIDC isEqualType controlNull) then {
	_controlIDC = ctrlIDC _controlIDC;
};

if (_controlIDC isEqualTo BLWK_SHOP_POINTS_WITHDRAW_EDIT_IDC) exitWith {CONTROL(BLWK_SHOP_POINTS_WITHDRAW_SLIDER_IDC)};
if (_controlIDC isEqualTo BLWK_SHOP_POINTS_WITHDRAW_SLIDER_IDC) exitWith {CONTROL(BLWK_SHOP_POINTS_WITHDRAW_EDIT_IDC)};

if (_controlIDC isEqualTo BLWK_SHOP_POINTS_DEPOSIT_SLIDER_IDC) exitWith {CONTROL(BLWK_SHOP_POINTS_DEPOSIT_EDIT_IDC)};
if (_controlIDC isEqualTo BLWK_SHOP_POINTS_DEPOSIT_EDIT_IDC) exitWith {CONTROL(BLWK_SHOP_POINTS_DEPOSIT_SLIDER_IDC)};

["%1 no partner IDC found",_controlIDC] call BIS_fnc_error;

controlNull