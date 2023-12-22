#include <YSI\y_hooks>

#define 		ADMIN_KOMANDE     			(22220)
//#define 		ADMIN_SKINCC     			(22229)

CMD:deagles(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pAdmin] >= 1)
		{
			GivePlayerWeapon(playerid,24,60000);
			SetPlayerAttachedObject(playerid,0, 348,6,0.007000 ,0.004000 ,-0.011999 ,8.599973 ,0.000000 ,0.000000 ,0.940000 ,1.354999 ,1.286999,0xFFFF0000,0xFFFF0000);
        }
   }
   return 1;
}

CMD:ah(playerid, params[])
{
	//if(PlayerInfo[playerid][pAdmin] < 1) return khongduocphep(playerid);
	if(IsPlayerConnected(playerid))
	{
		new info[2080];
		if(PlayerInfo[playerid][pAdmin] >= 1)
		{
			strcat(info, "*** {FFFF00}SENIOR SERVER MODERATOR{B4B5B7} *** /jail /kick /staff /togstaff /doiten /dmwatch /dmalert\n", sizeof(info));
			strcat(info, "*** {FFFF00}SERVER MODERATOR{B4B5B7} *** /mjail /kick /staff /togstaff /dmwatch /dmalert\n\n", sizeof(info));
	  		strcat(info, "*** {00FF00}JUNIOR ADMIN{BFC0C2} *** /baocaos /ar /tr /sta /nao /st /post /dmr *** MOVEMENT *** /up /dn /fd /bk /lt /rt /fly\n\n", sizeof(info));
			strcat(info, "*** {00FF00}JUNIOR ADMIN{BFC0C2} *** /kick /ban /prison /freeze /unfreeze /slap /warn /admins /spec /levelones\n", sizeof(info));
			strcat(info, "*** {00FF00}JUNIOR ADMIN{BFC0C2} *** /sendto /gotopveh /gotocar /jetpack /god /check /anetstats /ipcheck /ip /nrn /listguns\n", sizeof(info));
			strcat(info, "*** {00FF00}JUNIOR ADMIN{BFC0C2} *** /setvw /setint /vehname /gethere /gotoid /hospital /goto /hoisinh /bigears /skick /damagecheck\n", sizeof(info));
			strcat(info, "*** {00FF00}JUNIOR ADMIN{BFC0C2} *** /requestevent /watch /dmwatchlist /mark(2) /n(un)mute /ad(un)mute /checkinv /lastshot\n\n", sizeof(info));
			strcat(info, "*** {00FF00}GENERAL ADMIN{CBCCCE} *** /noooc /nonewbie /fine /pfine /takeadminweapons /prisonaccount /entercar /getcar\n", sizeof(info));
			strcat(info, "*** {00FF00}GENERAL ADMIN{CBCCCE} *** /gotoco /leaders /wepreset /owarn /ofine /okills /respawncar(s)\n", sizeof(info));
			strcat(info, "*** {00FF00}GENERAL ADMIN{CBCCCE} *** /mole /setskin /countdown /thatu /forcedeath /rto(reset) /hhc\n", sizeof(info));
            strcat(info, "*** {00FF00}GENERAL ADMIN{CBCCCE} *** /reloadpvehicles /apark /aimpound /dmrmute /dmrlookup /dmtokens /sendtoid /dm /tatnhacad /batnhacad\n\n", sizeof(info));
		    strcat(info, "*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /asellbiz /fixvehall /givenos /blowup /setname /savechars /dmstrikereset /cnn /respawnvipcars\n", sizeof(info));
		    strcat(info, "*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /veh /fixveh /sethp /setarmor /givegun /givemoney /setmoney /setstat /setfightstyle /switchgroup /switchfam\n", sizeof(info));
		    strcat(info, "*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /fcreate /fdelete /adivorce /destroycar /destroycars /eventhelp /xemhopdong /sprison /banip /unbanip");
		    strcat(info, "*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /groupban /deletehit /setinsurance /cmotd /givelicense /adestroyplant /tl(edit/text/status/next\n", sizeof(info));
		    strcat(info, "*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /gotolabel /createpvehicle /destroypvehicle /vto /vtoreset /admingatepw /gotogate /dedit /fedit\n", sizeof(info));
		    strcat(info, "*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /hnext /dmpnext /g(status/near/next/edit) /(goto/goin)door /(goto/goin)house /(create/delete/goto)point\n", sizeof(info));
		    strcat(info, "*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /hedit /dd(edit/next/name/pass) /dmpedit /dmpnear /gotomapicon /gangwarn /gangunban /setcapping /banaccount\n", sizeof(info));
		    strcat(info, "*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /removepvehicle /rcabuse /createmailbox /adestroymailbox /b(edit/next/name) /adestroycrate /gotocrate\n", sizeof(info));
		    strcat(info, "*** {EE9A4D}SENIOR ADMIN{D8D8D8} *** /(create/edit/delete)gaspump /(goto/goin)biz /dvcreate /dvstatus /dvrespawn /dvedit /dveditslot /dvplate /checkvouchers\n\n", sizeof(info));
			strcat(info, "*** {FF0000}HEAD ADMIN{E3E3E3} *** /ha /setweather /makeleader /pedit /groupunban /groupcsfunban /giftall /removemoderator /makewatchdog\n", sizeof(info));
		    strcat(info, "*** {FF0000}HEAD ADMIN{E3E3E3} *** /permaban /setcolor /payday /clearallreports /eventreset /amotd /motd /vipmotd /givetoken /giftgvip\n", sizeof(info));
		    strcat(info, "*** {FF0000}HEAD ADMIN{E3E3E3} *** /vmute /vsuspend /gifts /rcreset /dvrespawnall /setarmorall /removewatchdog /dathopqua /asellhouse\n", sizeof(info));
		    strcat(info, "*** {FF0000}HEAD ADMIN{E3E3E3} *** /togfireworks /togshopnotices\n\n", sizeof(info));
		    strcat(info, "*** {298EFF}LEAD HEAD ADMIN{E3E3E3} *** /setsec /suspend /osuspend /ounsuspend /osetrmutes /rmute /clearall /specreset /pausespec /random /vrandom\n", sizeof(info));
		    strcat(info, "*** {298EFF}LEAD HEAD ADMIN{E3E3E3} *** /giftreset /searchvipm /vipgifts /buddyinvite /rewardplay /doublexp\n\n", sizeof(info));
		    strcat(info, "*** {298EFF}System Admin{F0F0F0} *** /togspec /togtp /kickres /givecredits /setcredits /settotalcredits /setstpay /resetstpay /pmotd\n", sizeof(info));
		    strcat(info, "*** {298EFF}System Admin{F0F0F0} *** /setcode /togdynamicgift /dgedit /viewgiftbox /taotuitien /xoatuitien /xoatatcatuitien /taovang /xoavang /xoatatcavang\n\n", sizeof(info));
            strcat(info, "*** Special - Human Resources *** /givesprize /setsec\n", sizeof(info));
            strcat(info, "*** Special - Human Resources *** /makemoderator /xxxhuy /rmute /suspend /osuspend /ounsuspend /osetrmutes\n\n", sizeof(info));
            strcat(info, "*** Special - Admin Personnel *** /makemoderator /xxxhuy /rmute /suspend /osuspend /ounsuspend /osetrmutes\n\n", sizeof(info));
			strcat(info, "*** Special - Ban Appealer *** /unbanip /unban\n\n", sizeof(info));
            strcat(info, "*** Special - Spec Ops *** /setmystat /setmyname /setmyhp /setmyarmour /sprison /sdm /swarn\n\n", sizeof(info));
            strcat(info, "*** Special - Gang Mod *** /gtedit /gtstatus /gtnear /tagperm /tagedit\n", sizeof(info));
            strcat(info, "*** Special - Gang Mod *** /switchfam /fedit /gangwarn /gangunban /fcreate /fdelete /twmenu /dvrespawn\n\n", sizeof(info));
			strcat(info, "*** Special - Shop Tech *** /orders /adjustoid /shop(car(del)/house/tokens/exp/plate/laser/vest/firework/viptokens/boombox/object) /gedit /gnear\n", sizeof(info));
		    strcat(info, "*** Special - Shop Tech *** /g(status/next) /hnext /goto(gate/door) /goinhouse /setvip /searchvipm /newgvip /renewgvip\n", sizeof(info));
		    strcat(info, "*** Special - Shop Tech *** /shopbusiness /shopbusinessname /brenewal\n\n", sizeof(info));
		    strcat(info, "*** Special - DoCR *** /pmotd\n\n", sizeof(info));
		    strcat(info, "*** Special - Faction Mod *** /switchgroup /groupcsfban /groupban /groupkick /leaders /dvrespawn\n\n", sizeof(info));
		    strcat(info, "*** Special - Public Relations *** /catokens /cmotd /makeadvisor /makehelper /takeadvisor\n\n", sizeof(info));
		}
		ShowPlayerDialog(playerid, ADMIN_KOMANDE, DIALOG_STYLE_MSGBOX, "{FFFFFF}Administrator Panel", info, "Close", "");
	}
	return 1;
}

/*CMD:skinss(playerid) {
    const MAX_SKINS = 312;
    new subString[16];
    static string[MAX_SKINS * sizeof(subString)];

    if (string[0] == EOS) {
        for (new i; i < MAX_SKINS; i++) {
            format(subString, sizeof(subString), "%i\tID: %i\n", i, i);
            strcat(string, subString);
        }
    }

    return ShowPlayerDialog(playerid, ADMIN_SKINCC, DIALOG_STYLE_PREVIEW_MODEL, "Skin Selection Dialog", string, "Select", "Cancel");
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == 0) {
        if (response) {
            SetPlayerSkin(playerid, listitem);
            GameTextForPlayer(playerid, "~g~Skin Changed!", 3000, 3);
        }
    }
    return 1;
}*/
