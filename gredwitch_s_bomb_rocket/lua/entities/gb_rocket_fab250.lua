AddCSLuaFile()

DEFINE_BASECLASS( "base_rocket" )

local ExploSnds = {}
ExploSnds[1]                         =  "explosions/doi_generic_01.wav"
ExploSnds[2]                         =  "explosions/doi_generic_02.wav"
ExploSnds[3]                         =  "explosions/doi_generic_03.wav"
ExploSnds[4]                         =  "explosions/doi_generic_04.wav"

local CloseExploSnds = {}
CloseExploSnds[1]                         =  "explosions/doi_generic_01_close.wav"
CloseExploSnds[2]                         =  "explosions/doi_generic_02_close.wav"
CloseExploSnds[3]                         =  "explosions/doi_generic_03_close.wav"
CloseExploSnds[4]                         =  "explosions/doi_generic_04_close.wav"

local DistExploSnds = {}
DistExploSnds[1]                         =  "explosions/doi_generic_01_dist.wav"
DistExploSnds[2]                         =  "explosions/doi_generic_02_dist.wav"
DistExploSnds[3]                         =  "explosions/doi_generic_03_dist.wav"
DistExploSnds[4]                         =  "explosions/doi_generic_04_dist.wav"

local WaterExploSnds = {}
WaterExploSnds[1]                         =  "explosions/doi_generic_01_water.wav"
WaterExploSnds[2]                         =  "explosions/doi_generic_02_water.wav"
WaterExploSnds[3]                         =  "explosions/doi_generic_03_water.wav"
WaterExploSnds[4]                         =  "explosions/doi_generic_04_water.wav"

local CloseWaterExploSnds = {}
CloseWaterExploSnds[1]                         =  "explosions/doi_generic_02_closewater.wav"
CloseWaterExploSnds[2]                         =  "explosions/doi_generic_02_closewater.wav"
CloseWaterExploSnds[3]                         =  "explosions/doi_generic_03_closewater.wav"
CloseWaterExploSnds[4]                         =  "explosions/doi_generic_04_closewater.wav"

ENT.Spawnable		     	=  true
ENT.AdminSpawnable		 	=  true

ENT.PrintName		 		=  "[ROCKETS]FAB-250"
ENT.Author			 		=  ""
ENT.Contact			 		=  ""
ENT.Category         		=  "Gredwitch's Stuff"

ENT.Model              		=  "models/gredwitch/bombs/fab250.mdl"
ENT.RocketTrail        		=  "fire_jet_01"
ENT.RocketBurnoutTrail 		=  "ins_flaregun_trail_smoke"
ENT.Effect             		=  "doi_artillery_explosion"
ENT.EffectAir          		=  "doi_artillery_explosion"
ENT.EffectWater        		=  "ins_water_explosion"  
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
ENT.ExplosionRadius			=	1000
ENT.Mass           			=	250
ENT.EnginePower    			=	120000
ENT.TNTEquivalent			=	3.4
ENT.FuelBurnoutTime			=	5
ENT.LinearPenetration		=	200
ENT.MaxVelocity				=	300
ENT.Caliber					=	127
ENT.Decal					=	"scorch_medium"
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