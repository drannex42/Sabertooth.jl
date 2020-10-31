module Sabertooth

using SerialPorts
# Motor commands
    const forward_m1 = 0x00
    const reverse_m1 = 0x01
    const forward_m2 = 0x04
    const reverse_m2 = 0x05
    const forward_mixed = 0x08
    const reverse_mixed = 0x09
    const right_mixed = 0x0A
    const left_mixed = 0x0B
    const ramp = 0x10
    
# Modify the serial port configs as needed
    const portname = "/dev/ttyACM0"
    const baudrate = 115200 #Default baudrate for Sabertooth (115200)
    const address = 128 # The address of the Sabertooth. By default, this is 128.
    const mask = 127

s = SerialPort(portname, baudrate) # Instantiate the serial port

# sendCommand(command, data): Core motor controller function, this sends an update out to the motor controller hardware, all other functions should call this function instead of rewriting. 
    function sendCommand(command, data)
        checksum = ((address + command + data) & 127) # Calculate the required checksum with the bitwise operator for the bytesize (mask)
        newUpdate = [UInt8(address), UInt8(command), UInt8(data), UInt8(checksum)] # Create an array buffer of bytes to send to the motor controller hardware 
        
        write(s, newUpdate) # Write to the motor controller hardware
    end


    
# drive(motor, speed): This controls one motor at a time
     function drive(motor, speed)
        # Reverse commands are equal to forward + 1
        cmds = [forward_m1, forward_m2] 

        try
            command = cmds[motor]
        catch
            @warn "Drive error, invalid motor number: $motor"
        end

        if speed < 0 
            speed = -speed
            command = command + 1 
        end
        if speed > 100 
            @warn "Drive error, invalid speed: $speed"
        end

        calculatedspeed = round(Int, *(127, speed) / 100)
        sendCommand(command, calculatedspeed)
    end
# stop(): Stops both motors
    function stop() 
        drive(1, 0)
        drive(2, 0)
    end
# driveBoth(speed_m1, speed_m2):
    function driveBoth(speed_m1, speed_m2)
        drive(1, speed_m1)
        drive(2, speed_m2)
    end
# driveTank(speed)
    function driveTank(speed)
        drive(1, speed)
        drive(2, speed)
    end
end
