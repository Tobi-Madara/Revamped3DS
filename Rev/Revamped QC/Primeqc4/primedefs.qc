/*
==========================================
Some helpful things On my code.
1- If you see stuff like 
	if (self.health <= 25) or
	self.health = 20;
That is For the Suit function. It makes the suit stop working and Such. Could be a problem In campaign.

2- If you see mballtoggle everywhere, That is the Morphball system.


==========================================
*/




void() player_run;
.float morphbombs;
.float mballset;
.float ammo_sniper;
.float pfov;
.float donefire;
.float ammo_ric;
.float charge;
.float lives;
.float ammo_lava;
float DOUBLEJUMP_EXTRAJUMPS = 1; // how many times you can jump in the air (0 = quake, 1 = double jump, 2 = triple jump, ...)
float DOUBLEJUMP_TIMER = 0.2; // you can't doublejump faster than this
.float doublejump_time;
.float doublejump_lives; 
.float ammo_blaster;
.float energy;
.float boostlives;
float CHARGEHEALTH = 25;	// Will contribute to the Health system
float BROKENITEMS = 20;		// This is the point where Items malfunction and Don't work

#define FOV_DEFAULT	90


void() CycleWeaponCommand;
/*
===================
Missle Mode --Ghost
===================
*/

$frame missle1 missle2 missle3 missle4 missle5 missle6 missle7 missle8 missle9 missle10 missle11 missle12 missle13 missle14 missle15 missle16 missle17 missle18 missle19 missle20 missle21 missle22 missle23 missle24 missle25 $frame missle26
$frame mball1 mball2 mball3 mball4 mball5 mball6 mball7

void() player_mball0 =
{
self.weapon = IT_BLASTER;
	if (self.velocity_x || self.velocity_y)
	{
		if (self.walkframe > 8)
			self.frame = 1;
		self.frame = self.walkframe;
	}
self.frame = self.walkframe + 1;
};
//Transform --Ghost
void()	player_missle1 =	[$missle1, player_missle2]   
{ if (self.ammo_rockets == 0)
	CycleWeaponCommand();
else
self.weaponframe=12;};
void()	player_missle2 =	[$missle2, player_missle3]   {self.weaponframe=13;};
void()	player_missle3 =	[$missle3, player_missle4]   {self.weaponframe=14;};
void()	player_missle4 =	[$missle4, player_missle5]   {self.weaponframe=15;};
void()	player_missle5 =	[$missle5, player_missle6]   {self.weaponframe=16;};
void()	player_missle6 =	[$missle6, player_missle7]   {self.weaponframe=17;};
void()	player_missle7 =	[$missle7, player_missle8]   {self.weaponframe=18;};
void()	player_missle8 =	[$missle8, player_missle9]  {self.weaponframe=19;};
void()	player_missle9 =	[$missle9, player_missle10] {self.weaponframe=20;};
void()	player_missle10 =	{self.weaponframe=21;};

//Going back to blaster mode --Ghost
void()	player_missle27 =	[$missle1, player_missle28]   {self.weaponframe=35;};
void()	player_missle28 =	[$missle2, player_missle29]   {self.weaponframe=36;};
void()	player_missle29 =	[$missle3, player_missle30]   {self.weaponframe=37;};
void()	player_missle30 =	[$missle4, player_missle31]   {self.weaponframe=38;};
void()	player_missle31 =	[$missle5, player_missle32]   {self.weaponframe=39;};
void()	player_missle32 =	[$missle6, player_missle33]   {self.weaponframe=40;};
void()	player_missle33 =	[$missle7, player_missle34]   {self.weaponframe=41;};
void()	player_missle34 =	[$missle8, player_missle35]   {self.weaponframe=42;};
void()	player_missle35 =	[$missle9, player_missle36]   {self.weaponframe=43;};
void()	player_missle36 = {self.weaponframe=44;};

// Transfom Into Richochet beam
void()	player_missle37 =	[$missle1, player_missle38]   
{if (self.ammo_ric == 0)
	CycleWeaponCommand();
else
self.weaponframe=45;};
void()	player_missle38 =	[$missle2, player_missle39]   {self.weaponframe=46;};
void()	player_missle39 =	[$missle3, player_missle40]   {self.weaponframe=47;};
void()	player_missle40 =	{self.weaponframe=48;};
//Transform Back from richochet beam
void()	player_missle41 =	[$missle1, player_missle42]   {self.weaponframe=60;};
void()	player_missle42 =	[$missle2, player_missle43]   {self.weaponframe=61;};
void()	player_missle43 =	[$missle3, player_missle44]   {self.weaponframe=62;};
void()	player_missle44 = {self.weaponframe=63;};

 