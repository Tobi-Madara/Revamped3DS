void(vector org, vector vel, float damage) SpawnBlood;
vector() wall_velocity;


void()	s_explode1	=	[0,		s_explode2] {};
void()	s_explode2	=	[1,		s_explode3] {};
void()	s_explode3	=	[2,		s_explode4] {};
void()	s_explode4	=	[3,		SUB_Remove] {};


void(vector org) CreateExplosion =
{
	local entity s;
	s = self; // save old self

	self = spawn();
	self.movetype = MOVETYPE_NONE;
	self.velocity = '0 0 0';
	self.touch = SUB_Null;
	setmodel (self, "progs/s_explod.spr");
	setorigin (self, org);
	self.solid = SOLID_NOT;
	
	s_explode1 ();
	
	self = s; // restore old self
};

void ( float famt ) Set_FOV =
{
	stuffcmd( self, "fov " );
	stuffcmd( self, ftos( famt ) );
	stuffcmd( self, "\n" );
};
void () WeaponZoom =
{
	float tozoom;

	if (self.health < 1)
		return;
	
if (self.weapon == IT_SNIPER)
			{
		if (self.pfov < FOV_DEFAULT)
				tozoom = 15;
			else 
				tozoom = 45;
			}
	if (self.pfov == tozoom)
		tozoom = FOV_DEFAULT;
	
	Set_FOV( tozoom );
	self.pfov = tozoom;
};
/*
================
SpawnBlood
================
*/
void(vector org, vector vel, float damage) SpawnBlood =
{
	particle (org, vel*0.1, 73, damage*2);
};
/*
================
spawn_touchblood
================
*/
void(float damage) spawn_touchblood =
{
	local vector	vel;

	vel = wall_velocity () * 0.2;
	SpawnBlood (self.origin + vel*0.01, vel, damage);
};

	
/*
==============
Muzzleflashes
==============
*/
void() flash1_think =
{
self.frame = self.frame + 1;
self.think = SUB_Remove;
self.nextthink = time + 0.01;
};
void() blaster_flash =
{
local vector dir;
local entity flash;
flash = spawn();
flash.owner = self;
flash.solid = SOLID_NOT;
flash.movetype = MOVETYPE_NONE;
flash.classname = "muzzleflash";
flash.velocity = aim(self, 1000);
flash.velocity = flash.velocity + '0 0 0';
setorigin (flash, self.origin + dir + v_forward * 22 + v_right * 10.5 + '0 0 7');
makevectors (self.v_angle);
if (self.weapon == IT_BLASTER)
setmodel(flash,"progs/blaster_muzzle.spr");
if (self.weapon == IT_RIC)
setmodel(flash,"progs/ric_muzzle.spr");
if (self.weapon == IT_SNIPER)
setmodel(flash,"progs/sniper_muzzle.spr");
if (self.weapon == IT_SPLASER)
setmodel(flash,"progs/splaser_muzzle.spr");
flash.think = flash1_think;
flash.nextthink = time + 0.01;
};

void()	s_sniper	=	[0,		s_sniper2] {};
void()	s_sniper2	=	[1,		s_sniper3] {};
void()	s_sniper3	=	[2,		s_sniper4] {};
void()	s_sniper4	=	[3,		SUB_Remove] {};

//Creates a small blue body that Rises when You kill someone.
void(vector org) body =
{
local entity dbody;

dbody = spawn();
dbody.owner = self;
dbody.classname = "dbody";

dbody.solid = SOLID_NOT;
dbody.movetype = MOVETYPE_FLY;

dbody.velocity = aim(self, 1000);
dbody.velocity = dbody.velocity + v_up * 100;
dbody.angles = vectoangles(dbody.velocity);
setorigin(dbody, org);

setmodel (dbody, "progs/body.spr");
dbody.think = SUB_Remove;
dbody.nextthink = time + 1.5;
	
};
//Boost: An ability for the Morphball. It lets the ball get a boost of speed.


void() boost =
{
local vector dir;
if (self.boostlives == 0 || self.boostlives < 1 || self.weapon != IT_MORPHBALL)
	return;
	dir = aim (self, 1000);
	sound (self, CHAN_WEAPON, "weapons/boost.wav", 1, ATTN_NORM);
	if (vlen(self.velocity) >= 100)
	self.velocity = self.velocity + (dir * 650);
	else if (vlen(self.velocity) >= 200)
	self.velocity = self.velocity + (dir * 750);
	else if (vlen(self.velocity) >= 300)
	self.velocity = self.velocity + (dir * 950);
	else
	self.velocity = self.velocity + (dir * 550);
	self.boostlives -= 1;
}; 