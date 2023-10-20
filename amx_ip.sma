/* Plugin generated by AMXX-Studio */

#include <amxmodx>
#include <amxmisc>
#include <reapi>

#define PLUGIN "AMX_IP"
#define VERSION "1.0"
#define AUTHOR "PANDA"

new maxplayers;

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	register_clcmd("amx_ip", "drukuj");
	maxplayers=get_maxplayers();
}

public drukuj(id){
	new admin, steam;
	if(get_user_flags(id) & ADMIN_BAN) admin=1;
	new hostname[64], hostip[32], sid[23], ip[42];
	get_cvar_string("hostname", hostname, 63);
	get_cvar_string("net_address", hostip, 31);
	console_print(id, "----------------------Informacje------------------------------");
	console_print(id, " %s", hostname);
	console_print(id, " %s", hostip);
	console_print(id, "--------------------------------------------------------------");
	for(new i = 0; i <= maxplayers; i++){
		if(!is_user_connected(i)) continue;
		get_user_authid(i, sid, 23);
		if(contain(sid, "STEAM_0:1")==0 || contain(sid, "STEAM_0:0")==0) steam=1;
		else steam=0;
		get_user_ip(i, ip, 41, 0);
		console_print(id,"#%d %n [%s] %s %s", i+1, i, sid, admin==1? ip:"", steam ? "Steam":"NonSteam")
	}
	console_print(id, "--------------------------------------------------------------");
}
