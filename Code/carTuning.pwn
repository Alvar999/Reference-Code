// add define
#define C_ADMIN 0x4169E1FF
#define C_AVISO 0xB22222FF
//

// add new 
new Text:wTuning1[23];
new Text:wTuning2[9];
new Text:wTuning3[6];
new Text:wTuning4[3];
new Text:wTuning5[3];
new Text:roofs[2];
new Text:spoiler[2];
new InviterDoXe[MAX_PLAYERS];
new DoXePrice[MAX_PLAYERS];
//


// tim : else if(strcmp(params, "syringes", true) == 0) {
// add tren no 

		else if(strcmp(params, "doxe", true) == 0)
		{
			if(GetPlayerCash(playerid) >= DoXePrice[playerid])
			{
				new str[1024];
				if(InviterDoXe[playerid] == INVALID_PLAYER_ID) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Nguoi choi khong hop le.");

				format(str, sizeof(str), "{33AA33}[!]{FFFFFF} %s da chap nhan chi phi do xe cua ban voi gia : {ffff00}%s$", GetPlayerNameEx(playerid), number_format(DoXePrice[playerid]));
				SendClientMessageEx(InviterDoXe[playerid], -1, str);
				format(str, sizeof(str), "{33AA33}[!]{FFFFFF} Ban da chap nhan chi phi do xe cua %s voi gia : {ffff00}%s$.", GetPlayerNameEx(InviterDoXe[playerid]), number_format(DoXePrice[playerid]));
				SendClientMessageEx(playerid, -1, str);
				//
				SelectTextDraw(InviterDoXe[playerid],0x708090FF);
				for(new i = 0; i < sizeof(wTuning1); i++) TextDrawShowForPlayer(InviterDoXe[playerid], wTuning1[i]);

				SendClientMessage(InviterDoXe[playerid], C_AVISO, "[Mechanic Central] Ban da bat dau do phuong tien");
				PlayerInfo[playerid][pCash] -= DoXePrice[playerid];
				GivePlayerCash(InviterDoXe[playerid], DoXePrice[playerid]);
				InviterDoXe[playerid] = INVALID_PLAYER_ID;
			}
			else SendClientMessageEx(playerid, COLOR_WHITE, "{B22222}[!] Ban khong du tien de nhan vien do xe");
        }
//


// add o phan OnPlayerClickTextDraw
new wVeiculo = GetPlayerVehicleID(playerid);
	if(clickedid == wTuning1[6]) // X CLOSE
 	{
	    for(new i = 0; i < sizeof(wTuning1); i++) { TextDrawHideForPlayer(playerid, wTuning1[i]); }
	    for(new i = 0; i < sizeof(wTuning2); i++)       { TextDrawHideForPlayer(playerid, wTuning2[i]); }
	    for(new i = 0; i < sizeof(wTuning3); i++) { TextDrawHideForPlayer(playerid, wTuning3[i]); }
	    for(new i = 0; i < sizeof(wTuning4); i++) { TextDrawHideForPlayer(playerid, wTuning4[i]); }
	    for(new i = 0; i < sizeof(wTuning5); i++)       { TextDrawHideForPlayer(playerid, wTuning5[i]); }
	    TextDrawHideForPlayer(playerid,roofs[0]);
	    TextDrawHideForPlayer(playerid,roofs[1]);
	    TextDrawHideForPlayer(playerid,spoiler[0]);
	    TextDrawHideForPlayer(playerid,spoiler[1]);
	    CancelSelectTextDraw(playerid);
  	}
	if(clickedid == wTuning1[7]) //WHEELS
 	{
        for(new i = 14; i < sizeof(wTuning1); i++) { TextDrawHideForPlayer(playerid, wTuning1[i]); }
        for(new i = 0; i < sizeof(wTuning2); i++)       { TextDrawHideForPlayer(playerid, wTuning2[i]); }
        for(new i = 0; i < sizeof(wTuning3); i++) { TextDrawHideForPlayer(playerid, wTuning3[i]); }
        for(new i = 0; i < sizeof(wTuning4); i++) { TextDrawHideForPlayer(playerid, wTuning4[i]); }
        for(new i = 0; i < sizeof(wTuning5); i++)       { TextDrawHideForPlayer(playerid, wTuning5[i]); }

        TextDrawHideForPlayer(playerid,roofs[0]);
        TextDrawHideForPlayer(playerid,roofs[1]);
        TextDrawHideForPlayer(playerid,spoiler[0]);
        TextDrawHideForPlayer(playerid,spoiler[1]);
        for(new i = 0; i < sizeof(wTuning2); i++) { TextDrawShowForPlayer(playerid, wTuning2[i]); }
	}
	if(clickedid == wTuning1[8]) // COLOR
 	{
        for(new i = 14; i < sizeof(wTuning1); i++) { TextDrawHideForPlayer(playerid, wTuning1[i]); }
        for(new i = 0; i < sizeof(wTuning2); i++)   { TextDrawHideForPlayer(playerid, wTuning2[i]); }
        for(new i = 0; i < sizeof(wTuning3); i++) { TextDrawHideForPlayer(playerid, wTuning3[i]); }
        for(new i = 0; i < sizeof(wTuning4); i++) { TextDrawHideForPlayer(playerid, wTuning4[i]); }
        for(new i = 0; i < sizeof(wTuning5); i++) { TextDrawHideForPlayer(playerid, wTuning5[i]); }

        TextDrawHideForPlayer(playerid,roofs[0]);
        TextDrawHideForPlayer(playerid,roofs[1]);
        TextDrawHideForPlayer(playerid,spoiler[0]);
        TextDrawHideForPlayer(playerid,spoiler[1]);
        for(new i = 11; i < sizeof(wTuning1); i++) { TextDrawShowForPlayer(playerid, wTuning1[i]); }
	}
    if(clickedid == wTuning1[9]) // PAINTJOBS
	{
                for(new i = 14; i < sizeof(wTuning1); i++) { TextDrawHideForPlayer(playerid, wTuning1[i]); }
                for(new i = 0; i < sizeof(wTuning2); i++)       { TextDrawHideForPlayer(playerid, wTuning2[i]); }
                for(new i = 0; i < sizeof(wTuning3); i++) { TextDrawHideForPlayer(playerid, wTuning3[i]); }
                for(new i = 0; i < sizeof(wTuning5); i++) { TextDrawHideForPlayer(playerid, wTuning5[i]); }
                TextDrawHideForPlayer(playerid,roofs[0]);
                TextDrawHideForPlayer(playerid,roofs[1]);
                TextDrawHideForPlayer(playerid,spoiler[0]);
                TextDrawHideForPlayer(playerid,spoiler[1]);
                for(new i = 0; i < sizeof(wTuning4); i++) { TextDrawShowForPlayer(playerid, wTuning4[i]); }

	}
	if(clickedid == wTuning1[10]) // NITRO
 	{

                for(new i = 14; i < sizeof(wTuning1); i++) { TextDrawHideForPlayer(playerid, wTuning1[i]); }
                for(new i = 0; i < sizeof(wTuning2); i++)  { TextDrawHideForPlayer(playerid, wTuning2[i]); }
                for(new i = 0; i < sizeof(wTuning3); i++) { TextDrawHideForPlayer(playerid, wTuning3[i]); }
                for(new i = 0; i < sizeof(wTuning4); i++) { TextDrawHideForPlayer(playerid, wTuning4[i]); }
                for(new i = 0; i < sizeof(wTuning5); i++) { TextDrawShowForPlayer(playerid, wTuning5[i]); }
                TextDrawHideForPlayer(playerid,roofs[0]);
                TextDrawHideForPlayer(playerid,roofs[1]);
               // for(new i = 0; i < sizeof(wTuning3); i++) { TextDrawShowForPlayer(playerid, wTuning3[i]); }
                TextDrawHideForPlayer(playerid,spoiler[0]);
                TextDrawHideForPlayer(playerid,spoiler[1]);
	}
	if(clickedid == wTuning1[12]) // HYDRAULICS
 	{
                for(new i = 14; i < sizeof(wTuning1); i++) { TextDrawHideForPlayer(playerid, wTuning1[i]); }
                for(new i = 0; i < sizeof(wTuning2); i++)  { TextDrawHideForPlayer(playerid, wTuning2[i]); }
                for(new i = 0; i < sizeof(wTuning3); i++) { TextDrawHideForPlayer(playerid, wTuning3[i]); }
                for(new i = 0; i < sizeof(wTuning4); i++) { TextDrawHideForPlayer(playerid, wTuning4[i]); }
                TextDrawHideForPlayer(playerid,spoiler[0]);
                TextDrawHideForPlayer(playerid,spoiler[1]);
                for(new i = 0; i < sizeof(wTuning5); i++) { TextDrawHideForPlayer(playerid, wTuning5[i]); }
                TextDrawShowForPlayer(playerid,roofs[0]);
                TextDrawShowForPlayer(playerid,roofs[1]);
	}
	if(clickedid == spoiler[0]) // HYDRAULICS
 	{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
                {
                        AddVehicleComponent(wVeiculo,1138);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
                {
                        AddVehicleComponent(wVeiculo,1146);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
                {
                        AddVehicleComponent(wVeiculo,1049);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 557)
                {
                        AddVehicleComponent(wVeiculo,1058);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 555)
                {
                        AddVehicleComponent(wVeiculo,1158);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
                {
                        AddVehicleComponent(wVeiculo,1163);
                }
    }
	if(clickedid == spoiler[1]) // HYDRAULICS
 	{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
                {
                        AddVehicleComponent(wVeiculo,1139);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
                {
                        AddVehicleComponent(wVeiculo,1147);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
                {
                        AddVehicleComponent(wVeiculo,1050);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 557)
                {
                        AddVehicleComponent(wVeiculo,1060);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 555)
                {
                        AddVehicleComponent(wVeiculo,1162);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
                {
                        AddVehicleComponent(wVeiculo,1164);
                }
	}
	if(clickedid == roofs[0]) // HYDRAULICS
 	{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
                {
                        RemoveVehicleComponent(wVeiculo,1033);
                        AddVehicleComponent(wVeiculo,1032);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
                {
                        RemoveVehicleComponent(wVeiculo,1035);
                        AddVehicleComponent(wVeiculo,1038);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
                {
                        RemoveVehicleComponent(wVeiculo,1053);
                        AddVehicleComponent(wVeiculo,1054);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 557)
                {
                        RemoveVehicleComponent(wVeiculo,1061);
                        AddVehicleComponent(wVeiculo,1055);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 555)
                {
                        RemoveVehicleComponent(wVeiculo,1068);
                        AddVehicleComponent(wVeiculo,1067);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
                {
                        RemoveVehicleComponent(wVeiculo,1091);
                        AddVehicleComponent(wVeiculo,1088);
                }
	}
	if(clickedid == roofs[1]) // HYDRAULICS
 	{
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
                {
                        RemoveVehicleComponent(wVeiculo,1032);
                        AddVehicleComponent(wVeiculo,1033);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 562)
                {
                        RemoveVehicleComponent(wVeiculo,1038);
                        AddVehicleComponent(wVeiculo,1035);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 561)
                {
                        RemoveVehicleComponent(wVeiculo,1054);
                        AddVehicleComponent(wVeiculo,1053);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 557)
                {
                        RemoveVehicleComponent(wVeiculo,1055);
                        AddVehicleComponent(wVeiculo,1061);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 555)
                {
                        RemoveVehicleComponent(wVeiculo,1067);
                        AddVehicleComponent(wVeiculo,1068);
                }
                if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 558)
                {
                        RemoveVehicleComponent(wVeiculo,1088);
                        AddVehicleComponent(wVeiculo,1091);
                }
	}
	if(clickedid == wTuning1[11]) //NEON
 	{

                for(new i = 14; i < sizeof(wTuning1); i++) { TextDrawHideForPlayer(playerid, wTuning1[i]); }
                for(new i = 0; i < sizeof(wTuning2); i++)       { TextDrawHideForPlayer(playerid, wTuning2[i]); }
                for(new i = 0; i < sizeof(wTuning4); i++) { TextDrawHideForPlayer(playerid, wTuning4[i]); }
                for(new i = 0; i < sizeof(wTuning5); i++) { TextDrawHideForPlayer(playerid, wTuning5[i]); }
                TextDrawHideForPlayer(playerid,roofs[0]);
                TextDrawHideForPlayer(playerid,roofs[1]);
                TextDrawShowForPlayer(playerid,spoiler[0]);
                TextDrawShowForPlayer(playerid,spoiler[1]);
	}
	foreach(new d: Player)
	{
	    for(new i = 0; i < MAX_PLAYERVEHICLES; ++i)
	 	{
	 		if(PlayerVehicleInfo[d][i][pvId] == wVeiculo)
	 		{
		        if(clickedid == wTuning2[0]){ // SHADOW
		            AddVehicleComponent(wVeiculo,1073);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning2[1]){ // MEGA
		            AddVehicleComponent(wVeiculo, 1074);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning2[2]){  // RINSHIME
		            AddVehicleComponent(wVeiculo,1075);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning2[3]){ // WIRES
		            AddVehicleComponent(wVeiculo,1076);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning2[4]){ // CLASSIC
		            AddVehicleComponent(wVeiculo,1077);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning2[5]){ // TWIST
		            AddVehicleComponent(wVeiculo,1078);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning2[6]){ // CUTTER
		            AddVehicleComponent(wVeiculo,1079);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning2[7]){ // DOLLAR
		            AddVehicleComponent(wVeiculo,1083);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning2[8]){ // ATOMIC
		            AddVehicleComponent(wVeiculo,1085);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }

		        if(clickedid == wTuning1[14]){ // BLACK
                    PlayerVehicleInfo[d][i][pvColor1] = 0, PlayerVehicleInfo[d][i][pvColor2] = 0;
		            ChangeVehicleColor(wVeiculo, 0, 0);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning1[15]){ // WHITE
		        	PlayerVehicleInfo[d][i][pvColor1] = 1, PlayerVehicleInfo[d][i][pvColor2] = 1;
		            ChangeVehicleColor(wVeiculo, 1, 1);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning1[16]){ // GREEN
		        	PlayerVehicleInfo[d][i][pvColor1] = 128, PlayerVehicleInfo[d][i][pvColor2] = 128;
		            ChangeVehicleColor(wVeiculo, 128, 128);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning1[17]){ // CYAN
                	PlayerVehicleInfo[d][i][pvColor1] = 135, PlayerVehicleInfo[d][i][pvColor2] = 135;
		            ChangeVehicleColor(wVeiculo, 135, 135);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning1[18]){ // BLUE
                    PlayerVehicleInfo[d][i][pvColor1] = 152, PlayerVehicleInfo[d][i][pvColor2] = 152;
		            ChangeVehicleColor(wVeiculo, 152, 152);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning1[19]){ // YELLOW
                    PlayerVehicleInfo[d][i][pvColor1] = 6, PlayerVehicleInfo[d][i][pvColor2] = 6;
		            ChangeVehicleColor(wVeiculo, 6, 6);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning1[20]){ // GRAY
                    PlayerVehicleInfo[d][i][pvColor1] = 252, PlayerVehicleInfo[d][i][pvColor2] = 252;
		            ChangeVehicleColor(wVeiculo, 252, 252);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning1[21]){ // PINK
                    PlayerVehicleInfo[d][i][pvColor1] = 146, PlayerVehicleInfo[d][i][pvColor2] = 146;
		            ChangeVehicleColor(wVeiculo, 146, 146);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning1[22]){ // ORANGE
                    PlayerVehicleInfo[d][i][pvColor1] = 219, PlayerVehicleInfo[d][i][pvColor2] = 219;
		            ChangeVehicleColor(wVeiculo, 219, 219);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning4[0]){ // PAINTJOBS 1
		        	PlayerVehicleInfo[d][i][pvPaintJob] = 0;
		            ChangeVehiclePaintjob(wVeiculo, 0);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning4[1]){ // PAINTJOBS 2
                    PlayerVehicleInfo[d][i][pvPaintJob] = 2;
		            ChangeVehiclePaintjob(wVeiculo, 2);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning4[2]){ // PAINTJOBS 2
                    PlayerVehicleInfo[d][i][pvPaintJob] = 3;
		            ChangeVehiclePaintjob(wVeiculo, 3);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning5[0]){ // NITRO 1
		            AddVehicleComponent(wVeiculo,1009);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning5[1]){ // NITRO 2
		            AddVehicleComponent(wVeiculo,1008);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
		        if(clickedid == wTuning5[2]){ // NITRO 3
		            AddVehicleComponent(wVeiculo,1010);
		            g_mysql_SaveVehicle(playerid, i);
		            return 1;
		        }
			}
		}
	}
    if(clickedid == wTuning3[0])
    {
         SetPVarInt(playerid, "neon", 1);
         SetPVarInt(playerid, "blue", CreateObject(18648,0,0,0,0,0,0));
         SetPVarInt(playerid, "blue1", CreateObject(18648,0,0,0,0,0,0));
         AttachObjectToVehicle(GetPVarInt(playerid, "blue"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
         AttachObjectToVehicle(GetPVarInt(playerid, "blue1"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
         return 1;
	}
	if(clickedid == wTuning3[1])
	{
         SetPVarInt(playerid, "neon", 1);
         SetPVarInt(playerid, "yellow", CreateObject(18650,0,0,0,0,0,0));
         SetPVarInt(playerid, "yellow1", CreateObject(18650,0,0,0,0,0,0));
         AttachObjectToVehicle(GetPVarInt(playerid, "yellow"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
         AttachObjectToVehicle(GetPVarInt(playerid, "yellow1"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
         return 1;
	}
	if(clickedid == wTuning3[2])
	{
 		SetPVarInt(playerid, "neon", 1);
   		SetPVarInt(playerid, "white", CreateObject(18652,0,0,0,0,0,0));
   		SetPVarInt(playerid, "white1", CreateObject(18652,0,0,0,0,0,0));
     	AttachObjectToVehicle(GetPVarInt(playerid, "white"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
     	AttachObjectToVehicle(GetPVarInt(playerid, "white1"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
     	return 1;
	}
	if(clickedid == wTuning3[3])
	{
 		SetPVarInt(playerid, "neon", 1);
   		SetPVarInt(playerid, "pink", CreateObject(18651,0,0,0,0,0,0));
     	SetPVarInt(playerid, "pink1", CreateObject(18651,0,0,0,0,0,0));
      	AttachObjectToVehicle(GetPVarInt(playerid, "pink"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
       	AttachObjectToVehicle(GetPVarInt(playerid, "pink1"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
        return 1;
	}
	if(clickedid == wTuning3[4])
	{
		SetPVarInt(playerid, "neon", 1);
		SetPVarInt(playerid, "green", CreateObject(18649,0,0,0,0,0,0));
		SetPVarInt(playerid, "green1", CreateObject(18649,0,0,0,0,0,0));
		AttachObjectToVehicle(GetPVarInt(playerid, "green"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachObjectToVehicle(GetPVarInt(playerid, "green1"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
  		return 1;
	}
	if(clickedid == wTuning3[5])
	{
		DestroyObject(GetPVarInt(playerid, "blue"));
		DeletePVar(playerid, "neon");
		DestroyObject(GetPVarInt(playerid, "blue1"));
		DeletePVar(playerid, "neon");
		DestroyObject(GetPVarInt(playerid, "green"));
		DeletePVar(playerid, "neon");
		DestroyObject(GetPVarInt(playerid, "green1"));
		DeletePVar(playerid, "neon");
		DestroyObject(GetPVarInt(playerid, "yellow"));
		DeletePVar(playerid, "neon");
		DestroyObject(GetPVarInt(playerid, "yellow1"));
		DeletePVar(playerid, "neon");
		DestroyObject(GetPVarInt(playerid, "white"));
		DeletePVar(playerid, "neon");
		DestroyObject(GetPVarInt(playerid, "white1"));
		DeletePVar(playerid, "neon");
		DestroyObject(GetPVarInt(playerid, "pink"));
		DeletePVar(playerid, "neon");
		DestroyObject(GetPVarInt(playerid, "pink1"));
		DeletePVar(playerid, "neon");
		return 1;
	}
	if(clickedid == Text:INVALID_TEXT_DRAW)
	{


         for(new i = 0; i < sizeof(wTuning1); i++) { TextDrawHideForPlayer(playerid, wTuning1[i]); }
         for(new i = 0; i < sizeof(wTuning2); i++)       { TextDrawHideForPlayer(playerid, wTuning2[i]); }
         for(new i = 0; i < sizeof(wTuning3); i++) { TextDrawHideForPlayer(playerid, wTuning3[i]); }
         for(new i = 0; i < sizeof(wTuning4); i++) { TextDrawHideForPlayer(playerid, wTuning4[i]); }
         for(new i = 0; i < sizeof(wTuning5); i++)       { TextDrawHideForPlayer(playerid, wTuning5[i]); }
	}

// add o forward LoadTextDraws();
forward LoadTextDraws();
public LoadTextDraws() 


wTuning1[0] = TextDrawCreate(560.000000, 102.000000, "_");
	TextDrawBackgroundColor(wTuning1[0], 255);
	TextDrawFont(wTuning1[0], 1);
	TextDrawLetterSize(wTuning1[0], 0.709999, 1.599998);
	TextDrawColor(wTuning1[0], 852308735);
	TextDrawSetOutline(wTuning1[0], 0);
	TextDrawSetProportional(wTuning1[0], 1);
	TextDrawSetShadow(wTuning1[0], 1);
	TextDrawUseBox(wTuning1[0], 1);
	TextDrawBoxColor(wTuning1[0], 793726975);
	TextDrawTextSize(wTuning1[0], 72.000000, 20.000000);
	TextDrawSetSelectable(wTuning1[0], 0);

	wTuning1[1] = TextDrawCreate(560.000000, 120.000000, "_");
	TextDrawBackgroundColor(wTuning1[1], 255);
	TextDrawFont(wTuning1[1], 1);
	TextDrawLetterSize(wTuning1[1], 0.709999, 1.699998);
	TextDrawColor(wTuning1[1], -1);
	TextDrawSetOutline(wTuning1[1], 0);
	TextDrawSetProportional(wTuning1[1], 1);
	TextDrawSetShadow(wTuning1[1], 1);
	TextDrawUseBox(wTuning1[1], 1);
	TextDrawBoxColor(wTuning1[1], 150);
	TextDrawTextSize(wTuning1[1], 72.000000, 20.000000);
	TextDrawSetSelectable(wTuning1[1], 0);

	wTuning1[2] = TextDrawCreate(243.000000, 144.000000, "_");
	TextDrawBackgroundColor(wTuning1[2], 255);
	TextDrawFont(wTuning1[2], 1);
	TextDrawLetterSize(wTuning1[2], 0.709999, 21.299999);
	TextDrawColor(wTuning1[2], -1);
	TextDrawSetOutline(wTuning1[2], 0);
	TextDrawSetProportional(wTuning1[2], 1);
	TextDrawSetShadow(wTuning1[2], 1);
	TextDrawUseBox(wTuning1[2], 1);
	TextDrawBoxColor(wTuning1[2], 150);
	TextDrawTextSize(wTuning1[2], 72.000000, 19.000000);
	TextDrawSetSelectable(wTuning1[2], 0);

	wTuning1[3] = TextDrawCreate(271.000000, 105.000000, "Chuc Nang Do Xe Mobile / PC");
	TextDrawBackgroundColor(wTuning1[3], 255);
	TextDrawFont(wTuning1[3], 2);
	TextDrawLetterSize(wTuning1[3], 0.300000, 1.000000);
	TextDrawColor(wTuning1[3], -1);
	TextDrawSetOutline(wTuning1[3], 0);
	TextDrawSetProportional(wTuning1[3], 1);
	TextDrawSetShadow(wTuning1[3], 0);
	TextDrawSetSelectable(wTuning1[3], 0);

	wTuning1[4] = TextDrawCreate(368.000000, 152.000000, "Mechanic Central v1.0");
	TextDrawBackgroundColor(wTuning1[4], 255);
	TextDrawFont(wTuning1[4], 2);
	TextDrawLetterSize(wTuning1[4], 0.250000, 1.100000);
	TextDrawColor(wTuning1[4], -1);
	TextDrawSetOutline(wTuning1[4], 0);
	TextDrawSetProportional(wTuning1[4], 1);
	TextDrawSetShadow(wTuning1[4], 0);
	TextDrawSetSelectable(wTuning1[4], 0);

	wTuning1[5] = TextDrawCreate(560.000000, 144.000000, "_");
	TextDrawBackgroundColor(wTuning1[5], 255);
	TextDrawFont(wTuning1[5], 1);
	TextDrawLetterSize(wTuning1[5], 0.709999, 2.900000);
	TextDrawColor(wTuning1[5], -1);
	TextDrawSetOutline(wTuning1[5], 0);
	TextDrawSetProportional(wTuning1[5], 1);
	TextDrawSetShadow(wTuning1[5], 1);
	TextDrawUseBox(wTuning1[5], 1);
	TextDrawBoxColor(wTuning1[5], 793726975);
	TextDrawTextSize(wTuning1[5], 247.000000, 19.000000);
	TextDrawSetSelectable(wTuning1[5], 0);

	wTuning1[6] = TextDrawCreate(538.000000, 105.000000, "X");
	TextDrawBackgroundColor(wTuning1[6], 255);
	TextDrawFont(wTuning1[6], 1);
	TextDrawLetterSize(wTuning1[6], 0.500000, 1.000000);
	TextDrawColor(wTuning1[6], 255);
	TextDrawSetOutline(wTuning1[6], 0);
	TextDrawSetProportional(wTuning1[6], 1);
	TextDrawSetShadow(wTuning1[6], 0);
	TextDrawUseBox(wTuning1[6], 1);
	TextDrawBoxColor(wTuning1[6], 0);
	TextDrawTextSize(wTuning1[6], 550.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[6], 1);

	wTuning1[7] = TextDrawCreate(88.000000, 123.000000, "Wheels");
	TextDrawBackgroundColor(wTuning1[7], 255);
	TextDrawFont(wTuning1[7], 2);
	TextDrawLetterSize(wTuning1[7], 0.300000, 1.000000);
	TextDrawColor(wTuning1[7], -1);
	TextDrawSetOutline(wTuning1[7], 0);
	TextDrawSetProportional(wTuning1[7], 1);
	TextDrawSetShadow(wTuning1[7], 0);
	TextDrawUseBox(wTuning1[7], 1);
	TextDrawBoxColor(wTuning1[7], 0);
	TextDrawTextSize(wTuning1[7], 137.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[7], 0);

	wTuning1[8] = TextDrawCreate(150.000000, 123.000000, "Color");
	TextDrawBackgroundColor(wTuning1[8], 255);
	TextDrawFont(wTuning1[8], 2);
	TextDrawLetterSize(wTuning1[8], 0.300000, 1.000000);
	TextDrawColor(wTuning1[8], -1);
	TextDrawSetOutline(wTuning1[8], 0);
	TextDrawSetProportional(wTuning1[8], 1);
	TextDrawSetShadow(wTuning1[8], 0);
	TextDrawUseBox(wTuning1[8], 1);
	TextDrawBoxColor(wTuning1[8], 0);
	TextDrawTextSize(wTuning1[8], 190.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[8], 0);

	wTuning1[9] = TextDrawCreate(204.000000, 123.000000, "paintjobs");
	TextDrawBackgroundColor(wTuning1[9], 255);
	TextDrawFont(wTuning1[9], 2);
	TextDrawLetterSize(wTuning1[9], 0.300000, 1.000000);
	TextDrawColor(wTuning1[9], -1);
	TextDrawSetOutline(wTuning1[9], 0);
	TextDrawSetProportional(wTuning1[9], 1);
	TextDrawSetShadow(wTuning1[9], 0);
	TextDrawUseBox(wTuning1[9], 1);
	TextDrawBoxColor(wTuning1[9], 0);
	TextDrawTextSize(wTuning1[9], 274.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[9], 0);

	wTuning1[10] = TextDrawCreate(284.000000, 123.000000, "nitro");
	TextDrawBackgroundColor(wTuning1[10], 255);
	TextDrawFont(wTuning1[10], 2);
	TextDrawLetterSize(wTuning1[10], 0.300000, 1.000000);
	TextDrawColor(wTuning1[10], -1);
	TextDrawSetOutline(wTuning1[10], 0);
	TextDrawSetProportional(wTuning1[10], 1);
	TextDrawSetShadow(wTuning1[10], 0);
	TextDrawUseBox(wTuning1[10], 1);
	TextDrawBoxColor(wTuning1[10], 0);
	TextDrawTextSize(wTuning1[10], 320.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[10], 0);

	wTuning1[11] = TextDrawCreate(334.000000, 123.000000, "Spoiler");
	TextDrawBackgroundColor(wTuning1[11], 255);
	TextDrawFont(wTuning1[11], 2);
	TextDrawLetterSize(wTuning1[11], 0.300000, 1.000000);
	TextDrawColor(wTuning1[11], -1);
	TextDrawSetOutline(wTuning1[11], 0);
	TextDrawSetProportional(wTuning1[11], 1);
	TextDrawSetShadow(wTuning1[11], 0);
	TextDrawUseBox(wTuning1[11], 1);
	TextDrawBoxColor(wTuning1[11], 0);
	TextDrawTextSize(wTuning1[11], 411.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[11], true);

	wTuning1[12] = TextDrawCreate(424.000000, 123.000000, "Roof");
	TextDrawBackgroundColor(wTuning1[12], 255);
	TextDrawFont(wTuning1[12], 2);
	TextDrawLetterSize(wTuning1[12], 0.300000, 1.000000);
	TextDrawColor(wTuning1[12], -1);
	TextDrawSetOutline(wTuning1[12], 0);
	TextDrawSetProportional(wTuning1[12], 1);
	TextDrawSetShadow(wTuning1[12], 0);
	TextDrawUseBox(wTuning1[12], 1);
	TextDrawBoxColor(wTuning1[12], 0);
	TextDrawTextSize(wTuning1[12], 457.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[12], true);


	wTuning1[13] = TextDrawCreate(466.000000, 123.000000, "Auto");
	TextDrawBackgroundColor(wTuning1[13], 255);
	TextDrawFont(wTuning1[13], 2);
	TextDrawLetterSize(wTuning1[13], 0.300000, 1.000000);
	TextDrawColor(wTuning1[13], -1);
	TextDrawSetOutline(wTuning1[13], 0);
	TextDrawSetProportional(wTuning1[13], 1);
	TextDrawSetShadow(wTuning1[13], 0);
	TextDrawUseBox(wTuning1[13], 1);
	TextDrawBoxColor(wTuning1[13], 0);
	TextDrawTextSize(wTuning1[13], 542.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[13], 0);


	wTuning1[14] = TextDrawCreate(88.000000, 149.000000, "Black___________________");
	TextDrawBackgroundColor(wTuning1[14], 255);
	TextDrawFont(wTuning1[14], 2);
	TextDrawLetterSize(wTuning1[14], 0.300000, 1.000000);
	TextDrawColor(wTuning1[14], -1);
	TextDrawSetOutline(wTuning1[14], 0);
	TextDrawSetProportional(wTuning1[14], 1);
	TextDrawSetShadow(wTuning1[14], 0);
	TextDrawUseBox(wTuning1[14], 1);
	TextDrawBoxColor(wTuning1[14], 0);
	TextDrawTextSize(wTuning1[14], 190.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[14], 0);

	wTuning1[15] = TextDrawCreate(88.000000, 168.000000, "White____________________");
	TextDrawBackgroundColor(wTuning1[15], 255);
	TextDrawFont(wTuning1[15], 2);
	TextDrawLetterSize(wTuning1[15], 0.300000, 1.000000);
	TextDrawColor(wTuning1[15], -1);
	TextDrawSetOutline(wTuning1[15], 0);
	TextDrawSetProportional(wTuning1[15], 1);
	TextDrawSetShadow(wTuning1[15], 0);
	TextDrawUseBox(wTuning1[15], 1);
	TextDrawBoxColor(wTuning1[15], 0);
	TextDrawTextSize(wTuning1[15], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[15], 0);

	wTuning1[16] = TextDrawCreate(88.000000, 190.000000, "Green___________________");
	TextDrawBackgroundColor(wTuning1[16], 255);
	TextDrawFont(wTuning1[16], 2);
	TextDrawLetterSize(wTuning1[16], 0.300000, 1.000000);
	TextDrawColor(wTuning1[16], -1);
	TextDrawSetOutline(wTuning1[16], 0);
	TextDrawSetProportional(wTuning1[16], 1);
	TextDrawSetShadow(wTuning1[16], 0);
	TextDrawUseBox(wTuning1[16], 1);
	TextDrawBoxColor(wTuning1[16], 0);
	TextDrawTextSize(wTuning1[16], 171.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[16], 0);

	wTuning1[17] = TextDrawCreate(88.000000, 213.000000, "Cyan_____________________");
	TextDrawBackgroundColor(wTuning1[17], 255);
	TextDrawFont(wTuning1[17], 2);
	TextDrawLetterSize(wTuning1[17], 0.300000, 1.000000);
	TextDrawColor(wTuning1[17], -1);
	TextDrawSetOutline(wTuning1[17], 0);
	TextDrawSetProportional(wTuning1[17], 1);
	TextDrawSetShadow(wTuning1[17], 0);
	TextDrawUseBox(wTuning1[17], 1);
	TextDrawBoxColor(wTuning1[17], 0);
	TextDrawTextSize(wTuning1[17], 171.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[17], 0);

	wTuning1[18] = TextDrawCreate(88.000000, 233.000000, "Blue_____________________");
	TextDrawBackgroundColor(wTuning1[18], 255);
	TextDrawFont(wTuning1[18], 2);
	TextDrawLetterSize(wTuning1[18], 0.300000, 1.000000);
	TextDrawColor(wTuning1[18], -1);
	TextDrawSetOutline(wTuning1[18], 0);
	TextDrawSetProportional(wTuning1[18], 1);
	TextDrawSetShadow(wTuning1[18], 0);
	TextDrawUseBox(wTuning1[18], 1);
	TextDrawBoxColor(wTuning1[18], 0);
	TextDrawTextSize(wTuning1[18], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[18], 0);

	wTuning1[19] = TextDrawCreate(87.000000, 254.000000, "Yellow________________");
	TextDrawBackgroundColor(wTuning1[19], 255);
	TextDrawFont(wTuning1[19], 2);
	TextDrawLetterSize(wTuning1[19], 0.300000, 1.000000);
	TextDrawColor(wTuning1[19], -1);
	TextDrawSetOutline(wTuning1[19], 0);
	TextDrawSetProportional(wTuning1[19], 1);
	TextDrawSetShadow(wTuning1[19], 0);
	TextDrawUseBox(wTuning1[19], 1);
	TextDrawBoxColor(wTuning1[19], 0);
	TextDrawTextSize(wTuning1[19], 180.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[19], 0);

	wTuning1[20] = TextDrawCreate(87.000000, 275.000000, "gray_____________________");
	TextDrawBackgroundColor(wTuning1[20], 255);
	TextDrawFont(wTuning1[20], 2);
	TextDrawLetterSize(wTuning1[20], 0.300000, 1.000000);
	TextDrawColor(wTuning1[20], -1);
	TextDrawSetOutline(wTuning1[20], 0);
	TextDrawSetProportional(wTuning1[20], 1);
	TextDrawSetShadow(wTuning1[20], 0);
	TextDrawUseBox(wTuning1[20], 1);
	TextDrawBoxColor(wTuning1[20], 0);
	TextDrawTextSize(wTuning1[20], 229.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[20], 0);

	wTuning1[21] = TextDrawCreate(87.000000, 293.000000, "Pink_____________________");
	TextDrawBackgroundColor(wTuning1[21], 255);
	TextDrawFont(wTuning1[21], 2);
	TextDrawLetterSize(wTuning1[21], 0.300000, 1.000000);
	TextDrawColor(wTuning1[21], -1);
	TextDrawSetOutline(wTuning1[21], 0);
	TextDrawSetProportional(wTuning1[21], 1);
	TextDrawSetShadow(wTuning1[21], 0);
	TextDrawUseBox(wTuning1[21], 1);
	TextDrawBoxColor(wTuning1[21], 0);
	TextDrawTextSize(wTuning1[21], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[21], 0);

	wTuning1[22] = TextDrawCreate(87.000000, 312.000000, "Orange________________");
	TextDrawBackgroundColor(wTuning1[22], 255);
	TextDrawFont(wTuning1[22], 2);
	TextDrawLetterSize(wTuning1[22], 0.300000, 1.000000);
	TextDrawColor(wTuning1[22], -1);
	TextDrawSetOutline(wTuning1[22], 0);
	TextDrawSetProportional(wTuning1[22], 1);
	TextDrawSetShadow(wTuning1[22], 0);
	TextDrawUseBox(wTuning1[22], 1);
	TextDrawBoxColor(wTuning1[22], 0);
	TextDrawTextSize(wTuning1[22], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning1[22], 0);
	//------------------------------------------------------------------------------
	//
	//
	//------------------------------------------------------------------------------
	wTuning2[0] = TextDrawCreate(88.000000, 149.000000, "shadow________________");
	TextDrawBackgroundColor(wTuning2[0], 255);
	TextDrawFont(wTuning2[0], 2);
	TextDrawLetterSize(wTuning2[0], 0.300000, 1.000000);
	TextDrawColor(wTuning2[0], -1);
	TextDrawSetOutline(wTuning2[0], 0);
	TextDrawSetProportional(wTuning2[0], 1);
	TextDrawSetShadow(wTuning2[0], 0);
	TextDrawUseBox(wTuning2[0], 1);
	TextDrawBoxColor(wTuning2[0], 0);
	TextDrawTextSize(wTuning2[0], 190.000000, 10.000000);
	TextDrawSetSelectable(wTuning2[0], 0);

	wTuning2[1] = TextDrawCreate(88.000000, 168.000000, "mega_____________________");
	TextDrawBackgroundColor(wTuning2[1], 255);
	TextDrawFont(wTuning2[1], 2);
	TextDrawLetterSize(wTuning2[1], 0.300000, 1.000000);
	TextDrawColor(wTuning2[1], -1);
	TextDrawSetOutline(wTuning2[1], 0);
	TextDrawSetProportional(wTuning2[1], 1);
	TextDrawSetShadow(wTuning2[1], 0);
	TextDrawUseBox(wTuning2[1], 1);
	TextDrawBoxColor(wTuning2[1], 0);
	TextDrawTextSize(wTuning2[1], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning2[1], 0);

	wTuning2[2] = TextDrawCreate(88.000000, 190.000000, "rimshine_____________");
	TextDrawBackgroundColor(wTuning2[2], 255);
	TextDrawFont(wTuning2[2], 2);
	TextDrawLetterSize(wTuning2[2], 0.300000, 1.000000);
	TextDrawColor(wTuning2[2], -1);
	TextDrawSetOutline(wTuning2[2], 0);
	TextDrawSetProportional(wTuning2[2], 1);
	TextDrawSetShadow(wTuning2[2], 0);
	TextDrawUseBox(wTuning2[2], 1);
	TextDrawBoxColor(wTuning2[2], 0);
	TextDrawTextSize(wTuning2[2], 171.000000, 10.000000);
	TextDrawSetSelectable(wTuning2[2], 0);

	wTuning2[3] = TextDrawCreate(88.000000, 213.000000, "Wires___________________");
	TextDrawBackgroundColor(wTuning2[3], 255);
	TextDrawFont(wTuning2[3], 2);
	TextDrawLetterSize(wTuning2[3], 0.300000, 1.000000);
	TextDrawColor(wTuning2[3], -1);
	TextDrawSetOutline(wTuning2[3], 0);
	TextDrawSetProportional(wTuning2[3], 1);
	TextDrawSetShadow(wTuning2[3], 0);
	TextDrawUseBox(wTuning2[3], 1);
	TextDrawBoxColor(wTuning2[3], 0);
	TextDrawTextSize(wTuning2[3], 171.000000, 10.000000);
	TextDrawSetSelectable(wTuning2[3], 0);

	wTuning2[4] = TextDrawCreate(88.000000, 233.000000, "classic________________");
	TextDrawBackgroundColor(wTuning2[4], 255);
	TextDrawFont(wTuning2[4], 2);
	TextDrawLetterSize(wTuning2[4], 0.300000, 1.000000);
	TextDrawColor(wTuning2[4], -1);
	TextDrawSetOutline(wTuning2[4], 0);
	TextDrawSetProportional(wTuning2[4], 1);
	TextDrawSetShadow(wTuning2[4], 0);
	TextDrawUseBox(wTuning2[4], 1);
	TextDrawBoxColor(wTuning2[4], 0);
	TextDrawTextSize(wTuning2[4], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning2[4], 0);

	wTuning2[5] = TextDrawCreate(87.000000, 254.000000, "twist____________________");
	TextDrawBackgroundColor(wTuning2[5], 255);
	TextDrawFont(wTuning2[5], 2);
	TextDrawLetterSize(wTuning2[5], 0.300000, 1.000000);
	TextDrawColor(wTuning2[5], -1);
	TextDrawSetOutline(wTuning2[5], 0);
	TextDrawSetProportional(wTuning2[5], 1);
	TextDrawSetShadow(wTuning2[5], 0);
	TextDrawUseBox(wTuning2[5], 1);
	TextDrawBoxColor(wTuning2[5], 0);
	TextDrawTextSize(wTuning2[5], 180.000000, 10.000000);
	TextDrawSetSelectable(wTuning2[5], 0);

	wTuning2[6] = TextDrawCreate(87.000000, 275.000000, "cutter_________________");
	TextDrawBackgroundColor(wTuning2[6], 255);
	TextDrawFont(wTuning2[6], 2);
	TextDrawLetterSize(wTuning2[6], 0.300000, 1.000000);
	TextDrawColor(wTuning2[6], -1);
	TextDrawSetOutline(wTuning2[6], 0);
	TextDrawSetProportional(wTuning2[6], 1);
	TextDrawSetShadow(wTuning2[6], 0);
	TextDrawUseBox(wTuning2[6], 1);
	TextDrawBoxColor(wTuning2[6], 0);
	TextDrawTextSize(wTuning2[6], 180.000000, 10.000000);
	TextDrawSetSelectable(wTuning2[6], 0);

	wTuning2[7] = TextDrawCreate(87.000000, 293.000000, "Dollar_________________");
	TextDrawBackgroundColor(wTuning2[7], 255);
	TextDrawFont(wTuning2[7], 2);
	TextDrawLetterSize(wTuning2[7], 0.300000, 1.000000);
	TextDrawColor(wTuning2[7], -1);
	TextDrawSetOutline(wTuning2[7], 0);
	TextDrawSetProportional(wTuning2[7], 1);
	TextDrawSetShadow(wTuning2[7], 0);
	TextDrawUseBox(wTuning2[7], 1);
	TextDrawBoxColor(wTuning2[7], 0);
	TextDrawTextSize(wTuning2[7], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning2[7], 0);

	wTuning2[8] = TextDrawCreate(87.000000, 312.000000, "Atomic__________________");
	TextDrawBackgroundColor(wTuning2[8], 255);
	TextDrawFont(wTuning2[8], 2);
	TextDrawLetterSize(wTuning2[8], 0.300000, 1.000000);
	TextDrawColor(wTuning2[8], -1);
	TextDrawSetOutline(wTuning2[8], 0);
	TextDrawSetProportional(wTuning2[8], 1);
	TextDrawSetShadow(wTuning2[8], 0);
	TextDrawUseBox(wTuning2[8], 1);
	TextDrawBoxColor(wTuning2[8], 0);
	TextDrawTextSize(wTuning2[8], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning2[8], 0);
	//------------------------------------------------------------------------------
	//
	//
	//------------------------------------------------------------------------------
	wTuning3[0] = TextDrawCreate(88.000000, 149.000000, "Blue");
	TextDrawBackgroundColor(wTuning3[0], 255);
	TextDrawFont(wTuning3[0], 2);
	TextDrawLetterSize(wTuning3[0], 0.300000, 1.000000);
	TextDrawColor(wTuning3[0], -1);
	TextDrawSetOutline(wTuning3[0], 0);
	TextDrawSetProportional(wTuning3[0], 1);
	TextDrawSetShadow(wTuning3[0], 0);
	TextDrawUseBox(wTuning3[0], 1);
	TextDrawBoxColor(wTuning3[0], 0);
	TextDrawTextSize(wTuning3[0], 190.000000, 10.000000);
	TextDrawSetSelectable(wTuning3[0], 0);

	wTuning3[1] = TextDrawCreate(88.000000, 168.000000, "Yellow");
	TextDrawBackgroundColor(wTuning3[1], 255);
	TextDrawFont(wTuning3[1], 2);
	TextDrawLetterSize(wTuning3[1], 0.300000, 1.000000);
	TextDrawColor(wTuning3[1], -1);
	TextDrawSetOutline(wTuning3[1], 0);
	TextDrawSetProportional(wTuning3[1], 1);
	TextDrawSetShadow(wTuning3[1], 0);
	TextDrawUseBox(wTuning3[1], 1);
	TextDrawBoxColor(wTuning3[1], 0);
	TextDrawTextSize(wTuning3[1], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning3[1], 0);

	wTuning3[2] = TextDrawCreate(88.000000, 190.000000, "White");
	TextDrawBackgroundColor(wTuning3[2], 255);
	TextDrawFont(wTuning3[2], 2);
	TextDrawLetterSize(wTuning3[2], 0.300000, 1.000000);
	TextDrawColor(wTuning3[2], -1);
	TextDrawSetOutline(wTuning3[2], 0);
	TextDrawSetProportional(wTuning3[2], 1);
	TextDrawSetShadow(wTuning3[2], 0);
	TextDrawUseBox(wTuning3[2], 1);
	TextDrawBoxColor(wTuning3[2], 0);
	TextDrawTextSize(wTuning3[2], 171.000000, 10.000000);
	TextDrawSetSelectable(wTuning3[2], 0);

	wTuning3[3] = TextDrawCreate(88.000000, 213.000000, "Pink");
	TextDrawBackgroundColor(wTuning3[3], 255);
	TextDrawFont(wTuning3[3], 2);
	TextDrawLetterSize(wTuning3[3], 0.300000, 1.000000);
	TextDrawColor(wTuning3[3], -1);
	TextDrawSetOutline(wTuning3[3], 0);
	TextDrawSetProportional(wTuning3[3], 1);
	TextDrawSetShadow(wTuning3[3], 0);
	TextDrawUseBox(wTuning3[3], 1);
	TextDrawBoxColor(wTuning3[3], 0);
	TextDrawTextSize(wTuning3[3], 171.000000, 10.000000);
	TextDrawSetSelectable(wTuning3[3], 0);

	wTuning3[4] = TextDrawCreate(88.000000, 233.000000, "green");
	TextDrawBackgroundColor(wTuning3[4], 255);
	TextDrawFont(wTuning3[4], 2);
	TextDrawLetterSize(wTuning3[4], 0.300000, 1.000000);
	TextDrawColor(wTuning3[4], -1);
	TextDrawSetOutline(wTuning3[4], 0);
	TextDrawSetProportional(wTuning3[4], 1);
	TextDrawSetShadow(wTuning3[4], 0);
	TextDrawUseBox(wTuning3[4], 1);
	TextDrawBoxColor(wTuning3[4], 0);
	TextDrawTextSize(wTuning3[4], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning3[4], 0);

	wTuning3[5] = TextDrawCreate(88.000000, 252.000000, "remove_neon");
	TextDrawBackgroundColor(wTuning3[5], 255);
	TextDrawFont(wTuning3[5], 2);
	TextDrawLetterSize(wTuning3[5], 0.300000, 1.000000);
	TextDrawColor(wTuning3[5], -1);
	TextDrawSetOutline(wTuning3[5], 0);
	TextDrawSetProportional(wTuning3[5], 1);
	TextDrawSetShadow(wTuning3[5], 0);
	TextDrawUseBox(wTuning3[5], 1);
	TextDrawBoxColor(wTuning3[5], 0);
	TextDrawTextSize(wTuning3[5], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning3[5], 0);
	//------------------------------------------------------------------------------
	//
	//
	//------------------------------------------------------------------------------
	wTuning4[0] = TextDrawCreate(88.000000, 149.000000, "PAINTJOB_1");
	TextDrawBackgroundColor(wTuning4[0], 255);
	TextDrawFont(wTuning4[0], 2);
	TextDrawLetterSize(wTuning4[0], 0.300000, 1.000000);
	TextDrawColor(wTuning4[0], -1);
	TextDrawSetOutline(wTuning4[0], 0);
	TextDrawSetProportional(wTuning4[0], 1);
	TextDrawSetShadow(wTuning4[0], 0);
	TextDrawUseBox(wTuning4[0], 1);
	TextDrawBoxColor(wTuning4[0], 0);
	TextDrawTextSize(wTuning4[0], 190.000000, 10.000000);
	TextDrawSetSelectable(wTuning4[0], 0);

	wTuning4[1] = TextDrawCreate(88.000000, 168.000000, "PaintJob_2");
	TextDrawBackgroundColor(wTuning4[1], 255);
	TextDrawFont(wTuning4[1], 2);
	TextDrawLetterSize(wTuning4[1], 0.300000, 1.000000);
	TextDrawColor(wTuning4[1], -1);
	TextDrawSetOutline(wTuning4[1], 0);
	TextDrawSetProportional(wTuning4[1], 1);
	TextDrawSetShadow(wTuning4[1], 0);
	TextDrawUseBox(wTuning4[1], 1);
	TextDrawBoxColor(wTuning4[1], 0);
	TextDrawTextSize(wTuning4[1], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning4[1], 0);

	wTuning4[2] = TextDrawCreate(88.000000, 190.000000, "PaintJob_3");
	TextDrawBackgroundColor(wTuning4[2], 255);
	TextDrawFont(wTuning4[2], 2);
	TextDrawLetterSize(wTuning4[2], 0.300000, 1.000000);
	TextDrawColor(wTuning4[2], -1);
	TextDrawSetOutline(wTuning4[2], 0);
	TextDrawSetProportional(wTuning4[2], 1);
	TextDrawSetShadow(wTuning4[2], 0);
	TextDrawUseBox(wTuning4[2], 1);
	TextDrawBoxColor(wTuning4[2], 0);
	TextDrawTextSize(wTuning4[2], 171.000000, 10.000000);
	TextDrawSetSelectable(wTuning4[2], 0);
	//------------------------------------------------------------------------------
	//
	//
	//------------------------------------------------------------------------------
	wTuning5[0] = TextDrawCreate(88.000000, 149.000000, "Nitro 2X");
	TextDrawBackgroundColor(wTuning5[0], 255);
	TextDrawFont(wTuning5[0], 2);
	TextDrawLetterSize(wTuning5[0], 0.300000, 1.000000);
	TextDrawColor(wTuning5[0], -1);
	TextDrawSetOutline(wTuning5[0], 0);
	TextDrawSetProportional(wTuning5[0], 1);
	TextDrawSetShadow(wTuning5[0], 0);
	TextDrawUseBox(wTuning5[0], 1);
	TextDrawBoxColor(wTuning5[0], 0);
	TextDrawTextSize(wTuning5[0], 190.000000, 10.000000);
	TextDrawSetSelectable(wTuning5[0], 0);

	wTuning5[1] = TextDrawCreate(88.000000, 169.000000, "NITRo 5x");
	TextDrawBackgroundColor(wTuning5[1], 255);
	TextDrawFont(wTuning5[1], 2);
	TextDrawLetterSize(wTuning5[1], 0.300000, 1.000000);
	TextDrawColor(wTuning5[1], -1);
	TextDrawSetOutline(wTuning5[1], 0);
	TextDrawSetProportional(wTuning5[1], 1);
	TextDrawSetShadow(wTuning5[1], 0);
	TextDrawUseBox(wTuning5[1], 1);
	TextDrawBoxColor(wTuning5[1], 0);
	TextDrawTextSize(wTuning5[1], 170.000000, 10.000000);
	TextDrawSetSelectable(wTuning5[1], 0);

	wTuning5[2] = TextDrawCreate(88.000000, 190.000000, "nitro 10x");
	TextDrawBackgroundColor(wTuning5[2], 255);
	TextDrawFont(wTuning5[2], 2);
	TextDrawLetterSize(wTuning5[2], 0.300000, 1.000000);
	TextDrawColor(wTuning5[2], -1);
	TextDrawSetOutline(wTuning5[2], 0);
	TextDrawSetProportional(wTuning5[2], 1);
	TextDrawSetShadow(wTuning5[2], 0);
	TextDrawUseBox(wTuning5[2], 1);
	TextDrawBoxColor(wTuning5[2], 0);
	TextDrawTextSize(wTuning5[2], 171.000000, 10.000000);
	TextDrawSetSelectable(wTuning5[2], 0);

	roofs[0] = TextDrawCreate(88.000000, 149.000000, "Alien");
	TextDrawBackgroundColor(roofs[0], 255);
	TextDrawFont(roofs[0], 2);
	TextDrawLetterSize(roofs[0], 0.300000, 1.000000);
	TextDrawColor(roofs[0], -1);
	TextDrawSetOutline(roofs[0], 0);
	TextDrawSetProportional(roofs[0], 1);
	TextDrawSetShadow(roofs[0], 0);
	TextDrawUseBox(roofs[0], 1);
	TextDrawBoxColor(roofs[0], 0);
	TextDrawTextSize(roofs[0], 190.000000, 10.000000);
	TextDrawSetSelectable(roofs[0], true);

	roofs[1] = TextDrawCreate(88.000000, 168.000000, " X-Flow");
	TextDrawBackgroundColor(roofs[1], 255);
	TextDrawFont(roofs[1], 2);
	TextDrawLetterSize(roofs[1], 0.300000, 1.000000);
	TextDrawColor(roofs[1], -1);
	TextDrawSetOutline(roofs[1], 0);
	TextDrawSetProportional(roofs[1], 1);
	TextDrawSetShadow(roofs[1], 0);
	TextDrawUseBox(roofs[1], 1);
	TextDrawBoxColor(roofs[1], 0);
	TextDrawTextSize(roofs[1], 170.000000, 10.000000);
	TextDrawSetSelectable(roofs[1], true);

	spoiler[0] = TextDrawCreate(88.000000, 149.000000, "Alien");
	TextDrawBackgroundColor(spoiler[0], 255);
	TextDrawFont(spoiler[0], 2);
	TextDrawLetterSize(spoiler[0], 0.300000, 1.000000);
	TextDrawColor(spoiler[0], -1);
	TextDrawSetOutline(spoiler[0], 0);
	TextDrawSetProportional(spoiler[0], 1);
	TextDrawSetShadow(spoiler[0], 0);
	TextDrawUseBox(spoiler[0], 1);
	TextDrawBoxColor(spoiler[0], 0);
	TextDrawTextSize(spoiler[0], 190.000000, 10.000000);
	TextDrawSetSelectable(spoiler[0], true);

	spoiler[1] = TextDrawCreate(88.000000, 168.000000, " X-Flow");
	TextDrawBackgroundColor(spoiler[1], 255);
	TextDrawFont(spoiler[1], 2);
	TextDrawLetterSize(spoiler[1], 0.300000, 1.000000);
	TextDrawColor(spoiler[1], -1);
	TextDrawSetOutline(spoiler[1], 0);
	TextDrawSetProportional(spoiler[1], 1);
	TextDrawSetShadow(spoiler[1], 0);
	TextDrawUseBox(spoiler[1], 1);
	TextDrawBoxColor(spoiler[1], 0);
	TextDrawTextSize(spoiler[1], 170.000000, 10.000000);
	TextDrawSetSelectable(spoiler[1], true);

	for(new i = 5; i < sizeof(wTuning1); i++) { TextDrawSetSelectable(Text:wTuning1[i], true); }
	for(new i = 0; i < sizeof(wTuning2); i++) { TextDrawSetSelectable(Text:wTuning2[i], true); }
	for(new i = 0; i < sizeof(wTuning3); i++) { TextDrawSetSelectable(Text:wTuning3[i], true); }
	for(new i = 0; i < sizeof(wTuning4); i++) { TextDrawSetSelectable(Text:wTuning4[i], true); }
	for(new i = 0; i < sizeof(wTuning5); i++) { TextDrawSetSelectable(Text:wTuning5[i], true); }
//

// add cuối model
CMD:doxe(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid,8,1899.6859,-1793.6655,13.8777) || IsPlayerInRangeOfPoint(playerid,8,1890.2111,-1793.4839,13.8777))
	{
        if(IsPlayerInAnyVehicle(playerid))
        {
            new giveplayerid;
            new cost;
            new string[512];
            if(sscanf(params, "ui", giveplayerid, cost)) return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /doxe [playerid] [price]");
			if(PlayerInfo[playerid][pJob] != 3 && PlayerInfo[playerid][pJob2] != 3) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong phai nhan vien cua Mechanic Central");
            if(PlayerCuffed[playerid] >= 1 || PlayerInfo[playerid][pHospital] > 0) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Ban khong the lam dieu nay bay gio.");
            if(!IsPlayerConnected(giveplayerid)) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Nguoi choi khong hop le.");
            //if(playerid == giveplayerid) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Ban khong the lam dieu nay voi chinh ban.");
            if(!ProxDetectorS(3.0, playerid, giveplayerid)) return SendClientMessageEx(playerid, -1, "{AA3333}[!]{FFFFFF} Nguoi do phai o gan ban.");
            new ModelVehicle = GetVehicleModel(GetPlayerVehicleID(playerid));
            if(GetModel(ModelVehicle)) return SendClientMessage(playerid, C_AVISO, "[Mechanic Central] Phuong tien nay khong the do!");
            if(cost < 100000) return SendClientMessageEx(playerid, COLOR_GREY, "[Mechanic Central] Tien do xe khong the duoi 100.000$");
            format(string, sizeof(string), "{33AA33}[!]{FFFFFF} %s da gui  chi phi do xe : %s$ cho ban . {33AA33}[/chapnhan doxe]{FFFFFF} bat dau do xe.", GetPlayerNameEx(playerid), number_format(cost));
            SendClientMessageEx(giveplayerid, -1, string);
            format(string, sizeof(string), "{33AA33}[!]{FFFFFF} Ban da gui chi phi do xe : %s$ cho %s. Hay doi nguoi do dong y.", number_format(cost), GetPlayerNameEx(giveplayerid));
            SendClientMessageEx(playerid, -1, string);
			DoXePrice[giveplayerid] = cost;
            InviterDoXe[giveplayerid] = playerid;
        }    
        else SendClientMessage(playerid, C_AVISO, "[Mechanic Central] Ban khong o tren phuong tien nao ca");
    }
    else SendClientMessage(playerid, C_AVISO, "[Mechanic Central] Ban khong o noi do xe");       
	return 1;
}
forward GetModel(Model);
public GetModel(Model)
{
        switch(Model){
                case 417, 425, 430, 432, 446, 447, 448, 452, 453, 454, 460, 461, 462, 463, 464, 465, 468, 469, 471, 472, 473, 476, 481, 484, 487, 488, 493, 497, 501, 509, 510, 511, 512, 513, 521, 522, 523, 548:
                return true;
        }
        return false;
}
//