/*
*	 Black Ops 2 - GSC Studio by iMCSx
*
*	 Creator : TomG
*	 Project : TomGz Menu V1.1
*    Mode : Multiplayer
*	 Date : 2016.12.18 - 15:35:46	
 *
*/	

#include maps/mp/_utility;
#include common_scripts/utility;
#include maps/mp/gametypes/_hud_util;
#include maps/mp/gametypes/_weapons;
#include maps/mp/gametypes/_weaponsobjects;

init()
{
    level thread onPlayerConnect();
    
}
booleanOpposite(bool)
{
    if(!isDefined(bool))
        return true;
    if (bool)
        return false;
    else
        return true;
}
onPlayerConnect()
{
    for(;;)
    {
       level waittill("connected", player);
       player thread booleanOpposite();
       if(player isHost())
       player thread onplayerspawned();

    }
}

onPlayerSpawned()
{
    self endon("disconnect");
	level endon("game_ended");
	self thread Menu();
    for(;;)
    {
        self waittill("spawned_player");
        if( self.status == "Host")
        {
		self thread BoldInfo();
		}

    }
    	
 }

Prinltn()
{
 self waittill("spawned_player");
	  wait 2;
	
  self thread WelcomeMessages();
		self thread StartPrintln();
}

Menu()
{
	self thread Prinltn();
			wait 2;
		self thread initMenu();

	

 }
StartPrintln()
{
self iprintln("^4Welcome^7 "+self.name+"^4:D");
self iprintln("^4Press ^7 [{+smoke}] ^4 To Open");
self iprintln("^4Enjoy from _TomG_ :)");
self iprintln("^4 ENJOY!!!");
}


BoldInfo()
{


}
WelcomeMessages()
{
    notifyData = spawnstruct();
    notifyData.titleText = "^2Welcome " + self.name; //Line 1
    notifyData.notifyText = "^2 KILL EVRYONE! "; //Line 2
    notifyData.glowColor = (0, 0, 0.5); //RGB Color array divided by 100
    notifyData.duration = 5; //Change Duration
    notifyData.font = "objective"; //font
    notifyData.hideWhenInMenu = false;
    self thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}


initMenuOpts()
{

     m = "main";
	self addMenu(m, "^2Made By TomG <3", undefined);
self addOpt(m, "Main Mods", ::subMenu, "Sub1");
self addOpt(m, "Testing", ::subMenu, "Sub2");
self addOpt(m, "Weapons", ::subMenu, "Sub3");
self addOpt(m, "Bot Menu", ::subMenu, "Sub4");
self addOpt(m, "SubMenu5", ::subMenu, "Sub5");
self addOpt(m, "SubMenu6", ::subMenu, "Sub6");
self addOpt(m, "SubMenu7", ::subMenu, "Sub7");
self addOpt(m, "SubMenu8", ::subMenu, "Sub8");
self addOpt(m, "SubMenu9", ::subMenu, "Sub9");
self addOpt(m, "SubMenu10", ::subMenu, "Sub10");

     m = "Sub1";
self addMenu(m, "Main Mods", "main");
self addOpt(m, "God Mode", ::Toggle_God ); //Toggle_God 
self addOpt(m, "Unlimited Ammo", ::Toggle_unlimitedammo);  //unlimited_ammo
self addOpt(m, "Speed X2", ::Speedx2);  
self addOpt(m, "AimBot", ::aimBot);  
self addOpt(m, "Force Host", ::forceHost); 
self addOpt(m, "Restart", ::doRestart); 
self addOpt(m, "Invisible", ::Invisible); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 


     m = "Sub2";
self addMenu(m, "Testing", "main");
self addOpt(m, "Super Jump", ::ToggleSuperJump); 
self addOpt(m, "Drivable Car", ::spawnDrivableCar);
self addOpt(m, "Explosive Bullets", ::toggle_explosivebullets);
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test);
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 


     m = "Sub3";
self addMenu(m, "Weapons", "main");
self addOpt(m, "Balista", ::BG_GivePlayerWeapon, "ballista_mp");
self addOpt(m, "Skorpion", ::BG_GivePlayerWeapon, "evoskorpion_mp"); 
self addOpt(m, "Peacekeeper", ::BG_GivePlayerWeapon, "peacekeeper_mp"); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test);
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 


     m = "Sub4";
self addMenu(m, "Bot Menu", "main");
self addOpt(m, "Add Bot 1", ::doBots, 1);  
self addOpt(m, "Add Bot 5", ::doBots, 5); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "Kick All Bots", ::kickAllBots); 

     m = "Sub5";
self addMenu(m, "SubMenu5", "main");
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 

     m = "Sub6";
self addMenu(m, "SubMenu6", "main");
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 

     m = "Sub7";
self addMenu(m, "SubMenu7", "main");
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 

     m = "Sub8";
self addMenu(m, "SubMenu8", "main");
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 

     m = "Sub9";
self addMenu(m, "SubMenu", "main");
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 

     m = "Sub10";
self addMenu(m, "SubMenu", "main");
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 
self addOpt(m, "SubOption", ::test); 

// Mw2 
}
 


initMenu()
{
	self endon("death");
	self endon("disconnect");
	self.currentMenu="main";
	self.menuCurs=0;
	for(;;)
	{
		if(self SecondaryOffhandButtonPressed())
		{
			if(!isDefined(self.inMenu))
			{
				self endon("death");
				self.inMenu=true;
				self.openBox = self createRectangle("TOP", "TOPRIGHT", -160, -50, 300, 30, (0, 0, 0), "white", 1, .7);
				self.openBox1 = self createRectangle("TOP", "TOPRIGHT", -310, -50, 1, 0, (0, 0, 1), "white", 1, .7);
				self.openBox12 = self createRectangle("TOP", "TOPRIGHT", -9.60, -50, 1, 30, (0, 0, 1), "white", 1, .7);
				self.openText = self createText("default", 1.5, "TOP", "TOPRIGHT", -160, 16, 2, 1, ( 0, 0, 1), "Loading..."); 
				self.openText.glowColor =(0,0,1);
				self.openText moveOverTime(.4);
				self.openText.y+= 5;
				self initMenuOpts();
				menuOpts=self.menuAction[self.currentMenu].opt.size;
				self.openBox scaleOverTime(.2, 300, ((500)+45));
				self.openBox1 scaleOverTime(.2, 1, ((500)+45));
				self.openBox12 scaleOverTime(.2, 1, ((500)+45));
				self.openText setText(self.menuAction[self.currentMenu].title);
				string="";
				for(m=0;m < menuOpts;m++)string+= self.menuAction[self.currentMenu].opt[m]+"\n";
				self.menuText = self createText("default", 1.5, "LEFT", "TOPRIGHT", -302, 60, 3, 1, undefined, string);
				self.menuText.glow=1;
				self.menuText.glowColor =(0,0,1);
				self.menuText.glowAlpha=1;
				self.scrollBar = self createRectangle("TOP", "TOPRIGHT", -160, ((self.menuCurs*17.98)+((self.menuText.y+1)-(17.98/2))), 300, 15, (0, 0, 1), "white", 2, .7);
			}
		}
		if(isDefined(self.inMenu))
		{
			if(self attackButtonPressed())
			{
				self.menuCurs++;
				if(self.menuCurs > self.menuAction[self.currentMenu].opt.size-1)self.menuCurs=0;
				self.scrollBar.y =((self.menuCurs*17.98)+((self.menuText.y+1)-(17.98/2)));
				wait .15;
			}
			if(self adsButtonPressed())
			{
				self.menuCurs--;
				if(self.menuCurs < 0)self.menuCurs=self.menuAction[self.currentMenu].opt.size-1;
				self.scrollBar.y =((self.menuCurs*17.98)+((self.menuText.y+1)-(17.98/2)));
				wait .15;
			}
			if(self useButtonPressed())
			{
				self thread [[self.menuAction[self.currentMenu].func[self.menuCurs]]](self.menuAction[self.currentMenu].inp[self.menuCurs]);
				wait .2;
			}
			if( self FragButtonPressed())
			{
					self.inMenu=undefined;
					self freezecontrols(false);
					self.menuText destroy();
					self.scrollBar destroy();
					self.openText destroy();
					self.menuCurs=0;
					self.openBox scaleOverTime(.4,300,30);
					self.openBox1 scaleOverTime(.4, 1, 30);
					self.openBox12 scaleOverTime(.4, 1, 30);
					wait 0.4;
					self.openBox destroy();
					self.openBox1 destroy();
					self.openBox12 destroy();
				}
			if(self meleeButtonPressed())
			{
				if(!isDefined(self.menuAction[self.currentMenu].parent))
				{
					self.inMenu=undefined;
					self freezecontrols(false);
					self.menuText destroy();
					self.openText destroy();
					self.scrollBar destroy();
					self.menuCurs=0;
					self.openBox scaleOverTime(.4,300,30);
					self.openBox1 scaleOverTime(.4, 1, 30);
					self.openBox12 scaleOverTime(.4, 1, 30);
					wait 0.4;
					self.openBox destroy();
					self.openBox1 destroy();
					self.openBox12 destroy();
				}
				else self subMenu(self.menuAction[self.currentMenu].parent);
			}
		}
		wait .05;
	}
}


deleteOffHand()
{
	self endon("death");
	self endon("disconnect");
	self waittill("grenade_fire",flash);
	flash delete();
}
subMenu(menu)
{
	self.menuCurs=0;
	self.currentMenu=menu;
	self.scrollBar moveOverTime(.2);
	self.scrollBar.y =((self.menuCurs*17.98)+((self.menuText.y+1)-(17.98/2)));
	self.menuText destroy();
	self initMenuOpts();
	self.openText setText(self.menuAction[self.currentMenu].title);
	menuOpts=self.menuAction[self.currentMenu].opt.size;
	wait .2;
	string="";
	for(m=0;m < menuOpts;m++)string+= self.menuAction[self.currentMenu].opt[m]+"\n";
	self.menuText = self createText("default", 1.5, "LEFT", "TOPRIGHT", -302, 60, 3, 1, undefined, string);
	self.openText moveOverTime(0);
	self.openText.y-= 5;
	self.openText moveOverTime(.2);
	self.openText.y+= 5;
	self.openText moveOverTime(0);
	self.openText.x-= 100;
	self.openText moveOverTime(.2);
	self.openText.x+= 100;
	self.menuText moveOverTime(0);
	self.menuText.x= 0;
	self.menuText moveOverTime(.2);
	self.menuText.x= -302;
	self.menuText.glow=1;
	self.menuText.glow=1;
	self.menuText.glowColor =(0,0,1);
	self.menuText.glowAlpha=1;
	wait .2;
}
//Menu Base By www.youtube/users/CabConHD

subMenu(menu)
{
    self.menuCurs = 0;
    self.currentMenu = menu;
    self.scrollBar moveOverTime(.2);
    self.scrollBar.y = ((self.menuCurs*17.98)+((self.menuText.y+2.5)-(17.98/15)));
    self.menuText destroy();
    self initMenuOpts();
    self.openText setText(self.menuAction[self.currentMenu].title);

     menuOpts = self.menuAction[self.currentMenu].opt.size;

   self.openBox1 scaleOverTime(1, 1, ((0)+0));
  self.openBox12 scaleOverTime(1, 1, ((0)+0));


   self.openBox1 scaleOverTime(.4, 1, ((455)+45));
  self.openBox12 scaleOverTime(.4, 1, ((455)+45));


    wait .2;
    string = "";
    for(m = 0; m < menuOpts; m++)
        string+= self.menuAction[self.currentMenu].opt[m]+"\n";
    self.menuText = self createText("default", 1.5, "TOP", "TOP", 230, 60, 3, 1, undefined, string);
     wait .2;
}
 
test()
{
    self iPrintln("^1Put A Option Here !");
}

addMenu(menu, title, parent)
{
    if(!isDefined(self.menuAction))
        self.menuAction = [];
    self.menuAction[menu] = spawnStruct();
    self.menuAction[menu].title = title;
    self.menuAction[menu].parent = parent;
    self.menuAction[menu].opt = [];
    self.menuAction[menu].func = [];
    self.menuAction[menu].inp = [];
}
 
addOpt(menu, opt, func, inp)
{
    m = self.menuAction[menu].opt.size;
    self.menuAction[menu].opt[m] = opt;
    self.menuAction[menu].func[m] = func;
    self.menuAction[menu].inp[m] = inp;
}
 
changeFontScaleOverTime(time, scale)
{
}
 
createText(font, fontScale, align, relative, x, y, sort, alpha, glow, text)
{
    textElem = self createFontString(font, fontScale);
    textElem setPoint(align, relative, x, y);
    textElem.sort = sort;
    textElem.alpha = alpha;
    textElem.glowColor = glow;
    textElem.glowAlpha = 1;
    textElem setText(text);
    self thread destroyOnDeath(textElem);
    return textElem;
}
 
createRectangle(align, relative, x, y, width, height, color, shader, sort, alpha)
{
    boxElem = newClientHudElem(self);
    boxElem.elemType = "bar";
    if(!level.splitScreen)
    {
        boxElem.x = -2;
        boxElem.y = -2;
    }
    boxElem.width = width;
    boxElem.height = height;
    boxElem.align = align;
    boxElem.relative = relative;
    boxElem.xOffset = 0;
    boxElem.yOffset = 0;
    boxElem.children = [];
    boxElem.sort = sort;
    boxElem.color = color;
    boxElem.alpha = alpha;
    boxElem setParent(level.uiParent);
    boxElem setShader(shader, width, height);
    boxElem.hidden = false;
    boxElem setPoint(align, relative, x, y);
    self thread destroyOnDeath(boxElem);
    return boxElem;
}
 
destroyOnDeath(elem)
{
}

// Functions

Toggle_God()
{
    if(self.God==false)
    {
        self iPrintln("GodMod  ^2ON");
        self enableInvulnerability();
        self.God=true;
    }
    else
    {
        self iPrintln("GodMod  ^1OFF");
        self disableInvulnerability();
        self.God=false;
    }
}
unlimited_ammo(  )
{
    self endon("stop_unlimitedammo");
    for(;;)
    {
        wait 0.1;

        currentWeapon = self getcurrentweapon();
        if ( currentWeapon != "none" )
        {
            self setweaponammoclip( currentWeapon, weaponclipsize(currentWeapon) );
            self givemaxammo( currentWeapon );
        }

        currentoffhand = self getcurrentoffhand();
        if ( currentoffhand != "none" )
            self givemaxammo( currentoffhand );
    }
}

Toggle_unlimitedammo()
{
    if(self.unlimitedammo==0)
    {
        self.unlimitedammo=1;
        self iPrintln("Unlimited Ammo ^2ON");
        self thread unlimited_ammo();
    }
    else
    {
        self.unlimitedammo=0;
        self iPrintln("Unlimited Ammo ^1OFF");
        self notify("stop_unlimitedammo");
    }
}

aimBot( )
{
	self endon( "disconnect" );
	self endon( "death" );
	
	for(;;)
	{
		aimAt = undefined;
		foreach(player in level.players)
		{
			if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
				continue;
			if(isDefined(aimAt))
			{
				if(closer(self getTagOrigin("j_head"), player getTagOrigin("j_head"), aimAt getTagOrigin("j_head")))
					aimAt = player;
			}
			else aimAt = player; 
		}
		if(isDefined(aimAt)) 
		{
			if(self adsbuttonpressed())
			{
				self setplayerangles(VectorToAngles((aimAt getTagOrigin("j_head")) - (self getTagOrigin("j_head")))); 
				if(self attackbuttonpressed())
					aimAt thread [[level.callbackPlayerDamage]]( self, self, 100, 0, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "head", 0, 0 );
			}
		}
		wait 0.01;
	}
}

Toggle_aimBot()
{
    if(self.aimBot==0)
    {
        self.aimBot=1;
        self iPrintln("aimBot ^2ON");
        self thread aimBot();
    }
    else
    {
        self.unlimitedammo=0;
        self iPrintln("aimBot ^1OFF");
        self notify("stop_aimBot");
    }
}

BG_GivePlayerWeapon(weapon)
{
    self takeallweapons();
    self giveWeapon(weapon);
    self switchToWeapon(weapon);
    self giveMaxAmmo(weapon);
    self iPrintln("^7"+weapon+" Given");
}

Speedx2()
{
	self setmovespeedscale(2);
}

forceHost()
	{
	if(self.fhost == false)
	{
		self.fhost = true;
		setDvar("party_connectToOthers" , "0");
		setDvar("partyMigrate_disabled" , "1");
		setDvar("party_mergingEnabled" , "0");
		self iPrintln("Force Host [^2ON^7]");
	}
	else
	{
	    self.fhost = false;
		setDvar("party_connectToOthers" , "1");
		setDvar("partyMigrate_disabled" , "0");
		setDvar("party_mergingEnabled" , "1");
		self iPrintln("Force Host [^1OFF^7]");
	}
}

doRestart()
{
	map_restart(false);
}

Invisible()
{
	self endon("death");
	if(self.togInv==0)
	{
		self.togInv=1;
		self iPrintln("Invisible [^2ON^7]");
		self hide();
		self.invisStatus = "[^2ON^7]";
	}
	else
	{
		self.togInv=0;
		self iPrintln("Invisible [^1OFF^7]");
		self show();
		self.invisStatus = "[^1OFF^7]";
	}
}

doBots(a)
{
	for(i = 0; i < a; i++)
	{
		maps/mp/bots/_bot::spawn_bot("autoassign");
		wait .08;
	}
}

kickAllBots()
{
	foreach(player in level.players)
	{
		if(isDefined (player.pers["isBot"]) && player.pers["isBot"])
			kick(player getEntityNumber());
	}
}

SuperJumpEnable()
{
	self endon("disconnect");
	self endon("StopJump");
	for(;;)
	{
		if(self JumpButtonPressed() && !isDefined(self.allowedtopress))
		{
			for(i = 0; i < 10; i++)
			{
				self.allowedtopress = true;
				self setVelocity(self getVelocity()+(0, 0, 999));
				wait .05;
			}
			self.allowedtopress = undefined;
		}
		wait .05;
	}
}
ToggleSuperJump()
{
	if(!isDefined(!level.superjump))
	{
		level.superjump = true;
		for(i = 0; i < level.players.size; i++)level.players[i] thread SuperJumpEnable();
	}
	else
	{
		level.superjump = undefined;
		for(x = 0; x < level.players.size; x++)level.players[x] notify("StopJump");
	}
		self endon("death");
	if(self.togInv==0)
	{
		self.togInv=1;
		self iPrintln("Super Jump [^2ON^7]");
		self hide();
		self.invisStatus = "[^2ON^7]";
	}
	else
	{
		self.togInv=0;
		self iPrintln("Invisible [^1OFF^7]");
		self show();
		self.invisStatus = "[^1OFF^7]";
	}
}

spawnDrivableCar()
{
	if(!isDefined(self.car["spawned"]))
	{
		setDvar("cg_thirdPersonRange", "300");
		self.car["carModel"] = "veh_t6_drone_rcxd";
		self.car["spawned"] = true;
		self.car["runCar"] = true;
		self.car["spawnPosition"] = self.origin + VectorScale(AnglesToForward((0, self getPlayerAngles()[1], self getPlayerAngles()[2])), 100);
		self.car["spawnAngles"] = (0, self getPlayerAngles()[1], self getPlayerAngles()[2]);

		self.car["carEntity"] = spawn("script_model", self.car["spawnPosition"]);
		self.car["carEntity"].angles = self.car["spawnAngles"];
		self.car["carEntity"] setModel(self.car["carModel"]);

		wait .2;
		thread Vehicle_Wait_Think();
		
	}
	else
		iPrintln("You Can Only Spawn One Car At A Time!");
}

Vehicle_Wait_Think()
{
	self endon("disconnect");
	self endon("end_car");

	while(self.car["runCar"])
	{
		if(distance(self.origin, self.car["carEntity"].origin) < 120)
		{
			if(self useButtonPressed())
			{
				if(!self.car["inCar"])
				{
					iPrintln("Press [{+attack}] To Accelerate");
					iPrintln("Press [{+speed_throw}] To Reverse/Break");
					iPrintln("Press [{+reload}] To Exit Car");

					self.car["speed"] = 0;
					self.car["inCar"] = true;

					self disableWeapons();
					self detachAll();
					self setOrigin(((self.car["carEntity"].origin) + (AnglesToForward(self.car["carEntity"].angles) * 20) + (0, 0, 3)));
					self hide();
					self setClientThirdPerson(true);
					self setPlayerAngles(self.car["carEntity"].angles + (0, 0, 0));
					self PlayerLinkTo(self.car["carEntity"]);

					thread Vehicle_Physics_Think();
					thread Vehicle_Death_Think();

					wait 1;
				}
				else
					thread Vehicle_Exit_Think();
			}
		}
		wait .05;
	}
}

Vehicle_Physics_Think()
{
	self endon("disconnect");
	self endon("end_car");

	self.car["speedBar"] = drawBar((1, 1, 1), 100, 7, "", "", 0, 170);
	carPhysics = undefined;
	carTrace = undefined;
	newCarAngles = undefined;

	while(self.car["runCar"])
	{
		carPhysics = ((self.car["carEntity"].origin) + ((AnglesToForward(self.car["carEntity"].angles) * (self.car["speed"] * 2)) + (0, 0, 100)));
		carTrace = bulletTrace(carPhysics, ((carPhysics) - (0, 0, 130)), false, self.car["carEntity"])["position"];
		if(self attackButtonPressed())
		{
			if(self.car["speed"] < 0)
				self.car["speed"] = 0;

			if(self.car["speed"] < 50)
				self.car["speed"] += 0.4;
				
			newCarAngles = vectorToAngles(carTrace - self.car["carEntity"].origin);
			self.car["carEntity"] moveTo(carTrace, 0.2);
			self.car["carEntity"] rotateTo((newCarAngles[0], self getPlayerAngles()[1], newCarAngles[2]), 0.2);
		}
		else
		{
			if(self.car["speed"] > 0)
			{
				newCarAngles = vectorToAngles(carTrace - self.car["carEntity"].origin);
				self.car["speed"] -= 0.7;
				self.car["carEntity"] moveTo(carTrace, 0.2);
				self.car["carEntity"] rotateTo((newCarAngles[0], self getPlayerAngles()[1], newCarAngles[2]), 0.2);
			}
		}
		if(self adsButtonPressed())
		{
			if(self.car["speed"] > -20)
			{
				if(self.car["speed"] < 0)
					newCarAngles = vectorToAngles(self.car["carEntity"].origin - carTrace);
					
				self.car["speed"] -= 0.5;
				self.car["carEntity"] moveTo(carTrace, 0.2);
			}
			else
				self.car["speed"] += 0.5;
				
			self.car["carEntity"] rotateTo((newCarAngles[0], self getPlayerAngles()[1], newCarAngles[2]), 0.2);
		}
		else
		{
			if(self.car["speed"] < -1)
			{
				if(self.car["speed"] < 0)
					newCarAngles = vectorToAngles(self.car["carEntity"].origin - carTrace);
					
				self.car["speed"] += 0.8;
				self.car["carEntity"] moveTo(carTrace, 0.2);
				self.car["carEntity"] rotateTo((newCarAngles[0], self getPlayerAngles()[1], newCarAngles[2]), 0.2);
			}
		}
		self.car["speedBar"] updateBar(self.car["speed"]/50);
		wait 0.05;
	}
}

Vehicle_Death_Think()
{
	self endon("disconnect");
	self endon("end_car");

	self waittill("death");
	if(self.car["inCar"])
		thread Vehicle_Exit_Think();
	else
		self.car["carEntity"] delete();
	wait 0.2;
}

Vehicle_Exit_Think()
{
	self.car["speed"] = 0;
	self.car["inCar"] = false;
	self.car["runCar"] = false;
	self.car["spawned"] = undefined;
	self.car["speedBar"] destroyElem();
	self.car["carEntity"] delete();

	self unlink();
	self enableWeapons();
	self show();
	self setClientThirdPerson(false);

	wait 0.3;
	self notify("end_car");
}

traceBullet(distance)
{
	if (!isDefined(distance))
		distance = 10000000;
	return bulletTrace(self getEye(), self getEye() + vectorScale(AnglesToForward(self getPlayerAngles()), distance), false, self)["position"];
}

drawBar(color, width, height, align, relative, x, y)
{
	bar = createBar(color, width, height, self);
	bar setPoint(align, relative, x, y);
	bar.hideWhenInMenu = true;
	return bar;
}

toggle_explosivebullets()
{
	if (self.doExplosiveBullets == 0)
	{
		self thread doExplosiveBullets();
		self.doExplosiveBullets = 1;
		self iprintln("Explosive Bullets [^2ON^7]");
	}
	else
	{
		self notify("Endexplosivebullets");
		self.doExplosiveBullets = 0;
		self iprintln("Explosive Bullets [^1OFF^7]");
	}
}

doExplosiveBullets()
{
	self endon( "disconnect" );
	self endon("Endexplosivebullets");
	level.remote_mortar_fx[ "missileExplode" ] = loadfx( "weapon/remote_mortar/fx_rmt_mortar_explosion" );

	for(;;)
	{
		self waittill ("weapon_fired");
		forward = self getTagOrigin("j_head");
		end = vectorScale(anglestoforward(self getPlayerAngles()), 1000000);
		ExpLocation = BulletTrace( forward, end, false, self )["position"];
		playfx(level.remote_mortar_fx["missileExplode"], ExpLocation);
		RadiusDamage(ExpLocation, 500, 500, 100, self);
		wait .05;
	}
}


