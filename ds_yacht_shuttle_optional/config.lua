Config = {}
Config.Version = '1.2.0'

--  command. Use /gol to start the repeating shuttle service.
Config.Command = 'gol'

-- Native GTA V models, no dependency required.
Config.BoatModel = 'toro2'
Config.CaptainModel = 's_m_m_pilot_01'

-- Boarding and arrival timing, in seconds.
Config.BeachBoardingTime = 12
Config.EmptyConfirmTime = 1

-- Natural boat speeds in metres per second.
Config.CruiseSpeed = 13.0
Config.ApproachSpeed = 6.0
Config.DockSpeed = 1.8

Config.DockRange = 2.0
-- Some MLO collision shells stop the AI just before the exact coordinate.
-- If the boat remains this close at low speed, the dock is considered reached.
Config.DockFallbackRange = 12.0
Config.DockFallbackSpeed = 2.2
Config.DockFallbackTime = 2.0
Config.TravelTimeout = 120
Config.RouteRetryDelay = 2
-- The beach has open water: this wider natural stop radius prevents GTA from
-- circling an exact point or reporting a false failure after visibly returning.
Config.BeachReturnRange = 5.0
Config.DrivingStyle = 786603
Config.BoatMissionType = 4
Config.BoatMissionRadius = -1.0
Config.BoatMissionFlags = 7
Config.NavigationWaterZ = 0.0
Config.YachtTurnDistance = 70.0

-- Supplied yacht shuttle positions.
Config.Stops = {
    beachDeparture = vector4(-2328.8352, -376.9817, 1.4568, 149.5828),
    yachtArrival = vector4(-2440.2000, -612.6800, 3.8200, 152.2400)
}

-- Safe player landing points used by E when leaving the shuttle.
Config.SafeExit = {
    yacht = vector4(-2447.0700, -613.9400, 2.8200, 152.2400),
    beach = vector4(-2328.8352, -376.9817, 1.4568, 149.5828)
}

Config.Messages = {
    alreadyActive = 'The yacht shuttle is already running.',
    tripFailed = 'The yacht shuttle could not finish the route.',
    stopped = 'The yacht shuttle has been stopped.',
    spawnFailed = 'The yacht shuttle could not be created.',
    noSeat = 'No passenger seat is available.',
    boardLabel = 'BOARD',
    leaveLabel = 'EXIT'
}
