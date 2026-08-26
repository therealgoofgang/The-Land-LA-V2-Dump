--[[ ====================================================================================================================================

	Project: "Enhanced Driveby Animations (EDA)"
	Copyright � 2022 Delta District (deltadistrict.com)

]]-- ====================================================================================================================================

config={
	aimingRequired=true, 		-- Players will not be able to shoot unless they are aiming (This is recommended to avoid issues)
	restrictDriver=true, 		-- Driver can not aim or shoot weapons while driving	(Note: Driver does not have a custom clipset yet.)
	disableAtSpeed=0.0,		-- Max speed (m/s) limit to disable driveby aiming		(Set to 0.0 or very high to allow at any speeds)
								-- Default: ~60 MPH			Conversion:		m * 2.237 for MPH		m * 3.6 for KPH
								
	cameraMode=0, 				-- 0: Custom Camera Disabled	1: Only used for vehicles on list	2: Default for all vehicles
	camTransition=0,			-- 0: Smooth	1: Instant
	dCamFov=65.0,				-- Third Person Camera Feild of View
	fpCamFov=65.0,				-- First Person Camera Feild of View
	useCamAlways=false,			-- Custom camera will be available to use even when not aiming
	autoActivate=false,			-- Automatically activate custom camera when player enters a vehicle
	fpOnly=false, 				-- Restrict the driveby camera to first-person 		(Note: This will override allowVehCam)
	allowVehCam=true,			-- Allow player to switch to the regular vehicle camera

	shakeCamForRecoil=false,		-- Shake camera for weapon recoil
	upRecoilForSpeed=false,		-- Change recoil depending on vehicle speed
	camShakeScale=0.75,			-- 0.0 - 1.0 amount to shake camera
}

-- Camera Mode 0: Disabled for all vehicles
-- Camera Mode 1: Use this list to specify which default (1) and custom (2) vehicles	
-- Camera Mode 2: Use this list to disable (0) certain vehicles and to specify custom (2) vehicles

--	0: Disable 		1: Enable (default driveby)		2: Enable (custom driveby)		(Note: Only need to disable if using cameraMode 2)
vehList={
	[`buffalo`]=1,
	[`gauntlet`]=1,
	[`minivan`]=1,
	[`cavalcade`]=1,
	['gstkrobuffhell1'] = 2,
	['amwbhawk'] = 2,
	['demondurango'] = 2,
	['gstcara1'] = 2
}--
