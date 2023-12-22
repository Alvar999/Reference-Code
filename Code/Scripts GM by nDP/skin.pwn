#define DOWNLOAD_REQUEST_EMPTY		0
#define DOWNLOAD_REQUEST_MODEL_FILE	1
#define DOWNLOAD_REQUEST_TEXTURE_FILE	2

stock LoadCustomSkin()
{
	//anime
	AddCharModel(305, 22001, "bfori.dff", "bfori.txd");//lol
	AddCharModel(305, 22002, "bfyst.dff", "bfyst.txd");//lol
	AddCharModel(305, 22003, "bmydj.dff", "bmydj.txd");
	AddCharModel(305, 22004, "hfyst.dff", "hfyst.txd");
	AddCharModel(305, 22005, "lsv1.dff", "lsv1.txd");//justin bi bo
	AddCharModel(305, 22006, "ofost.dff", "ofost.txd"); //ronado
	AddCharModel(305, 22007, "ofyri.dff", "ofyri.txd"); //lol
	AddCharModel(305, 22008, "wuzimu.dff", "wuzimu.txd"); //NU
	AddCharModel(305, 22009, "wuzimu2.dff", "wuzimu2.txd"); //freefire
	//Gia dinh sieu nhan
	AddCharModel(305, 22010, "Bob.dff", "Bob.txd"); //DJ
	AddCharModel(141, 22011, "Dash.dff", "Dash.txd");
	AddCharModel(305, 22012, "Elastigirl.dff", "Elastigirl.txd"); //DJ
	AddCharModel(305, 22013, "ElastigirlYoung.dff", "ElastigirlYoung.txd"); //DJ
	AddCharModel(305, 22014, "Frozone.dff", "Frozone.txd"); //DJ
	AddCharModel(305, 22015, "VioletParr.dff", "VioletParr.txd"); //fornite
	// Skin Thuong
	AddCharModel(305, 22016, "andre.dff", "andre.txd"); //malayxia
	AddCharModel(305, 22017, "randomskin.dff", "randomskin.txd"); //anime
	AddCharModel(305, 22018, "skinrandom120.dff", "skinrandom120.txd"); //BunnyBoy
	AddCharModel(305, 22019, "skinrandom223.dff", "skinrandom223.txd"); //BunnyGirl
	AddCharModel(305, 22020, "wbdyg2.dff", "wbdyg2.txd"); //hockey
	//
	AddCharModel(305, 22021, "TheDonato.dff", "TheDonato.txd"); //moto
	AddCharModel(305, 22022, "mex01.dff", "mex01.txd"); //helmet
	AddCharModel(305, 22023, "Eeyore.dff", "Eeyore.txd"); //helmet
	//yasou
	AddCharModel(305, 22024, "Yasuo.dff", "Yasuotxd");
	AddCharModel(305, 22024, "Yasuo1.dff", "Yasuo1txd");


	AddSimpleModel(-1,18865, -1001, "Katana.dff", "Katana.txd");
	AddSimpleModel(-1,18865, -1002, "gun_cane.dff", "gun_cane.txd");
	AddSimpleModel(-1,18865, -1003, "wallzzz.dff", "wallzzz.txd");

}

new SERVER_DOWNLOAD[] = "http://gosamp.net/models/";
forward OnPlayerRequestDownload(playerid, type, crc);
public OnPlayerRequestDownload(playerid, type, crc)
{
    if(!IsPlayerConnected(playerid)) return 0;

    new filename[64], filefound, url_final[256];

    if(type == DOWNLOAD_REQUEST_TEXTURE_FILE)
        filefound = FindTextureFileNameFromCRC(crc, filename, sizeof(filename));
    else if(type == DOWNLOAD_REQUEST_MODEL_FILE)
        filefound = FindModelFileNameFromCRC(crc, filename, sizeof(filename));

    if(filefound)
    {
        format(url_final, sizeof(url_final), "%s/%s", SERVER_DOWNLOAD, filename);
        RedirectDownload(playerid, url_final);
    }
    return 1;
}
