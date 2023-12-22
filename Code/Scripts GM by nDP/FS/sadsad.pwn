//
                case 22:
                {
                    if(PlayerInfo[playerid][pAmmo][ 1 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 1 ] -= 1;
                    }
              		if(PlayerInfo[playerid][pBangDan][1] > 1 && PlayerInfo[playerid][pAmmo][ 1 ] <= 1)
                    {
		            GivePlayerValidWeapon(playerid, weaponid, 22);
				    PlayerInfo[playerid][pBangDan][1] -= 1;
				    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
				    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}9mm ");
				    SetPlayerArmedWeapon(playerid, weaponid);
				    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
		            }
                }
                case 23:
                {
                    if(PlayerInfo[playerid][pAmmo][ 1 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 1 ] -= 1;
                    }
              		if(PlayerInfo[playerid][pBangDan][1] > 1 && PlayerInfo[playerid][pAmmo][ 1 ] <= 1)
                    {
		            GivePlayerValidWeapon(playerid, weaponid, 6);
				    PlayerInfo[playerid][pBangDan][1] -= 1;
				    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
				    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}Sdpistol ");
				    SetPlayerArmedWeapon(playerid, weaponid);
				    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
		            }
                }
                case 24:
                {
                    if(PlayerInfo[playerid][pAmmo][ 1 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 1 ] -= 1;
                    }
              		if(PlayerInfo[playerid][pBangDan][2] > 1 && PlayerInfo[playerid][pAmmo][ 1 ] <= 1)
                    {
		            GivePlayerValidWeapon(playerid, weaponid, 6);
				    PlayerInfo[playerid][pBangDan][2] -= 1;
				    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
				    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}Deagle ");
				    SetPlayerArmedWeapon(playerid, weaponid);
				    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
		            }
                }
                case 25:
                {
                    if(PlayerInfo[playerid][pAmmo][ 2 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 2 ] -= 1;
                    }
                    if(PlayerInfo[playerid][pBangDan][3] > 1 && PlayerInfo[playerid][pAmmo][ 2 ]  < 2)
					{
			            GivePlayerValidWeapon(playerid, weaponid, 12);
					    PlayerInfo[playerid][pBangDan][3] -= 1;
					    ApplyAnimation(playerid, "BUDDY", "buddy_reload", 4.0, 0, 0, 0, 0, 0, 1);
					    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}Shotgun ");
					    SetPlayerArmedWeapon(playerid, weaponid);
					    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
					}
                }
                case 26:
                {
                    if(PlayerInfo[playerid][pAmmo][ 2 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 2 ] -= 1;
                    }
                }
                case 27:
                {
                    if(PlayerInfo[playerid][pAmmo][ 2 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 2 ] -= 1;
                    }
                    if(PlayerInfo[playerid][pBangDan][7] > 1 && PlayerInfo[playerid][pAmmo][ 2 ]  < 2)
					{
			            GivePlayerValidWeapon(playerid, weaponid, 8);
					    PlayerInfo[playerid][pBangDan][7] -= 1;
					    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
					    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}Spass12 ");
					    SetPlayerArmedWeapon(playerid, weaponid);
					    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
					}
                }
                case 28:
                {
                    if(PlayerInfo[playerid][pAmmo][ 3 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 3 ] -= 1;
                    }
              		if(PlayerInfo[playerid][pBangDan][4] > 1 && PlayerInfo[playerid][pAmmo][ 3 ]  < 2)
					{
					    PlayerInfo[playerid][pBangDan][4] -= 1;
			            GivePlayerValidWeapon(playerid, weaponid, 29);
					    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
					    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}Uzi ");
					    SetPlayerArmedWeapon(playerid, weaponid);
					    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
					}
                }
                case 29:
                {
                    if(PlayerInfo[playerid][pAmmo][ 3 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 3 ] -= 1;
                    }
              		if(PlayerInfo[playerid][pBangDan][4] > 1  && PlayerInfo[playerid][pAmmo][ 3 ]  < 2)
					{
					    PlayerInfo[playerid][pBangDan][4] -= 1;
			            GivePlayerValidWeapon(playerid, weaponid, 29);
					    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
					    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}MP5 ");
					    SetPlayerArmedWeapon(playerid, weaponid);
					    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
					}
                }
                case 32:
                {
                    if(PlayerInfo[playerid][pAmmo][ 3 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 3 ] -= 1;
                    }
              		if(PlayerInfo[playerid][pBangDan][4] > 1 && PlayerInfo[playerid][pAmmo][ 3 ]  < 2)
					{
					    PlayerInfo[playerid][pBangDan][4] -= 1;
			            GivePlayerValidWeapon(playerid, weaponid, 29);
					    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
					    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}Tec9 ");
					    SetPlayerArmedWeapon(playerid, weaponid);
					    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
					}
                }
                case 30: // M4, Ak 47
                {
                    if(PlayerInfo[playerid][pAmmo][ 4 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 4 ] -= 1;
                    }
              		if(PlayerInfo[playerid][pBangDan][5] > 1 && PlayerInfo[playerid][pAmmo][ 4 ] < 2)
					{
					    PlayerInfo[playerid][pBangDan][5] -= 1;
			            GivePlayerValidWeapon(playerid, weaponid, 29);
					    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
					    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}AK-47 ");
					    SetPlayerArmedWeapon(playerid, weaponid);
					    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
					}
                }
                case 31:
                {
                    if(PlayerInfo[playerid][pAmmo][ 4 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 4 ] -= 1;
                    }
              		if(PlayerInfo[playerid][pBangDan][6]  > 1 && PlayerInfo[playerid][pAmmo][ 4 ] < 2)
					{
			            GivePlayerValidWeapon(playerid, weaponid, 29);
					    PlayerInfo[playerid][pBangDan][6] -= 1;
					    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
					    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}M4a1 ");
					    SetPlayerArmedWeapon(playerid, weaponid);
					    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
					}
                }
                case 33:
                {
                    if(PlayerInfo[playerid][pAmmo][ 5 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 5 ] -= 1;
                    }
              		if(PlayerInfo[playerid][pBangDan][8]  > 1 && PlayerInfo[playerid][pAmmo][ 5 ] < 2)
					{
						///
						PlayerInfo[playerid][pBangDan][8] -= 1;
			            GivePlayerValidWeapon(playerid, weaponid, 12);
					    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
					    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}Rifle ");
					    SetPlayerArmedWeapon(playerid, weaponid);
					    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
					}
                }
                case 34: // rifle, sniper
                {
                    if(PlayerInfo[playerid][pAmmo][ 5 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 5 ] -= 1;
                    }
              		if(PlayerInfo[playerid][pBangDan][9]  > 1 && PlayerInfo[playerid][pAmmo][ 5 ] < 2)
					{
						///
						PlayerInfo[playerid][pBangDan][9] -= 1;
			            GivePlayerValidWeapon(playerid, weaponid, 12);
					    ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 0, 1);
					    SendClientMessageEx(playerid, COLOR_YELLOW, "{99CC33} Ban vua thay bang dan - Vu khi: {99CC33}Sniper ");
					    SetPlayerArmedWeapon(playerid, weaponid);
					    GameTextForPlayer(playerid, "~y~Dang thay dan", 5000, 3);
					}
                }
                case 35,36,37,38: // Bazoka, RPG, Firegun, minigun
                {
                    if(PlayerInfo[playerid][pAmmo][ 6 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 6 ] -= 1;
                    }
                }
                case 40,41,42,43: // SPRAYCAN, FIREEXTINGUISHER, CAMERA
                {
                    if(PlayerInfo[playerid][pAmmo][ 8 ] > 0)
                    {
                        PlayerInfo[playerid][pAmmo][ 8 ] -= 1;
                    }
                }
            }
        }
