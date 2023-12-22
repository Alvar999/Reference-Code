

// add duoi stock IsATruckerCar(carid)
stock XeGiaoXang(carid)
{
	for(new v = 0; v < sizeof(GiaoXangVehicles); v++) {
	    if(carid == GiaoXangVehicles[v]) return 1;
	}
	return 0;
}

// add ben duoi public OnPlayerEnterCheckpoint(playerid)
if(GetPVarInt(playerid, "GiaoXang_") == 1)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
	    if(XeGiaoXang(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        //new vehicleid = GetPlayerVehicleID(playerid);
	        new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
			if(engine == VEHICLE_PARAMS_ON) // TAT PHUONG TIEN
			{
				SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
				arr_Engine{vehicleid} = 0;
			}
			//_____________________________________________________________//
			SetPVarInt(playerid, "LayXangTime1", 30);
	        SetTimerEx("LayXang1", 1000, 0, "d", playerid);
	        TogglePlayerControllable(playerid, 0);
	        SendClientMessageEx(playerid, COLOR_GREY, "Ban dang giao xang , vui long doi trong giay lat.");
	        return 1;
        }else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o tren xe van chuyen xang dau.");
    }
    if(GetPVarInt(playerid, "GiaoXang_") == 2)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
	    if(XeGiaoXang(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        //new vehicleid = GetPlayerVehicleID(playerid);
	        new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
			if(engine == VEHICLE_PARAMS_ON) // TAT PHUONG TIEN
			{
				SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
				arr_Engine{vehicleid} = 0;
			}
			//_____________________________________________________________//
			SetPVarInt(playerid, "LayXangTime2", 30);
	        SetTimerEx("LayXang2", 1000, 0, "d", playerid);
	        TogglePlayerControllable(playerid, 0);
	        SendClientMessageEx(playerid, COLOR_GREY, "Ban dang giao xang , vui long doi trong giay lat.");
	        return 1;
        }else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o tren xe van chuyen xang dau.");
    }
    if(GetPVarInt(playerid, "GiaoXang_") == 3)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
	    if(XeGiaoXang(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        //new vehicleid = GetPlayerVehicleID(playerid);
	        new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
			if(engine == VEHICLE_PARAMS_ON) // TAT PHUONG TIEN
			{
				SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
				arr_Engine{vehicleid} = 0;
			}
			//_____________________________________________________________//
			SetPVarInt(playerid, "LayXangTime3", 30);
	        SetTimerEx("LayXang3", 1000, 0, "d", playerid);
	        TogglePlayerControllable(playerid, 0);
	        SendClientMessageEx(playerid, COLOR_GREY, "Ban dang giao xang , vui long doi trong giay lat.");
	        return 1;
        }else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o tren xe van chuyen xang dau.");
    }
    if(GetPVarInt(playerid, "GiaoXang_") == 4)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
	    if(XeGiaoXang(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        //new vehicleid = GetPlayerVehicleID(playerid);
	        new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
			if(engine == VEHICLE_PARAMS_ON) // TAT PHUONG TIEN
			{
				SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
				arr_Engine{vehicleid} = 0;
			}
			//_____________________________________________________________//
			SetPVarInt(playerid, "LayXangTime4", 30);
	        SetTimerEx("LayXang4", 1000, 0, "d", playerid);
	        TogglePlayerControllable(playerid, 0);
	        SendClientMessageEx(playerid, COLOR_GREY, "Ban dang giao xang , vui long doi trong giay lat.");
	        return 1;
        }else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o tren xe van chuyen xang dau.");
    }
    if(GetPVarInt(playerid, "GiaoXang_") == 5)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
	    if(XeGiaoXang(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        //new vehicleid = GetPlayerVehicleID(playerid);
	        new engine,lights,alarm,doors,bonnet,boot,objective;
			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
			if(engine == VEHICLE_PARAMS_ON) // TAT PHUONG TIEN
			{
				SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
				arr_Engine{vehicleid} = 0;
			}
			//_____________________________________________________________//
			SetPVarInt(playerid, "LayXangTime5", 30);
	        SetTimerEx("Layxangs", 1000, 0, "d", playerid);
	        TogglePlayerControllable(playerid, 0);
	        SendClientMessageEx(playerid, COLOR_GREY, "Ban dang giao xang , vui long doi trong giay lat.");
	        return 1;
        }else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o tren xe van chuyen xang dau.");
    }
    if(GetPVarInt(playerid, "GiaoXang_") == 6)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
	    if(XeGiaoXang(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        DisablePlayerCheckpoint(playerid);

	    	SetPVarInt(playerid, "GiaoXang_", 0);
	        DeletePVar(playerid, "GiaoXang_");

	        SendClientMessageEx(playerid, COLOR_GREY, "Ban da giao thanh cong 1,000 lit Xang, bay gio hay quay ve tra xe va nhan tien thuong.");

	        //new vehicleid = GetPlayerVehicleID(playerid);
			SetVehicleToRespawn(vehicleid);

			new money = 9000+random(5000);
	        PlayerInfo[playerid][pCash] += money;

	        PlayerInfo[playerid][pXP] += 50;

	        new string[1280];
	        format(string, sizeof(string), "{C2A2DA}%s , da giao xang thanh cong , va nhan duoc $%d", GetPlayerNameEx(playerid),money);
			ProxDetectorWrap(playerid, string, 92, 30.0, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);

			return 1;
		}else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o tren xe van chuyen xang dau.");
    }


//vehicle

    new GiaoXangVehicles[99]; // add new

	GiaoXangVehicles[0] = AddStaticVehicle(573,-1718.0510,395.5274,7.8299,225.2043,26,4); // VehGiaoXang1
	GiaoXangVehicles[1] = AddStaticVehicle(573,-1715.6063,398.0015,7.8307,224.0618,26,4); // VehGiaoXang2
	GiaoXangVehicles[2] = AddStaticVehicle(573,-1705.7416,407.7031,7.8307,224.0626,26,4); // VehGiaoXang3
	GiaoXangVehicles[3] = AddStaticVehicle(573,-1703.3011,410.1137,7.8301,224.6426,26,4); // VehGiaoXang4
	GiaoXangVehicles[4] = AddStaticVehicle(573,-1700.4552,412.7579,7.8289,225.2939,26,4); // VehGiaoXang5
	GiaoXangVehicles[5] = AddStaticVehicle(573,-1647.7413,444.9285,7.8306,131.3385,26,4); // VehGiaoXang6
	GiaoXangVehicles[6] = AddStaticVehicle(573,-1650.3273,447.6917,7.8305,130.4982,26,4); // VehGiaoXang7
	GiaoXangVehicles[7] = AddStaticVehicle(573,-1652.8760,450.4537,7.8290,132.9852,26,4); // VehGiaoXang8
	GiaoXangVehicles[8] = AddStaticVehicle(573,-1655.5886,453.2897,7.8326,134.2825,26,4); // VehGiaoXang9
	GiaoXangVehicles[9] = AddStaticVehicle(573,-1658.3585,456.0969,7.8345,133.5683,26,4); // VehGiaoXang10

//  add ben tren forward InitiateGamemode();

forward LayXang(playerid);
public LayXang(playerid)
{
    SetPVarInt(playerid, "LayXangTime", GetPVarInt(playerid, "LayXangTime")-1);

    new string[1280];
    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%d giay con lai", GetPVarInt(playerid, "LayXangTime"));
    GameTextForPlayer(playerid, string, 1100, 3);

    if(GetPVarInt(playerid, "LayXangTime") > 0) SetTimerEx("LayXang", 1000, 0, "d", playerid);

    if(GetPVarInt(playerid, "LayXangTime") <= 0)
    {
        DeletePVar(playerid, "LayXangTime");
        DeletePVar(playerid, "LayXang");
        
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        new vehicleid = GetPlayerVehicleID(playerid);
	        if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510) return SendClientMessageEx(playerid,COLOR_WHITE,"KHONG THE KHOI DONG PHUONG TIEN NAY.");
	        new engine;
	    	//GetVehicleParamsEx(vehicleid);
	        if((engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET))
	        {
		        SetTimerEx("SetVehicleEngine", 100, 0, "dd",  vehicleid, playerid);
	        }
	    }

        TogglePlayerControllable(playerid, 1);
		// CHECKPOINT

		SetPlayerCheckpoint(playerid, -2407.1641,976.2516,45.2969, 2);
        SetPVarInt(playerid, "GiaoXang_", 5);
        
        format(string, sizeof(string), "{C2A2DA}%s da lay thanh cong 1,000 lit xang , tu thung chua xang dau", GetPlayerNameEx(playerid));
		ProxDetectorWrap(playerid, string, 92, 30.0, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        SendClientMessageEx(playerid, COLOR_GREY, "Ban hay di sao 1,000 lit xanh , roi quay ve tra xe nhan tien.");
        return 1;
    }
    return 1;
}


forward Layxangs(playerid);
public Layxangs(playerid)
{
    SetPVarInt(playerid, "LayXangTime5", GetPVarInt(playerid, "LayXangTime5")-1);

    new string[1280];
    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%d giay con lai", GetPVarInt(playerid, "LayXangTime5"));
    GameTextForPlayer(playerid, string, 1100, 3);

    if(GetPVarInt(playerid, "LayXangTime5") > 0) SetTimerEx("Layxangs", 1000, 0, "d", playerid);

    if(GetPVarInt(playerid, "LayXangTime5") <= 0)
    {
        DeletePVar(playerid, "LayXangTime5");
        DeletePVar(playerid, "Layxangs");

		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        new vehicleid = GetPlayerVehicleID(playerid);
	        if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510) return SendClientMessageEx(playerid,COLOR_WHITE,"KHONG THE KHOI DONG PHUONG TIEN NAY.");
	        new engine;
	    	//GetVehicleParamsEx(vehicleid);
	        if((engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET))
	        {
		        SetTimerEx("SetVehicleEngine", 100, 0, "dd",  vehicleid, playerid);
	        }
	    }

        DisablePlayerCheckpoint(playerid);
        
        TogglePlayerControllable(playerid, 1);

    	SetPVarInt(playerid, "GiaoXang_", 0);
        DeletePVar(playerid, "GiaoXang_");

        SendClientMessageEx(playerid, COLOR_GREY, "Ban da giao thanh cong 1,000 lit Xang, bay gio hay quay ve tra xe va nhan tien thuong.");

		SetPlayerCheckpoint(playerid, -1707.08, 383.51, 7.17, 2);
        SetPVarInt(playerid, "GiaoXang_", 6);
        return 1;
    }
    return 1;
}

// them vao OnPlayerDisconnect

    SetPVarInt(playerid, "GiaoXang_", 0);
 	DeletePVar(playerid, "GiaoXang_");

// OnPlayerDeath
    SetPVarInt(playerid, "GiaoXang_", 0);
 	DeletePVar(playerid, "GiaoXang_");


// them vao /xoamuctieu
    SetPVarInt(playerid, "GiaoXang_", 0);
 	DeletePVar(playerid, "GiaoXang_");

    SetPVarInt(playerid, "GiaoXang_", 0);
 	DeletePVar(playerid, "GiaoXang_");

//other
    // add tim viec lam
    // add help
CreateDynamic3DTextLabel("Noi lay 'XANG' \nSu dung :  '/layxang'",COLOR_YELLOW,-1702.4624,378.1379,7.1797+0.6,15.0);




// cuoi GM
CMD:layxang(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] == 4 || PlayerInfo[playerid][pJob2] == 4)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(XeGiaoXang(vehicleid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
		    if(IsPlayerInRangeOfPoint(playerid,3.0, -1702.4624,378.1379,7.1797))
	    	{
	    	        //new vehicleid = GetPlayerVehicleID(playerid);
		            new engine,lights,alarm,doors,bonnet,boot,objective;
	    			GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
	    			if(engine == VEHICLE_PARAMS_ON) // TAT PHUONG TIEN
					{
						SetVehicleParamsEx(vehicleid,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
						arr_Engine{vehicleid} = 0;
					}
	    			//_____________________________________________________________//
		    		SetPVarInt(playerid, "LayXangTime", 10);
			        SetTimerEx("LayXang", 1000, 0, "d", playerid);
			        TogglePlayerControllable(playerid, 0);
			        SendClientMessageEx(playerid, COLOR_GREY, "Ban dang lay xang , vui long doi trong giay lat.");
			        return 1;
			        //_____________________________________________________________//
		    }else SendClientMessageEx(playerid, COLOR_GREY, "Ban khong dung o noi '/layxang'.");
	    }else SendClientMessageEx(playerid, COLOR_GREY, "Ban can phai o xe van chuyen xang dau.");
	}else SendClientMessageEx(playerid, COLOR_GREY, "Ban chua nhan cong viec Nguoi Van Chuyen Xang/Dau.");
	return 1;
}