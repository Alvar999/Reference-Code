//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//

#include <YSI\y_hooks>


//pMaHieu,
// cache_get_field_content(row,  "CMND", szResult, MainPipeline); PlayerInfo[extraid][pCMND] = strval(szResult);
// SavePlayerInteger(query, GetPlayerSQLId(playerid), "MaHieu", PlayerInfo[playerid][pMaHieu]);
//===========================================================================//
stock randomEx(min, max)
{
    new rand = random(max-min)+min;
    return rand;
}

stock ResetPlayerMaHieu(playerid)
{
    PlayerInfo[playerid][pMaHieu] = 0;
    ResetPlayerMaHieu(playerid);
    return 1;
}
//===========================================================================//



//===========================================================================//
hook OnPlayerConnect(playerid)
{
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

hook OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
//===========================================================================//


else if(strcmp(params, "group", true) == 0) {
            if(GetPVarType(playerid, "Group_Inviter")) {

    			new
					iInviter = GetPVarInt(playerid, "Group_Inviter"),
					iGroupID = PlayerInfo[iInviter][pLeader],
					iRank = PlayerInfo[iInviter][pRank];

				if (PlayerInfo[playerid][pCSFBanned]) {
					if (arrGroupData[iGroupID][g_iGroupType] == 1 || arrGroupData[iGroupID][g_iGroupType] == 3)	{
						SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong the tham gia vao nhom nay, ban bi cam vao nhom. Lien he admin de mo khoa.");
						DeletePVar(playerid, "Group_Invite");
						DeletePVar(iInviter, "Group_Invited");
						return 1;
					}
				}

                if(IsPlayerConnected(iInviter) && GetPVarInt(iInviter, "Group_Invited") == playerid && 0 <= iGroupID < MAX_GROUPS) {
					PlayerInfo[playerid][pMember] = iGroupID;
					PlayerInfo[playerid][pRank] = 0;
					PlayerInfo[playerid][pDivision] = INVALID_DIVISION;

					format(szMessage, sizeof szMessage, "Ban da chap nhan loi moi %s %s's, va bay gio la thanh vien cua %s.", arrGroupRanks[iGroupID][iRank], GetPlayerNameEx(iInviter), arrGroupData[iGroupID][g_szGroupName]);
					SendClientMessageEx(playerid, COLOR_LIGHTBLUE, szMessage);
					new rand = Random(100, 1000);
                    PlayerInfo[playerid][pMaHieu] = rand;
                    format(szMessage, sizeof szMessage, "Ma hieu cua ban: %d.",PlayerInfo[playerid][pMaHieu]);
                    SendClientMessage(playerid, COLOR_LIGHTBLUE, szMessage);

					format(szMessage, sizeof szMessage, "%s da chap nhan ban tham gia.", GetPlayerNameEx(playerid));
					SendClientMessageEx(iInviter, COLOR_LIGHTBLUE, szMessage);

					format(szMessage, sizeof szMessage, "%s chap nhan %s %s's tham gia %s (%d).", GetPlayerNameEx(playerid), arrGroupRanks[iGroupID][iRank], GetPlayerNameEx(iInviter), arrGroupData[iGroupID][g_szGroupName], iGroupID + 1);
					Log("logs/group.log", szMessage);

					DeletePVar(playerid, "Group_Invite");
					DeletePVar(iInviter, "Group_Invited");
                }
				else SendClientMessageEx(playerid, COLOR_GREY, "Nguoi cung cap cho ban loi moi tham gia da mat ket noi.");
            }
            else SendClientMessageEx(playerid, COLOR_GREY, "Khong ai de nghi ban vao nhom.");
        }

        
CMD:quitgroup(playerid, params[])
{
    if(PlayerInfo[playerid][pMember] >= 0 || PlayerInfo[playerid][pLeader] >= 0)
	{
		SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"* Ban da roi khoi nhom, gio ban la nguoi dan binh  thuong.");
		new string[128];
		format(string, sizeof(string), "%s da bo %s khoi rank %i", GetPlayerNameEx(playerid), arrGroupData[PlayerInfo[playerid][pMember]][g_szGroupName], PlayerInfo[playerid][pRank]);
		Log("logs/group.log", string);
		PlayerInfo[playerid][pMember] = INVALID_GROUP_ID;
		PlayerInfo[playerid][pRank] = INVALID_RANK;
		PlayerInfo[playerid][pDuty] = 0;
		PlayerInfo[playerid][pMaHieu] = 0;
		PlayerInfo[playerid][pLeader] = INVALID_GROUP_ID;
		PlayerInfo[playerid][pDivision] = INVALID_DIVISION;
		if(!IsValidSkin(GetPlayerSkin(playerid)))
		{
  			new rand = random(sizeof(CIV));
			SetPlayerSkin(playerid,CIV[rand]);
			PlayerInfo[playerid][pModel] = CIV[rand];
		}
		SetPlayerToTeamColor(playerid);
		player_remove_vip_toys(playerid);
		ResetPlayerWeaponsEx(playerid);
   		pTazer{playerid} = 0;
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong o trong nhom.");
	}
	return 1;
}

CMD:showmahieu(playerid, params[])
{
    if(PlayerInfo[playerid][pMaHieu] >= 1)
    {
    new giveplayerid, nation[24];
    if(sscanf(params, "u", giveplayerid))  return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: /showmahieu [player]");
    if(IsPlayerConnected(giveplayerid))
    {
            new iGroupID = PlayerInfo[playerid][pMember],
            rank[GROUP_MAX_RANK_LEN],
            division[GROUP_MAX_DIV_LEN],
            employer[GROUP_MAX_NAME_LEN];
            if (0 <= iGroupID < MAX_GROUPS)
        if (ProxDetectorS(8.0, playerid, giveplayerid))
        {
            switch(PlayerInfo[playerid][pNation])
            {
            case 0: nation = "San Andreas";
            case 1: nation = "Tierra Robada";
             }
             new str[2460], str1[1280], str2[1280], str3[1280],str4[1280],str5[1280],name[1280];
             GetPlayerGroupInfo(playerid, rank, division, employer);
            format(str1, sizeof(str), "           Ma phu hieu: %d", PlayerInfo[playerid][pMaHieu]);
            format(str2, sizeof(str), " Ten: %s", GetPlayerNameEx(playerid));
            format(str3, sizeof(str), " Lam viec tai:  %s", employer);
            format(str4, sizeof(str), " Chuc vu:       %s (%s)", rank ,division);
            format(str5, sizeof(str), " Quoc tich:     %s", nation);
            format(str, sizeof(str), "%s\n\n%s\n%s\n%s\n%s", str1,str2,str3,str4,str5);
            format(name, sizeof(name), "MA HIEU");
            ShowPlayerDialog(giveplayerid, DIALOG_NOTHING, DIALOG_STYLE_MSGBOX, name, str, "Ok", "");
            new string[128];
            format(string, sizeof(string), "* %s da show ma hieu cua minh.", GetPlayerNameEx(playerid));
            ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            //if(gettime() < ShowTimer[playerid])
        } else SendClientMessageEx(playerid, COLOR_GREY, "Nguoi do khong gan ban.");
        } else SendClientMessageEx(playerid, COLOR_GRAD1, "Nguoi choi khong hop le.");
    } else SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong co Ma Hieu.");
    return 1;
}
CMD:r(playerid, params[]) {

    new
        iGroupID = PlayerInfo[playerid][pMember],
        iRank = PlayerInfo[playerid][pRank];

    if (0 <= iGroupID < MAX_GROUPS) {
         if (iRank >= arrGroupData[iGroupID][g_iRadioAccess]) {
            if(GetPVarInt(playerid, "togRadio") == 0) {
                if(!isnull(params))
                {
                    new string[128], employer[GROUP_MAX_NAME_LEN], rank[GROUP_MAX_RANK_LEN], division[GROUP_MAX_DIV_LEN];
                    format(string, sizeof(string), "(radio) %s", params);
                    SetPlayerChatBubble(playerid, string, COLOR_WHITE, 15.0, 5000);
                    GetPlayerGroupInfo(playerid, rank, division, employer);
                    format(string, sizeof(string), "**[%d-%s] %s : %s **", PlayerInfo[playerid][pMaHieu], division, GetPlayerNameEx(playerid), params);
                    foreach(new i: Player)
                    {
                        if(GetPVarInt(i, "togRadio") == 0)
                        {
                            if(PlayerInfo[i][pMember] == iGroupID && iRank >= arrGroupData[iGroupID][g_iRadioAccess]) {
                                SendClientMessageEx(i, arrGroupData[iGroupID][g_hRadioColour] * 256 + 255, string);
                            }
                            if(GetPVarInt(i, "BigEar") == 4 && GetPVarInt(i, "BigEarGroup") == iGroupID) {
                                new szBigEar[128];
                                format(szBigEar, sizeof(szBigEar), "(BE) %s", string);
                                SendClientMessageEx(i, arrGroupData[iGroupID][g_hRadioColour] * 256 + 255, szBigEar);
                            }
                        }
                    }
                }
                else return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: (/r)adio [radio chat]");
            }
            else return SendClientMessageEx(playerid, COLOR_GREY, "Kenh radio cua ban hien dang tatt, su dung /togradio de lien lac tro lai.");
        }
        else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co quyen truy cap tan so radio nay.");
    }
    else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong nhom.");
    return 1;
}
CMD:g(playerid, params[])
{
    new
        iGroupID = PlayerInfo[playerid][pMember],
        iRank = PlayerInfo[playerid][pRank];

    if (0 <= iGroupID < MAX_GROUPS)
    {
        if (iRank >= arrGroupData[iGroupID][g_iRadioAccess])
        {
                if(!isnull(params))
                {
                    new string[128], employer[GROUP_MAX_NAME_LEN], rank[GROUP_MAX_RANK_LEN], division[GROUP_MAX_DIV_LEN];
                    GetPlayerGroupInfo(playerid, rank, division, employer);
                    format(string, sizeof(string), "**[%d-%s] (( %s %s: %s )) **", PlayerInfo[playerid][pMaHieu], division, rank, GetPlayerNameEx(playerid), params);
                    foreach(new i: Player)
                    {
                        if(PlayerInfo[i][pMember] == iGroupID && iRank >= arrGroupData[iGroupID][g_iRadioAccess])
                        {
                            SendClientMessageEx(i, arrGroupData[iGroupID][g_hRadioColour] * 256 + 255, string);
                        }
                    }
                }
                else return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: (/g)roup [radio OOC chat]");
        }
        else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co quyen truy cap tan so radio nay.");
    }
    else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong to chuc.");
    return 1;
}

CMD:r2(playerid, params[]) {

	new
		iGroupID = PlayerInfo[playerid][pMember],
		iRank = PlayerInfo[playerid][pRank];

	if (0 <= iGroupID < MAX_GROUPS) {
 		if (iRank >= arrGroupData[iGroupID][g_iRadioAccess]) {
			if(GetPVarInt(playerid, "togRadio") == 0) {
				if(!isnull(params))
				{
					new string[128], employer[GROUP_MAX_NAME_LEN], rank[GROUP_MAX_RANK_LEN], division[GROUP_MAX_DIV_LEN];
					format(string, sizeof(string), "(radio) %s", params);
					SetPlayerChatBubble(playerid, string, COLOR_WHITE, 15.0, 5000);
					GetPlayerGroupInfo(playerid, rank, division, employer);
					format(string, sizeof(string), "** %s (%s) %s: %s **", rank, division, GetPlayerNameEx(playerid), params);
					foreach(new i: Player)
					{
						if(GetPVarInt(i, "togRadio") == 0)
						{
							if(PlayerInfo[i][pMember] == iGroupID && iRank >= arrGroupData[iGroupID][g_iRadioAccess]) {
								SendClientMessageEx(i, arrGroupData[iGroupID][g_hRadioColour] * 256 + 255, string);
							}
							if(GetPVarInt(i, "BigEar") == 4 && GetPVarInt(i, "BigEarGroup") == iGroupID) {
								new szBigEar[128];
								format(szBigEar, sizeof(szBigEar), "(BE) %s", string);
								SendClientMessageEx(i, arrGroupData[iGroupID][g_hRadioColour] * 256 + 255, szBigEar);
							}
						}
					}
				}
				else return SendClientMessageEx(playerid, COLOR_GREY, "SU DUNG: (/r)adio [radio chat]");
			}
			else return SendClientMessageEx(playerid, COLOR_GREY, "Kenh radio cua ban hien dang tatt, su dung /togradio de lien lac tro lai.");
		}
		else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong co quyen truy cap tan so radio nay.");
	}
	else return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong o trong nhom.");
	return 1;
}


//
else if (dialogid == DIALOG_MAKELEADER && response)
	{
		if (PlayerInfo[playerid][pAdmin] >= 1337 || PlayerInfo[playerid][pFactionModerator] >= 2)
		{
			new
				iGroupID = listitem,
				iTargetID = GetPVarInt(playerid, "MakingLeader");

			if(!arrGroupData[iGroupID][g_szGroupName][0]) { return SendClientMessageEx(playerid, COLOR_GREY, "This group has not been properly set up yet."); }

			PlayerInfo[iTargetID][pLeader] = iGroupID;
			PlayerInfo[iTargetID][pMember] = iGroupID;
			PlayerInfo[iTargetID][pRank] = Group_GetMaxRank(iGroupID);
			PlayerInfo[iTargetID][pDivision] = -1;
			PlayerInfo[iTargetID][pFMember] = INVALID_FAMILY_ID;
			format(string, sizeof(string), "You have been made the leader of the %s by Administrator %s.", arrGroupData[iGroupID][g_szGroupName], GetPlayerNameEx(playerid));
			new rand = Random(100, 1000);
            PlayerInfo[iTargetID][pMaHieu] = rand;
            format(string, sizeof (string), "Ma hieu cua ban: %d.",PlayerInfo[iTargetID][pMaHieu]);
            SendClientMessageEx(iTargetID, COLOR_LIGHTBLUE, string);
			SendClientMessageEx(iTargetID, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "You have made %s the leader of the %s.", GetPlayerNameEx(iTargetID), arrGroupData[iGroupID][g_szGroupName]);
			SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
			format(string, sizeof(string), "%s have made %s the leader of the %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(playerid), arrGroupData[iGroupID][g_szGroupName]);
			Log("logs/group.log", string);
		}
		else SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong co quyen truy cap vao day.");
	}
