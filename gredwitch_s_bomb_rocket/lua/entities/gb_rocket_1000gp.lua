AddCSLuaFile()

DEFINE_BASECLASS( "base_rocket" )

local ExploSnds = {}
ExploSnds[1]                         =  "explosions/gbomb_3.mp3"
ExploSnds[2]                         =  "explosions/gbomb_3.mp3"
ExploSnds[3]                         =  "explosions/gbomb_3.mp3"

local CloseExploSnds = {}
CloseExploSnds[1]                         =  "explosions/gbomb_3.mp3"
CloseExploSnds[2]                         =  "explosions/gbomb_3.mp3"
CloseExploSnds[3]                         =  "explosions/gbomb_3.mp3"

local DistExploSnds = {}
DistExploSnds[1]                         =  "explosions/gbomb_3.mp3"
DistExploSnds[2]                         =  "explosions/gbomb_3.mp3"
DistExploSnds[3]                         =  "explosions/gbomb_3.mp3"

local WaterExploSnds = {}
WaterExploSnds[1]                         =  "explosions/gbomb_3.mp3"
WaterExploSnds[2]                         =  "explosions/gbomb_3.mp3"
WaterExploSnds[3]                         =  "explosions/gbomb_3.mp3"

local CloseWaterExploSnds = {}
CloseWaterExploSnds[1]                         =  "explosions/gbomb_3.mp3"
CloseWaterExploSnds[2]                         =  "explosions/gbomb_3.mp3"
CloseWaterExploSnds[3]                         =  "explosions/gbomb_3.mp3"

ENT.Spawnable		     	=  true
ENT.AdminSpawnable		 	=  true

ENT.PrintName		 		=  "[ROCKETS]1000LB GP"
ENT.Author			 		=  ""
ENT.Contact			 		=  ""
ENT.Category         		=  "Gredwitch's Stuff"

ENT.Model              		=  "models/gredwitch/bombs/1000lbgp.mdl"
ENT.RocketTrail        		=  "fire_jet_01"
ENT.RocketBurnoutTrail 		=  "ins_flaregun_trail_smoke"
ENT.Effect             		=  "cloudmaker_ground"
ENT.EffectAir          		=  "cloudmaker_ground"
ENT.EffectWater        		=  "water_huge"  
ENT.StartSound         		=  "gunsounds/fh2_rocket_3p.wav"
ENT.ArmSound           		=  "npc/roller/mine/rmine_blip3.wav"
ENT.ActivationSound    		=  "buttons/blip2.wav"
ENT.EngineSound        		=  ""

ENT.ExplosionSound        	=  table.Random(CloseExploSnds)
ENT.FarExplosionSound		=  table.Random(ExploSnds)
ENT.DistExplosionSound		=  table.Random(DistExploSnds)
ENT.WaterExplosionSound		=  table.Random(CloseWaterExploSnds)
ENT.WaterFarExplosionSound	=  table.Random(WaterExploSnds)

ENT.StartSoundFollow		=	true

ENT.ExplosionDamage			=	16000
ENT.ExplosionRadius			=	3500
ENT.Mass           			=	500
ENT.EnginePower    			=	150000
ENT.TNTEquivalent			=	3.4
ENT.FuelBurnoutTime			=	5
ENT.LinearPenetration		=	200
ENT.MaxVelocity				=	300
ENT.Caliber					=	127
ENT.Decal					=	"scorch_gigantic"
-- ENT.RotationalForce			=	500

function ENT:SpawnFunction( ply, tr )
    if (!tr.Hit) then return end
	
    local ent = ents.Create(self.ClassName)
	ent:SetPhysicsAttacker(ply)
	ent.Owner = ply
    ent:SetPos(tr.HitPos + tr.HitNormal * 16) 
    ent:Spawn()
    ent:Activate()
	
    return ent
end

function ENT:DoPreInit()
	self.ExplosionSound	= CloseExploSnds[math.random(#CloseExploSnds)]
	self.FarExplosionSound	= ExploSnds[math.random(#ExploSnds)]
	self.DistExplosionSound	= DistExploSnds[math.random(#DistExploSnds)]
	self.WaterExplosionSound	= CloseWaterExploSnds[math.random(#CloseWaterExploSnds)]
	self.WaterFarExplosionSound	= WaterExploSnds[math.random(#WaterExploSnds)]
end