//--------------------------------[FUNCTIONS.PWN]--------------------------------

stock ReturnName(playerid)
{
	new playersName[MAX_PLAYER_NAME + 2];
	format(playersName, sizeof(playersName), "Unknown");
	if(playerid != INVALID_PLAYER_ID) {
		GetPlayerName(playerid, playersName, sizeof(playersName)); 
		return playersName;
	}
	return playersName;
}

CreateRGB(r, g, b, a) return (r<<24 | g<<16 | b<<8 | a);

stock ReturnWeaponName(weaponid)
{
	static
		name[24];
		
	if(weaponid == DEATH_PLAYZONE) {
		name = "outside Playzone";
		return name;
	}
	else if(weaponid == 54) {
		name = "from falling";
		return name;
	}
	else if(weaponid == 49) {
		name = "with vehicle explosion";
		return name;
	}

	GetWeaponName(weaponid, name, sizeof(name));

	if (!weaponid)
	    name = "Punch";

	else if (weaponid == 30)
	    name = "AK-47";

	else if (weaponid == 18)
	    name = "Molotov Cocktail";

	else if (weaponid == 44)
	    name = "Nightvision";

	else if (weaponid == 45)
	    name = "Infrared";

	return name;
}

stock ConvertTimeTH(&cts, &ctm=-1,&cth=-1,&ctd=-1,&ctw=-1,&ctmo=-1,&cty=-1)
{
    #define CTM_cty 31536000
    #define CTM_ctmo 2628000
    #define CTM_ctw 604800
    #define CTM_ctd 86400
    #define CTM_cth 3600
    #define CTM_ctm 60

    #define CT(%0) %0 = cts / CTM_%0; cts %= CTM_%0

    new strii[128];

    if(cty != -1 && (cts/CTM_cty))
    {
        CT(cty); CT(ctmo); CT(ctw); CT(ctd); CT(cth); CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s %d %s %d %s %d %s %d %s %d %s",cty, "ปี",ctmo, "เดือน",ctw, "สัปดาห์",ctd, "วัน",cth, "ชั่วโมง",ctm, "นาที",cts, "วินาที");
        return strii;
    }
    if(ctmo != -1 && (cts/CTM_ctmo))
    {
        cty = 0; CT(ctmo); CT(ctw); CT(ctd); CT(cth); CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s %d %s %d %s %d %s %d %s",ctmo, "เดือน",ctw, "สัปดาห์",ctd, "วัน",cth, "ชั่วโมง",ctm, "นาที",cts, "วินาที");
        return strii;
    }
    if(ctw != -1 && (cts/CTM_ctw))
    {
        cty = 0; ctmo = 0; CT(ctw); CT(ctd); CT(cth); CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s %d %s %d %s %d %s",ctw, "สัปดาห์",ctd, "วัน",cth, "ชั่วโมง",ctm, "นาที",cts, "วินาที");
        return strii;
    }
    if(ctd != -1 && (cts/CTM_ctd))
    {
        cty = 0; ctmo = 0; ctw = 0; CT(ctd); CT(cth); CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s %d %s %d %s",ctd, "วัน",cth, "ชั่วโมง",ctm, "นาที",cts, "วินาที");
        return strii;
    }
    if(cth != -1 && (cts/CTM_cth))
    {
        cty = 0; ctmo = 0; ctw = 0; ctd = 0; CT(cth); CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s %d %s",cth, "ชั่วโมง",ctm, "นาที",cts, "วินาที");
        return strii;
    }
    if(ctm != -1 && (cts/CTM_ctm) && cts > 0)
    {
        cty = 0; ctmo = 0; ctw = 0; ctd = 0; cth = 0; CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s",ctm, "นาที",cts, "วินาที");
        return strii;
    }
    cty = 0; ctmo = 0; ctw = 0; ctd = 0; cth = 0; ctm = 0;
    format(strii, sizeof(strii), "%d %s", cts, "วินาที");
    return strii;
}

stock ConvertTime(&cts, &ctm=-1,&cth=-1,&ctd=-1,&ctw=-1,&ctmo=-1,&cty=-1)
{
    #define PLUR(%0,%1,%2) (%0),((%0) == 1)?((#%1)):((#%2))

    #define CTM_cty 31536000
    #define CTM_ctmo 2628000
    #define CTM_ctw 604800
    #define CTM_ctd 86400
    #define CTM_cth 3600
    #define CTM_ctm 60

    #define CT(%0) %0 = cts / CTM_%0; cts %= CTM_%0

    new strii[128];

    if(cty != -1 && (cts/CTM_cty))
    {
        CT(cty); CT(ctmo); CT(ctw); CT(ctd); CT(cth); CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s %d %s %d %s %d %s %d %s %d %s",PLUR(cty,"year","years"),PLUR(ctmo,"month","months"),PLUR(ctw,"week","weeks"),PLUR(ctd,"day","days"),PLUR(cth,"hour","hours"),PLUR(ctm,"minute","minutes"),PLUR(cts,"second","seconds"));
        return strii;
    }
    if(ctmo != -1 && (cts/CTM_ctmo))
    {
        cty = 0; CT(ctmo); CT(ctw); CT(ctd); CT(cth); CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s %d %s %d %s %d %s %d %s",PLUR(ctmo,"month","months"),PLUR(ctw,"week","weeks"),PLUR(ctd,"day","days"),PLUR(cth,"hour","hours"),PLUR(ctm,"minute","minutes"),PLUR(cts,"second","seconds"));
        return strii;
    }
    if(ctw != -1 && (cts/CTM_ctw))
    {
        cty = 0; ctmo = 0; CT(ctw); CT(ctd); CT(cth); CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s %d %s %d %s %d %s",PLUR(ctw,"week","weeks"),PLUR(ctd,"day","days"),PLUR(cth,"hour","hours"),PLUR(ctm,"minute","minutes"),PLUR(cts,"second","seconds"));
        return strii;
    }
    if(ctd != -1 && (cts/CTM_ctd))
    {
        cty = 0; ctmo = 0; ctw = 0; CT(ctd); CT(cth); CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s %d %s %d %s",PLUR(ctd,"day","days"),PLUR(cth,"hour","hours"),PLUR(ctm,"minute","minutes"),PLUR(cts,"second","seconds"));
        return strii;
    }
    if(cth != -1 && (cts/CTM_cth))
    {
        cty = 0; ctmo = 0; ctw = 0; ctd = 0; CT(cth); CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s %d %s",PLUR(cth,"hour","hours"),PLUR(ctm,"minute","minutes"),PLUR(cts,"second","seconds"));
        return strii;
    }
    if(ctm != -1 && (cts/CTM_ctm) && cts > 0)
    {
        cty = 0; ctmo = 0; ctw = 0; ctd = 0; cth = 0; CT(ctm);
        format(strii, sizeof(strii), "%d %s %d %s",PLUR(ctm,"minute","minutes"),PLUR(cts,"second","seconds"));
        return strii;
    }
    cty = 0; ctmo = 0; ctw = 0; ctd = 0; cth = 0; ctm = 0;
    format(strii, sizeof(strii), "%d %s", PLUR(cts,"second","seconds"));
    return strii;
}

stock ConvertTimePUBG(second) {
	new str[16], minutes, seconds = second;
	ConvertTimeTH(seconds, minutes);
	if(minutes) format(str, 16, "%d:%02d", minutes, seconds);
	else format(str, 16, "%d", seconds);
	return str;
}

stock SetPlayerLookAt(playerid, Float:x, Float:y)
{
	new Float:Px, Float:Py, Float: Pa;
	GetPlayerPos(playerid, Px, Py, Pa);
	Pa = floatabs(atan((y-Py)/(x-Px)));
	if (x <= Px && y >= Py) Pa = floatsub(180, Pa);
	else if (x < Px && y < Py) Pa = floatadd(Pa, 180);
	else if (x >= Px && y <= Py) Pa = floatsub(360.0, Pa);
	Pa = floatsub(Pa, 90.0);
	if (Pa >= 360.0) Pa = floatsub(Pa, 360.0);
	SetPlayerFacingAngle(playerid, Pa);
}

stock SetActorLookAt(actorid, Float:x, Float:y)
{
	new Float:Px, Float:Py, Float: Pa;
	GetActorPos(actorid, Px, Py, Pa);
	Pa = floatabs(atan((y-Py)/(x-Px)));
	if (x <= Px && y >= Py) Pa = floatsub(180, Pa);
	else if (x < Px && y < Py) Pa = floatadd(Pa, 180);
	else if (x >= Px && y <= Py) Pa = floatsub(360.0, Pa);
	Pa = floatsub(Pa, 90.0);
	if (Pa >= 360.0) Pa = floatsub(Pa, 360.0);
	SetActorFacingAngle(actorid, Pa);
}

stock Float:GetFacingFromPos(Float:Px, Float:Py, Float:x, Float:y)
{
	new Float: Pa;
	Pa = floatabs(atan((y-Py)/(x-Px)));
	if (x <= Px && y >= Py) Pa = floatsub(180, Pa);
	else if (x < Px && y < Py) Pa = floatadd(Pa, 180);
	else if (x >= Px && y <= Py) Pa = floatsub(360.0, Pa);
	Pa = floatsub(Pa, 90.0);
	if (Pa >= 360.0) Pa = floatsub(Pa, 360.0);
	return Pa;
}

stock Float:GetFacingFromPos2(Float:Px, Float:Py, Float:x, Float:y) {
	return (-atan2((x - Px), (y - Py)));
}

stock RGBAToARGB( rgba )
    return rgba >>> 8 | rgba << 24;

stock PreloadAnimations(playerid)
{
	for (new i = 0; i < sizeof(g_aPreloadLibs); i ++)
		ApplyAnimation(playerid, g_aPreloadLibs[i], "null", 4.0, 0, 0, 0, 0, 0, 1);

	return 1;
}
/*public IsPlayerSkydiving(playerid)           //true if player is falling with a closed parachute
{
    new index = GetPlayerAnimationIndex(playerid)
    return (index >= 958 && index <= 962);
}

public IsPlayerUsingParachute(playerid)    //true if player is falling with an opened parachute
{
    new index = GetPlayerAnimationIndex(playerid)
    return (index >= 963 && index <= 979);
}*/

/*stock CTimeTextTH(second) {
	new str[128], minutes, seconds = second;
	if(minutes) format(str, 128, "%s", ConvertTimeTH(seconds, minutes));
	return str;
}

stock CTimeText(second) {
	new str[128], minutes, seconds = second;
	if(minutes) format(str, 128, "%s", ConvertTime(seconds, minutes));
	return str;
}*/

forward KickTimer(playerid);
public KickTimer(playerid)
{
	return Kick(playerid);
}