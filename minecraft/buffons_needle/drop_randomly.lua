require("env")

local SHIP_NAME = constants.SHIP_NAME
local ORIGIN = constants.ORIGIN
local LOG_FILENAME = constants.LOG_FILENAME
local L = constants.L
local D = constants.D
local DROP_W = constants.DROP_W
local MIN_DROP_HEIGHT = constants.MIN_DROP_HEIGHT
local DROP_HEIGHT_RANGE = constants.DROP_HEIGHT_RANGE
local KEEP_THRUSTER_RANGE = constants.KEEP_THRUSTER_RANGE
local NEAR_GROUND_HEIGHT = constants.NEAR_GROUND_HEIGHT


local reader = peripheral.wrap("back")


function start_thruster()
	redstone.setOutput("left", true)
	redstone.setOutput("right", true)
end

function stop_thruster()
	redstone.setOutput("left", false)
	redstone.setOutput("right", false)
end

function getSpeed(reader)
	local v = reader.getVelocity()
	return math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z)
end

function range(n)
	local i = 0
	return function()
		if i >= n then
			return nil
		end

		local r = i
		i = i + 1
		return r 
	end
end


if not fs.exists(LOG_FILENAME) then
	local log_file = fs.open(LOG_FILENAME, "a")
	log_file.write("date,origin_x,origin_y,origin_z,teleport_x,teleport_y,ship_x,ship_y,ship_z,ship_yaw,ship_roll,ship_pitch,pi\n")
	log_file.close()
end


local cross_count = 0
local total_count = 0

stop_thruster()

-- for i in range(1000) do
while true do
	local teleport_x = math.random() * DROP_W * 2 - DROP_W + (ORIGIN.x - 0.5)
	local teleport_y = math.random() * DROP_HEIGHT_RANGE + MIN_DROP_HEIGHT + (ORIGIN.y - 0.5)
	commands.exec("vs teleport " .. SHIP_NAME .. " " .. 
		teleport_x .. " " .. teleport_y .. " " .. (ORIGIN.z - 0.5))

	start_thruster()

	while true do
		local ship_pos = reader.getWorldspacePosition()
		if ship_pos.y <= ORIGIN.y + NEAR_GROUND_HEIGHT then
			break
		end
		sleep(0.1)
	end

	local keep_thruster_sec = math.random() * KEEP_THRUSTER_RANGE
	sleep(keep_thruster_sec)

	stop_thruster()

	while true do
		local speed = getSpeed(reader)
		if speed <= 0.001 then
			break
		end

		sleep(0.1)
	end
	sleep(0.5)

	local ship_pos = reader.getWorldspacePosition()
	local ship_rotation = reader.getRotation()
	local sin_roll = math.sin(ship_rotation.roll)
	local left_x = ship_pos.x + L / 2 * sin_roll
	local right_x = ship_pos.x - L / 2 * sin_roll

	if (ship_pos.x - ORIGIN.x) >= -D / 2 and (ship_pos.x - ORIGIN.x) < D / 2 then
		total_count = total_count + 1
		if (left_x - ORIGIN.x) * (right_x - ORIGIN.x) < 0 then
			cross_count = cross_count + 1
		end
	end
	
	local pi_approx = (total_count / cross_count)
	if cross_count == 0 then
		pi_approx = 0.0
	end

	local log_file = fs.open(LOG_FILENAME, "a")
	log_file.write(os.date("%F %T") .. 
		"," .. ORIGIN.x .. "," .. ORIGIN.y .. "," .. ORIGIN.z ..
		"," .. teleport_x .. "," .. teleport_y ..
		"," .. ship_pos.x .. "," .. ship_pos.y .."," .. ship_pos.z .. 
		"," .. ship_rotation.yaw .. "," .. ship_rotation.roll .. "," .. ship_rotation.pitch .. 
		"," .. pi_approx ..
		"\n")
	log_file.close()
end

-- print("total: " .. total_count .. ", crossed: " .. cross_count)
-- print("pi = " .. (total_count / cross_count))

