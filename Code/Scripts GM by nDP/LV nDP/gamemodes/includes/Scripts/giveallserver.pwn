//============================== BE PHUONG 3 TUOI ============================//
//========================== fb.com/nguyenduyphuong.dz =======================//

#include <YSI\y_hooks>


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

//============================================================================//

CMD:admingive(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin]>=1338)
	{
		SendClientMessage(playerid,0xFF000FF,"Lenh tich thu all sv: /tichthucredits , /tichthumoney , /tichthuvatlieu , /tichthufacveh , /tichthuveh");
	    SendClientMessage(playerid,0xFF000FF,"Lenh tang qua all sv: /giveallcreditsndpdz , /giveallmoneyndpdz , /giveallmatndpdz , /giveallgoldboxndp , /giveallfacvehndp , /giveallvehndpdz");
	}
	else
	{
        SendClientMessage(playerid,0xFF000FF,"Ban khong the su dung lenh nay");
	}
	return 1;
}

// Update 7/1/2020
CMD:tichthucredits(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallcreditsndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So credits khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da tich thu {68FF33}%d Credits{ffffff} cua moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pCredits]-=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}
CMD:giveallcreditsndpdz(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallcreditsndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So credits khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da phat {68FF33}%d Credits{ffffff} cho tat ca moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pCredits]+=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}
CMD:tichthumoney(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallcreditsndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So credits khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da tich thu {68FF33}%d money{ffffff} cua moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pCash]-=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}
CMD:giveallmoneyndpdz(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallmoneyndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So tien khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da phat {68FF33}%d $(Money){ffffff} cho tat ca moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pCash]+=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}
CMD:tichthuvatlieu(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallcreditsndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So credits khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da tich thu {68FF33}%d Vatlieu{ffffff} cua moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pMats]-=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}
CMD:giveallmatndpdz(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallmoneyndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So tien khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da phat {68FF33}%d (Vat Lieu){ffffff} cho tat ca moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pMats]+=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
} // pGoldBoxTokens
CMD:giveallgoldboxndp(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallmoneyndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So tien khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da phat {68FF33}%d (Tokens Nhan Hop Qua Vang){ffffff} cho tat ca moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pGoldBoxTokens]+=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}
CMD:tichthufacveh(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallcreditsndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So credits khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da tich thu {68FF33}%d Credits{ffffff} cua moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pCarVoucher]-=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}
CMD:giveallfacvehndp(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallmoneyndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So tien khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da phat {68FF33}%d (Phieu Xe Faction){ffffff} cho tat ca moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pCarVoucher]+=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}
CMD:tichthuveh(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallcreditsndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So credits khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da tich thu {68FF33}%d Credits{ffffff} cua moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pVehVoucher]-=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}
CMD:giveallvehndpdz(playerid,params[])
{
 	if(PlayerInfo[playerid][pAdmin]>=1338)
	{
	    //if(!DaDangNhap(playerid)) return  SendClientMessage(playerid,0xFF000FF,"Ban chua dang nhap!");
		if(isnull(params)) return SendClientMessage(playerid,0xFF000FF,"Su dung : /giveallmoneyndpdz [so luong]");
		if(strval(params)<=0) return SendClientMessage(playerid,0xFF000FF,"So tien khong hop le");
		new str[128];
		format(str,128,"{ff0000}%s{ffffff} da phat {68FF33}%d (Phieu Xe Vouchers){ffffff} cho tat ca moi nguoi trong server",GetPlayerNameExt(playerid),strval(params));
		SendClientMessageToAll(0xFFF000FF,str);
		for(new i; i<MAX_PLAYERS;i++)
		{
			if(IsPlayerConnected(i))//Neu tat ca nguoi choi trong so MAX_PLAYERS dang online moi tiep tuc vong lap
			{
			    PlayerInfo[i][pVehVoucher]+=strval(params); //Chuyen du lieu string sang so nguyen de give credits
			}
		}
 	}
	return 1;
}
