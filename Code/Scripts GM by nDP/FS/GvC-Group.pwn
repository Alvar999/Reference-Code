/*

						License Copyright 2014 GvC Script Team.

			Licensed under the Apache License, Version 2.0 (the "License");
			You may not use this file except in compliance with the License.
			You may obtain a copy of the License at

				http://www.apache.org/licenses/LICENSE-2.0

			Unless required by applicable law or agreed to in writing, software
			distributed under the License is distributed on an "AS IS" BASIS,
			WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
			See the License for the specific language governing permissions and
			limitations under the License.

			  SCRIPT NAME: GvC | UG-RP

			  GvC Scrip Team & Website Dev Team:

			 *Hyperion Above [Leader Scripter | Server Owner]
			 *Masley [Scripter].
			 *NhatNguyen [Scripter].
			 *Ò.Ó [Maper].
			 *Zedd [Maper].
			 *Béo [Website Deverloper].

		  ADDITIONAL CREDITS:
		      NGG Version 2009 [Script Base],
		      Incognito [Objects streamer],
		      SA-MP Team.
*/

#define SERVER_GM_TEXT "[GvC] v2.2.002"

#include <a_samp>
#include <a_mysql>	
#include <streamer>
#include <yom_buttons>		
#include <ZCMD>
#include <sscanf2>
#include <foreach>
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <progress2>
#include <progress>
#include <fcnpc>

#if defined SOCKET_ENABLED
#include <socket>
#endif
#include "./includes/gvc.pwn"

main() {}

public OnGameModeInit()
{
	print("Dang chuan bi tai gamemode, xin vui long cho doi...");
	SetGameModeText(SERVER_GM_TEXT);
	g_mysql_Init();
	return 1;
}

public OnGameModeExit()
{
    g_mysql_Exit();
	return 1;
}


