###### Advanced Charging Switch

###### Copyright (c) 2019 Jaymin Suthar. All rights reserved.

## Links

* [Git Repository](https://github.com/sjayminsgithub/ACSwitch-module)
* [Build Git Repo](https://github.com/sjayminsgithub/ACSwitch-build)
* [Support Thread](https://www.google.co.in/)

## Introduction

* ACSwitch allows you to switch charging status based on a configured Automation
  and even on demand.

## Description

* ACSwitch will automatically disable charging when battery level is more than a
  specified disable threshold and enable it back when level is lower than enable
  threshold. This works autonomous, and always...

* ... while you can also enable/disable charging whenever you want via ACSwitch
  Methods using commandline interface. You can find more details on commandline
  below.

## Requirements

* Magisk v18.2+ (if systemless mode).
* Init.d support (if system mode).
* Basic knowledge of commandline.

## Installation

* Simply flash the zip via either Magisk Manager or any custom recovery (TWRP is
  preferred). Note that upgrading ACSwitch wipes previous configs, so you'd have
  to start all over again with configuring it.

## Setup

* You need to configure ACSwitch whenever you install/upgrade it. Please see the
  commandline section to know how to configure it.

## Usage

* Well, if you don't have a terminal emulator, install it first then. After then
  you can run `acs [<option> [<args>...]...]` from terminal emulator.

    Options:

        acs --toggle
            Toggle Automation on or off.

        acs --update <thr_disable> <thr_enable>
            Set disable threshold to thr_disable and similarly.
            Omitting values will reset them to their defaults.

        acs --method <format_str>
            Enable or disable charging manually based on format_str.
            Format string must be "(e|d)(%|s|m|h)(threshold)" where...

            ... (e|d) are to determine charging state (enable/disabled).
            ... (%|s|m|h) determine target threshold type (time/level).
            ... and (threshold) is the threshold to keep changes until.

        acs --daemon <action>
            Launch or kill the ACSwitch daemon.
            action can be either launch or kill.

        acs --info
            Provides some information about battery and ACSwitch settings.

        acs --configure
            (Re)Configure ACSwitch. This is required on install/upgrades.

        acs --help
            Print this usage document.

## Support

* Please feel free to post any feature requests or bugreports at Support Thread.
  I will try my best to implement/fix the report.

* Please post complete terminal output, possibly screenshots if you're reporting
  bugs. ACSwitch does not generate logfiles, so that's everything what I need.

* For installation errors, you need to save /dev/ACSwitch_install.log right away
  following the failure and provide it to me.

## Thanks To

* Huge thanks to @VR-25, providing their control files' database with open heart
  making development on ACSwitch easier than ever.

## Legal

* See file NOTICE in project root for licensing information and more details.

## Source Code

* Source code of this entire project can be found in the Build Repo (submodules
  contain actual sources, Build Repo just provides build scripts).

## Changelog

#### 1.0

* Initial release.
