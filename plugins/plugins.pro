TEMPLATE = subdirs

!android:!ios {

 SUBDIRS              += dmxusb
 SUBDIRS              += peperoni
 # PATCH (metanull): uDMX requires libusb, which this CI build does not
 # provide. This rig outputs via the DMX USB plugin, not uDMX, so skip
 # uDMX on Windows only.
 !win32:SUBDIRS       += udmx
 SUBDIRS              += midi
 unix {
   system(pkg-config --exists libola) {
     system(pkg-config --exists libolaserver) {
       SUBDIRS        += ola
     }
   }
 }
 !macx:!win32:SUBDIRS += dmx4linux
 # PATCH (metanull): Velleman K8062 plugin needs a vendor SDK at C:/Qt/K8062D
 # which this CI build does not provide; rig does not use a K8062. Skip on
 # Windows only.
 !win32:SUBDIRS       += velleman
 SUBDIRS              += enttecwing
 SUBDIRS              += hid
 !macx:!win32:SUBDIRS += spi
 SUBDIRS              += os2l
 #!macx:!win32:SUBDIRS += uart
 #!macx:!win32:SUBDIRS += gpio
}

SUBDIRS              += artnet
SUBDIRS              += E1.31
SUBDIRS              += loopback
SUBDIRS              += osc
