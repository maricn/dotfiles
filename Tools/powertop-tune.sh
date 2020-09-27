#!/bin/bash 

### exceptions:
iw dev wlan0 set power_save off
echo 'on' > '/sys/bus/usb/devices/usb1/power/control'; 
echo 'on' > '/sys/bus/usb/devices/usb2/power/control'; 
echo 'on' > '/sys/bus/usb/devices/usb3/power/control'; 
echo 'on' > '/sys/bus/usb/devices/usb4/power/control'; 


### rules:
# echo 'enabled' > '/sys/bus/usb/devices/usb1/power/wakeup'
# echo 'enabled' > '/sys/bus/usb/devices/usb2/power/wakeup'
# echo 'enabled' > '/sys/bus/usb/devices/usb3/power/wakeup'
# echo 'enabled' > '/sys/bus/usb/devices/usb4/power/wakeup'
#echo 'auto' > '/sys/bus/usb/devices/1-4/power/control'; 
#echo 'auto' > '/sys/bus/usb/devices/1-3/power/control'; 
echo 'enabled' > '/sys/class/net/wlan0/device/power/wakeup'; 
echo 'enabled' > '/sys/bus/usb/devices/1-9/power/wakeup'; 
echo 'enabled' > '/sys/bus/usb/devices/1-10/power/wakeup'; 
#echo 'enabled' > '/sys/bus/usb/devices/1-3/power/wakeup'; 
echo 'auto' > '/sys/bus/i2c/devices/i2c-2/device/power/control'
echo 'auto' > '/sys/bus/i2c/devices/i2c-3/device/power/control'
echo 'auto' > '/sys/bus/i2c/devices/i2c-4/device/power/control'
echo 'auto' > '/sys/bus/i2c/devices/i2c-5/device/power/control'
echo 'auto' > '/sys/bus/i2c/devices/i2c-6/device/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:15.1/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:02:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:08.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:04.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:15.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:14.3/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:03:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.4/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:14.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.6/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:02.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.5/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.3/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:07:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:2d:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:16.3/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:14.2/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:12.0/power/control'
echo 'enabled' > '/sys/class/net/wlan0/device/power/wakeup'
echo 'enabled' > '/sys/bus/usb/devices/1-9/power/wakeup'
echo 'enabled' > '/sys/bus/usb/devices/1-10/power/wakeup'
