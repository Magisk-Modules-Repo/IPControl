###### Advanced Charging Switch

###### Copyright (c) 2019 Jaymin Suthar. All rights reserved.

## Links

* [Git Repository](https://github.com/sjaymin1001/ACSwitch-module)
* [Build Git Repo](https://github.com/sjaymin1001/ACSwitch-build)

## Introduction

* ACSwitch allows you to switch charging status based on a configured Automation
  and even on demand.

## Description

* ACSwitch will automatically disable charging when battery level is more than a
  specified disable threshold and enable it back when level is lower than enable
  threshold. This works autonomous, and always...

* ... while you can also enable/disable charging whenever you want via charging
  methods using commandline interface. You can find more details on commandline
  in 'Usage' section below.

## Requirements

* Magisk v18.2+ (if systemless mode).
* Init.d support (if system mode).
* Basic knowledge of commandline.

## Installation

* Simply flash the zip via either Magisk Manager or any custom recovery, TWRP is
  preferred. Note that upgrading ACSwitch wipes previous configs, so you'll have
  to start all over again with updating configurations.

## Setup

* You must configure ACSwitch after installing or upgrading, it's also needed if
  you flash a different kernel (or a whole ROM) on your device. Please see below
  section to know how to configure it.

## Usage

* ACSwitch does not offer graphical interface, so you must use a terminal to use
  it. If you don't have a terminal app, then you can install one from Play Store
  or F-Droid, etc...

* Usage: `acs [<option> [<args>...]...]`

    Options:

        [--toggle]      Toggle Automation on or off.

        [--update] <thr_disable> <thr_enable>

                        Set enable threshold and disable threshold to thr_enable
                        and thr_disable respectively.
                        Omitting thresholds will reset them to their defaults.

        [--method] <format_str>

                        Run a charging method, manually switch charging based on
                        format_str. Here, format string must be
                        "(e|d)(%|s|m|h)(threshold)" where...

                        ... (e|d)     defines if enabling or disabling charging.
                        ... (%|s|m|h) defines if running based on time or level.
                        ...           and last is the threshold method runs for.

        [--daemon] <action>

                        Launch or kill the ACSwitch daemon.
                        action can be either of launch or kill.

        [--info]        Print battery information and ACSwitch settings.

        [--configure]   Configure ACSwitch.

        [--help]        Print this usage document.

* To detect whether found switch works correctly, device must be charging whilst
  configuring, [--configure] will throw an error if it isn't charging.

## Support

* Just tell me what happens in detail at the thread and I'll tell you what next.

## Thanks To

* Thanks to @VR-25 for their control files' database making ACSwitch development
  easier than ever, and thanks to me for creating this beautiful ACSwitch.

## Legal

* See file NOTICE in project root for licensing information and more details.

## Source Code

* Source code of entire ACSwitch project can be found in the Build Repo, just be
  sure to clone recursively (including submodules), Build Repo gathers all small
  parts (projects) together and provides scripts to build them.

## Changelog

#### 1.0

* Initial release.
