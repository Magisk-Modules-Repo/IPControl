###### Advanced Charging Switch

###### Copyright (c) 2019 Jaymin Suthar. All rights reserved.

## Links

* [Git Repository](https://github.com/sjayminsgithub/ACSwitch-module)
* [Super Git Repo](https://github.com/sjayminsgithub/ACSwitch-build)
* [Support Thread](https://www.google.co.in/)

## Introduction

* ACSwitch lets you enable or disable charging based on configured Automation
  and even on demand.

* Well, ACSwitch is a great approach if you'd knew how batteries work to extend
  their lives while it's still a great thing to know that now you can leave your
  phone charging overnight without having to worry about the battery exploding.
  ACSwitch takes care of it :)

## Description

* ACSwitch will automatically disable charging when battery level is more than a
  specified disable threshold and enable it back when level is lower than enable
  threshold. This works autonomous, and always...

* ... while you can also enable/disable charging whenever you want via ACSwitch
  commandline interface. You can find more details on commandline below.

## Requirements

* Magisk v15.0+ (if systemless mode).
* Init.d support (if system mode).
* Basic knowledge of commandline.

## Installation

* Simply flash the zip via either Magisk Manager or any custom recovery. Note
  that upgrading ACSwitch wipes previous configs, so you'll have to start over
  again with configuring it.

## Setup

* You need to configure ACSwitch whenever you install/upgrade it. Please check
  commandline section to know how to configure it.

## Usage

* Well, if you don't have a terminal emulator, install it first then. Afterwards
  you can run `acs [<option> [<args>...]...]` from terminal emulator.

    Options:

        acs --toggle
            Toggle Automation on or off.

        acs --update <thr_disable> <thr_enable>
            Set disable threshold to thr_disable and similarly.
            Omitting values will reset them to their defaults.

        acs --launch
            Launch the ACSwitch daemon.

        acs --method <format_str>
            Enable or disable charging manually based on format_str.
            Format string should be "(e|d)(%|s|m|h)(threshold)" where...

            ... (e|d) are determine charging state (enable/disabled).
            ... (%|s|m|h) determine target threshold type (time/level).
            ... and (threshold) is the threshold to hold changes until.

        acs --kill
            Kill all ACSwitch processes including the daemon.

        acs --info
            Provides some information about battery and ACSwitch settings.

        acs --configure
            (Re)Configure ACSwitch. This is required on install/upgrades.

## Support

* Please feel free to ask any questions, request features or submit bugreports
  at ACSwitch Support Thread. I will do best to give satisfactory resolution.

* Please post complete terminal output, possibly screenshots if you're reporting
  bugs. ACSwitch does not generate logfiles, so that's everything what I need.

## Thanks To

* A huge thanks to @VR-25, who provided their control files' database with open
  heart, making development on ACSwitch easier than ever.

## Legal

* This WIP project is pre-released under the GNU General Public License v3. See
  file NOTICE in Super Repo root for licensing information and more details.

## Source Code

* Source code of the acs binary can be found in native/ folder of Super Repo. I
  believe this to be a good source code sharing scheme. Other are scripts, they
  are pretty much open sourced anyways.

## Changelog

#### 1.0

* Initial release.
