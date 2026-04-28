# 1. Superuser access

```bash
su -
```

**Action:** Initiates a session as `root`.  
**Purpose:** Elevates the execution context to unrestricted administrative privileges, enabling the execution of critical system-level operations.

**Impact:** All subsequent commands are executed with complete authority over the system, without privilege constraints or isolation boundaries.

# 2. Target user definition and validation

```bash
read -p "Enter the username: " USER_NAME

if [ -z "$USER_NAME" ]; then
    echo "A valid user must be specified."
    exit 1
fi

if ! id "$USER_NAME" >/dev/null 2>&1; then
    echo "The user does not exist on the system."
    exit 1
fi
```

**Action:** Requests the user identifier, validates that `$USER_NAME` is non-empty, and confirms its existence using `id`.  
**Purpose:** Establish and verify the target account upon which privilege modifications will be enforced.

**Impact:** Guarantees that subsequent administrative operations are applied exclusively to a valid, pre-existing account, preventing execution failures derived from null or invalid inputs.

# 3. System repository reconfiguration

```bash
rm -f /etc/apt/sources.list
tee /etc/apt/sources.list << 'EOF'
deb http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security trixie-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security trixie-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ trixie-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ trixie-updates main contrib non-free non-free-firmware
EOF
```

**Action:** Removes `/etc/apt/sources.list` using `rm -f` and reconstructs it via `tee` with delimiter `EOF`.  
**Purpose:** Reinitialize and explicitly define official package repositories for `Debian Trixie`, including `deb`, `deb-src`, security, and update channels.

**Impact:** Fully redefines the system’s package source configuration, directly influencing all subsequent package resolution, installation, and upgrade operations.

# 4. System synchronization and upgrade

```bash
apt -y update
apt -y full-upgrade
```

**Action:** Executes `apt update` and `apt full-upgrade` with the `-y` flag.  
**Purpose:** Synchronize the package index and perform a comprehensive system upgrade to the latest available state.

**Impact:** May introduce dependency transitions, package installations, or removals, thereby altering the global system composition.

# 5. Timezone configuration

```bash
ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime
echo "America/Bogota" > /etc/timezone
```

**Action:** Establishes a symbolic link using `ln -sf` and defines `/etc/timezone`.  
**Purpose:** Configure the system timezone using the canonical data located in `/usr/share/zoneinfo`.

**Impact:** Ensures temporal consistency across system logs, scheduled operations, and service validation mechanisms.

# 6. Automatic time synchronization

```bash
apt -y install chrony
systemctl enable --now chrony
```

**Action:** Installs `chrony` via `apt` and activates it using `systemctl enable --now`.  
**Purpose:** Deploy and enable a time synchronization daemon that maintains alignment with external time sources.

**Impact:** Guarantees continuous temporal accuracy, critical for security controls, logging integrity, and distributed system coordination.

# 7. Trust infrastructure and connectivity

```bash
apt -y install ca-certificates curl wget gnupg lsb-release
```

**Action:** Installs `ca-certificates`, `curl`, `wget`, `gnupg`, and `lsb-release` using `apt`.  
**Purpose:** Enable validation of `TLS/HTTPS` connections, remote data retrieval, `GPG` key management, and system metadata inspection.

**Impact:** Establishes secure communication channels, supports external resource acquisition, and ensures integrity verification of repositories and packages.

# 8. Base system and diagnostic tools

```bash
apt -y install nano less file dnsutils
```

**Action:** Installs `nano`, `less`, `file`, and `dnsutils`.  
**Purpose:** Provide capabilities for text editing, file inspection, file type identification, and DNS diagnostics.

**Impact:** Supplies essential tooling for system interaction, analysis, and troubleshooting.

# 9. Compression and file handling

```bash
apt -y install zip unzip tar gzip bzip2 xz-utils
```

**Action:** Installs compression and archiving utilities via `apt`.  
**Purpose:** Ensure interoperability with formats such as `zip`, `tar`, `gzip`, `bzip2`, and `xz`.

**Impact:** Enables comprehensive handling of compressed artifacts across diverse formats without operational limitations.

# 10. Compilation environment

```bash
apt -y install build-essential
```

**Action:** Installs `build-essential` using `apt`.  
**Purpose:** Provide compilers and auxiliary tooling required for building software from source code.

**Impact:** Enables compilation of dependencies and applications lacking precompiled distributions.

# 11. Administrative privilege assignment

```bash
usermod -aG sudo "$USER_NAME"
```

**Action:** Executes `usermod -aG sudo "$USER_NAME"`.  
**Purpose:** Append the specified user to the `sudo` group while preserving existing group memberships.

**Impact:** Grants persistent administrative capabilities to the designated account.

# 12. System reboot (optional)

```bash
reboot
```

**Action:** Executes `reboot`.  
**Purpose:** Restart the system to ensure application of structural and configuration changes.

**Impact:** Applies pending modifications and reinitializes all active system services.
