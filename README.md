# Sabertooth.jl
Julia Library to manage the Sabertooth motor controller

Simple to use Julia API for Sabertooth motor controllers (made by Dimension Engineering) - The official API only has support for Python, C#, and Arduino - I needed one for quick prototyping and this was born. (Based on my *other* project: [Sabertooth.js](https://github.com/drannex42/sabertooth.js).

This is not set up as a library, but with some simple changes it could be. This is ready to use for most applications. 

------

## Documentation

![](https://raw.githubusercontent.com/MomsFriendlyRobotCompany/pysabertooth/master/docs/pics/Sabertooth2x32Big.jpg)

### Usage

```

// drive(number, speed) :: number: 1-2 :: speed: -100 to 100 
saber.drive(1, 50)
saber.drive(2, -75)

// driveBoth(speed_m1, speed_m2)
saber.driveBoth(50, 80)

// driveTank(speed) :: speed: -100 to 100
saber.driveTank(50)

// Stop
saber.stop()

```

## MIT License
Copyright (c) 2020 - t. Macleod Sawyer 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

----

There were a few people who have attempted this in the past and I have taken many ideas from them, and tried to follow the pysabertooth code as close as possible in API. Thanks to: [MomsFriendlyRobotCompany/pysabertooth](https://github.com/MomsFriendlyRobotCompany/pysabertooth), and [Joehuew/RaspWifiRover](https://github.com/joehuewe/RaspiWifiRover)

