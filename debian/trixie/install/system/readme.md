# Base System Configuration (APT, Time, Tools and User)

Module dedicated to the initial system configuration phase, encompassing `APT` repository management, system upgrade operations, time synchronization, timezone definition, installation of foundational tooling, and assignment of administrative privileges to a designated user. This module establishes a deterministic, controlled, and reproducible baseline for subsequent provisioning layers.

## Purpose

To formalize a standardized configuration of package sources, ensure temporal consistency across the system, provision essential operational tooling, and enable a non-`root` user with `sudo` privileges, thereby facilitating secure and controlled administrative workflows.

## Status

Stable component within the base provisioning pipeline. Executes direct and global modifications to system configuration.

## Scope

This module encompasses:

- Complete overwrite of the `/etc/apt/sources.list` file
- Configuration of official repositories for Debian Trixie
- Inclusion of `main`, `contrib`, `non-free`, and `non-free-firmware` components
- Configuration of security and update repositories
- Full system upgrade via `full-upgrade`
- Timezone configuration (`America/Bogota`)
- Deployment and activation of time synchronization service (`chrony`)
- Installation of trust infrastructure (`ca-certificates`, `gnupg`)
- Installation of data retrieval tools (`curl`, `wget`)
- Installation of base utilities (`nano`, `less`, `file`)
- Installation of network diagnostic utilities (`dnsutils`)
- Installation of compression and archiving tools (`zip`, `unzip`, `tar`, `gzip`, `bzip2`, `xz-utils`)
- Installation of compilation toolchain (`build-essential`)
- Assignment of an existing user to the `sudo` group

## Key Features

- Deterministic definition of package source configuration
- System-wide upgrade aligned with declared repositories
- Automated time synchronization through `chrony`
- Explicit and consistent timezone configuration
- Provision of essential tooling for system operation, networking, and diagnostics
- Capability to compile software from source via `build-essential`
- Delegation of administrative privileges through `sudo`
- Establishment of a consistent baseline for subsequent dependency and service layers

## Requirements

- System based on Debian Trixie
- Elevated privileges (`root` or `sudo`)
- Pre-existing user within the system

## Usage

This module is intended for execution during the base system initialization phase:

- Must be executed with elevated privileges
- Requires user interaction:
  - Input of target user identifier
  - Optional confirmation for system reboot
- Prior validation of user existence is strongly recommended

## Module Structure

The configuration domain includes:

- `APT` repository definition and management
- System upgrade lifecycle
- Time synchronization and timezone configuration
- Installation of foundational and auxiliary tooling
- User privilege and access control management

## Notes

- The `/etc/apt/sources.list` file is fully overwritten
- Inclusion of `non-free` and `non-free-firmware` extends package availability scope
- Execution of `full-upgrade` may introduce package additions, removals, or dependency transitions
- Timezone is explicitly defined as `America/Bogota`
- `chrony` is installed and enabled to ensure continuous time synchronization
- Core tooling for system operation, diagnostics, and compilation is provisioned
- Target user must pre-exist to prevent privilege assignment inconsistencies
- The module introduces global state changes with direct impact on system behavior and administration.
