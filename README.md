# Advanced Charging Switch

### ACSwitch allows you to switch charging status based on configured Automation and on demand.

## Description

ACSwitch will automatically disable charging when battery level hits a specified
disable threshold and enable it back when a specific enable threshold is hit. It
is handled by a daemon which works always in background. This part is considered
Automation...

... and you can also manually enable, or disable charging using charging methods
provided by the commandline interface. They can be set to run until a level hits
or for a time interval.

See first two options in 'Usage' section to know how to setup Automation and 3rd
command regarding charging methods.

## Requirements

1. Android Lollipop (5.0) or newer.
2. Modern ARM or x86 based chipset.
2. Magisk v18.2 (18105) or newer (if systemless mode).
3. Init.d support (if system mode).
4. Basic knowledge of commandline.

## Installation

ACSwitch supports both, Magisk systemless and standard /system installations. To
install, simply flash the zip using either Magisk Manager or any custom recovery
and the installer will automatically detect installation mode.

Beware that if Magisk is installed, but is older than what is required at least,
the installer will automatically install ACSwitch in /system mode, and upgrading
always wipes previous settings, so you should update them again.

## Setup

You must configure ACSwitch each time after either flashing the zip, a kernel or
a ROM, see '[--configure]' below. After it succeeds, you should set it up to fit
your needs. Here is what an ideal setup should be like...

    su
    acs --configure     # Device must be charging while running this.
    acs --update 70 60  # These are already the defaults, replace '70 60'.
    acs --daemon launch # Just in case the daemon had been killed.

## Usage

`acs [<option> [<args>...]...]`

    Options:

        [--toggle] <state: ON, OFF>

                        Toggle Automation status on or off.

        [--update] <thr_disable: integer> <thr_enable: integer>

                        Set Automation disable threshold and enable threshold to
                        thr_disable and thr_enable respectively. Thresholds will
                        be reset if none were specified.

        [--method] <format_str: (e|d)(%: integer|s|m|h)(threshold)>

                        Run a charging method (manually switch charging based on
                        format_str). Here, format_str may have...

                        ... (e|d)     defining if to enable or disable charging,
                        ... (%|s|m|h) defining if to run until a level is hit or
                                      for specified seconds, minutes or hours,
                        ...           and this is the threshold method runs for.

                        Only the element specifying charging state is necessary.

        [--configure]

                        Configure ACSwitch. To properly configure ACSwitch, your
                        device must be charging or else it will likely fail with
                        an error.

        [--daemon] <action: launch, kill>

                        Launch or kill the ACSwitch daemon. Remember, Automation
                        and charging methods, both depend on the daemon to work.

        [--info]        Print battery information and ACSwitch settings.

Note that ACSwitch does not print anything but errors, if any, on terminal, thus
if everything is working as expected, you will find nothing on terminal screen.

## Support

Just ask me your concern in detail in [this Telegram group](https://t.me/joinchat/JUfXGwuAuzKxo5boALVf1w)
and I will assist you with relevant necessities.

## Legal

Thanks to VR25 @ xda-developers for providing their control files' database.

Copyright (c) 2019 Jaymin Suthar. All rights reserved.
See file NOTICE in project root for licensing information and more details.

## Changelog

#### 0.2

- Link acs binaries statically to fix missing libc++_shared.so.

#### 0.1.1

- Update documentations.

#### 0.1

- Initial release.
