# Advanced Charging Switch

### ACSwitch allows you to switch charging status based on configured Automation and on demand.

## Description

ACSwitch disables charging when battery level hits a specified disable threshold
and enables it back when a specified enable threshold is hit. It is handled by a
daemon which runs autonomous in background. This part is called Automation...

... and you can also manually enable, or disable charging using the commandline,
such sessions are called charging methods. These methods can be set to run until
a certain level is hit or for specific time interval.

See first three options in 'Usage' section regarding Automation and methods.

## Requirements

1. Android Lollipop (5.0) or newer.
2. Modern ARM or x86 based chipset.
3. If systemless mode, Magisk v18.2 (18105) or newer,
4. or else, any root solution and Init.d support.

## Downloads

Please download the zip [from here](https://github.com/Magisk-Modules-Repo/ACSwitch/releases)
as installing directly from 'Magisk downloads' enforces Magisk framework.

## Installation

ACSwitch supports both, Magisk systemless and standard /system installations. To
install, just flash the zip using either Magisk Manager or any custom recovery.

Beware that if Magisk is installed, but is older than what is required at least,
the installer will automatically install ACSwitch in /system mode (which you may
not like).

## Setup

You must configure ACSwitch each time after either flashing the zip, a kernel or
a ROM. After it configures itself, you should set it up to suit your needs. Here
is what a minimal setup should be like...

    su                  # Returns a root shell session.
    acs --configure     # Configures ACSwitch, device must be charging.
    acs --update 70 60  # Update Automation thresholds, replace '70 60'.
    acs --daemon launch # Launch the daemon (just in case :blink:).

## Usage

`acs [<option> [<args>...]...]`

Every option below must be executed with escalated privileges, i.e., `su`.

Options:

    [--toggle] <state: ON, OFF>

        Toggle Automation status on or off.

    [--update] <thr_disable: int> <thr_enable: int>

        Set Automation disable threshold and enable threshold to
        thr_disable and thr_enable respectively. Thresholds will
        be reset if none were specified.

    [--method] <format_str: (e|d)(%: int|s|m|h)(threshold)>

        Run a charging method. Here, format_str may have...

        ... (e|d)     defines if enabling or disabling charging,
        ... (%|s|m|h) defines if running until a level is hit or
                      for specified seconds, minutes or hours,
        ...           and this is the threshold method runs for.

        Only the element specifying charging state is necessary.

    [--configure]

        Configure ACSwitch, while your device must be charging.

    [--daemon] <action: launch, kill>

        Launch or kill the ACSwitch daemon. Note that Automation
        and charging methods, both depend on the daemon.

    [--info]    Print battery information and ACSwitch settings.

## Support

Just tell me your concern in detail in [this Telegram group](https://t.me/joinchat/JUfXGwuAuzKxo5boALVf1w)
and I will assist you with relevant necessities.

## Legal

Thanks to VR25 @ xda-developers for providing their control files' database.

Copyright (c) 2019 Jaymin Suthar. All rights reserved.

See file NOTICE in project root for licensing information and more details.

## Changelog

#### 0.4.0.94

- Inline installer.sh with Magisk/module_installer.sh
- Update documentations

#### 0.3.1

- Internal code adjustments

#### 0.3

- Print success message after option is handled successfully
- Update internal code
- Update documentation
- Never check charger connection status
- Use only those triggers with an uevent

#### 0.2.1

- Fix 'Incorrect setup' errors even when configuring
- Fix 'Device not supported' errors when configuring
- Fix daemon blocking exit after killing via cmdline
- Some internal code improvements

#### 0.2

- Add support for the newer Magisk module template
- Fix device freezing after flashing from Magisk Manager
- Fix 'libc++_shared.so library not found' errors
- Fix empty or partial messages printed on terminal
- Fix read/writing on socket giving I/O errors
- Remove seteuid support, 'su' must be ran before 'acs'
- Stop logging to Android system, improve performance
- Code optimizations
- Update documentations

#### 0.1.1

- Update documentations

#### 0.1

- Initial release
