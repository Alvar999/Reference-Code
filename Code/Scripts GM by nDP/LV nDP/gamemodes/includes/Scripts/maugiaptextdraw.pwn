new Text:Health[MAX_PLAYERS];
new Text:Armour[MAX_PLAYERS];
new Text:MauGiap[6];

//
forward vitals(playerid);
public vitals(playerid)
{
	new string[5];
	new Float:pHealth, Float:pArmour;
	GetPlayerHealth(playerid,pHealth);
	GetPlayerArmour(playerid,pArmour);
	format(string, sizeof(string), "%.0f%", pArmour);
	TextDrawSetString(MauGiap[3][playerid], string);
	format(string, sizeof(string), "%.0f%", pHealth);
	TextDrawSetString(MauGiap[5][playerid], string); // CMND[22][playerid], string
}
//

MauGiap[0][i] = TextDrawCreate(546.999938, 67.214828, "box");
TextDrawLetterSize(MauGiap[0][i], 0.000000, 0.833333);
TextDrawTextSize(MauGiap[0][i], 608.000000, 0.000000);
TextDrawAlignment(MauGiap[0][i], 1);
TextDrawColor(MauGiap[0][i], -1);
TextDrawUseBox(MauGiap[0][i], 1);
TextDrawBoxColor(MauGiap[0][i], 255);
TextDrawSetShadow(MauGiap[0][i], 0);
TextDrawSetOutline(MauGiap[0][i], 0);
TextDrawBackgroundColor(MauGiap[0][i], 255);
TextDrawFont(MauGiap[0][i], 2);
TextDrawSetProportional(MauGiap[0][i], 1);
TextDrawSetShadow(MauGiap[0][i], 0);

MauGiap[1][i] = TextDrawCreate(546.999877, 51.451873, "box");
TextDrawLetterSize(MauGiap[1][i], 0.000000, 0.833333);
TextDrawTextSize(MauGiap[1][i], 608.000000, 0.000000);
TextDrawAlignment(MauGiap[1][i], 1);
TextDrawColor(MauGiap[1][i], -1);
TextDrawUseBox(MauGiap[1][i], 1);
TextDrawBoxColor(MauGiap[1][i], 255);
TextDrawSetShadow(MauGiap[1][i], 0);
TextDrawSetOutline(MauGiap[1][i], 0);
TextDrawBackgroundColor(MauGiap[1][i], 255);
TextDrawFont(MauGiap[1][i], 2);
TextDrawSetProportional(MauGiap[1][i], 1);
TextDrawSetShadow(MauGiap[1][i], 0);

MauGiap[2][i] = TextDrawCreate(546.000061, 47.303676, "GIAP"); // GIAP
TextDrawLetterSize(MauGiap[2][i], 0.259666, 1.591703);
TextDrawAlignment(MauGiap[2][i], 1);
TextDrawColor(MauGiap[2][i], -1);
TextDrawSetShadow(MauGiap[2][i], 0);
TextDrawSetOutline(MauGiap[2][i], 0);
TextDrawBackgroundColor(MauGiap[2][i], 255);
TextDrawFont(MauGiap[2][i], 2);
TextDrawSetProportional(MauGiap[2][i], 1);
TextDrawSetShadow(MauGiap[2][i], 0);

MauGiap[3][i] = TextDrawCreate(577.333557, 47.303707, "100"); // Giap
TextDrawLetterSize(MauGiap[3][i], 0.400000, 1.600000);
TextDrawAlignment(MauGiap[3][i], 1);
TextDrawColor(MauGiap[3][i], -1);
TextDrawSetShadow(MauGiap[3][i], 0);
TextDrawSetOutline(MauGiap[3][i], 0);
TextDrawBackgroundColor(MauGiap[3][i], 255);
TextDrawFont(MauGiap[3][i], 2);
TextDrawSetProportional(MauGiap[3][i], 1);
TextDrawSetShadow(MauGiap[3][i], 0);

MauGiap[4][i] = TextDrawCreate(546.333374, 63.066619, "MAU");
TextDrawLetterSize(MauGiap[4][i], 0.259666, 1.591703);
TextDrawAlignment(MauGiap[4][i], 1);
TextDrawColor(MauGiap[4][i], -1);
TextDrawSetShadow(MauGiap[4][i], 0);
TextDrawSetOutline(MauGiap[4][i], 0);
TextDrawBackgroundColor(MauGiap[4][i], 255);
TextDrawFont(MauGiap[4][i], 2);
TextDrawSetProportional(MauGiap[4][i], 1);
TextDrawSetShadow(MauGiap[4][i], 0);

MauGiap[5][i] = TextDrawCreate(577.666870, 63.066661, "100"); // Mau
TextDrawLetterSize(MauGiap[5][i], 0.400000, 1.600000);
TextDrawAlignment(MauGiap[5][i], 1);
TextDrawColor(MauGiap[5][i], -1);
TextDrawSetShadow(MauGiap[5][i], 0);
TextDrawSetOutline(MauGiap[5][i], 0);
TextDrawBackgroundColor(MauGiap[5][i], 255);
TextDrawFont(MauGiap[5][i], 2);
TextDrawSetProportional(MauGiap[5][i], 1);
TextDrawSetShadow(MauGiap[5][i], 0);
