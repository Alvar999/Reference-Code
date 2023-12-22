//***********ULTRA CUBIC WORLD********//

//Game Mode version - 1.0 BETA
//pasha97 aka Pavel Chernyshov
//2013-2013
//Voronezh, Russia
//Skype: pasha.97.97
//All rights reserved

#include <a_samp>
#include <a_http>
#include <streamer>
#include <dini>
#include <MPM>
#include <sscanf2>
#pragma tabsize 0


//***********Variables and defines which can bee edited for some reason********//
#define PRINT_LOADING_INFO //if you define it, server will print to console the process of loading blocks, safe zones etc

#define MAX_BLOCKS 16000//Max amount of blocks on the server
#define MAX_ZONES 100//Max amount of zones on the server
#define MAX_LABELS 100//Max amount of labels on the server

#define MAPFILE "GLOBAL_MAP.sav"//File of saved map
#define ZONESFILE "SAFE_ZONES.sav"//File of safe zones
#define LABELSFILE "LABELS.sav"//File of safe labels
#define USERFILE "Users/%s.sav"//File of saved map

#define BOUND_MAX_X 5295.6675//Some config for player bounds
#define BOUND_MIN_X 4703.5796//Some config for player bounds
#define BOUND_MAX_Y 1372.4235//Some config for player bounds
#define BOUND_MIN_Y 626.7107//Some config for player bounds

#define BUTTON_SWITCH_T "C"//Text for switch button
#define BUTTON_DISABLE_T "F"//Text for disable button
#define BUTTON_PUT_T "RMB"//Text for put button
#define BUTTON_DESTROY_T "LMB"//Text for destroy button
#define BUTTON_ROTATE_T "Y"//text for rotation button

#define BUTTON_SWITCH KEY_CROUCH//The switch button
#define BUTTON_DISABLE KEY_SECONDARY_ATTACK//The disable button
#define BUTTON_PUT KEY_HANDBRAKE//The put button
#define BUTTON_DESTROY KEY_FIRE//The destroy button
#define BUTTON_ROTATE KEY_YES//The rotate decoration button

#define CUBE_SIZE_WIDE 1.76//Size of the cube on wide
#define CUBE_SIZE_HEIGH 1.5//size of the cube on heigh

#define KOEF 4//by what value the cube heigh size must be multipled to reach the terrain
#define SCALE 10//the maximum distance to put/destroy block
#define MIN_SCALE 5//the minimum distance to put block
#define MIN_SCALE_DES 3//the minimum distance to destroy block

#define BASE_MODEL 4242//model of the terrain
#define BASE_SIZE_X 199.4//X size of terrain
#define BASE_SIZE_Y 251.3//Y size of terrain
#define BASE_PLACE_X 5000//The center of terrain(X)
#define BASE_PLACE_Y 1000//The center of terrain(Y)
#define BASE_PLACE_Z 5.2//The center of terrain(Z)
#define BASE_COLOR 0xFFccff00//The color of terrain(X)
#define BASE_TX_MODEL -1//The model of the object which has the needed texture for terrain
#define BASE_TX_TXD "none"//The name of TXD file for terrain texture
#define BASE_TX_TEXTURE "none"//The name of terrain textute

#define PUT_FLOOD_SECONDS 1000//the minimum time in mileseconds between putting blocks
#define DES_FLOOD_SECONDS 500//the minimum time in mileseconds between destroying blocks

//***********System Variables and defines which do not need to be edited********//

new timer[MAX_PLAYERS];

new Zone[MAX_PLAYERS][2];
new Text3D:Label[MAX_PLAYERS];
new Label_ID[MAX_PLAYERS];
new pname[MAX_PLAYER_NAME];
new Float:BlockX[MAX_BLOCKS];
new Float:BlockY[MAX_BLOCKS];
new Float:BlockZ[MAX_BLOCKS];
new BlockAdd[MAX_BLOCKS];
new LastBlock[MAX_PLAYERS][2];
//new curveh[MAX_PLAYERS];
//new curveh2[MAX_PLAYERS];

native WP_Hash(buffer[], len, const str[]);

#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) \
	(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))
#define SetPlayerTimer(%0,%1,%2) SetTimerEx(%0,%1,%2,"i",playerid)

#define colorlist 93745
#define glasslist 14455
#define DIALOGID 2000
#define DECORATIONS_ID 2000

new stringu[512];
new switchlist;
new naturelist;
new woodlist;
new stonelist;
new fencinglist;
new decorationslist;
new plantslist;


new BlockHold[MAX_PLAYERS];
new BlockID[MAX_PLAYERS];
new Pointer[MAX_PLAYERS];
new RotDec[MAX_PLAYERS];
new SAVED[MAX_BLOCKS];
new SAVED_ZONE[MAX_ZONES];
new Text3D:SAVED_LABEL[MAX_LABELS];
new Text:Center;

new Text:Logo;
new Text:Tips;


new PlayerText:BLOCKINFO[MAX_PLAYERS];
new PutFlood[MAX_PLAYERS];
new DesFlood[MAX_PLAYERS];

#define DOOR_1 1491
#define DOOR_2 1502
#define SIGN 3927
#define SIGN_ID DECORATIONS_ID+5

#define DOOR_RAM_MODEL 19397

#define DOOR_RIGHT_X 0.7800
#define DOOR_RIGHT_Y 0.0
#define DOOR_RIGHT_Z 1.7600
#define DOOR_RIGHT_ROT_X 0
#define DOOR_RIGHT_ROT_Y 0
#define DOOR_RIGHT_ROT_Z 90

#define DOOR_LEFT_X (-0.2930)
#define DOOR_LEFT_Y 0.0
#define DOOR_LEFT_Z 1.2048
#define DOOR_LEFT_ROT_X 90
#define DOOR_LEFT_ROT_Y 0
#define DOOR_LEFT_ROT_Z 0



#define DOOR_UP_X 0.7678
#define DOOR_UP_Y 0
#define DOOR_UP_Z 2.730
#define DOOR_UP_ROT_X 0
#define DOOR_UP_ROT_Y 90
#define DOOR_UP_ROT_Z -90



#define SIGN_RAM_MODEL 2258

#define SIGN_RIGHT_X (-0.24)
#define SIGN_RIGHT_Y (-0.07)
#define SIGN_RIGHT_Z 0.75
#define SIGN_RIGHT_ROT_X 0
#define SIGN_RIGHT_ROT_Y 0
#define SIGN_RIGHT_ROT_Z 0


new CUBE_MODEL[] =//Array which has object id of all cubes
{
1685,//grass
1685,//ground
1685,//rock
1685,//water
1685,//sand
1685,//lava
1685,//ice

1685,//wood1
1685,//wood2
1685,//wood3

1685,//stone
1685,//stone
1685,//stone
1685,//stone
1685,//stone
1685,//stone
1685,//stone

1685,//bark

1685,//new wood
1685,//new wood
1685,//new wood
1685,//new wood

1685,//black
1685,//white
1685,//red
1685,//orange
1685,//yellow
1685,//green
1685,//green-blue
1685,//blue
1685,//Purple

1685,//white
1685,//red
1685,//orange
1685,//yellow
1685,//green
1685,//green-blue
1685,//blue
1685,//Purple


1685,//fencing
1685,//fencing
1685,//fencing
};


new CUBE_NAME[][] =//array with cubes names
{
"Grass",
"Ground",
"Rock",
"Water",
"Sand",
"Lava",
"Ice",

"Wood 1",
"Wood 2",
"Wood 3",

"Stone 1",
"Stone 2",
"Stone 3",
"Stone 4",
"Stone 5",
"Stone 6",
"Stone 7",

"Tree Bark",

"Wood 4",
"Wood 5",
"Wood 6",
"Wood 7",

"Black",
"White",
"Red",
"Orange",
"Yellow",
"Green",
"Green-Blue",
"Blue",
"Purple",

"White Glass",
"Red Glass",
"Orange Glass",
"Yellow Glass",
"Green Glass",
"Green-Blue Glass",
"Blue Glass",
"Purple Glass",


"Fencing 1",
"Fencing 2",
"Fencing 3"
};

new DECO_NAME[][]=//array with decorations names
{
"Chair 1",
"Chair 2",
"Armchair",
"Tabel 1",
"Fencing 1",
"Sign",
"Bed 1",
"Cabinet 1",
"Cabinet 2",
"Cabinet 3",
"Stairs",
"Door 1",
"Door 2",
"Streetlight",
"Fencing 2",

"Tree 1",
"Tree 2",
"Tree 3",
"Tree 4",
"Tree 5",
"Tree 6",
"Tree 7",
"Grass 1",
"Grass 2",
"Grass 3",
"Flowers 1",
"Flowers 2"
};

new cmodel[] =//array for changing cubes textures
{
17880,//grass
16134,//ground
898,//rock
3951,//water
16202,//sand
898,//lava
898,//ice

1224,//wood1
3260,//wood3
2988,//wood6

4724,//stone
19355,//stone
19364,//stone
19357,//stone
19359,//stone
19363,//stone
19371,//stone

832,//bark

19376,//new wood
19378,//new wood
19379,//new wood
19356,//new wood

19357,//black
19357,//white
19357,//red
19357,//orange
19357,//yellow
19357,//green
19357,//green-blue
19357,//blue
19357,//Purple

19466,//white
19466,//red
19466,//orange
19466,//yellow
19466,//green
19466,//green-blue
19466,//blue
19466,//Purple


983,//fencing
3282,//fencing
4100,//fencing
};

new ctxd[][] =//array for changing cubes textures
{
"landhub",//grass
"desert",//ground
"underwater",//rock
"rczero_track",//water
"des_cen",//sand
"underwater",//lava
"underwater",//ice


"boxes",//wood1
"country_breakable",//wood3
"kcomp_gx",//wood6

"skyscr1_lan2",//stone
"all_walls",//stone
"all_walls",//stone
"all_walls",//stone
"all_walls",//stone
"all_walls",//stone
"all_walls",//stone

"gta_brokentrees",//bark

"all_walls",//new wood
"all_walls",//new wood
"all_walls",//new wood
"all_walls",//new wood

"all_walls",//black
"all_walls",//white
"all_walls",//red
"all_walls",//orange
"all_walls",//yellow
"all_walls",//green
"all_walls",//green-blue
"all_walls",//blue
"all_walls",//Purple

"lsmall_shops",//white
"lsmall_shops",//red
"lsmall_shops",//orange
"lsmall_shops",//yellow
"lsmall_shops",//green
"lsmall_shops",//green-blue
"lsmall_shops",//blue
"lsmall_shops",//Purple


"bar_chainlink",//fencing
"country_breakable",//fencing
"lanfireesc_tr"//fencing
};

new ctexture[][] =//array for changing cubes textures
{
"yardgrass1",//grass
"des_redrock1",//ground
"greyrockbig",//rock
"waterclear256",//water
"des_ripplsand",//sand
"greyrockbig",//lava
"greyrockbig",//ice

"crate128",//wood1
"des_ghotwood1",//wood3
"kmwood_gate",//wood6

"sl_librarywall1",//stone
"ab_corWallUpr",//stone
"mp_carter_bwall",//stone
"cj_white_wall2",//stone
"copbtm_brown",//stone
"motel_wall3",//stone
"stormdrain3_nt",//stone

"CJ_bark",//bark

"gym_floor5",//new wood
"mp_diner_woodwall",//new wood
"mp_shop_floor2",//new wood
"CJ_LIGHTWOOD",//new wood

"cj_white_wall2",//black
"cj_white_wall2",//white
"cj_white_wall2",//red
"cj_white_wall2",//orange
"cj_white_wall2",//yellow
"cj_white_wall2",//green
"cj_white_wall2",//green-blue
"cj_white_wall2",//blue
"cj_white_wall2",//Purple


"lsmall_window01",//white
"lsmall_window01",//red
"lsmall_window01",//orange
"lsmall_window01",//yellow
"lsmall_window01",//green
"lsmall_window01",//green-blue
"lsmall_window01",//blue
"lsmall_window01",//Purple

"awirex2",//fencing
"Gen_Meshfencing",//fencing
"Upt_Fence_Mesh"//fencing//fencing
};

new ccolor[] =//array for changing cubes textures
{
0xFF7FFF00,//grass
0xFF834E1D,//ground
0xFFD5D5D5,//rock
0xEE008CF0,//water
0xFFFFF5B0,//sand
0xFFE32636,//lava
0x907FFFD4,//ice


0xFFFFFFFF,//wood1
0xFFFFFFFF,//wood2
0xFFFFFFFF,//wood3

0xFFFFFFFF,//stone
0xFFFFFFFF,//stone
0xFFFFFFFF,//stone
0xFFFFFFFF,//stone
0xFFFFFFFF,//stone
0xFFFFFFFF,//stone
0xFFFFFFFF,//stone

0xFFFFFFFF,//bark

0xFFFFFFFF,//wood
0xFFFFFFFF,//wood
0xFFFFFFFF,//wood
0xFFFFFFFF,//wood

0xFF000000,//black
0,//white
0xFFFF0000,//red
0xFFffa500,//orange
0xFFFFFF00,//yellow
0xFF00FF00,//green
0xFF00ffa0,//green-blue
0xFF0047ab,//blue
0xFFFF00FF,//Purple

0xFFFFFFFF,//white
0xFFFF0000,//red
0xFFffa500,//orange
0xFFFFFF00,//yellow
0xFF00FF00,//green
0xFF00ffa0,//green-blue
0xFF3636cc,//blue
0xFFFF00FF,//Purple


0xFFFFFFFF,//fencing
0xFFFFFFFF,//fencing
0xFFFFFFFF,//fencing
};


new DECO_MODEL[] =//Array which has object id of all decorations
{
1671,//chair
1720,//chair2
1711,//armchair
2635,//tabel2
1408,//fencing
3927,//sign
1802,//bed3
912,//cabinet1
2204,//cabinet2
2328,//cabinet3
3361,//stairs
1491,//door1
1502,//door2
1223,//Streetlight
970,//fencing 2

617,//tree
659,//tree
673,//tree
732,//tree
3506,//tree
736,//tree
685,//tree
820,//grass
821,//grass
19473,//grass
869,//flowers
870//flowers
};
new Float:DECO_Z_INDEX[] =//Array which has value which must be added to Z corrdinate decor
{
-0.3,//chair
-0.7,//chair2
-0.8,//armchair
-0.5,//table2
0.0,//fencing
1.3,//sign
-0.6,//bed3
-0.3,//cabinet1
-0.7,//cabinet2
-0.7,//cabinet3
-1.3,//stairs
-0.7,//door1
-0.7,//door2
-0.9,//Streetlight
-0.1,//fencing2

-1.5,//tree
-1.5,//tree
-1.5,//tree
-1.5,//tree
-1.5,//tree
9.4,//tree
-1.5,//tree
-0.9,//grass
-0.9,//grass
-0.9,//grass
-0.4689,//flowers
-0.6724//flowers
};
new Float:DECO_X_INDEX[] =//Array which has value which must be added to X corrdinate decor
{
0.0,//chair
0.0,//chair2
0.0,//armchair
0.0,//table2
0.0,//fencing
0.0,//sign
-0.5,//bed3
0.0,//cabinet1
-1.1,//cabinet2
0.0,//cabinet3
2.0,//stairs
-0.8,//door1
-0.8,//door2
0.0,//Streetlight
0.0,//fencing2

0.0,//tree
0.0,//tree
0.0,//tree
0.0,//tree
0.0,//tree
0.0,//tree
0.0,//tree
0.0,//grass
0.0,//grass
0.0,//grass
0.0,//flowers
0.0//flowers
};
new Float:DECO_Y_INDEX[] =//Array which has value which must be added to Z corrdinate of decor
{
0.0,//chair
0.0,//chair2
0.0,//armchair
0.0,//table2
0.0,//fencing
0.0,//sign
-2.0,//bed3
0.0,//cabinet1
0.0,//cabinet2
-1.1,//cabinet3
0.0,//stairs
0.0,//door1
0.0,//door2
0.0,//Streetlight
0.0,//fencing2

0.0,//tree
0.0,//tree
0.0,//tree
0.0,//tree
0.0,//tree
0.0,//tree
0.0,//tree
0.0,//grass
0.0,//grass
0.0,//grass
0.0,//flowers
0.0//flowers
};


new cnames[][] =//names of blocks in the selection menu
{
"Natural",
"Wood",
"Facing/stone",
"Colorful",
"Glass",
"Fencing",
"Decorations",
"Plants/treese",
"Disable"
};

new wnames[][] =//names of blocks in the selection menu
{
"Wood 1",
"Wood 2",
"Wood 3",
"Wood 4",
"Wood 5",
"Wood 6",
"Wood 7"
};

new snames[][] =//names of blocks in the selection menu
{
"Stone 1",
"Stone 2",
"Stone 3",
"Stone 4",
"Stone 5",
"Stone 6",
"Stone 7"
};

new colnames[][] =//names of blocks in the selection menu
{
"Black",
"White",
"Red",
"Orange",
"Yellow",
"Green",
"Green-Blue",
"Blue",
"Purple"
};

new gnames[][] =//names of blocks in the selection menu
{
"Simple",
"Red",
"Orange",
"Yellow",
"Green",
"Green-Blue",
"Blue",
"Purple"
};

new fnames[][] =//names of blocks in the selection menu
{
"Fencing 1",
"Fencing 2",
"Fencing 3"
};

new nnames[][] =//names of blocks in the selection menu
{
"Grass",
"Ground",
"Rock",
"Water",
"Sand",
"Lava",
"Ice",
"Tree Bark"
};

new dnames[][] =//names of decorations in the selection menu
{
"Chair 1",
"Chair 2",
"Armchair",
"Tabel 1",
"Fencing 1",
"Sign",
"Bed 1",
"Cabinet 1",
"Cabinet 2",
"Cabinet 3",
"Stairs",
"Door 1",
"Door 2",
"Streetlight",
"Fencing 2"
};

new pnames[][] =//names of plants in the selection menu
{
"Tree 1",
"Tree 2",
"Tree 3",
"Tree 4",
"Tree 5",
"Tree 6",
"Tree 7",
"Grass 1",
"Grass 2",
"Grass 3",
"Flowers 1",
"Flowers 2"
};

new colcolors[]=//Colors of blocks in the selection menu
{
0x000000FF,//black
0xFFFFFFFF,//white
0xFF0000FF,//red
0xffa500FF,//orange
0xFFFF00FF,//yellow
0x00FF00FF,//green
0x00ffa0FF,//green-blue
0x3636ccFF,//blue
0xFF00FFFF//Purple
};
new gcolors[]=//Colors of blocks in the selection menu
{
0xFFFFFF44,//white
0xFF000044,//red
0xffa50044,//orange
0xFFFF0044,//yellow
0x00FF0044,//green
0x00ffa044,//green-blue
0x3636cc44,//blue
0xFF00FF44//Purple
};

#define SPD ShowPlayerDialog
#define REG_DIALOG 2334
#define LOG_DIALOG 2335

//WARNING!!! This defines can NOT be changed!
//No one can prevent you from doing it, but if you are a honest person, you won't change theese defines!
#define	NICK "pasha97"
#define FULL_NAME "Pavel Chernyshov"
#define COPYRIGHT_DATE "2013-2013"
#define	LOCATION "Voronezh, Russia"
#define	SKYPE "pasha.97.97"
#define CREDITS "Naufal[Many thanks]\nBillyBoy[Many thanks]\nLakiya[Many thanks]\nProZ\nromart97\niheb\nSilverKiller\nVirtual1ty[Many thanks]\nMuqeet"
#define CREDITS_2 "Kalcor\nDracoBlue\nY_Less\nTotto8492\nD0efler\nIncognito"

//******End of variables and defines*********//

main()
{
return 1;
}
public OnPlayerConnect(playerid)
{
	BLOCKINFO[playerid] = CreatePlayerTextDraw(playerid, 509.000000, 379.750091, "Selected block:~n~lolxd");
	PlayerTextDrawLetterSize(playerid, BLOCKINFO[playerid], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, BLOCKINFO[playerid], 634.599792, 480.399658);
	PlayerTextDrawAlignment(playerid, BLOCKINFO[playerid], 1);
	PlayerTextDrawColor(playerid, BLOCKINFO[playerid], -1);//
	PlayerTextDrawUseBox(playerid, BLOCKINFO[playerid], true);
	PlayerTextDrawBoxColor(playerid, BLOCKINFO[playerid], -2147483393);//
	PlayerTextDrawSetShadow(playerid, BLOCKINFO[playerid], 0);
	PlayerTextDrawSetOutline(playerid, BLOCKINFO[playerid], 1);//
	PlayerTextDrawBackgroundColor(playerid, BLOCKINFO[playerid], -1523963137);
	PlayerTextDrawFont(playerid, BLOCKINFO[playerid], 1);
	PlayerTextDrawSetProportional(playerid, BLOCKINFO[playerid], 1);//
	GameTextForPlayer(playerid,"~w~Welcome to ~r~UCW ~w~server!",5000,5);

 	 new giocatore[MAX_PLAYER_NAME];

    GetPlayerName(playerid, giocatore, sizeof(giocatore));
    format(stringu, sizeof(stringu), "{ffffff}%s (ID: %d)  {ffcc00}has joined {ff0000}Ultra Cubic World! ", giocatore, playerid);
    SendClientMessageToAll(0xFFFFFF, stringu);

	SendClientMessage(playerid, 0xFFFFFFFF,"{ffcc00}~~~~~~~~~~~~~~~~~~~~~~~~~{000000}~~~~~~~~~~~~~{ffcc00}~~~~~~~~~~~~~~~~~~~~~~~");
    SendClientMessage(playerid, 0xFFFFFFFF,"{00ff00}Welcome to {f50000}Ultra Cubic World!");
    SendClientMessage(playerid, 0xFFFFFFFF,"{00ff00}It's a place where you can show your imagination and build great buildings with your friends!");
	SendClientMessage(playerid, 0xFFFFFFFF,"{ffcc00}~~~~~~~~~~~~~~~~~~~~~~~~~{000000}~~~~~~~~~~~~~{ffcc00}~~~~~~~~~~~~~~~~~~~~~~~");
	PlayerPlaySound(playerid,1185,0,0,0);
	BlockHold[playerid]=0;

	BlockID[playerid]=-1;

	SetDynamicObjectMaterial(Pointer[playerid], 0, -1, "none", "none", 0x91FF0000);
	timer[playerid]=SetPlayerTimer("UpdateCubes",2000,1);
	
	PutFlood[playerid]=0;
	DesFlood[playerid]=0;
	RotDec[playerid]=0;
	Zone[playerid][0]=-1;
	Zone[playerid][1]=-1;
	Label[playerid]=Text3D:-1;
	Label_ID[playerid]=-1;
	LastBlock[playerid][0]=-1;
	LastBlock[playerid][1]=-1;

	

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    new giocatore[MAX_PLAYER_NAME];
    GetPlayerName(playerid, giocatore, sizeof(giocatore));
    switch(reason)
    {
    case 0: format(stringu, sizeof(stringu), "{ffffff}%s (ID: %d)  {ffcc00}has left the server! {ff0000}(Crash)", giocatore, playerid);
    case 1: format(stringu, sizeof(stringu), "{ffffff}%s (ID: %d)  {ffcc00}has left the server! {ff0000}(Left)", giocatore, playerid);
    case 2: format(stringu, sizeof(stringu), "{ffffff}%s (ID: %d)  {ffcc00}has left the server! {ff0000}(Kicked)", giocatore, playerid);
    }
    SendClientMessageToAll(0xFFFFFFFF, stringu);
    DestroyDynamicObject(Pointer[playerid]);
    TextDrawHideForPlayer(playerid,Center);
    TextDrawHideForPlayer(playerid,Logo);
    TextDrawHideForPlayer(playerid,Tips);
    PlayerTextDrawHide(playerid,BLOCKINFO[playerid]);
	KillTimer(timer[playerid]);
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new idx;
	new cmd[256];
	
	cmd = strtok(cmdtext, idx);

	if(strcmp(cmd, "/help", true) == 0 || strcmp(cmd, "/about", true) == 0)
	{
	new dialogbox[1024];
	strcat(dialogbox,"{ffcc00}Hello, dear player! We are happy to see you here! \nIt is a place where you can show everybody your imagination and creativity! \n");
	strcat(dialogbox,"{00ff00}Create magnificent masterworks from cubes, or just build something more simple - the choice is yours!\n");
	format(stringu, sizeof(stringu), "{ff00ff}To switch blocks, press button {ff0000}%s. \n{ff00ff}To put the block, press {ff0000}%s, {ff00ff} to destroy it, press {ff0000}%s. \n{ff00ff}To change the decoration rotation press {ff0000}%s.\n{ff00ff}To disable block selection press {ff0000}%s\n",BUTTON_SWITCH_T,BUTTON_PUT_T, BUTTON_DESTROY_T,BUTTON_ROTATE_T,BUTTON_DISABLE_T);
	strcat(dialogbox,stringu);
	format(stringu, sizeof(stringu), "{00ffff}That's all! Good luck and enjoy your game! If you need commands list, check /cmd.\n\n{ff00ff}Project is in development. Since 7 March 2013\nScripter and owner: %s aka %s\nSkype: %s\n\n",NICK,FULL_NAME,SKYPE);
	strcat(dialogbox,stringu);
	format(stringu,sizeof(stringu),"{ffff00}Special thanks for help and testing:\n{00ff00}%s\n\n{ffff00}And, ofcourse, many thanks to theese people for their tools and plugins:\n{ff0000}%s",CREDITS,CREDITS_2);
	strcat(dialogbox,stringu);
	SPD(playerid, DIALOGID+1000, DIALOG_STYLE_MSGBOX, "UCW-express your creativity", dialogbox, "..::Ok::..", "");
    	return 1;
	}
	
	
	if(strcmp(cmd, "/cmd", true) == 0 || strcmp(cmd, "/c", true) == 0 || strcmp(cmd, "/command", true) == 0 || strcmp(cmd, "/commands", true) == 0 || strcmp(cmd, "/cmds", true) == 0)
	{
	new dialogbox[1024];
	strcat(dialogbox,"{ff00ff}Server commands list:\n\n");
	strcat(dialogbox,"{ffff00}/spawn - go to spawn place\n");
    strcat(dialogbox,"{ffff00}/fly - get jetpack to fly\n{ffff00}/safe [distance] - to set a safe zone at your place\n\n{ffff00}/delsafe - to delete your safe zone\n");
    strcat(dialogbox,"{ffff00}/label [text] - to set a label at your place\n{ffff00}/dellabel - to delete your label\n");
	SPD(playerid, DIALOGID+1000, DIALOG_STYLE_LIST, "UCW-express your creativity", dialogbox, "..::Ok::..", "");
    	return 1;
	}

	
	if (!strcmp("/test", cmd, true))
	{
	 new tmp[512];
	 tmp = strtok(cmdtext, idx);
        PlayerPlaySound(playerid,strval(tmp),0,0,0);
		return 1;
	}
	if (!strcmp("/switch", cmd, true))
	{
	 ShowMPMenu(playerid, switchlist, "Switch blocks",cnames,9,   0xc8c6bf44,  0xDBC77E77 ,   0xF4B81BAA);
	 return 1;
	}
	if (!strcmp("/spawn", cmd, true))
	{
	SetPlayerPos(playerid,BASE_PLACE_X, BASE_PLACE_Y, BASE_PLACE_Z+2);
	Inform(playerid,"{00ff00}You have been successfully teleported to spawn!");
	 return 1;
	}
	if (!strcmp("/jet", cmd, true) || !strcmp("/jp", cmdtext, true) || !strcmp("/jetpack", cmdtext, true) || !strcmp("/fly", cmdtext, true))
	{
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USEJETPACK);
		return 1;
	}
	if (!strcmp("/safe", cmd, true))
	{
	 new tmp[512];
	 tmp = strtok(cmdtext, idx);
	 if(strval(tmp)<=0 || strval(tmp)>15) return Warn(playerid,"{ff0000}USAGE: /safe [radius:1-15]");
	 if(IsPlayerInAnyDynamicArea(playerid)) return Warn(playerid,"{ff0000}You are in another safe area! Come to another place!");
	 new Float:x,Float:y,Float:z;
	 new ft[256];
	 new tt[100];
	 GetPlayerPos(playerid,x,y,z);
	
	 if(IsValidDynamicArea(Zone[playerid][0]))
	 {
	 DestroyDynamicArea(Zone[playerid][0]);
	  format(tt,sizeof(tt),"%d",Zone[playerid][1]);
	 dini_Unset(ZONESFILE,tt);

	 SAVED_ZONE[Zone[playerid][1]]=-1;
	 Zone[playerid][1]=-1;
	 Zone[playerid][0]=-1;
	 }
		Zone[playerid][0]=CreateDynamicCircle(x,y,strval(tmp));
		
			new d=0;
			new idrd=0;
			new zoneidx;
			while (d==0)
			{
				idrd++;

    			if(SAVED_ZONE[idrd]!=-1) d=0;
    			else d=1, zoneidx=idrd;
			}
		format(tt,sizeof(tt),"%d",zoneidx);
		Zone[playerid][1]=zoneidx;
		SAVED_ZONE[zoneidx]=Zone[playerid][0];
		format(ft,sizeof(ft),"%f %f %d",x,y,strval(tmp));
		dini_Set(ZONESFILE,tt,ft);
		
	new file[256];
  GetPlayerName(playerid, pname, sizeof(pname));
  format(file,sizeof(file),USERFILE,pname);
  dini_IntSet(file,"SAFE_ZONE",zoneidx);
		
		Inform(playerid,"You have just created a safe zone at this place! Only can build here now!");
	return 1;
	}
	
	if (!strcmp("/delsafe", cmd, true))
	{
	 new tt[100];

	 if(IsValidDynamicArea(Zone[playerid][0]))
	 {
	 DestroyDynamicArea(Zone[playerid][0]);
	  format(tt,sizeof(tt),"%d",Zone[playerid][1]);
	 dini_Unset(ZONESFILE,tt);

	 SAVED_ZONE[Zone[playerid][1]]=-1;
	 Zone[playerid][1]=-1;
	 Zone[playerid][0]=-1;
	 Inform(playerid,"{00ff00}You have just deleted your safe zone!");
	 }
	 else
	 {
	 	 Warn(playerid,"{ff0000}You don't have any safe zone created!");
	  }
	return 1;
	}
		
	if (!strcmp("/label", cmd, true))
	{
	 new tmp[1024];
	 sscanf(cmdtext, "{s[256]}p<->s[1024]", tmp);
	 if(strlen(tmp)<=0 || strlen(tmp)>50) return Warn(playerid,"{ff0000}USAGE: /label [text from 1 to 50 characters]");
	 new Float:x,Float:y,Float:z;
	 new ft[256];
	 new tt[100];
	 GetPlayerPos(playerid,x,y,z);

	 if(IsValidDynamic3DTextLabel(Label[playerid]))
	 {
	 DestroyDynamic3DTextLabel(Label[playerid]);
	  format(tt,sizeof(tt),"%d",Label_ID[playerid]);
	 dini_Unset(LABELSFILE,tt);

	 SAVED_LABEL[Label_ID[playerid]]=Text3D:-1;
	 Label_ID[playerid]=-1;
	 Label[playerid]=Text3D:-1;
	 }
		Label[playerid]=CreateDynamic3DTextLabel(tmp,0xFFFFFFFF, x,y,z,500);

			new d=0;
			new idrd=0;
			new zoneidx;
			while (d==0)
			{
				idrd++;

    			if(SAVED_LABEL[idrd]!=Text3D:-1) d=0;
    			else d=1, zoneidx=idrd;
			}
		format(tt,sizeof(tt),"%d",zoneidx);
		Label_ID[playerid]=zoneidx;
		SAVED_LABEL[zoneidx]=Label[playerid];
		format(ft,sizeof(ft),"%f %f %f %s",x,y,z,tmp);
		dini_Set(LABELSFILE,tt,ft);

	new file[256];
  GetPlayerName(playerid, pname, sizeof(pname));
  format(file,sizeof(file),USERFILE,pname);
  dini_IntSet(file,"SAFE_LABEL",zoneidx);

		Inform(playerid,"{00ff00}You have just created a text label at this place!");
	return 1;
	}

	if (!strcmp("/dellabel", cmd, true))
	{

	 new tt[100];

	 if(IsValidDynamic3DTextLabel(Label[playerid]))
	 {
	 DestroyDynamic3DTextLabel(Label[playerid]);
	  format(tt,sizeof(tt),"%d",Label_ID[playerid]);
	 dini_Unset(LABELSFILE,tt);

	 SAVED_LABEL[Label_ID[playerid]]=Text3D:-1;
	 Label_ID[playerid]=-1;
	 Label[playerid]=Text3D:-1;
		Inform(playerid,"{00ff00}You have just deleted your text label!");
	 }
	 else
	 {
	 Warn(playerid,"{ff0000}You don't have any label created!");
	 }

	return 1;
	}

	return Warn(playerid,"{ff0000}This command does not exist! {ffffff}Look at commands list! /cmd");
}

public OnPlayerSpawn(playerid)
{
	SetPlayerInterior(playerid,0);
	SetPlayerPos(playerid,BASE_PLACE_X, BASE_PLACE_Y, BASE_PLACE_Z+2);

				GameTextForPlayer(playerid, "~r~Wait! ~g~Loading objects!", 2500, 3);
			    SetPlayerTimer("Unfreeze",3000,0);
			    SetPlayerHealth(playerid,10000000);
			    SetPlayerAttachedObject(playerid, 0, 18635, 6, -0.015000, 0.015000, 0.041999, -5.900000, -12.000002, 0.000000);
			    

			    
			   

	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
   	return 1;
}



public OnPlayerRequestClass(playerid, classid)
{	SetPlayerPos(playerid,2011.0867,1357.0909,10.8203);
	SetPlayerFacingAngle(playerid, 279.5659);
	SetPlayerCameraPos(playerid,2017.8021,1356.7081,12.1);
	SetPlayerCameraLookAt(playerid,2011.0867,1357.0909,10.8203,CAMERA_MOVE);
	return 1;
}
public OnPlayerRequestSpawn(playerid)
{
	if(!IsPlayerRegistered(playerid))
	{
		SPD(playerid, DIALOGID+REG_DIALOG, DIALOG_STYLE_PASSWORD, "UCW-register", "{ff00ff}Hello! You are first time here! \n {00ff00}To continune, create a password and type it below!", "..::Ok::..", "");
		return 0;
	}
	else
	{
	    if(IsIpMatch(playerid)) Login(playerid);
	    else
		{
		SPD(playerid, DIALOGID+LOG_DIALOG, DIALOG_STYLE_PASSWORD, "UCW-login", "{ff00ff}Welcome back! Your IP had changed! \n {00ff00}To continune, type your password below!", "..::Ok::..", "");
		return 0;
		}
	}
    PlayerPlaySound(playerid,1186,0,0,0);
    HTTP(playerid, HTTP_GET, "192.168.0.101:7775", "", "PlayRadio");
    TextDrawShowForPlayer(playerid,Center);
    TextDrawShowForPlayer(playerid,Logo);
    TextDrawShowForPlayer(playerid,Tips);
	PlayerTextDrawShow(playerid,BLOCKINFO[playerid]);
    
    
	return 1;
}
public OnGameModeInit()
{
	print("\n----------------------------------");
	print("WAIT! LOADING SERVER!\n");
	print("----------------------------------\n");
	SetGameModeText("Creative•Minecraft");
	SendRconCommand("mapname Made by our players");
	SendRconCommand("hostname •• ••©Ultra Cubic World™ 0.3x•• ••");
	ShowPlayerMarkers(1);
	ShowNameTags(1);
	SetWeather(1);
	Streamer_VisibleItems(STREAMER_TYPE_OBJECT, 950);
	

Center = TextDrawCreate(330.046386, 215.041732, "|");
TextDrawLetterSize(Center, 0.415328, 2.235836);
TextDrawAlignment(Center, 2);
TextDrawColor(Center, 0xFFFFFF);
TextDrawSetShadow(Center, 0);
TextDrawSetOutline(Center, 0);
TextDrawBackgroundColor(Center, 51);
TextDrawFont(Center, 0);
TextDrawSetProportional(Center, 1);


Logo = TextDrawCreate(316.799804, 431.141510, "~b~Ultra ~h~Cubes ~h~World ~w~1.0 ~g~BETA        ~r~For more info - ~p~/help");
TextDrawLetterSize(Logo, 0.449999, 1.600000);
TextDrawTextSize(Logo, 469.000000, 644.582092);
TextDrawAlignment(Logo, 2);
TextDrawColor(Logo, -1);
TextDrawUseBox(Logo, true);
TextDrawBoxColor(Logo, 1431655850);
TextDrawSetShadow(Logo, 0);
TextDrawSetOutline(Logo, 1);
TextDrawBackgroundColor(Logo, 255);
TextDrawFont(Logo, 1);
TextDrawSetProportional(Logo, 1);


Tips = TextDrawCreate(8.011749, 219.566619, "~g~Useful keys:~n~~y~~k~~PED_DUCK~ - ~p~Switch blocks~n~~y~~k~~PED_LOCK_TARGET~ - ~p~Put block~n~~y~~k~~PED_FIREWEAPON~ - ~p~Destroy block~n~~y~~k~~VEHICLE_ENTER_EXIT~ - ~p~Disable selection~n~~y~~k~~CONVERSATION_YES~ - ~p~Rotate decoration");
TextDrawLetterSize(Tips, 0.449999, 1.600000);
TextDrawTextSize(Tips, 182.500000, -65.916694);
TextDrawAlignment(Tips, 1);
TextDrawColor(Tips, -1);
TextDrawUseBox(Tips, true);
TextDrawBoxColor(Tips, 1717985587);
TextDrawSetShadow(Tips, 0);
TextDrawSetOutline(Tips, 1);
TextDrawBackgroundColor(Tips, 286340010);
TextDrawFont(Tips, 1);
TextDrawSetProportional(Tips, 1);


	AddPlayerClass(260,BASE_PLACE_X, BASE_PLACE_Y, BASE_PLACE_Z+2,270.1425,0,0,0,0,-1,-1);

	for(new i=0; i<300;i++)
	{
	AddPlayerClass(i,BASE_PLACE_X, BASE_PLACE_Y, BASE_PLACE_Z+2,270.1425,0,0,0,0,-1,-1);
	}
	new idx;
	for(new i=0; i<2;i++)
	{
	//1 side
		idx=CreateObject(BASE_MODEL, BASE_PLACE_X + (BASE_SIZE_X*i), BASE_PLACE_Y, BASE_PLACE_Z,  0.00, 0.00, 0.00);
		SetObjectMaterial(idx, 0, BASE_TX_MODEL, BASE_TX_TXD, BASE_TX_TEXTURE, BASE_COLOR);
		if(i!=0)
		{
		idx=CreateObject(BASE_MODEL, BASE_PLACE_X - (BASE_SIZE_X*i), BASE_PLACE_Y, BASE_PLACE_Z,  0.00, 0.00, 0.00);
		SetObjectMaterial(idx, 0, BASE_TX_MODEL, BASE_TX_TXD, BASE_TX_TEXTURE, BASE_COLOR);
		}
	    
		for(new d=1;d<2;d++)
		{
		idx=CreateObject(BASE_MODEL, BASE_PLACE_X + (BASE_SIZE_X*i), BASE_PLACE_Y + (BASE_SIZE_Y*d), BASE_PLACE_Z,  0.00, 0.00, 0.00);
		SetObjectMaterial(idx, 0, BASE_TX_MODEL, BASE_TX_TXD, BASE_TX_TEXTURE, BASE_COLOR);
		idx=CreateObject(BASE_MODEL, BASE_PLACE_X + (BASE_SIZE_X*i), BASE_PLACE_Y - (BASE_SIZE_Y*d), BASE_PLACE_Z,  0.00, 0.00, 0.00);
		SetObjectMaterial(idx, 0, BASE_TX_MODEL, BASE_TX_TXD, BASE_TX_TEXTURE, BASE_COLOR);
		
		idx=CreateObject(BASE_MODEL, BASE_PLACE_X - (BASE_SIZE_X*i), BASE_PLACE_Y + (BASE_SIZE_Y*d), BASE_PLACE_Z,  0.00, 0.00, 0.00);
		SetObjectMaterial(idx, 0, BASE_TX_MODEL, BASE_TX_TXD, BASE_TX_TEXTURE, BASE_COLOR);
		idx=CreateObject(BASE_MODEL, BASE_PLACE_X - (BASE_SIZE_X*i), BASE_PLACE_Y - (BASE_SIZE_Y*d), BASE_PLACE_Z,  0.00, 0.00, 0.00);
		SetObjectMaterial(idx, 0, BASE_TX_MODEL, BASE_TX_TXD, BASE_TX_TEXTURE, BASE_COLOR);

		}
		
	

	}
	#if defined PRINT_LOADING_INFO
	print("Terrain loaded!\n");
	#endif
	
	
	switchlist = LoadMPMenu("switch.txt");
	naturelist = LoadMPMenu("nature.txt");
	woodlist = LoadMPMenu("wood.txt");
	stonelist = LoadMPMenu("stone.txt");
	fencinglist = LoadMPMenu("fencing.txt");
	decorationslist = LoadMPMenu("decorations.txt");
	plantslist = LoadMPMenu("plants.txt");
	
	
	new blocksam=0, zonesam=0, labelsam=0;


			new idtz[100],ftz[256];
   			new Float:xz, Float:yz, rz;
	for(new i=0;i<MAX_ZONES;i++)
 	{


			format(idtz,sizeof(idtz),"%d",i);

			if(dini_Isset(ZONESFILE,idtz))
			{
	
			ftz=dini_Get(ZONESFILE,idtz);

   			
   			sscanf(ftz, "ffd", xz,yz,rz);

 			SAVED_ZONE[i]=CreateDynamicCircle(xz,yz,rz);
	zonesam++;


 			#if defined PRINT_LOADING_INFO
			 printf("Loading Zones: %d",zonesam);
			 #endif
 			}
 			else
 			{
 			SAVED_ZONE[i]=-1;
			}
 	}
 	
 	#if defined PRINT_LOADING_INFO
	 print("Safe Zones loaded!\n");
	 #endif
	 
	 
	 
	 
	 
			new idtl[100],rtl[1024],ftl[256];
   			new Float:xl, Float:yl, Float: zl;
	for(new i=0;i<MAX_LABELS;i++)
 	{


			format(idtl,sizeof(idtl),"%d",i);

			if(dini_Isset(LABELSFILE,idtl))
			{

			ftl=dini_Get(LABELSFILE,idtl);
   	


   			
   			sscanf(ftl, "fffp<->s[1024]", xl,yl,zl,rtl);

 			SAVED_LABEL[i]=CreateDynamic3DTextLabel(rtl,0xFFFFFFFF, xl,yl,zl,500);
	labelsam++;


 			#if defined PRINT_LOADING_INFO
			 printf("Loading labels: %d",labelsam);
			 #endif
 			}
 			else
 			{
 			SAVED_LABEL[i]=Text3D:-1;
			}
 	}

 	#if defined PRINT_LOADING_INFO
	 print("Labels loaded!\n");
	 #endif




new string[256];
new File:objectsFile = fopen(MAPFILE, io_read);

// check if it is a valid file handle, it might crash the server if it isn't
if(objectsFile)
{
    // it's always better to declare variables outside loops
    new id, seq,Float:x, Float:y, Float:z, r,text[512];

    // we read the file line by line, first line is stored into string and so on..
    while(fread(objectsFile, string))
    {
    blocksam++;
        // we extract the contents of string into variables
        sscanf(string, "p<=>dp<;>dfffI(0)p<=>s[512]", seq,id, x, y, z, r,text);

            SAVED[seq]=CreateBlock(id, x, y, z, r);
            if(id==SIGN_ID) UpdateSignText(SAVED[seq],text);
            #if defined PRINT_LOADING_INFO
                if(blocksam%100==0)printf("Loading blocks: %d",blocksam);
            #endif


    }
    fclose(objectsFile);
}


 
 	#if defined PRINT_LOADING_INFO
	  print("Blocks loaded!\n");
	  #endif
 	
 	


	print("\n----------------------------------");
	print("Ultra Cubic World server loaded");
	printf("With %d blocks, %d safe zones, %d labels\n",blocksam,zonesam, labelsam);
	printf(" -%s aka %s",NICK,FULL_NAME);
	printf(" -%s",COPYRIGHT_DATE);
	printf(" -%s",LOCATION);
	printf(" -Skype: %s",SKYPE);
	print(" -All rights reserved\n");
	print("----------------------------------\n");

	return 1;
}



strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

CreateBlock(blockmodel,Float:x, Float:y, Float:z,rot=0)
{
	new ob;
	if(blockmodel<DECORATIONS_ID)
	{
	ob = CreateDynamicObjectEx(CUBE_MODEL[blockmodel],x,y,z, 0,0,0,900,100);
	SetDynamicObjectMaterial(ob, 0, cmodel[blockmodel], ctxd[blockmodel], ctexture[blockmodel], ccolor[blockmodel]);
	BlockX[ob]=x;
	BlockY[ob]=y;
	BlockZ[ob]=z;
	}
	else
	{
	if(DECO_MODEL[blockmodel-DECORATIONS_ID]==DOOR_1 || DECO_MODEL[blockmodel-DECORATIONS_ID]==DOOR_2) return CreateDoor(blockmodel,x,y,z,rot);
	if(DECO_MODEL[blockmodel-DECORATIONS_ID]==SIGN) return CreateSign(blockmodel,x,y,z,rot);
	if(rot==0) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x+DECO_X_INDEX[blockmodel-DECORATIONS_ID],y+DECO_Y_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);
	if(rot==90) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x-DECO_Y_INDEX[blockmodel-DECORATIONS_ID],y+DECO_X_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);
	
	if(rot==180) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x-DECO_X_INDEX[blockmodel-DECORATIONS_ID],y-DECO_Y_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);
	if(rot==270) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x+DECO_Y_INDEX[blockmodel-DECORATIONS_ID],y-DECO_X_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);
	BlockX[ob]=x;
	BlockY[ob]=y;
	BlockZ[ob]=z;
	}
	BlockAdd[ob]=-1;
	
	
	return ob;
}

CreateDoor(blockmodel,Float:x,Float:y,Float:z,rot=0)
{
	new ob,dob[4];

	if(rot==0) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x+DECO_X_INDEX[blockmodel-DECORATIONS_ID],y+DECO_Y_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);
	if(rot==90) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x-DECO_Y_INDEX[blockmodel-DECORATIONS_ID],y+DECO_X_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);

	if(rot==180) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x-DECO_X_INDEX[blockmodel-DECORATIONS_ID],y-DECO_Y_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);
	if(rot==270) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x+DECO_Y_INDEX[blockmodel-DECORATIONS_ID],y-DECO_X_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);
	
	if(rot==0)
	{
	dob[0] = CreateDynamicObjectEx(DOOR_RAM_MODEL,x+DECO_X_INDEX[blockmodel-DECORATIONS_ID]+DOOR_RIGHT_X,y+DECO_Y_INDEX[blockmodel-DECORATIONS_ID]+DOOR_RIGHT_Y,z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID]+DOOR_RIGHT_Z, DOOR_RIGHT_ROT_X,DOOR_RIGHT_ROT_Y,DOOR_RIGHT_ROT_Z+rot,900,100);
	}
	
	if(rot==90)
	{
	dob[0] = CreateDynamicObjectEx(DOOR_RAM_MODEL,x-DECO_Y_INDEX[blockmodel-DECORATIONS_ID]-DOOR_RIGHT_Y,y+DECO_X_INDEX[blockmodel-DECORATIONS_ID]+DOOR_RIGHT_X,z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID]+DOOR_RIGHT_Z, DOOR_RIGHT_ROT_X,DOOR_RIGHT_ROT_Y,DOOR_RIGHT_ROT_Z+rot,900,100);
   }
	
	if(rot==180)
	{
	dob[0] = CreateDynamicObjectEx(DOOR_RAM_MODEL,x-DECO_X_INDEX[blockmodel-DECORATIONS_ID]-DOOR_RIGHT_X,y-DECO_Y_INDEX[blockmodel-DECORATIONS_ID]-DOOR_RIGHT_Y,z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID]+DOOR_RIGHT_Z, DOOR_RIGHT_ROT_X,DOOR_RIGHT_ROT_Y,DOOR_RIGHT_ROT_Z+rot,900,100);
	}
	
	if(rot==270)
	{
	dob[0] = CreateDynamicObjectEx(DOOR_RAM_MODEL,x+DECO_Y_INDEX[blockmodel-DECORATIONS_ID]+DOOR_RIGHT_Y,y-DECO_X_INDEX[blockmodel-DECORATIONS_ID]-DOOR_RIGHT_X,z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID]+DOOR_RIGHT_Z, DOOR_RIGHT_ROT_X,DOOR_RIGHT_ROT_Y,DOOR_RIGHT_ROT_Z+rot,900,100);
  }
	
	BlockX[ob]=x;
	BlockY[ob]=y;
	BlockZ[ob]=z;
	BlockAdd[ob]=dob[0];
	return ob;
}

CreateSign(blockmodel,Float:x,Float:y,Float:z,rot=0)
{
	new ob,dob[4];

	if(rot==0) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x+DECO_X_INDEX[blockmodel-DECORATIONS_ID],y+DECO_Y_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);
	if(rot==90) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x-DECO_Y_INDEX[blockmodel-DECORATIONS_ID],y+DECO_X_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);

	if(rot==180) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x-DECO_X_INDEX[blockmodel-DECORATIONS_ID],y-DECO_Y_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);
	if(rot==270) ob = CreateDynamicObjectEx(DECO_MODEL[blockmodel-DECORATIONS_ID],x+DECO_Y_INDEX[blockmodel-DECORATIONS_ID],y-DECO_X_INDEX[blockmodel-DECORATIONS_ID],z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID], 0,0,rot,900,100);

	if(rot==0)
	{
	dob[0] = CreateDynamicObjectEx(SIGN_RAM_MODEL,x+DECO_X_INDEX[blockmodel-DECORATIONS_ID]+SIGN_RIGHT_X,y+DECO_Y_INDEX[blockmodel-DECORATIONS_ID]+SIGN_RIGHT_Y,z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID]+SIGN_RIGHT_Z, SIGN_RIGHT_ROT_X,SIGN_RIGHT_ROT_Y,SIGN_RIGHT_ROT_Z+rot,900,100);
	}

	if(rot==90)
	{
	dob[0] = CreateDynamicObjectEx(SIGN_RAM_MODEL,x-DECO_Y_INDEX[blockmodel-DECORATIONS_ID]-SIGN_RIGHT_Y,y+DECO_X_INDEX[blockmodel-DECORATIONS_ID]+SIGN_RIGHT_X,z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID]+SIGN_RIGHT_Z, SIGN_RIGHT_ROT_X,SIGN_RIGHT_ROT_Y,SIGN_RIGHT_ROT_Z+rot,900,100);
 	}

	if(rot==180)
	{
	dob[0] = CreateDynamicObjectEx(SIGN_RAM_MODEL,x-DECO_X_INDEX[blockmodel-DECORATIONS_ID]-SIGN_RIGHT_X,y-DECO_Y_INDEX[blockmodel-DECORATIONS_ID]-SIGN_RIGHT_Y,z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID]+SIGN_RIGHT_Z, SIGN_RIGHT_ROT_X,SIGN_RIGHT_ROT_Y,SIGN_RIGHT_ROT_Z+rot,900,100);
	}

	if(rot==270)
	{
	dob[0] = CreateDynamicObjectEx(SIGN_RAM_MODEL,x+DECO_Y_INDEX[blockmodel-DECORATIONS_ID]+SIGN_RIGHT_Y,y-DECO_X_INDEX[blockmodel-DECORATIONS_ID]-SIGN_RIGHT_X,z+DECO_Z_INDEX[blockmodel-DECORATIONS_ID]+SIGN_RIGHT_Z, SIGN_RIGHT_ROT_X,SIGN_RIGHT_ROT_Y,SIGN_RIGHT_ROT_Z+rot,900,100);
   	}
   	
   	SetDynamicObjectMaterialText(dob[0],0,"Blank sign",OBJECT_MATERIAL_SIZE_256x128,"Arial",36,1,0xFF000000,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	BlockX[ob]=x;
	BlockY[ob]=y;
	BlockZ[ob]=z;
	BlockAdd[ob]=dob[0];
	return ob;
}


DestroyBlock(blockid)
{
	DestroyDynamicObject(blockid);
	BlockX[blockid]=0;
	BlockY[blockid]=0;
	BlockZ[blockid]=0;
	DestroyDynamicObject(BlockAdd[blockid]);
	BlockAdd[blockid]=-1;
}

UpdateSignText(blockid,text[]="Blank sign")
{
	new size;
   	if(strlen(text)>0) size=36;
   	if(strlen(text)>15) size=28;
   	if(strlen(text)>20) size=20;
SetDynamicObjectMaterialText(BlockAdd[blockid],0,text,OBJECT_MATERIAL_SIZE_256x128,"Arial",size,1,0xFF000000,0,OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
}

DisableBlock(playerid)
{
			 BlockHold[playerid]=0;

			 BlockID[playerid]=-1;

			 return 1;
}

FindClosestVal(Float:val,Float:toval, &Float:fval)
{
	new a=0;
	new Float:x=0, Float:x2=0;
	new Float: val2=val*100;
	new val3=floatround(val2,floatround_round);
	new val31=val3;

	new Float:val4=toval*100;

	new val5=floatround(val4,floatround_round);

	while (a==0)
	{
		x= val3 % val5;
		x2= val31 % val5;

		if(x==0) a=1;
		if(x2==0) a=2;
		if(x2!=0 && x!=0) a=0,val3=val3+1,val31=val31-1;
	}
	if(a==1) fval=float(val3);
	if(a==2) fval=float(val31);
	fval=fval/100;

	return 1;
}

forward PlayRadio(playerid, response_code, const data[]);
public PlayRadio(playerid, response_code, const data[])
{

    if(response_code == 200) 
    {
     
        PlayAudioStreamForPlayer(playerid,"http://ultrabee.dlinkddns.com:7775/live");
        SendClientMessage(playerid, 0xFFFFFFFF,"{00ff00}Our radio is online! You started to listen to it!");
    }
    else
    {
        
        SendClientMessage(playerid, 0xFFFFFFFF,"{ff0000}Our radio is offline! {00ff00}We are sorry :(");
    }
}

GetXYInFrontOfPlayer(playerid, &Float:XP, &Float:YP, &Float:ZP, Float:distance)
{
 		new
			Float:fPX, Float:fPY, Float:fPZ,
			Float:fVX, Float:fVY, Float:fVZ;

	
		GetPlayerCameraPos(playerid, fPX, fPY, fPZ);
		GetPlayerCameraFrontVector(playerid, fVX, fVY, fVZ);
	 
		ZP = fPZ + floatmul(fVZ, distance);
		XP = fPX + floatmul(fVX, distance);
		YP = fPY + floatmul(fVY, distance);

		if(ZP<CUBE_SIZE_HEIGH*KOEF)
		{
			new Float: k = (CUBE_SIZE_HEIGH*KOEF)/ZP;
		 	ZP=CUBE_SIZE_HEIGH*KOEF;
		 	if(k>=0)
		 	{
		 	XP = fPX + floatmul(fVX, distance)/k;
		 	YP = fPY + floatmul(fVY, distance)/k;
		 	}
		 	if(k<0)
		 	{
		 	XP = fPX + floatmul(fVX, distance)/(-k);
		 	YP = fPY + floatmul(fVY, distance)/(-k);
		 	}
	 	}


}

stock abs( value )
{
   return ( ( value < 0 ) ? ( -value ) : ( value ) );
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
        
	if(PRESSED(BUTTON_SWITCH))
	{
		CallLocalFunction( "OnPlayerCommandText", "ds", playerid,"/switch");
    new act=GetPlayerSpecialAction(playerid);
		ClearAnimations(playerid);
		SetPlayerSpecialAction(playerid,act);
	}
	


	
	if(PRESSED(BUTTON_DISABLE))
	{
	    if(BlockHold[playerid]==1)
	    {
		DisableBlock(playerid);
	PlayerPlaySound(playerid, 1138, 0.0, 0.0, 0.0);
	RotDec[playerid]=0;
		}
	}
	
	if(PRESSED(BUTTON_PUT))
	{
	    if(BlockHold[playerid]==1)
	    {
	    if(PutFlood[playerid]==1) return 1;
	    	if(IsPlayerInRangeOfPoint(playerid, 10.0, BASE_PLACE_X, BASE_PLACE_Y, BASE_PLACE_Z)) return Warn(playerid,"{ff0000}You can't build so close to spawn");
	    PlayerPlaySound(playerid,6400,0,0,0);
		SetTimerEx("PutBlockFromPlayer",400,0,"d",playerid);
		SetPlayerTimer("ClearPutFlood",PUT_FLOOD_SECONDS,0);
		PutFlood[playerid]=1;

		}
	}
	
	if(PRESSED(BUTTON_DESTROY))
	{
		if(DesFlood[playerid]==1) return 1;
	    PlayerPlaySound(playerid,6400,0,0,0);
		SetTimerEx("DestroyBlockFromPlayer",400,0,"d",playerid);
		SetPlayerTimer("ClearDesFlood",DES_FLOOD_SECONDS,0);
		DesFlood[playerid]=1;
	}

	if(PRESSED(BUTTON_ROTATE))
	{
	    
	    if(BlockID[playerid]<DECORATIONS_ID) return Warn(playerid,"{ff0000}You haven't choosen the decoration!");
	    PlayerPlaySound(playerid,4202,0,0,0);
  		RotDec[playerid]=RotDec[playerid]+90;
  		if(RotDec[playerid]>=360) RotDec[playerid]=0;
  		format(stringu,sizeof(stringu),"{00ff00}You have changed the decoration rotation to %d",RotDec[playerid]);
 		SendClientMessage(playerid, 0xFFFFFFFF,stringu);

	}
	return 1;
}

public OnDialogResponse(playerid,dialogid,response,listitem,inputtext[])
{
	switch(dialogid)
	{
	    case DIALOGID+REG_DIALOG:
	    {
	        if(response)
	        {
				if(strlen(inputtext)<=0 || strlen(inputtext)>32) return SPD(playerid, DIALOGID+REG_DIALOG, DIALOG_STYLE_PASSWORD, "UCW-register", "{ff0000}Password should have from 1 to 32 characters!", "..::Ok::..", "");
				Register(playerid,inputtext);
	        }
	        if(!response) return SPD(playerid, DIALOGID+REG_DIALOG, DIALOG_STYLE_PASSWORD, "UCW-register", "{ff0000}You have to register if you want to play here!", "..::Ok::..", "");
	    }
	    case DIALOGID+LOG_DIALOG:
	    {
	        if(response)
	        {
				if(!IsPasswordMatch(playerid,inputtext)) return SPD(playerid, DIALOGID+LOG_DIALOG, DIALOG_STYLE_PASSWORD, "UCW-lgoin", "{ff0000}You have typed a wrong password! Try again!", "..::Ok::..", "");
				Login(playerid);
	        }
	        if(!response) return SPD(playerid, DIALOGID+LOG_DIALOG, DIALOG_STYLE_PASSWORD, "UCW-login", "{ff0000}You have to type your password if you want to play here!", "..::Ok::..", "");
	    }
	    case DIALOGID+1:
	    {
	        if(response)
	        {
				if(strlen(inputtext)<=0) return SPD(playerid,DIALOGID+1,DIALOG_STYLE_INPUT,"Sign","{ff0000}You didn't type anything!","..::Ok::..","..::No::..");
				UpdateSignText(LastBlock[playerid][0],inputtext);
				new idt[100],ft[256];
				format(idt,sizeof(idt),"%d",LastBlock[playerid][1]);
				ft=dini_Get(MAPFILE,idt);
				format(ft,sizeof(ft),"%s %s",ft,inputtext);
				dini_Set(MAPFILE,idt,ft);
	        }
	        else
	        {
				UpdateSignText(LastBlock[playerid][0],"Blank sign");
				new idt[100],ft[256];
				format(idt,sizeof(idt),"%d",LastBlock[playerid][1]);
				ft=dini_Get(MAPFILE,idt);
				format(ft,sizeof(ft),"%s Blank sign",ft);
				dini_Set(MAPFILE,idt,ft);
	        }
	    }
	}
	return 1;
}
public OnPlayerEnterDynamicArea(playerid,areaid)
{
	if(areaid==Zone[playerid][0]) Inform(playerid,"{00ff00}You have just entered your own safe zone!");
	else Inform(playerid,"{ffff00}You have just entered someone's safe zone!");
	return 1;
}

forward Unfreeze(playerid);
public Unfreeze(playerid)
{
TogglePlayerControllable(playerid,1);
PlayerPlaySound(playerid,1137 ,0.0,0.0,0.0);
GameTextForPlayer(playerid, "~b~Done!", 2000, 3);
CallLocalFunction( "OnPlayerCommandText", "ds", playerid,"/switch");
}

IsThereAnyBlock(Float:x,Float:y,Float:z)
{
				new a=0;
				for(new i=0;i<MAX_BLOCKS;i++)
			 	{
				 			if(BlockX[i]==x && BlockY[i]==y && BlockZ[i]==z) a=1;
				 			
				}
				return a;
}

public OnMPMenuResponse(playerid, response, listid, modelid,listitem)
{
 
    if(listid == switchlist)
    {
        if(response)
        {
		 if(listitem == 0) return ShowMPMenu(playerid, naturelist, "~y~Switch blocks",nnames,8,   0xc8c6bf44,  0xDBC77E77 ,   0xF4B81BAA);
		 if(listitem == 1) return ShowMPMenu(playerid, woodlist, "~y~Switch blocks",wnames,7,   0xc8c6bf44,  0xDBC77E77 ,   0xF4B81BAA);
		 if(listitem == 2) return ShowMPMenu(playerid, stonelist, "~y~Switch blocks",snames,7,   0xc8c6bf44,  0xDBC77E77 ,   0xF4B81BAA);
		 if(listitem == 3) return ShowColorMPMenu(playerid, colcolors, 9, "~y~Switch blocks", colorlist, colnames,   0xc8c6bf44,  0xDBC77E77 ,   0xF4B81BAA);
		 if(listitem == 4) return ShowColorMPMenu(playerid, gcolors, 9, "~y~Switch blocks", glasslist, gnames,   0xc8c6bf44,  0xDBC77E77 ,   0xF4B81BAA);
		 if(listitem == 5) return ShowMPMenu(playerid, fencinglist, "~y~Switch blocks",fnames,3,   0xc8c6bf44,  0xDBC77E77 ,   0xF4B81BAA);
		 if(listitem == 6) return ShowMPMenu(playerid, decorationslist, "~y~Switch blocks",dnames,15,   0xc8c6bf44,  0xDBC77E77 ,   0xF4B81BAA);
		 if(listitem == 7) return ShowMPMenu(playerid, plantslist, "~y~Switch blocks",pnames,12,   0xc8c6bf44,  0xDBC77E77 ,   0xF4B81BAA);

		 if(listitem == 8)
		 {
			DisableBlock(playerid);
		 }

        }
   }
   
   if(listid == naturelist)
    {
        if(response)
        {
        	PlayerPlaySound(playerid,1150,0,0,0);
            if(listitem==0)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=0;
			}
            if(listitem==1)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=1;
			}
            if(listitem==2)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=2;
			}
            if(listitem==3)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	       
			BlockHold[playerid]=1;
			BlockID[playerid]=3;
			}
            if(listitem==4)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=4;
			}
            if(listitem==5)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	      
			BlockHold[playerid]=1;
			BlockID[playerid]=5;
			}
            if(listitem==6)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	      
			BlockHold[playerid]=1;
			BlockID[playerid]=6;
			}
            if(listitem==7)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	      
			BlockHold[playerid]=1;
			BlockID[playerid]=17;
			}

	        
        }
        else
        {
        CallLocalFunction( "OnPlayerCommandText", "ds", playerid,"/switch");
        }
   }
   
   if(listid == woodlist)
    {
        if(response)
        {
        	PlayerPlaySound(playerid,1150,0,0,0);
            if(listitem==0)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	      
			BlockHold[playerid]=1;
			BlockID[playerid]=7;
			}
            if(listitem==1)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	  
			BlockHold[playerid]=1;
			BlockID[playerid]=8;
			}
            if(listitem==2)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=9;
			}
			
			
            if(listitem==3)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);

			BlockHold[playerid]=1;
			BlockID[playerid]=18;
			}
            if(listitem==4)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=19;
			}
            if(listitem==5)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	    
			BlockHold[playerid]=1;
			BlockID[playerid]=20;
			}
            if(listitem==6)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	       
			BlockHold[playerid]=1;
			BlockID[playerid]=21;
			}


        }
        else
        {
        CallLocalFunction( "OnPlayerCommandText", "ds", playerid,"/switch");
        }
   }
   if(listid == stonelist)
    {
        if(response)
        {
        	PlayerPlaySound(playerid,1150,0,0,0);
            if(listitem==0)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	      
			BlockHold[playerid]=1;
			BlockID[playerid]=10;
			}
            if(listitem==1)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=11;
			}
            if(listitem==2)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	     
			BlockHold[playerid]=1;
			BlockID[playerid]=12;
			}
            if(listitem==3)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=13;
			}
            if(listitem==4)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=14;
			}
            if(listitem==5)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	       
			BlockHold[playerid]=1;
			BlockID[playerid]=15;
			}
            if(listitem==6)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);

			BlockHold[playerid]=1;
			BlockID[playerid]=16;
			}


        }
        else
        {
        CallLocalFunction( "OnPlayerCommandText", "ds", playerid,"/switch");
        }
   }


    if(listid == fencinglist)
    {
        if(response)
        {
        	PlayerPlaySound(playerid,1150,0,0,0);
            if(listitem==0)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	      
			BlockHold[playerid]=1;
			BlockID[playerid]=39;
			}
            if(listitem==1)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	      
			BlockHold[playerid]=1;
			BlockID[playerid]=40;
			}
            if(listitem==2)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=41;
			}




        }
        else
        {
        CallLocalFunction( "OnPlayerCommandText", "ds", playerid,"/switch");
        }
   }
    if(listid == decorationslist)
    {
        if(response)
        {
        	PlayerPlaySound(playerid,1150,0,0,0);
            if(listitem==0)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+0;
			}
            if(listitem==1)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+1;
			}
            if(listitem==2)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+2;
			}
            if(listitem==3)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+3;
			}
            if(listitem==4)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+4;
			}
            if(listitem==5)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+5;
			}
            if(listitem==6)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+6;
			}
            if(listitem==7)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+7;
			}
            if(listitem==8)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+8;
			}
            if(listitem==9)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+9;
			}
            if(listitem==10)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+10;
			}
            if(listitem==11)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+11;
			}
            if(listitem==12)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+12;
			}
            if(listitem==13)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+13;
			}
            if(listitem==14)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+14;
			}


        }
        else
        {
        CallLocalFunction( "OnPlayerCommandText", "ds", playerid,"/switch");
        }
   }
    if(listid == plantslist)
    {
        if(response)
        {
        	PlayerPlaySound(playerid,1150,0,0,0);
            if(listitem==0)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+15;
			}
            if(listitem==1)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+16;
			}
            if(listitem==2)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+17;
			}
            if(listitem==3)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+18;
			}
            if(listitem==4)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+19;
			}
            if(listitem==5)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+20;
			}
            if(listitem==6)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+21;
			}
            if(listitem==7)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+22;
			}
            if(listitem==8)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+23;
			}
            if(listitem==9)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+24;
			}
            if(listitem==10)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+25;
			}
            if(listitem==11)
            {
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);

			BlockHold[playerid]=1;
			BlockID[playerid]=DECORATIONS_ID+26;
			}

        }
        else
        {
        CallLocalFunction( "OnPlayerCommandText", "ds", playerid,"/switch");
        }
   }
    return 1;
}
public OnDynamicMPMenuResponse(playerid, response, extraid, modelid, listitem)
{
   if(extraid == colorlist)
    {
        if(response)
        {
        	PlayerPlaySound(playerid,1150,0,0,0);
            if(listitem==0)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);

			BlockHold[playerid]=1;
			BlockID[playerid]=22;
			}
            if(listitem==1)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);

			BlockHold[playerid]=1;
			BlockID[playerid]=23;
			}
            if(listitem==2)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);

			BlockHold[playerid]=1;
			BlockID[playerid]=24;
			}
            if(listitem==3)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);

			BlockHold[playerid]=1;
			BlockID[playerid]=25;
			}
            if(listitem==4)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);

			BlockHold[playerid]=1;
			BlockID[playerid]=26;
			}
            if(listitem==5)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);

			BlockHold[playerid]=1;
			BlockID[playerid]=27;
			}
            if(listitem==6)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=28;
			}
            if(listitem==7)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	    
			BlockHold[playerid]=1;
			BlockID[playerid]=29;
			}
            if(listitem==8)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);

			BlockHold[playerid]=1;
			BlockID[playerid]=30;
			}


        }
        else
        {
        CallLocalFunction( "OnPlayerCommandText", "ds", playerid,"/switch");
        }
   }
    if(extraid == glasslist)
    {
        if(response)
        {
        	PlayerPlaySound(playerid,1150,0,0,0);
            if(listitem==0)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	      
			BlockHold[playerid]=1;
			BlockID[playerid]=31;
			}
            if(listitem==1)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=32;
			}
            if(listitem==2)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	       
			BlockHold[playerid]=1;
			BlockID[playerid]=33;
			}
            if(listitem==3)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=34;
			}
            if(listitem==4)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	  
			BlockHold[playerid]=1;
			BlockID[playerid]=35;
			}
            if(listitem==5)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	       
			BlockHold[playerid]=1;
			BlockID[playerid]=36;
			}
            if(listitem==6)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	        
			BlockHold[playerid]=1;
			BlockID[playerid]=37;
			}
            if(listitem==7)
            {
	        new Float:x, Float:y,Float:z;
		 	if(BlockHold[playerid]==1) DisableBlock(playerid);
	        GetPlayerPos(playerid,x,y,z);
	        GetXYInFrontOfPlayer(playerid, x, y,z, SCALE);
	       
			BlockHold[playerid]=1;
			BlockID[playerid]=38;
			}



        }
        else
        {
        CallLocalFunction( "OnPlayerCommandText", "ds", playerid,"/switch");
        }
   }
	return 1;
}

forward UpdateCubes(i);
public UpdateCubes(i)
{
if(BlockID[i] != -1)
{
 	if(BlockID[i]<DECORATIONS_ID) format(stringu, sizeof(stringu), "~w~Selected block:~n~~p~~h~~h~%s",CUBE_NAME[BlockID[i]]);
 	else format(stringu, sizeof(stringu), "~w~Selected decoration:~n~~p~~h~~h~%s",DECO_NAME[BlockID[i]-DECORATIONS_ID]);
}
else format(stringu, sizeof(stringu), "~w~Selected block:~n~~p~~h~~h~None");
PlayerTextDrawSetString(i,BLOCKINFO[i],stringu);
    return 1;
}
	
	forward DestroyEffect(e);
	public DestroyEffect(e)
	{
	DestroyDynamicObject(e);
	return 1;
	}

forward ClearPutFlood(playerid);
public ClearPutFlood(playerid)
{
 PutFlood[playerid]=0;
}

forward ClearDesFlood(playerid);
public ClearDesFlood(playerid)
{
 DesFlood[playerid]=0;
}
forward PutBlockFromPlayer(playerid);
public PutBlockFromPlayer(playerid)
{
	    
     		new Float:x, Float:y,Float:z;
     		new Float:x2, Float:y2, Float:z2;
     		new Float:x3, Float:y3, Float:z3;
     		new blockidx;
			new ft[256],idt[100];
	        GetPlayerPos(playerid,x,y,z);

	        new SCALENEW=MIN_SCALE;
			new sc=0;
			while(sc==0)
			{
			        GetXYInFrontOfPlayer(playerid, x, y,z, SCALENEW);
			        FindClosestVal(x,CUBE_SIZE_WIDE,x2);
			        FindClosestVal(y,CUBE_SIZE_WIDE,y2);
			        FindClosestVal(z,CUBE_SIZE_HEIGH,z2);
					if(!IsThereAnyBlock(x2,y2,z2)) x3=x2,y3=y2,z3=z2,sc=0,SCALENEW++;
					if(IsThereAnyBlock(x2,y2,z2) || SCALENEW>=SCALE) sc=1;
			}
			if(x3==0 && y3==0 && z3==0) return 1;
   			if(IsPlayerInRangeOfPoint(playerid, 1.0, x3, y3, z3)) return PlayerPlaySound(playerid,1150,0,0,0);
			if(IsPointInAnyDynamicArea(x3,y3,z3))
	        {
	        if(!IsPointInDynamicArea(Zone[playerid][0], x3,y3,z3)) return Warn(playerid,"{ff0000}This area is protected by /safe! You can't build here!");
	        }


			PlayerPlaySound(playerid,1135,0,0,0);

			new d=0;
			new idrd=0;
			while (d==0)
			{
				idrd++;

    			if(SAVED[idrd]!=0) d=0;
    			else d=1, blockidx=idrd;
			}
			format(idt,sizeof(idt),"%d",blockidx);
			format(ft,sizeof(ft),"%d %f %f %f %d",BlockID[playerid],x3,y3,z3,RotDec[playerid]);
			dini_Set(MAPFILE,idt,ft);



 			if(BlockID[playerid]<DECORATIONS_ID) SAVED[blockidx]=CreateBlock(BlockID[playerid], x3,y3,z3);
 			else SAVED[blockidx]=CreateBlock(BlockID[playerid], x3,y3,z3,RotDec[playerid]);
 			
	LastBlock[playerid][0]=SAVED[blockidx];
	LastBlock[playerid][1]=blockidx;

			if(BlockID[playerid]==SIGN_ID)
			{
			SPD(playerid,DIALOGID+1,DIALOG_STYLE_INPUT,"Sign","{00ff00}Type a text for a sign here","..::Ok::..","..::No::..");
			}

			Streamer_Update(playerid);
			RotDec[playerid]=0;
			return 1;

}

forward DestroyBlockFromPlayer(playerid);
public DestroyBlockFromPlayer(playerid)
{
     		new Float:x, Float:y,Float:z;
     		new Float:x2, Float:y2, Float: z2;
	        GetPlayerPos(playerid,x,y,z);
	        for(new SCALENEW=MIN_SCALE_DES;SCALENEW<SCALE;SCALENEW++)
	        {
		        GetXYInFrontOfPlayer(playerid, x, y, z, SCALENEW);
		        FindClosestVal(x,CUBE_SIZE_WIDE,x2);
		        FindClosestVal(y,CUBE_SIZE_WIDE,y2);
		        FindClosestVal(z,CUBE_SIZE_HEIGH,z2);
			if(IsPointInAnyDynamicArea(x2,y2,z2))
	        {
	        if(!IsPointInDynamicArea(Zone[playerid][0], x2,y2,z2)) return Warn(playerid,"{ff0000}This area is protected by /safe! You can't build here!");
	        }
				for(new i=0;i<MAX_BLOCKS;i++)
			 	{
				 			if(BlockX[i]==x2 && BlockY[i]==y2 && z2==BlockZ[i])
				 			{
			   					DestroyBlock(i);
			   					CreateExplosion(x2, y2, z2, 12, 5.0);
							    new bid;
							    new r=0,rd=0;
				                while(r == 0)
				                {
					                if(SAVED[rd]==i)  bid=rd,r=1;
					                else rd++,r=0;
				                }
								new idt[100];
		                        format(idt,sizeof(idt),"%d",bid);

								SAVED[bid]=0;
								dini_Unset(MAPFILE,idt);
								
								return 1;
								
				 			}

			 	}

			}
			return 1;
}


Register(playerid,password[])
{
    PlayerPlaySound(playerid,1185,0,0,0);
	new file[256];
	new year,day,month,ip[256],pass[512];
  GetPlayerName(playerid, pname, sizeof(pname));
  format(file,sizeof(file),USERFILE,pname);
  dini_Create(file);
  getdate(year,month,day);
  format(stringu,sizeof(stringu),"%d/%d/%d",day,month,year);
  dini_Set(file,"REGISTRATION_DATE",stringu);
  GetPlayerIp(playerid,ip,sizeof(ip));
  dini_Set(file,"IP",ip);
  pass=HashPass(password);
  dini_Set(file,"PASSWORD",pass);
  SendClientMessage(playerid, 0xFFFFFFFF,"{ffffff}You have successfully registered! {00ff00}Enjoy the game!");
  Login(playerid);
  
}
Login(playerid)
{
    PlayerPlaySound(playerid,1185,0,0,0);
	new file[256];
	new ip[256];
  GetPlayerName(playerid, pname, sizeof(pname));
  format(file,sizeof(file),USERFILE,pname);
  GetPlayerIp(playerid,ip,sizeof(ip));
  dini_Set(file,"IP",ip);
  if(dini_Isset(file,"SAFE_ZONE")) Zone[playerid][1]=dini_Int(file,"SAFE_ZONE"),Zone[playerid][0]=SAVED_ZONE[Zone[playerid][1]];
  if(dini_Isset(file,"SAFE_LABEL")) Label_ID[playerid]=dini_Int(file,"SAFE_LABEL"),Label[playerid]=SAVED_LABEL[Label_ID[playerid]];
  SendClientMessage(playerid, 0xFFFFFFFF,"{ffffff}You have successfully logged in!");
}
IsPlayerRegistered(playerid)
{
	new file[256];
  GetPlayerName(playerid, pname, sizeof(pname));
  format(file,sizeof(file),USERFILE,pname);
  if(dini_Exists(file)) return 1;
  else return 0;
}
IsIpMatch(playerid)
{
	new file[256];
	new ip[256];
  GetPlayerName(playerid, pname, sizeof(pname));
  format(file,sizeof(file),USERFILE,pname);
  GetPlayerIp(playerid,ip,sizeof(ip));
  if(!strcmp(ip, dini_Get(file,"IP"), true)) return 1;
  else return 0;
}
IsPasswordMatch(playerid,password[])
{
	new file[256];
	new pass[512];
  GetPlayerName(playerid, pname, sizeof(pname));
  format(file,sizeof(file),USERFILE,pname);

  pass=HashPass(password);
  if(!strcmp(pass,dini_Get(file,"PASSWORD"))) return 1;
  else return 0;
}
Warn(playerid,text[])
{
SendClientMessage(playerid,0xFF0000,text);
PlayerPlaySound(playerid,1150,0,0,0);
return 1;
}
Inform(playerid,text[])
{
SendClientMessage(playerid,0xFF0000,text);
PlayerPlaySound(playerid,1058,0,0,0);
return 1;
}

stock HashPass(text[])
{
    new buf[129];
    WP_Hash(buf, sizeof (buf), text);
    return buf;
}

stock IsNumeric(line[]){
  for(new i=0, j=strlen(line); i<j; i++){
    if(line[i]>'9' || line[i]<'0') return 0;}
  return 1;}
