#include <YSI\y_hooks>

#define 		DIALOG_XE 					(10100)

CMD:xe(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))
	{
	   ShowPlayerDialog(playerid, DIALOG_XE, DIALOG_STYLE_LIST,"He Thong Xe","Mo Nap Xe\nMo Cop Xe\nDeo Day An Toan\nDen Xe\nCua So\nDong Co\nFuel\nTrang Thai","Dong Y","Huy");
	}
	else
	{
	   SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong o tren chiec xe , nen khong the su dung lenh nay.");
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_XE)
	{
		if(response)
		{
			new string[128];
			switch(listitem)
			{
				case 0:
				{
					if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					{
						new vehicleid = GetPlayerVehicleID(playerid);
						if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510 || IsAPlane(vehicleid) || IsABike(vehicleid))
						{
							return SendClientMessageEx(playerid,COLOR_WHITE,"khong the duoc su dung trong chiec xe nay.");
						}
						SetVehicleHood(vehicleid, playerid);
					}
					else if(!IsPlayerInAnyVehicle(playerid))
					{
						new closestcar = GetClosestCar(playerid);
						if(IsPlayerInRangeOfVehicle(playerid, closestcar, 5.0))
						{
							if(GetVehicleModel(closestcar) == 481 || GetVehicleModel(closestcar) == 509 || GetVehicleModel(closestcar) == 510 || IsAPlane(closestcar) || IsABike(closestcar))
							{
								return SendClientMessageEx(playerid,COLOR_WHITE,"khong the duoc su dung trong chiec xe nay.");
							}
							SetVehicleHood(closestcar, playerid);
						}
					}
				}
				case 1:
				{
					if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					{
						new vehicleid = GetPlayerVehicleID(playerid);
						if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510)
						{
							return SendClientMessageEx(playerid,COLOR_WHITE,"Lenh nay khong the duoc su dung trong chiec xe nay.");
						}
						SetVehicleTrunk(vehicleid, playerid);
					}
					else if(!IsPlayerInAnyVehicle(playerid))
					{
						new closestcar = GetClosestCar(playerid);
						if(IsPlayerInRangeOfVehicle(playerid, closestcar, 5.0))
						{
							if(GetVehicleModel(closestcar) == 481 || GetVehicleModel(closestcar) == 509 || GetVehicleModel(closestcar) == 510)
							{
								return SendClientMessageEx(playerid,COLOR_WHITE,"Lenh nay khong the duoc su dung trong chiec xe nay.");
							}
							SetVehicleTrunk(closestcar, playerid);
						}
					}
				}
				case 2:
				{
					return cmd_sb(playerid, "");
				}
				case 3:
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510) return SendClientMessageEx(playerid,COLOR_WHITE,"This command can't be used in this vehicle.");
					SetVehicleLights(vehicleid, playerid);
				}
				case 4:
				{
					if(CrateVehicleLoad[GetPlayerVehicleID(playerid)][vCarWindows])
					{
						CrateVehicleLoad[GetPlayerVehicleID(playerid)][vCarWindows] = 0;
						format(string, sizeof(string), "{FF8000}** {C2A2DA}%s mo kinh chan gio nhin ra ngoai.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
					else {
						CrateVehicleLoad[GetPlayerVehicleID(playerid)][vCarWindows] = 1;
						format(string, sizeof(string), "{FF8000}** {C2A2DA}%s mo kinh chan gio nhin ra ngoai.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
				}
				case 5:
				{
					new engine,lights,alarm,doors,bonnet,boot,objective,vehicleid;
					vehicleid = GetPlayerVehicleID(playerid);
					if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510 || DynVeh[vehicleid] != -1 && DynVehicleInfo[DynVeh[vehicleid]][gv_iType] == 1 && GetVehicleModel(vehicleid) == 592) return SendClientMessageEx(playerid,COLOR_WHITE,"This command can't be used in this vehicle.");
					GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
					if(engine == VEHICLE_PARAMS_ON)
					{
						SetVehicleEngine(vehicleid, playerid);
						format(string, sizeof(string), "{FF8000}** {C2A2DA}%s rut chia khoa ra ngoai va dung dong co xe.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
					else if((engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET))
					{
						if (GetPVarInt(playerid, "Refueling")) return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the no may xe khi dang tiep nhien lieu.");
						format(string, sizeof(string), "{FF8000}** {C2A2DA}%s dua chia khoa vao o va bat dong co xe.", GetPlayerNameEx(playerid));
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						SendClientMessageEx(playerid, COLOR_WHITE, "Dong co xe dang duoc khoi dong, vui long doi trong giay lat..");
						SetTimerEx("SetVehicleEngine", 1000, 0, "dd",  vehicleid, playerid);
					}
				}
				case 6:
				{
					if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					{
						new vehicleid = GetPlayerVehicleID(playerid);
						new engine,lights,alarm,doors,bonnet,boot,objective,enginestatus[4],lightstatus[4];
						GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
						if(!IsRefuelableVehicle(vehicleid)) return SendClientMessageEx(playerid,COLOR_RED,"Chiec xe nay khong can nhien lieu.");
						if(engine != VEHICLE_PARAMS_ON) strcpy(enginestatus, "OFF", 4);
						else strcpy(enginestatus, "ON", 3);
						if(lights != VEHICLE_PARAMS_ON) strcpy(lightstatus, "OFF", 4);
						else strcpy(lightstatus, "ON", 3);

						if (IsVIPcar(vehicleid) || IsAdminSpawnedVehicle(vehicleid) || IsFamedVeh(vehicleid)) format(string, sizeof(string), "Dong co: %s | Den xe: %s | Xang: Unlimited",enginestatus,lightstatus);
						else format(string, sizeof(string), "Dong co: %s | Den xe: %s | Xang: %.1f%s",enginestatus,lightstatus, VehicleFuel[vehicleid], "%");
						SendClientMessageEx(playerid, COLOR_WHITE, string);
					}
				}
				case 7:
				{
					if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					{
						new vehicleid = GetPlayerVehicleID(playerid);
						new engine,lights,alarm,doors,bonnet,boot,objective,enginestatus[4],lightstatus[4];
						GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
						if(!IsRefuelableVehicle(vehicleid)) return SendClientMessageEx(playerid,COLOR_RED,"Chiec xe nay khong can nhien lieu.");
						if(engine != VEHICLE_PARAMS_ON) strcpy(enginestatus, "OFF", 4);
						else strcpy(enginestatus, "ON", 3);
						if(lights != VEHICLE_PARAMS_ON) strcpy(lightstatus, "OFF", 4);
						else strcpy(lightstatus, "ON", 3);
						if (IsVIPcar(vehicleid) || IsAdminSpawnedVehicle(vehicleid) || IsFamedVeh(vehicleid)) format(string, sizeof(string), "Dong co: %s | Den xe: %s | Xang: Unlimited | Windows: %s",enginestatus,lightstatus,(CrateVehicleLoad[GetPlayerVehicleID(playerid)][vCarWindows] == 0) ? ("Up") : ("Down"));
						else format(string, sizeof(string), "Dong co: %s | Den xe: %s | Xang: %.1f percent | Windows: %s",enginestatus,lightstatus, VehicleFuel[vehicleid], (CrateVehicleLoad[GetPlayerVehicleID(playerid)][vCarWindows] == 0) ? ("Up") : ("Down"));
						SendClientMessageEx(playerid, COLOR_WHITE, string);
					}
				}
			}
		}
	}
	return 1;
}
