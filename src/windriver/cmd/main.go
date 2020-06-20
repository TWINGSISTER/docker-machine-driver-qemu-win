package main

import (
	"github.com/docker/machine/libmachine/drivers/plugin"
	"github.com/TWINGSISTER/docker-machine-driver-qemu-win/src/windriver"
)

func main() {
	plugin.RegisterDriver(new(qemu.Driver))
}
