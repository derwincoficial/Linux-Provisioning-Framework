# Linux Provisioning Framework

Repository focused on provisioning, configuration, and automation of `Linux` systems, oriented toward building reproducible, functional environments ready for real-world use.

## Purpose

To centralize and standardize installation, configuration, and infrastructure deployment processes, enabling the creation of complete systems from scratch using reusable scripts and configurations.

## Status

Project under active development. Structure, scripts, and configurations may change without prior notice.

## Scope

The project covers:

- Installation and preparation of `Linux` systems
- Installation of essential tools (development, networking, virtualization, databases, utilities)
- Deployment and configuration of services
- Automation of system tasks and processes
- Creation of backend environments (APIs, web servers, base structures)
- Provisioning and configuration of databases
- Exposure of local services to the internet through tunnels
- Basic system hardening and secure configurations

## Key Features

- Complete provisioning scripts for environments from scratch
- Automated configuration of services such as Nginx, PHP, PostgreSQL, among others
- Generation of ready-to-use structures for APIs and web applications
- Organization of environments into standardized directories
- System-level permission and security configuration
- Integration of modern tools for development and deployment
- Use of tunnels to expose local services in real-world scenarios

## Requirements

- `Linux` system
- Superuser access (`root` or `sudo`)
- Internet connection
- Clean or controlled environment for script execution

## Usage

The repository is designed to be executed either modularly or as a whole:

- Scripts can be used individually depending on the need
- They can also be combined to build complete environments
- It is recommended to review each script before execution
- Some scripts perform changes at the system, network, security, and service levels, so they must be executed in controlled environments

## Project Structure

The repository organization is oriented toward:

- Base system installation scripts
- Tool and dependency configuration
- Service deployment
- Infrastructure examples (APIs, web applications, databases)
- Process automation

## Notes

This project is intended for users with technical knowledge in `Linux` systems and service administration. It is not designed as a plug-and-play tool, but rather as a set of resources for building, learning, and experimenting with real infrastructure.

## Copyright

© 2026 Derwinc.

## License

Distributed under the Apache 2.0 License, allowing use, modification, and distribution with minimal restrictions, subject to proper attribution and compliance with its terms.
