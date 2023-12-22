//--------------------------------[FUNCTIONS.PWN]--------------------------------

#define DEATH_PLAYZONE 55

forward Float:GetDist3D(Float:x, Float:y, Float:z, Float:x2, Float:y2, Float:z2);

ReturnName(playerid)
{
	static
	    name[MAX_PLAYER_NAME + 1];

	GetPlayerName(playerid, name, sizeof(name));

	return name;
}

ReturnWeaponName(weaponid)
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

ReturnReasonName(weaponid)
{
	static
		name[24];
		
	if(weaponid == DEATH_PLAYZONE) {
		name = "เขตการเล่น"; // Playzone
		return name;
	}
	else if(weaponid == 54) {
		name = "ตกจากที่สูง"; // Falling
		return name;
	}
	else if(weaponid == 49) {
		name = "ยานพาหนะระเบิด"; // Vehicle explosion
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

SendMatchMessage(matching, color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[144]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 12)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 12); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 144
		#emit PUSH.C string
		#emit PUSH.C args

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

		foreach(new x : Player) if(GetPlayerJoinMatch(x) == matching) {
			SendClientMessage(x, color, string);
		}
		return 1;
	}
	foreach(new x : Player) if(GetPlayerJoinMatch(x) == matching) {
		SendClientMessage(x, color, string);
	}
	return 1;
}

stock ConvertTime(&cts, &ctm=-1,&cth=-1,&ctd=-1,&ctw=-1,&ctmo=-1,&cty=-1)
{
    #define CTM_cty 31536000
    #define CTM_ctmo 2628000
    #define CTM_ctw 604800
    #define CTM_ctd 86400
    #define CTM_cth 3600
    #define CTM_ctm 60

    #define CT(%0) %0 = cts / CTM_%0; cts %= CTM_%0

    if(cty != -1 && (cts/CTM_cty))
    {
        CT(cty); CT(ctmo); CT(ctw); CT(ctd); CT(cth); CT(ctm);
		return 1;
    }
    if(ctmo != -1 && (cts/CTM_ctmo))
    {
        cty = 0; CT(ctmo); CT(ctw); CT(ctd); CT(cth); CT(ctm);
		return 1;
    }
    if(ctw != -1 && (cts/CTM_ctw))
    {
        cty = 0; ctmo = 0; CT(ctw); CT(ctd); CT(cth); CT(ctm);
		return 1;
    }
    if(ctd != -1 && (cts/CTM_ctd))
    {
        cty = 0; ctmo = 0; ctw = 0; CT(ctd); CT(cth); CT(ctm);
		return 1;
    }
    if(cth != -1 && (cts/CTM_cth))
    {
        cty = 0; ctmo = 0; ctw = 0; ctd = 0; CT(cth); CT(ctm);
		return 1;
    }
    if(ctm != -1 && (cts/CTM_ctm) && cts > 0)
    {
        cty = 0; ctmo = 0; ctw = 0; ctd = 0; cth = 0; CT(ctm);
		return 1;
    }
    cty = 0; ctmo = 0; ctw = 0; ctd = 0; cth = 0; ctm = 0;
    return 1;
}

CreateRGB(r, g, b, a) return (r<<24 | g<<16 | b<<8 | a);

Float:GetDistance(Float:x1,Float:y1,Float:z1, Float:x2,Float:y2,Float:z2)
{
	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

// valstr fix by Slice
stock FIX_valstr(dest[], value, bool:pack = false)
{
    // format can't handle cellmin properly
    static const cellmin_value[] = !"-2147483648";
 
    if (value == cellmin)
        pack && strpack(dest, cellmin_value, 12) || strunpack(dest, cellmin_value, 12);
    else
        format(dest, 12, "%d", value), pack && strpack(dest, dest, 12);
}
#define valstr FIX_valstr