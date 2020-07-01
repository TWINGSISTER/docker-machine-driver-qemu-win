module github.com/TWINGSISTER/docker-machine-driver-qemu-windows

go 1.14

replace github.com/docker/machine => Z:\PortableApps\Eclipse\home\go\src\github.com\TWINGSISTER\machine

replace github.com/ANOTHERFORK/docker-machine-driver-qemu-windows/src/qemu => Z:\PortableApps\Eclipse\home\go\src\github.com\TWINGSISTER\docker-machine-driver-qemu-windows\src\qemu

require (
	github.com/ANOTHERFORK/docker-machine-driver-qemu-windows/src/qemu v0.0.0-00010101000000-000000000000
	github.com/docker/machine v0.0.0-00010101000000-000000000000
	github.com/qeedquan/iso9660 v0.0.0-20190801031807-52ec7cd7b268
	golang.org/x/sys v0.0.0-20200625212154-ddb9806d33ae
)
