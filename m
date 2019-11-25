Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by arago-project.org (Postfix) with ESMTPS id 567CD529C0
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2019 07:31:30 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id l28so10190573lfj.1
	for <meta-arago@arago-project.org>;
	Sun, 24 Nov 2019 23:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=KZvJmcuzZp0bZsAKwdgv8IXufMXZ2cUStoGIc+RIxP0=;
	b=vSviC8TU9Nz0RMsg8LNz4kd5j/pEw0ilYgQh5AQLEmSH6SJkK+OHHmpUEmWGw+ikWE
	9KVMotS5PzAvBt009DDdChrXnCLhFw5zIXOVyDWNMe5pi0NQ/oS1TQOrCpywWP6iL/fX
	8R7oSH4svqX5slixIGXZkb67eXbZcrIjbmO5aZi0SGlkPcoiHqrkLVNhNSyDiH+25xbN
	IGHKQuEl4MdEycYf5FU8Ise+nCx9wYWHfekYkr0LcSpuANlgpH8YZQMF7CIGsxF6a3iD
	/kJaleH43wwRdN78GZBSjnaaVwvtOZGdZ3wY9Tgj66RlWU92nCezSSU587cdH1CQsKg6
	z1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=KZvJmcuzZp0bZsAKwdgv8IXufMXZ2cUStoGIc+RIxP0=;
	b=tRCjvusEfmVgZQUbN1smrzNy5pcMmBtRaQqPoTCq73UXmB8ze2UKpotZhcGXH3S+E+
	yEi4DMLC7zRr+bZR+ftnjIc0hR4zabmIgYgH6lRbdYIj3ZIWPeY4CxQULU27IkomZybx
	7Qqwq+QjnfXjotfPVr/p/nTu4eHWmmhbFGYDv4malvPF7wuNbbu65Iz0ExuuwFfhaksD
	fAN1oRci6/PgdI2LQYsle+5XNraLkag1jEXP8TQP9B2DNgCE7hKgQv7uF1SJctCIxXZ0
	/LXuye0vmtxUbXupFmWHxpB4AvKL5DMkzfEBqIGwrXYHn9lrJvQQh0cQcKsdXphO9x4h
	F72g==
X-Gm-Message-State: APjAAAVGfapgaJBqtF5V+Zu+TPjeWXwIHJRwihKgOgCAX1zVOIyxrPdK
	GNGUaSRjhFfrb6gZfl4x/rzpdohtQk4ooiFym/dPuY0zfpw=
X-Google-Smtp-Source: APXvYqxZiHSaD8p14npKZ/mg3EBG03n0Oh7WKFArgbLXD3W5xy3Hoiy1EK1E8ihyC3vy9CC3kcQNJTPpff3YwFg7AQg=
X-Received: by 2002:ac2:5a43:: with SMTP id r3mr5325769lfn.150.1574666999797; 
	Sun, 24 Nov 2019 23:29:59 -0800 (PST)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 24 Nov 2019 23:29:48 -0800
Message-ID: <CADySD0GBEtZZnEq9De7A6ti3a4zPH4WShcyTVaEgtu9Z2cLqAg@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Increase in libraries/image size when moving to thud branch
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Nov 2019 07:31:31 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I am building an image based upon arago "thud" branch for board based
upon am335x-evm.

When I compare the image based upon "daisy" branch with "thud" branch,
there is a huge increase in the size of libraries packaged in the
"thud" branch image

For the same package group, "daisy" branch image size was 42M whereas
now in "thud" branch image size if 105M

It's a big blocker in moving ahead with "thud" branch. Is this known
or have I missed something? Couldn't stress it more but I am in need
of some urgent help here, thanks for understanding.

I only have "debug-tweaks" in EXTRA_IMAGE_FEATURES

My image recipe is this:

require recipes-core/images/arago-image.inc
IMAGE_FEATURES_remove = "package-management"
IMAGE_INSTALL += " \
    packagegroup-image-extra \
"

Below is short comparison of few library sizes between daisy and thud image

Daisy branch :
-rw-r--r--  1 nws nws 2793402 Oct 20  2015 libstdc++.a
-rwxr-xr-x  1 nws nws 4925882 Oct 20  2015 libstdc++.so
lrwxrwxrwx  1 nws nws      12 Nov 25 18:58 libstdc++.so.6 -> libstdc++.so
-rwxr-xr-x  1 nws nws  881932 Oct 20  2015 libc.so.6
-rw-r--r--  1 nws nws    9816 Oct 20  2015 libdl-2.15.so
-rw-r--r--  1 nws nws    9816 Oct 20  2015 libdl.so.2
-rw-r--r--  1 nws nws     135 Oct 20  2015 libgcc_s.so
-rw-r--r--  1 nws nws 1473720 Oct 20  2015 libgcc_s.so.1

Thud branch:
-rwxr-xr-x  1 nws nws 11930116 Nov 24 20:59 libstdc++.so.6
-rwxr-xr-x  1 nws nws 11930116 Nov 24 20:59 libstdc++.so.6.0.25
-rwxr-xr-x  1 nws nws 16537400 Nov 24 20:58 libc.so.6
-rwxr-xr-x  1 nws nws   225508 Nov 24 20:58 libdl.so.2
-rw-r--r--  1 nws nws      132 Nov 24 20:58 libgcc_s.so
-rw-r--r--  1 nws nws  9063520 Nov 24 20:58 libgcc_s.so.1

Below is the comparison of daisy and thud image

Daisy image:
$ du -h
4.7M    ./boot
4.0K    ./media
4.0K    ./lib/udev/devices
92K    ./lib/udev/rules.d
20K    ./lib/udev/keymaps/force-release
252K    ./lib/udev/keymaps
672K    ./lib/udev
168K    ./lib/firmware
84K    ./lib/modules/3.14.49-ge9cd4cc/kernel/sound/core/oss
136K    ./lib/modules/3.14.49-ge9cd4cc/kernel/sound/core
208K    ./lib/modules/3.14.49-ge9cd4cc/kernel/sound/usb
44K    ./lib/modules/3.14.49-ge9cd4cc/kernel/sound/soc/omap
44K    ./lib/modules/3.14.49-ge9cd4cc/kernel/sound/soc/davinci
156K    ./lib/modules/3.14.49-ge9cd4cc/kernel/sound/soc/codecs
248K    ./lib/modules/3.14.49-ge9cd4cc/kernel/sound/soc
596K    ./lib/modules/3.14.49-ge9cd4cc/kernel/sound
40K    ./lib/modules/3.14.49-ge9cd4cc/kernel/fs/configfs
44K    ./lib/modules/3.14.49-ge9cd4cc/kernel/fs
48K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/media/i2c
252K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/media/v4l2-core
40K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/media/usb/gspca
96K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/media/usb/uvc
140K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/media/usb
468K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/media
124K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/mtd/tests
36K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/mtd/devices
164K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/mtd
24K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/bluetooth
20K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/phy
16K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/input/touchscreen
32K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/input
12K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/video/backlight
32K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/video/fbdev/omap2/displays-new
36K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/video/fbdev/omap2
40K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/video/fbdev
56K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/video
40K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb/misc
60K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb/class
68K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb/serial
16K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb/phy
16K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb/host
40K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb/musb
276K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb/gadget/legacy
272K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb/gadget/function
612K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb/gadget
88K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb/dwc3
944K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/usb
48K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/ata
40K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/net/can/c_can
64K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/net/can
232K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/net/ethernet/intel/e1000e
132K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/net/ethernet/intel/e1000
368K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/net/ethernet/intel
180K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/net/ethernet/broadcom
48K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/net/ethernet/marvell
600K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/net/ethernet
668K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/net
16K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/hwmon
140K    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers/scsi
2.6M    ./lib/modules/3.14.49-ge9cd4cc/kernel/drivers
52K    ./lib/modules/3.14.49-ge9cd4cc/kernel/crypto
88K    ./lib/modules/3.14.49-ge9cd4cc/kernel/net/can
24K    ./lib/modules/3.14.49-ge9cd4cc/kernel/net/802
88K    ./lib/modules/3.14.49-ge9cd4cc/kernel/net/ipv4/netfilter
92K    ./lib/modules/3.14.49-ge9cd4cc/kernel/net/ipv4
112K    ./lib/modules/3.14.49-ge9cd4cc/kernel/net/bridge
16K    ./lib/modules/3.14.49-ge9cd4cc/kernel/net/llc
168K    ./lib/modules/3.14.49-ge9cd4cc/kernel/net/netfilter
504K    ./lib/modules/3.14.49-ge9cd4cc/kernel/net
3.7M    ./lib/modules/3.14.49-ge9cd4cc/kernel
4.0M    ./lib/modules/3.14.49-ge9cd4cc
4.0M    ./lib/modules
8.0K    ./lib/depmod.d
4.0K    ./lib/modprobe.d
20M    ./lib
4.0K    ./etc/rcS.d
24K    ./etc/udev/rules.d
12K    ./etc/udev/scripts
48K    ./etc/udev
4.0K    ./etc/rc3.d
2.0M    ./etc/upgrade/images
2.0M    ./etc/upgrade
8.0K    ./etc/udhcpc.d
12K    ./etc/skel
4.0K    ./etc/rc1.d
4.0K    ./etc/rc5.d
4.0K    ./etc/network/if-down.d
8.0K    ./etc/network/if-pre-up.d
4.0K    ./etc/network/if-up.d
4.0K    ./etc/network/if-post-down.d
28K    ./etc/network
4.0K    ./etc/rc2.d
4.0K    ./etc/dbus-1/system.d
4.0K    ./etc/dbus-1/session.d
20K    ./etc/dbus-1
4.0K    ./etc/rcstart.d
200K    ./etc/init.d
16K    ./etc/terminfo/x
12K    ./etc/terminfo/s
20K    ./etc/terminfo/v
8.0K    ./etc/terminfo/r
8.0K    ./etc/terminfo/l
8.0K    ./etc/terminfo/a
8.0K    ./etc/terminfo/d
84K    ./etc/terminfo
12K    ./etc/default/volatiles
40K    ./etc/default
4.0K    ./etc/depmod.d
4.0K    ./etc/rc0.d
4.0K    ./etc/rc4.d
4.0K    ./etc/dropbear
4.0K    ./etc/modprobe.d
8.0K    ./etc/profile.d
4.0K    ./etc/rc6.d
2.7M    ./etc
4.0K    ./tmp
4.0K    ./opt/data
8.0K    ./opt
4.0K    ./mnt/.psplash
8.0K    ./mnt
4.0K    ./run
4.0K    ./home/root
8.0K    ./home
1.5M    ./bin
4.0K    ./sys
4.0K    ./dev
4.0K    ./proc
4.0K    ./var/local
4.0K    ./var/lib/dbus
4.0K    ./var/lib/misc
4.0K    ./var/lib/bluetooth
4.0K    ./var/lib/urandom
4.0K    ./var/lib/opkg
24K    ./var/lib
4.0K    ./var/spool/mail
8.0K    ./var/spool
4.0K    ./var/usb-upgrade
4.0K    ./var/backups
4.0K    ./var/volatile/tmp
8.0K    ./var/volatile
56K    ./var
4.0K    ./usr/src
240K    ./usr/lib/dbus
16K    ./usr/lib/ssl
932K    ./usr/lib/opkg/alternatives
936K    ./usr/lib/opkg
72K    ./usr/lib/openssh
1.7M    ./usr/lib/gcc/arm-linux-gnueabihf/4.7.3
1.7M    ./usr/lib/gcc/arm-linux-gnueabihf
1.7M    ./usr/lib/gcc
8.0K    ./usr/lib/perl/5.14.3/warnings
96K    ./usr/lib/perl/5.14.3
140K    ./usr/lib/perl
68K    ./usr/lib/ts
8.8M    ./usr/lib
4.0K    ./usr/share/man
4.0K    ./usr/share/misc
4.0K    ./usr/share/info
4.0K    ./usr/share/dbus-1/services
4.0K    ./usr/share/dbus-1/system-services
12K    ./usr/share/dbus-1
4.0K    ./usr/share/dict
8.0K    ./usr/share/udhcpc
212K    ./usr/share
4.0K    ./usr/games
2.5M    ./usr/bin
1.6M    ./usr/sbin
13M    ./usr
148K    ./sbin
42M    .

Thud branch:

$ du -h
4.0K    ./mnt/.psplash
8.0K    ./mnt
16K    ./etc/terminfo/s
8.0K    ./etc/terminfo/r
8.0K    ./etc/terminfo/a
16K    ./etc/terminfo/x
8.0K    ./etc/terminfo/l
8.0K    ./etc/terminfo/d
20K    ./etc/terminfo/v
88K    ./etc/terminfo
4.0K    ./etc/rc0.d
180K    ./etc/init.d
8.0K    ./etc/udhcpc.d
4.0K    ./etc/rc3.d
4.0K    ./etc/rc1.d
4.0K    ./etc/rcstart.d
8.0K    ./etc/ipk-postinsts
4.0K    ./etc/rc6.d
4.0K    ./etc/modprobe.d
4.0K    ./etc/network/if-post-down.d
4.0K    ./etc/network/if-up.d
4.0K    ./etc/network/if-down.d
8.0K    ./etc/network/if-pre-up.d
28K    ./etc/network
4.0K    ./etc/rc2.d
16K    ./etc/udev/scripts
6.1M    ./etc/udev/hwdb.d
28K    ./etc/udev/rules.d
4.0K    ./etc/udev/mount.blacklist.d
14M    ./etc/udev
4.0K    ./etc/rcS.d
4.0K    ./etc/rc5.d
4.0K    ./etc/depmod.d
12K    ./etc/skel
4.0K    ./etc/rc4.d
12K    ./etc/default/volatiles
32K    ./etc/default
2.4M    ./etc/upgrade/images
104K    ./etc/upgrade/touchutil
2.6M    ./etc/upgrade
17M    ./etc
4.0K    ./home/root
8.0K    ./home
4.0K    ./run
4.0K    ./media
4.0K    ./tmp
4.0K    ./lib/modprobe.d
420K    ./lib/modules/4.19.73-gd02acfec3d/kernel/crypto
28K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/crypto/virtio
128K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/crypto
24K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/uio
32K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/extcon
28K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/misc/eeprom
32K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/misc
196K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/ethernet/broadcom
148K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/ethernet/intel/e1000
224K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/ethernet/intel/e1000e
376K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/ethernet/intel
56K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/ethernet/marvell
632K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/ethernet
428K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/usb
48K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/phy
264K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/wireless/ti/wlcore
120K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/wireless/ti/wl18xx
388K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/wireless/ti
392K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net/wireless
1.5M    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/net
144K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/mtd/tests
148K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/mtd
124K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/nvme/host
128K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/nvme
44K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/firmware/efi
48K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/firmware
16K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/i2c/muxes
16K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/i2c/busses
36K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/i2c
48K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/cdrom
20K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/gpio
20K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/w1/masters
64K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/w1
24K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/spi
16K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/memory
32K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/input/keyboard
20K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/input/misc
64K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/input/mouse
16K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/input/touchscreen
148K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/input
472K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/ata
128K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/dwc3
16K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/roles
32K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/gadget/udc
204K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/gadget/legacy
352K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/gadget/function
652K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/gadget
64K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/misc
376K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/serial
48K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/class
396K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/host
56K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/cdns3
208K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/musb
140K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/storage
56K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/phy
52K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/isp1760
16K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/common
268K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb/core
2.5M    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/usb
16K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/leds
32K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/phy/ti
20K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/phy/motorola
56K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/phy
172K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/scsi/ufs
448K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/scsi
40K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/hid/usbhid
72K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/hid
64K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/ssb
48K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/gpu/drm/bridge
52K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/gpu/drm
56K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/gpu
68K    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers/bcma
6.0M    ./lib/modules/4.19.73-gd02acfec3d/kernel/drivers
112K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/ipv4/netfilter
188K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/ipv4
40K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/8021q
28K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/802
68K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/xfrm
16K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/llc
60K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/dsa
484K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/mac80211
172K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/bridge/netfilter
356K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/bridge
296K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/netfilter
340K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/sctp
20K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/ipv6/netfilter
140K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/ipv6
48K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/key
320K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/wireless
620K    ./lib/modules/4.19.73-gd02acfec3d/kernel/net/sched
3.0M    ./lib/modules/4.19.73-gd02acfec3d/kernel/net
48K    ./lib/modules/4.19.73-gd02acfec3d/kernel/lib
152K    ./lib/modules/4.19.73-gd02acfec3d/kernel/arch/arm/crypto
156K    ./lib/modules/4.19.73-gd02acfec3d/kernel/arch/arm
160K    ./lib/modules/4.19.73-gd02acfec3d/kernel/arch
9.6M    ./lib/modules/4.19.73-gd02acfec3d/kernel
11M    ./lib/modules/4.19.73-gd02acfec3d
11M    ./lib/modules
104K    ./lib/udev/rules.d
400K    ./lib/udev
8.0K    ./lib/depmod.d
49M    ./lib
4.0K    ./dev
4.0K    ./opt/data
8.0K    ./opt
1.4M    ./bin
4.1M    ./boot
4.0K    ./usr/include
8.0K    ./usr/share/udhcpc
4.0K    ./usr/share/misc
4.0K    ./usr/share/info
4.0K    ./usr/share/dict
4.0K    ./usr/share/man
28K    ./usr/share
4.0K    ./usr/lib/opkg
23M    ./usr/lib
2.0M    ./usr/bin
4.0K    ./usr/games
4.0K    ./usr/libexec
1.4M    ./usr/sbin
4.0K    ./usr/src
27M    ./usr
5.5M    ./sbin
4.0K    ./sys
4.0K    ./var/spool/mail
8.0K    ./var/spool
4.0K    ./var/backups
8.0K    ./var/cache/ldconfig
4.0K    ./var/cache/opkg
16K    ./var/cache
4.0K    ./var/volatile
4.0K    ./var/lib/misc
4.0K    ./var/lib/urandom
4.0K    ./var/lib/opkg
4.0K    ./var/lib/bluetooth
20K    ./var/lib
4.0K    ./var/usb-upgrade
4.0K    ./var/local
64K    ./var
4.0K    ./proc
103M    .

Thanks
Ankur

