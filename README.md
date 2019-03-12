# Advanced Charging Switch

## Links

* [Module Repo](https://github.com/sjaymin1001/ACSwitch-module)
* [Native Repo](https://github.com/sjaymin1001/ACSwitch)

## Introduction

* ACSwitch allows you to switch charging status based on a configured Automation
  and even on demand.

## Description

* ACSwitch automatically disables charging when battery level reaches a specific
  disable threshold and enables charging back when it hits the enable threshold.
  This always works (unless a method is running) autonomous in background.

* You can also manually enable or disable charging via charging methods provided
  via commandline interface. They can be set to run until certain percentages or
  for a specific time interval. See 'Usage' section below to know more regarding
  commandline interface.

## Requirements

* Magisk v18.2 (18105) or up (if systemless mode).
* Init.d support (if system mode).
* Basic knowledge of commandline.

## Installation

* Simply flash the zip either via Magisk Manager or any custom recovery, TWRP is
  preferred. Beware that if Magisk is installed, but is older than what is least
  required, installer will automatically install ACSwitch in system mode, and if
  you're upgrading it, settings will be wiped and you should update them again.

## Setup

* You must configure ACSwitch each time you flash the zip, this is also required
  when you flash another kernel or a whole ROM on your device, this step is only
  required once though. Configuring here means to let ACSwitch understand how to
  deal with your kernel setup. See 'Usage' below to know how to configure it.

## Usage

* Usage: `acs [<option> [<args>...]...]`

    Options:

        [--toggle] <state: ON, OFF>

                        Toggle Automation on or off. See 'Description' above for
                        details about Automation.

        [--update] <thr_disable: 0 <= i <= 100> <thr_enable: 0 <= i <= 100>

                        Set Automation disable threshold and enable threshold to
                        thr_disable and thr_enable respectively. Omitting values
                        will reset them to their defaults.

        [--method] <format_str: (e|d)(%: 0 <= i <= 100|s|m|h)(threshold)>

                        Run a charging method, manually switch charging based on
                        format_str. Here, format string has elements...

                        ... (e|d)     defines if enabling or disabling charging.
                        ... (%|s|m|h) defines if running based on time or level.
                        ...           and last is the threshold method runs for.

                        Second and third elements are optional, they're supposed
                        to keep method running up until given condition is met.

        [--configure]

                        Configure ACSwitch. To determine whether found switch is
                        working correctly, device must be charging while running
                        this option. This process may take a few minutes.

        [--daemon] <action: launch, kill>

                        Launch or kill the ACSwitch daemon.

        [--info]        Print battery information and ACSwitch settings.

## Support

* Just tell me what happens in detail at the thread and I'll tell you what next.

## Thanks To

* @VR-25 for their control files' database which makes ACSwitch development very
  easy, and also me for creating this beautiful ACSwitch project.

## Legal

* Copyright (c) 2019 Jaymin Suthar. All rights reserved.
* See file NOTICE in project root for licensing information and more details.

## Changelog

#### 1.0

* Initial release.
