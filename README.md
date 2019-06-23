# Input Power Control

![IPControl banner](https://i.imgur.com/6gyQUTZ.png)

### Completely native input power control tool written purely in C++ for performance and stability

## Description

IPControl automatically switches charging off when battery level reaches a certain
disable threshold and back on as soon as it drowns to enable threshold. Thus, it
is kept bouncing between those boundaries. This feature is called `Automation`.

There's one more feature, namingly `method`s, that basically helps in switching
based on conditions including level and time, but it is recommended only if you
really need it or have decent knowledge of how phone batteries work.

Please see `Commandline` section on manipulating these feature and other available
options.

## Requirements

1. Android Lollipop or up
2. ARM or x86 based chipset
3. Magisk v18.2 (18105) or up
4. Any root solution and Init.d support

Having either of 3 or 4 would suffice, 3 is favored if both are detected.

## Supported Devices

- Asus Zenfone Max Pro M1
- Google Pixel 3
- LG Google Nexus 5
- LeEco Le Max 2
- OnePlus 3T
- OnePlus 3
- Samsung Galaxy S8
- Xiaomi Mi A1
- Xiaomi Mi Max 3
- Xiaomi Pocophone F1
- Xiaomi Redmi Note 3 Pro
- Xiaomi Redmi Note 5
- ZTE Axon 7

If your device isn't listed above, don't worry! You should try IPControl and test
it out yourself.

## Downloads

Please obtain release zips [from GitHub releases](https://github.com/Magisk-Modules-Repo/IPControl/releases),
downloading from Magisk Manager enforces Magisk framework which forbids some
installation functions.

## Installation

Assured your device meets requirements, flash IPControl like any other flashable.
Magisk Manager or TWRP are advised as installation mediums.

## Setup

If you aren't a power-user and don't wanna mess with understanding commandline
(although it's explained well below), here is what minimal setup should be like,

    su                                 # Obtain root shell
    ipc -u 70 60                       # Update thresholds
    ipc -d launch                      # Launch the daemon

## Commandline

    Usage: `ipc [<option> [<args>...]...]`

    Options:

    [-u] <thr_disable> <thr_enable>

        Updates disable and enable threshold for Automation.
        resets them to defaults if no values were specified.
        <thr_disable> and <thr_enable> must be integers.

        -> `ipc -u 90 80` sets disable threshold to 90 and
                          enable threshold to 80
        -> `ipc -u`       resets thresholds to 70 60

    [-t] <status>

        Toggles Automation on or off.
        <status> can be 'ON' or 'OFF'.

        -> `ipc -t ON`  toggles Automation on
        -> `ipc -t OFF` toggles Automation off

    [-m] <format_str>

        Run a method based on format string <format_str>.
        Here, format string must follow the pattern:
            (e|d)(%|s|m|h)(threshold: int)

        where...
        ... (e|d)     defines if enable/disabling charging,
        ... (%|s|m|h) defines if seeking level or timespan,
        ...           and this is the value of threshold.

        -> `ipc -m es60` enables charging for 60 seconds
        -> `ipc -m d%40` disables charging until 40%
        -> `ipc -m em30` enables charging for 30 minutes

    [-d] <action>

        Launches or kills the daemon.
        <action> can be 'launch' or 'kill'.

        -> `ipc -d launch` launches the daemon
        -> `ipc -d kill`   kills the daemon

    [-i]

        Print battery details and IPControl settings.

        -> `ipc -i` prints battery level, charging status,
                    Automation status, disable threshold
                    and enable threshold

## Support

Please share your unease in [this Telegram group](https://t.me/IPControl_Support)
and I will serve you ASAP with required solutions.

## Legal

Copyright (c) 2019 Jaymin Suthar. All rights reserved.

See file NOTICE in project root for licensing information.

## [Changelog](https://github.com/Magisk-Modules-Repo/IPControl/blob/master/Changelog.md)
