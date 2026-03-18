AddCSLuaFile()

DEFINE_BASECLASS( "base_rocket" )

ENT.Spawnable		     	=  true
ENT.AdminSpawnable		 	=  true

ENT.PrintName		 		=  "[ROCKETS] CBU-52U"
ENT.Author			 		=  ""
ENT.Contact			 		=  ""
ENT.Category         		=  "Gredwitch's Stuff"

ENT.Model              		=  "models/gbombs/bomb_cbu.mdl"
ENT.RocketTrail        		=  "fire_jet_01"
ENT.RocketBurnoutTrail 		=  ""
ENT.Effect             		=  "high_explosive_main_2"
ENT.EffectAir          		=  "high_explosive_air_2"
ENT.EffectWater        		=  "water_medium"  
ENT.StartSound         		=  "gunsounds/fh2_rocket_1p.wav"
ENT.ArmSound           		=  "npc/roller/mine/rmine_blip3.wav"
ENT.ActivationSound    		=  "buttons/blip2.wav"
ENT.EngineSound        		=  ""

ENT.StartSoundFollow		=	true

ENT.ExplosionDamage			=	200
ENT.ExplosionRadius			=	600
ENT.Mass           			=	52
ENT.EnginePower    			=	17680
ENT.TNTEquivalent			=	3.4
ENT.FuelBurnoutTime			=	5
ENT.LinearPenetration		=	200
ENT.MaxVelocity				=	300
ENT.Caliber					=	127
ENT.Decal					=	""
-- ENT.RotationalForce			=	500

function ENT:AddOnExplode()
	local pos = self:LocalToWorld(self:OBBCenter())
	
	local entities = {}
	
	for i = 1,10 do
		local ent = ents.Create("gb_bomb_cbubomblet") 
		ent:SetPos(pos) 
		ent.Owner = self.Owner
		ent.ang = Angle(math.random(-160,-20),math.random(-70,70),math.random(-70,70))
		-- ent:SetModelScale(0.1)
		-- ent:SetAngles(ent.ang)
		ent:SetNoDraw(true)
		ent:Spawn()
		ent:Activate()
		constraint.NoCollide(ent,self,0,0)
		
		table.insert(entities,ent)
	end
	
	for i = 1,#entities do
		
		for k = 1,#entities do
			constraint.NoCollide(entities[i],entities[k],0,0)
		end
		
		entities[i]:Arm()
		entities[i]:TimedExplosion()
		
		local bphys = entities[i]:GetPhysicsObject()
		
		if IsValid(bphys) then
			bphys:SetVelocityInstantaneous(entities[i].ang:Forward() * 500)
		end
	end
end

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