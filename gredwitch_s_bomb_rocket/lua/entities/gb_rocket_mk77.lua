AddCSLuaFile()

DEFINE_BASECLASS( "base_rocket" )

local ExploSnds = {}
ExploSnds[1]                         =  "explosions/gbombs_napalm_1.mp3"
ExploSnds[2]                         =  "explosions/gbombs_napalm_2.mp3"
ExploSnds[3]                         =  "explosions/gbombs_napalm_3.mp3"
ExploSnds[4]                         =  "explosions/gbombs_napalm_4.mp3"

local CloseExploSnds = {}
CloseExploSnds[1]                         =  "explosions/gbombs_napalm_1.mp3"
CloseExploSnds[2]                         =  "explosions/gbombs_napalm_2.mp3"
CloseExploSnds[3]                         =  "explosions/gbombs_napalm_3.mp3"
CloseExploSnds[4]                         =  "explosions/gbombs_napalm_4.mp3"

local DistExploSnds = {}
DistExploSnds[1]                         =  "explosions/gbombs_napalm_1.mp3"
DistExploSnds[2]                         =  "explosions/gbombs_napalm_2.mp3"
DistExploSnds[3]                         =  "explosions/gbombs_napalm_3.mp3"
DistExploSnds[4]                         =  "explosions/gbombs_napalm_4.mp3"

local WaterExploSnds = {}
WaterExploSnds[1]                         =  "explosions/gbombs_napalm_1.mp3"
WaterExploSnds[2]                         =  "explosions/gbombs_napalm_2.mp3"
WaterExploSnds[3]                         =  "explosions/gbombs_napalm_3.mp3"
WaterExploSnds[4]                         =  "explosions/gbombs_napalm_4.mp3"

local CloseWaterExploSnds = {}
CloseWaterExploSnds[1]                         =  "explosions/gbombs_napalm_1.mp3"
CloseWaterExploSnds[2]                         =  "explosions/gbombs_napalm_2.mp3"
CloseWaterExploSnds[3]                         =  "explosions/gbombs_napalm_3.mp3"
CloseWaterExploSnds[4]                         =  "explosions/gbombs_napalm_4.mp3"

ENT.Spawnable		     	=  true
ENT.AdminSpawnable		 	=  true

ENT.PrintName		 		=  "[ROCKETS]Mark 77 Napalm"
ENT.Author			 		=  ""
ENT.Contact			 		=  ""
ENT.Category         		=  "Gredwitch's Stuff"

ENT.Model              		=  "models/gbombs/napalm.mdl"
ENT.RocketTrail        		=  "fire_jet_01"
ENT.RocketBurnoutTrail 		=  ""
ENT.Effect             		=  "napalm_explosion"
ENT.EffectAir          		=  "napalm_explosion_midair"
ENT.EffectWater        		=  "water_medium"  
ENT.StartSound         		=  "gunsounds/fh2_rocket_1p.wav"
ENT.ArmSound           		=  "npc/roller/mine/rmine_blip3.wav"
ENT.ActivationSound    		=  "buttons/blip2.wav"
ENT.EngineSound        		=  ""

ENT.ExplosionSound        	=  table.Random(CloseExploSnds)
ENT.FarExplosionSound		=  table.Random(ExploSnds)
ENT.DistExplosionSound		=  table.Random(DistExploSnds)
ENT.WaterExplosionSound		=  table.Random(CloseWaterExploSnds)
ENT.WaterFarExplosionSound	=  table.Random(WaterExploSnds)

ENT.StartSoundFollow		=	true

ENT.ExplosionDamage			=	750
ENT.ExplosionRadius			=	950
ENT.Mass           			=	340
ENT.EnginePower    			=	115600
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

function ENT:AddOnExplode()
	local ent = ents.Create("base_napalm")
	local pos = self:GetPos()
	ent:SetPos(pos)
	ent:Spawn()
	ent:Activate()
	ent:SetVar("GBOWNER",self.GBOWNER)
end