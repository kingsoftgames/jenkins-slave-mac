# jenkins-slave-mac

Initialize build environment of jenkins slaves (macOS).

## System Optimizations

### Spotlight

Go to **System Preferences** -> **Spotlight** -> **Privacy**, add current user's `HOME` folder to the exclusion list.

This will save a ton of CPU and Disk IO from Spotlight's **mdworker** process when doing heavy compilation work.

### Energy Saver

Go to **System Preferences** -> **Energy Saver**, set the following options:

| Option | Checked |
| :----- | :----: |
| Prevent computer from sleeping automatically when the display is off | Yes
| Put hard disks to sleep when possible | No
| Wake for network access | No
| Start up automatically after a power failure | Yes
| Enable Power Nap | No

Options above trade energy consumption for responsiveness.

They also tell the Mac to stay online as much as possible.
