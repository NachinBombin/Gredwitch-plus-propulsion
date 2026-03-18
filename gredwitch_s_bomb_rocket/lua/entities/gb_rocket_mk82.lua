AddCSLuaFile()

DEFINE_BASECLASS( "base_rocket" )

local ExploSnds = {}
ExploSnds[1]                         =  "explosions/doi_stuka_close.wav"
ExploSnds[2]                         =  "explosions/doi_stuka_close.wav"
ExploSnds[3]                         =  "explosions/doi_stuka_close.wav"

local CloseExploSnds = {}
CloseExploSnds[1]                         =  "explosions/doi_stuka_close.wav"
CloseExploSnds[2]                         =  "explosions/doi_stuka_close.wav"
CloseExploSnds[3]                         =  "explosions/doi_stuka_close.wav"

local DistExploSnds = {}
DistExploSnds[1]                         =  "explosions/doi_stuka_dist.wav"
DistExploSnds[2]                         =  "explosions/doi_stuka_dist.wav"
DistExploSnds[3]                         =  "explosions/doi_stuka_dist.wav"

local WaterExploSnds = {}
WaterExploSnds[1]                         =  "explosions/doi_stuka_far.wav"
WaterExploSnds[2]                         =  "explosions/doi_stuka_far.wav"
WaterExploSnds[3]                         =  "explosions/doi_stuka_far.wav"

local CloseWaterExploSnds = {}
CloseWaterExploSnds[1]                         =  "explosions/doi_stuka_far.wav"
CloseWaterExploSnds[2]                         =  "explosions/doi_stuka_far.wav"
CloseWaterExploSnds[3]                         =  "explosions/doi_stuka_far.wav"

ENT.Spawnable		     	=  true
ENT.AdminSpawnable		 	=  true

ENT.PrintName		 		=  "[ROCKETS]Mark 82 500lb"
ENT.Author			 		=  ""
ENT.Contact			 		=  ""
ENT.Category         		=  "Gredwitch's Stuff"

ENT.Model              		=  "models/gbombs/bomb_mk82.mdl"
ENT.RocketTrail        		=  "fire_jet_01"
ENT.RocketBurnoutTrail 		=  "ins_flaregun_trail_smoke"
ENT.Effect             		=  "500lb_ground"
ENT.EffectAir          		=  "500lb_ground"
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
ENT.ExplosionRadius			=	1450
ENT.Mass           			=	500
ENT.EnginePower    			=	240000
ENT.TNTEquivalent			=	3.4
ENT.FuelBurnoutTime			=	5
ENT.LinearPenetration		=	200
ENT.MaxVelocity				=	300
ENT.Caliber					=	127
ENT.Decal					=	"scorch_huge"
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