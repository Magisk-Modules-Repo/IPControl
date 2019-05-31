## Changelog

#### 1.3.1

Intermediary versions from v1.1.1 to v1.3.1 are lost as I had to reset and setup
my local development environment and personal testing device all over again.

- Fix modules flashed after ACControl unable to mount magisk.img when ACControl
  had aborted for some reason, applicable to Magisk v18.0 or lesser
- Reduce sane sleep delays to 10 seconds, thus improving accuracy to great extent
- Update documentations and make [--help] output fit Termux' default window size
- Fix the daemon not being killed by `acc --daemon kill` and `acc --daemon launch`
  spawning multiple daemons if subsequent calls were made to it
- Fix the daemon recognizing a method as running after unreachable level was given
  to [--method], thus no methods could be ran until a reboot

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
