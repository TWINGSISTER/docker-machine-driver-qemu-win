# QEMU Docker Machine Driver Plugin (Windows only Twingsister fork)
This Docker Machine driver for QEMU enables the use of the QEMU hypervisor with Docker-Machine in Windows WITHOUT admin privileges and WITHOUT bios enabled virtualization.

See this webinar [(link)](https://github.com/tobedone) for the installation instructions involving this driver. This is part of a  project whose aim
is to run Docker in QEMU from a USB pen WITHOUT admin privileges and WITHOUT bios enabled virtualization. Part of this project is an extended version of `docker-machine` that enables the control of some communication timeouts. Find this extended version of `docker-machine` [(here)](https://github.com/TWINGSISTER/machine). The two programs works in cooperation so, please, take a look to this fork of `docker-machine`, too. 

This driver also introduces  options `--qemu-attempts`, `--qemu-sleep`, `--qemu-tick` for timeout control (see below for defaults). 

When this driver  communicates with the QEMU VM, the QEMU hypervisor, running without Hw virtualization support, could fail to communicate in the due timeout. You can use these parameters to prevent the driver to fail due to timeouts. Indeed, during driver to hypervisor communication these parameters are used this way. The driver retries the communication for `--qemu-attempts` doing nothing between attempts for `--qemu-sleep` seconds. Furthermore, at each failed attempt, the tolerated timeout is increased of `--qemu-tick` seconds.
## Requirements
* A USB 3.0+ pen
* Windows 10 64 Bit
* QEMU 2.9.0+

## Install from Binary
Please see the [link](https://github.com/tobedone)

## Build driver from Source
```
go get -v github.com/TWINGSISTER/docker-machine-driver-qemu
cd <GO-ROOT>/src/github.com/intel-iot-devkit/docker-machine-driver-qemu
SET GOOS=windows 
go build -i -o docker-machine-driver-qemu.exe ./bin
```
Setting ``GOOS=linux`` and ``GOARCH=386``  or other architectures you can cross compile and generate binaries for your system.

## Usage
The usual Docker Machine commands apply:
```
docker-machine create --driver qemu qemumachine
docker-machine env qemumachine
```
On Windows `QEMU_LOCATION` must be set to the location where the QEMU exe is e.g. 
``--qemu-location "Z:\PortableApps\PortableDockerLight64\QEmu64"``
## Limitations
* **Ports**: QEMU will not generally respect forwarding the network traffic to the docker-machine.
During creation, you need to explicitly state the port ranges you wish to use
For example:
``` --qemu-open-ports 8022,1111,1231-1235 ```
* **Mounts**: Using mounts into containers is not supported.
* **Concurrent usage**: One instance of a machine using QEMU driver is possible at this time. The provisioner does not handle NATd Docker Ports.


# CLI Options/Environment variables and defaults:

| CLI option                        | Environment variable   | Default                                |
|-----------------------------------|------------------------|----------------------------------------|
| `--qemu-vcpu-count`               | `QEMU_CPU_COUNT`       | `2`                                    |
| `--qemu-memory-size`              | `QEMU_MEMORY_SIZE`     | `1024`                                 |
| `--qemu-disk-size`                | `QEMU_DISK_SIZE`       | `18000` Grows with qcow2 to this limit |
| `--qemu-boot2docker-url`          | `QEMU_BOOT2DOCKER_URL` | *boot2docker URL*                      |
| `--qemu-open-ports`               | -                      | -                                      |
| `--qemu-attempts`                 |                        | `60`   |
| `--qemu-sleep`                    |                        | `1`   |
| `--qemu-tick`                     |                        | `1`  |