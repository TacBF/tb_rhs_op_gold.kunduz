/*
	fn_mapObjectGreyMarker.sqf: by mad rabbit v06/09/13
	
	Purpose: creates a grey marker on map representative of the 2D dimnesions of a passed object
	Client/Server: runs on all clients but marker commands are local only
	
	Usage:
	
	1) copy this script into the mission directory
	
	2) paste this into the initialization field of the map editor placed object: 
		[this] call compile preprocessFileLineNumbers "fn_mapObjectGreyMarker.sqf";
*/

private ["_object","_objPos","_dimensions","_objName","_markerName","_marker","_markerShape","_markerColour","_markerAlpha","_markerBrush","_markerSize","_markerDir"];

_object = _this select 0;

_objPos = getPos _object;

_dimensions = boundingBox _object; // dimensions of object from 3D model
_objName = str(_object); // convert object name into a string to be used for naming the marker
_markerName = Format ["%1Marker",_objName]; // add the word marker as a suffix to the string created above
_marker = createMarkerLocal [_markerName,_objPos]; // create the marker at the position of the object
_markerShape = _marker setMarkerShapeLocal "RECTANGLE"; // marker shape
_markerColour = _marker setMarkerColorLocal "Default"; // marker colour with default = grey
_markerAlpha = _marker setMarkerAlphaLocal 1; // marker transparency
_markerBrush = _marker setMarkerBrushLocal "Solid"; // marker fill patterm
_markerSize = _marker setMarkerSizeLocal [(_dimensions select 0) select 0, (_dimensions select 0) select 1]; // reshape marker to object dimensions (semi-accurate)
_markerDir = _marker setMarkerDirLocal (getDir _object); // reorientate marker in direction of object