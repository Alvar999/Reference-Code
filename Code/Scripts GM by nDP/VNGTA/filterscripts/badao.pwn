/*******************************************************************************
////			////////////////////////////////////////////////            ////
\\\\			\\\\                               			\\\\            \\\\
////           	////    	   loggo player FS by Teddy	    ////            ////
\\\\            \\\\                               			\\\\            \\\\
\\\\            \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\            ////
\\\\                                                                        \\\\
////            ////////////////////////////////////////////////            ////
\\\\            \\\\\\\\	     Version: 1.0       \\\\\\\\\\\\            \\\\
////            ////////  	Relese Date: 20/02/2013 ////////////            ////
\\\\            \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\            \\\\
////                                                                        \\\\
////            ////////////////////////////////////////////////            ////
\\\\            \\\\                                		\\\\            \\\\
////            //// You CAN edit this FS to you liking     ////            ////
\\\\            \\\\ You CANNOT clame this as your own  	\\\\            \\\\
////            //// You CANNOT re-release or post this on  ////            ////
\\\\            \\\\ 	other sites without my permission   \\\\            \\\\
////            ////////////////////////////////////////////////            ////
*******************************************************************************/
#define FILTERSCRIPT
#include <a_samp>
new logo1,logo2,logo3,logo4,logo5,logo6,logo7,logo8,logo9,logo10,logo11;
public OnFilterScriptInit()
{
		return 1;
}
public OnFilterScriptExit()
{
		return 1;
}
public OnPlayerConnect(playerid)
{
	   return 1;
}
public OnPlayerDisconnect(playerid,reason)
{
		DestroyObject(logo1);
		DestroyObject(logo2);
        DestroyObject(logo3);
		DestroyObject(logo4);
        DestroyObject(logo5);
		DestroyObject(logo6);
        DestroyObject(logo7);
		DestroyObject(logo8);
        DestroyObject(logo9);
		DestroyObject(logo10);
        DestroyObject(logo11);
		return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
//=========================================================================================
	if(strcmp(cmdtext, "/logo", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
		    ShowPlayerDialog(playerid, 0002, DIALOG_STYLE_LIST, "Logo by Teddy", "Wi-fi\nTribal\nMafia\nDemons\nSaint\nFacebook\nYoutube\nAC-DC\nMetalica\nNo mercy\nEmineM \nDelete Loggo", "Select", "Cancel");
		    PlayerPlaySound(playerid, 0001, 0.0, 0.0, 10.0);
	    }
        return 1;
	}
	return 0;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == 0002)
    {
        if(response)
		{
            if(listitem == 0)
            {
			logo1 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo1, "{FFFFFF}F", 0, OBJECT_MATERIAL_SIZE_256x128, "TI logoso TFB", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo1, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
			}
            if(listitem == 1)
            {
			logo2 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo2, "{FFFFFF}F", 0, OBJECT_MATERIAL_SIZE_256x128, "Tribal Animals Tattoo Designs", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo2, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
			}
            if(listitem == 2)
            {
			logo3 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo3, "{FFFFFF}00MAFIA00", 0, OBJECT_MATERIAL_SIZE_256x128, "C39HrP48DhTt", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo3, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
			}
            if(listitem == 3)
            {
			logo4 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo4, "{FFFFFF}3", 0, OBJECT_MATERIAL_SIZE_256x128, "Cornucopia of Ornaments", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo4, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
			}
            if(listitem == 4)
            {
			logo5 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo5, "{FFFFFF}J", 0, OBJECT_MATERIAL_SIZE_256x128, "crossbats tfb", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo5, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
			}
            if(listitem == 5)
            {
			logo6 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo6, "{FFFFFF}D", 0, OBJECT_MATERIAL_SIZE_256x128, "Social logos tfb", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo6, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
			}
            if(listitem == 6)
            {
			logo7 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo7, "{FFFFFF}B", 0, OBJECT_MATERIAL_SIZE_256x128, "Social logos tfb", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo7, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
			}
            if(listitem == 7)
            {
			logo8 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo8, "{FFFFFF}k", 0, OBJECT_MATERIAL_SIZE_256x128, "MUSIC LOGOS TFB", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo8, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
			}
            if(listitem == 8)
            {
			logo9 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo9, "{FFFFFF}l", 0, OBJECT_MATERIAL_SIZE_256x128, "MUSIC LOGOS TFB", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo9, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
			}
            if(listitem == 9)
            {
			logo10 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo10, "{FFFFFF}z", 0, OBJECT_MATERIAL_SIZE_256x128, "MUSIC LOGOS TFB", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo10, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
			}
            if(listitem == 10)
            {
			logo11 = CreateObject(19326,0,0,0,0,0,0);
			SetObjectMaterialText(logo11, "{FFFFFF}y", 0, OBJECT_MATERIAL_SIZE_256x128, "MUSIC LOGOS TFB", 35,0, -16776961, 0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			AttachObjectToPlayer(logo11, playerid, 0.000000, -0.120000, 0.40000, 0.000000, 0.00000, 0.000000);
			SendClientMessage(playerid, 0xDEEE20FF, "You put logo on skin!");
            if(listitem == 11)
            {
		    DestroyObject(logo1);
			DestroyObject(logo2);
		    DestroyObject(logo3);
			DestroyObject(logo4);
		    DestroyObject(logo5);
			DestroyObject(logo6);
		    DestroyObject(logo7);
			DestroyObject(logo8);
		    DestroyObject(logo9);
			DestroyObject(logo10);
            DestroyObject(logo11);
		    }
	 	    }
	    }
    }
    return 1;
}
/*******************************************************************************
/////     	 			 ///// End Of File \\\\\						  \\\\\\
******************************************************************************/
