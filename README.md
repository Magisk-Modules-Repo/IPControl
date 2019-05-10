# Advanced Charging Control

### Basically enables you to switch charging.

## Description

ACControl automatically switches charging off when battery level reaches a certain
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

## Downloads

Please obtain release zips [from GitHub releases](https://github.com/Magisk-Modules-Repo/ACControl/releases),
downloading from Magisk Manager enforces Magisk framework which forbids some
installation functions.

## Installation

Assured your device meets requirements, flash ACControl like any other flashable.
Magisk Manager or TWRP are advised as installation mediums.

## Setup

If you aren't a power-user and don't wanna mess with understanding commandline
(although it's explained well below), here is what minimal setup should be like,

    su                                    # Obtain root shell
    acc --update 70 60                    # Update thresholds, substitute 70 and 60
    acc --daemon launch                   # Launch the daemon

## Commandline

    Usage: `acc [<option> [<args>...]...]`

    Options:

    [--update] <thr_disable> <thr_enable>

        Updates Automation disable threshold and enable threshold,
        resets them to defaults if no values were specified.
        <thr_disable> and <thr_enable> must be integers.

        -> `acc --update 90 80` will set disable threshold to 90
                                and enable threshold to 80
        -> `acc --update`       will reset thresholds (to 70 60)

    [--toggle] <status>

        Toggles Automation on or off.
        <status> can be 'ON' or 'OFF'.

        -> `acc --toggle ON`  will toggle Automation on
        -> `acc --toggle OFF` will toggle Automation off

    [--method] <format_str>

        Run a method based on format string <format_str>.
        Here, format string must follow the pattern:
            (e|d)(%|s|m|h)(threshold: int)

        where...
        ... (e|d)     defines if enabling or disabling charging,
        ... (%|s|m|h) defines if seeking level or time interval,
        ...           and this is the value of threshold.

        -> `acc --method es60` will enable charging for 60 seconds
        -> `acc --method d%40` will disable charging until 40%
        -> `acc --method em30` will enable charging for 30 minutes

    [--daemon] <action>

        Launches or kills the daemon.
        <action> can be 'launch' or 'kill'.

        -> `acc --daemon launch` will launch the daemon
        -> `acc --daemon kill`   will kill the daemon

    [--info]

        Print battery details and ACControl settings.

        -> `acc --info` will print battery level, charging status,
                        Automation status, disable threshold and
                        enable threshold

## Support

Please share your unease in [this Telegram group](https://t.me/ACControl_Support)
and I will serve you ASAP with required solutions.

## Legal

Copyright (c) 2019 Jaymin Suthar. All rights reserved.

See file NOTICE in project root for licensing information.

## Changelog

#### 1.1.1

- Update documentations

#### 1.1.0

- Remove all untested legacy-derived switches
- Don't check each switch on initialization
- Update debug script
- Remove need of initializing on each install
- Fix heavy resource usage for some devices

#### 1.0.2

- Fix 'Permission denied' errors when initializing

#### 1.0.1

- Add support for some new devices
- Fix syntax error in debug script

#### 1.0.0

- Renamed from `Advanced Charging Switch`
