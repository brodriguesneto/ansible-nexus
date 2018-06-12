nexus
=====

[![Build Status](https://travis-ci.org/everproven/ansible-nexus.svg?branch=master)](https://travis-ci.org/everproven/ansible-nexus)
[![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-everproven.nexus-blue.svg)](https://galaxy.ansible.com/everproven/nexus/)

An Ansible role that installs and configures [Nexus Repository OSS] service on Linux.

It installs Nexus Repository OSS and some tooling: __unzip__, __gzip__, __bzip2__ and __maven__.

Platforms
---------

Role tested on Linux operating systems:

* Ubuntu Server 16.04 LTS
* Ubuntu Server 18.04 LTS

Requirements
------------

It recommends a server with 4 CPUs and assumes that the server will have at lest 4GB of RAM. For more informantion see the __nexus_sizing_profile__ variable.

Role Variables
--------------

__nexus_major_version__: The Nexus Repository OSS major version to install.

__Default__: 3

```YAML
nexus_major_version: 3
```

__nexus_archive_version__: The Nexus Repository OSS archive version.

__Default__: nexus-3.12.1-01

```YAML
nexus_archive_version: nexus-3.12.1-01
```

__nexus_application_port__: host port.

__Default__: 8091

```YAML
nexus_application_port: 8091
```

__nexus_application_host__: host address.

__Default__: 0.0.0.0

```YAML
nexus_application_host: 0.0.0.0
```

__nexus_sizing_profile__: Instance Sizing profiles.

__Default__: small

The role follows the general memory guidelines:

* set minimum heap should always equal set maximum heap
* minimum heap size 1200MB
* maximum heap size <= 4GB
* minimum MaxDirectMemory size 2GB
* minimum unallocated physical memory should be no less than 1/3 of total physical RAM to allow for virtual memory swap
* max heap + max direct memory <= host physical RAM * 2/3

> Do not set max heap size larger than 4GB

Here are instance profiles pre-configured that you can use to configure physical memory requirements needed for a dedicated server:

| Profile Use Case | Physical Memory RAM | Example Maximum Memory Configuration              |
| ---------------- |:-------------------:|:-------------------------------------------------:|
| small            | 4 GB                | -Xms1200M -Xmx1200M -XX:MaxDirectMemorySize=2G    |
| medium           | 8 GB                | -Xms2703M -Xmx2703M -XX:MaxDirectMemorySize=2703M |
| large16          | 16 GB               | -Xms4G -Xmx4G -XX:MaxDirectMemorySize=6717M       |
| large32          | 32 GB               | -Xms4G -Xmx4G -XX:MaxDirectMemorySize=17530M      |
| large64          | 64 GB               | -Xms4G -Xmx4G -XX:MaxDirectMemorySize=39158M      |

```YAML
nexus_sizing_profile: small
```

__nexus_instance_profiles__: A *dict* variable that is used by __nexus_sizing_profile__ varible to configure JVM options for memory usage.

__Default__: N/A

```YAML
nexus_instance_profiles:
  small:
    xms: 1200M
    xmx: 1200M
    xx_max_direct_memory_size: 2G
  medium:
    xms: 2703M
    xmx: 2703M
    xx_max_direct_memory_size: 2703M
  large16:
    xms: 4G
    xmx: 4G
    xx_max_direct_memory_size: 6717M
  large32:
    xms: 4G
    xmx: 4G
    xx_max_direct_memory_size: 17530M
  large64:
    xms: 4G
    xmx: 4G
    xx_max_direct_memory_size: 39158M
```

Dependencies
------------

[everproven.jdk]: Installs Oracle Java Development Kit 1.8.

Example Playbook
----------------

```YAML
- hosts: nexus
  become: True
  roles:
  - role: everproven.nexus
```

License
-------

[Apache License 2.0]

Author Information
------------------

[Ever Proven]

[Nexus Repository OSS]: https://www.sonatype.com/nexus-repository-oss
[everproven.jdk]: https://galaxy.ansible.com/everproven/jdk/
[Apache License 2.0]: https://github.com/everproven/ansible-nexus/blob/master/LICENSE
[Ever Proven]: https://github.com/everproven