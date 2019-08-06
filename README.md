# Mac as Jenkins Slave

Initialize build environment of jenkins slaves (macOS).

This repo is designed to work with macOS 11.14 (Mojave).

## Base System

### Install macOS

Install macOS via an USB drive.

- [How to create a bootable installer for macOS - Apple Support](https://support.apple.com/en-us/HT201372)
- [How to select a different startup disk - Apple Support](https://support.apple.com/en-us/HT202796)

### Create Admin User

During macOS installation, create following user when asked:

- Full Name: `Administrator`
- Account Name: `admin` (will be used to create Home folder in the **Users** directory)

### Install Updates

Go to **System Preferences** -> **Software Update**.

Check and install available updates, make sure macOS is up to date.

## Configure macOS

### Users & Groups

Go to **System Preferences** -> **Users & Groups** -> **Login Options**.

Enable *Show fast user switching menu as [Full Name]*.

### Hostname

Open **Terminal.app**.

Run following command:

    scutil --set ComputerName [hostname]
    scutil --set LocalHostName [hostname]
    scutil --set HostName [hostname]

Add the following to `/etc/hosts`:

    127.0.0.1       [hostname]

### Screen Locked Message

Go to **System Preferences** -> **Security & Privacy** -> **General**.

- Enable `Show a message when the screen is locked`
- Click `Set Lock Message` -> [hostname]

### Network

Go to **System Preferences** -> **Network**.

Disable all interfaces except **Ethernet**.

### Sharing

Go to **System Preferences** -> **Sharing**.

Enable the following:

- Screen Sharing
- Remote Login

### Energy Saver

Go to **System Preferences** -> **Energy Saver**.

Set the following options:

| Option | Value |
| :----- | :----: |
| Computer sleep | Never
| Display sleep | 10 minutes
| Put hard disks to sleep when possible | No
| Wake for network access | No
| Start up automatically after a power failure | Yes
| Enable Power Nap | No

Options above trade energy consumption for responsiveness.

They also tell the Mac to stay online as much as possible.

### Software Update

Go to **System Preferences** -> **Software Update** -> **Advanced**.

Set the following options:

| Option | Value |
| :----- | :----: |
| Check for updates | Yes
| Download new updates when available | No
| Install macOS updates | No
| Install app updates from the App Store | No
| Install system data files and security updates | Yes

## Install Software

### Xcode

Open **App Store.app** and sign-in with Apple ID.

When prompted with *Require a password for additional purchases*, chose **Always Require**.

Install **Xcode**, then:

- Launch Xcode.
- Agree to license agreements.
- When prompted with *Install additional required components*, chose **Install**.

### Additional Software

Open **Terminal.app** in `scripts` folder.

Run each bash scripts in the order of their file names.

## Jenkins Slave User

As a rule of thumb, do **NOT** run Jenkins Slave as an Admin user.

### Create Unprivileged User

Go to **System Preferences** -> **Users & Groups**.

- New Account: `Standard`
- Full Name: `Pirates of the Caribbean`
- Account Name: `pirates` (will be used to create Home folder in the **Users** directory)

### Enable Remote Login

Go to **System Preferences** -> **Sharing** -> **Remote Login**.

Add user `pirates` to the **Allow access for** list.

### Spotlight

Go to **System Preferences** -> **Spotlight** -> **Privacy**.

In **Prevent Spotlight from searching these locations**, add `/Users/pirates` folder.

This will save a ton of CPU and Disk IO from Spotlight's **mdworker** processes when doing heavy compilation work.

### Config Files

Copy all files in `bash` folder to `/Users/pirates`.
