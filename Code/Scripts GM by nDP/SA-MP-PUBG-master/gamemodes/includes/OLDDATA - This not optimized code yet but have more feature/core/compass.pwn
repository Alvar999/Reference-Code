//--------------------------------[COMPASS.PWN]--------------------------------
#include <YSI\y_hooks>


new bool:Compass[MAX_PLAYERS char];

hook OnPlayerConnect(playerid) {
	PlayerCompass(playerid, false);
	return 1;
}

Float: GetPlayerCameraFacingAngle(playerid)
{
    new Float: vX, Float: vY;
    if(GetPlayerCameraFrontVector(playerid, vX, vY, Float: playerid))
	{
        if((vX = -atan2(vX, vY)) < 0.0) return vX + 360.0;
        return vX;
    }
    return 0.0;
}

forward UICompassTimer(playerid);
public UICompassTimer(playerid)
{
	if(Compass{playerid}) {
		static const
			step_1 = MAX_UICOMPASS_STEP * 1,
			step_2 = MAX_UICOMPASS_STEP * 2,
			step_3 = MAX_UICOMPASS_STEP * 3;
			
		static
			north,
			result;

		//Get the maximum step of the compass
		result = RoundCompassDirection(GetPlayerCameraFacingAngle(playerid));
		//SetPlayerFacingAngle(playerid, GetPlayerCameraFacingAngle(playerid));

		//Find out what TD will be displayed "N"
		north = CompassHeadingNorth(result);
		
		//Three previous directions
		PlayerTextDrawSetString(playerid, td_uicompass[playerid][0], CreateCompassString(result - step_3));
		PlayerTextDrawSetString(playerid, td_uicompass[playerid][1], CreateCompassString(result - step_2));
		PlayerTextDrawSetString(playerid, td_uicompass[playerid][2], CreateCompassString(result - step_1));

		//The current direction
		PlayerTextDrawSetString(playerid, td_uicompass[playerid][3], CreateCompassString(result));
		
		//Three next directions
		PlayerTextDrawSetString(playerid, td_uicompass[playerid][4], CreateCompassString(result + step_1));
		PlayerTextDrawSetString(playerid, td_uicompass[playerid][5], CreateCompassString(result + step_2));
		PlayerTextDrawSetString(playerid, td_uicompass[playerid][6], CreateCompassString(result + step_3));
		//Print direction which is multiply to the minimum step

		//Installed all the TD the original color
		PlayerTextDrawColor(playerid, td_uicompass[playerid][0], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][0]);
		PlayerTextDrawColor(playerid, td_uicompass[playerid][1], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][1]);
		PlayerTextDrawColor(playerid, td_uicompass[playerid][2], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][2]);
		PlayerTextDrawColor(playerid, td_uicompass[playerid][3], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][3]);
		PlayerTextDrawColor(playerid, td_uicompass[playerid][4], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][4]);
		PlayerTextDrawColor(playerid, td_uicompass[playerid][5], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][5]);
		PlayerTextDrawColor(playerid, td_uicompass[playerid][6], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][6]);

		PlayerTextDrawColor(playerid, td_compass[playerid][0], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_compass[playerid][0]);
		PlayerTextDrawColor(playerid, td_compass[playerid][1], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_compass[playerid][1]);
		PlayerTextDrawColor(playerid, td_compass[playerid][2], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_compass[playerid][2]);
		PlayerTextDrawColor(playerid, td_compass[playerid][3], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_compass[playerid][3]);
		PlayerTextDrawColor(playerid, td_compass[playerid][4], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_compass[playerid][4]);
		PlayerTextDrawColor(playerid, td_compass[playerid][5], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_compass[playerid][5]);
		PlayerTextDrawColor(playerid, td_compass[playerid][6], 0xFFFFFFFF);
		PlayerTextDrawShow(playerid, td_compass[playerid][6]);
		
		//TextDrawShowForPlayer(playerid,td__compass_dir);
		
		//Set the TD yellow color, where it will be displayed "N"
		if (0 <= north < MAX_UICOMPASS_TD)
		{
			PlayerTextDrawColor(playerid, td_uicompass[playerid][north], 0xFFFF00FF);
			PlayerTextDrawShow(playerid, td_uicompass[playerid][north]);
		}
	}
    return 1;
}

stock PlayerCompass(playerid, bool:on) {
	if(on) {
		Compass{playerid} = true;
		PlayerTextDrawShow(playerid, td_uicompass[playerid][0]);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][1]);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][2]);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][3]);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][4]);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][5]);
		PlayerTextDrawShow(playerid, td_uicompass[playerid][6]);
		PlayerTextDrawShow(playerid, td_compass[playerid][0]);
		PlayerTextDrawShow(playerid, td_compass[playerid][1]);
		PlayerTextDrawShow(playerid, td_compass[playerid][2]);
		PlayerTextDrawShow(playerid, td_compass[playerid][3]);
		PlayerTextDrawShow(playerid, td_compass[playerid][4]);
		PlayerTextDrawShow(playerid, td_compass[playerid][5]);
		PlayerTextDrawShow(playerid, td_compass[playerid][6]);
		TextDrawShowForPlayer(playerid,td__compass_dir);
	}
	else {
		Compass{playerid} = false;
		PlayerTextDrawHide(playerid, td_uicompass[playerid][0]);
		PlayerTextDrawHide(playerid, td_uicompass[playerid][1]);
		PlayerTextDrawHide(playerid, td_uicompass[playerid][2]);
		PlayerTextDrawHide(playerid, td_uicompass[playerid][3]);
		PlayerTextDrawHide(playerid, td_uicompass[playerid][4]);
		PlayerTextDrawHide(playerid, td_uicompass[playerid][5]);
		PlayerTextDrawHide(playerid, td_uicompass[playerid][6]);
		PlayerTextDrawHide(playerid, td_compass[playerid][0]);
		PlayerTextDrawHide(playerid, td_compass[playerid][1]);
		PlayerTextDrawHide(playerid, td_compass[playerid][2]);
		PlayerTextDrawHide(playerid, td_compass[playerid][3]);
		PlayerTextDrawHide(playerid, td_compass[playerid][4]);
		PlayerTextDrawHide(playerid, td_compass[playerid][5]);
		PlayerTextDrawHide(playerid, td_compass[playerid][6]);
		TextDrawHideForPlayer(playerid,td__compass_dir);
	}
}