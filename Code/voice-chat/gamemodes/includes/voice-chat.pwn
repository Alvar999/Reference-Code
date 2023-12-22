#include <YSI\y_hooks>



new SV_GSTREAM:gstream;
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };

public SV_VOID:OnPlayerActivationKeyPress(
	SV_UINT:playerid,
	SV_UINT:keyid
) {
	if(keyid == 0x42 && lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);
	if(keyid == 0x5A && gstream) SvAttachSpeakerToStream(gstream, playerid);
}

public SV_VOID:OnPlayerActivationKeyRelease(
	SV_UINT:playerid,
	SV_UINT:keyid
) {
	if(keyid == 0x42 && lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
	if(keyid == 0x5A && gstream) SvDetachSpeakerFromStream(gstream, playerid);
}

hook OnPlayerConnect(playerid) {

	if(!SvGetVersion(playerid)) SendClientMessage(playerid, -1, "Cai dat Plugin");
	else if(!SvHasMicro(playerid)) SendClientMessage(playerid, -1, "Micro khong tim thay");
	else if ((lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0xff0000ff, "Local")))
    { 
		SendClientMessage(playerid, -1, "Voice chat da cai dat thanh cong");
		if(gstream) SvAttachListenerToStream(gstream, playerid);
		SvAddKey(playerid, 0x42);
		SvAddKey(playerid, 0x5A);
	}
	return 1;
}

hook OnPlayerDisconnect(playerid, reason) {

	if(lstream[playerid]) {
		SvDeleteStream(lstream[playerid]);
		lstream[playerid] = SV_NULL;
	}
	return 1;
}

hook OnGameModeInit() {

	//SvDebug(SV_TRUE);
	gstream = SvCreateGStream(0xffff0000, "G"); // blue color
	return 1;
}
