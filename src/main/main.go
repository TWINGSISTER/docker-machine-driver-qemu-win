package main

import (
	"github.com/docker/machine/libmachine/drivers/plugin"
	"github.com/ANOTHERFORK/docker-machine-driver-qemu-windows/src/qemu"
)

func main() {
	plugin.RegisterDriver(new(qemu.Driver))
}
