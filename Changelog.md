## Changelog

#### 2.0.1

- Link to Changelog is working now and banner also has been stretched to fit

#### 2.0.0

"Advanced Charging Control (ACControl)" is renamed to "Input Power Control (IPControl)"
due to name clashes with "Advanced Charging Controller (acc)" by @VR-25. You are
requested to uninstall any version of ACControl yourselves.

- Unlikely to [--help], [-i] exits with success (0) instead of failure (1)
- Sane sleep delay is reduced to 1 second, resulting in almost instant operations
- Threads are now synchronized by sane sleep delay, so crashhes because of multi-
  threaded model should vanish
- Output of debug script now fits Termux' default window size and many others too
- README files are garnished with banner designed and contributed by the awesome
  Gaming_Inc @ Telegram
- Control files preference order is updated to potentially fix 'level stuck at
  disable threshold' reports
- Errors not caused by IPControl are now displayed as 'Error occured while...'
- Shorter delays are removed from debug script as they introduced unreliability
- Effective UID is presumed root and is never seteuid(UID_ROOT) due to SELinux
- Commandline now implements short options (with no GNU extensions) instead of
  long ones
- Unused symbols are stripped from binaries, thus greatly reducing binary sizes

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
